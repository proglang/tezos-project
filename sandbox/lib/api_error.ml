open Tezos_protocol_environment_006_PsCARTHA
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_raw_protocol_006_PsCARTHA.Contract_repr
open Tezos_micheline.Micheline_parser
open Format
open Str

(** Provides information about why a transaction failed / is invalid *)
type rejection_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Michelson_parser_error

type error = Rejection of rejection_message
           | RPC_error of {uri: string}
           | Unexpected_result
           | Unknown_secret_key
           | Unknown_public_key
           | Keys_not_found
           | Wrong_contract_notation of string
           | Unknown of string

let errors_of_strings =
  let open Base in
  Base.Map.of_alist_exn (module String)
    [
      ("The proposed fee .* are higher than the configured fee cap", Rejection Reached_feecap);
      ("The proposed fee .* are lower than the fee that baker expect", Rejection Insufficient_fee);
      ("The operation will burn .* which is higher than the configured burn cap", Rejection Reached_burncap);
      ("Unknown secret key for .*", Unknown_secret_key);
      ("Unknown public key for .*", Unknown_public_key);
      ("no keys for the source contract manager", Keys_not_found);
      ("no .* alias named .*", Keys_not_found)
    ]

let err_to_str = asprintf "%a" Error_monad.pp
let env_err_to_str = asprintf "%a" Environment.Error_monad.pp

module Answer : sig
  type 'a t = ('a, error) Result.t Lwt.t
  val return : 'a -> 'a t
  val fail : error -> 'a t
  val ( >>=? ) : 'a t -> ('a -> 'b t) -> 'b t
end = struct
  type 'a t = ('a, error) Result.t Lwt.t
  let return v = Lwt.return (Result.Ok v)
  let fail e = Lwt.return (Result.error e)
  let ( >>=? ) v f =
    v >>= function Error _ as err -> Lwt.return err | Result.Ok v -> f v
end

let catch_env_error errs =
  match errs with
  | (Invalid_contract_notation s)::_ -> Answer.fail (Wrong_contract_notation s)
  | err :: _ -> Answer.fail (Unknown (env_err_to_str err))
  | _ -> Answer.fail (Unknown "Empty trace")

let catch_error errs =
  let open Tezos_protocol_006_PsCARTHA.Protocol.Contract_storage in
  match errs with
  | (Environment.Ecoproto_error (Invalid_contract_notation s)) :: _ -> Answer.fail (Wrong_contract_notation s)
  | (RPC_context.Not_found {uri; _}) ::_
    | (RPC_context.Gone {uri;_}) ::_
    | (RPC_context.Generic_error {uri;_}) ::_ ->
     Answer.fail (RPC_error {uri = Uri.to_string uri })
  | (Environment.Ecoproto_error Contract.Balance_too_low _) :: _
    -> Answer.fail (Rejection Insufficient_balance)
  | (Environment.Ecoproto_error Counter_in_the_past _) :: _
    -> Answer.fail (Rejection Counter_mismatch)
  | (Environment.Ecoproto_error Counter_in_the_future _):: _
    -> Answer.fail (Rejection Counter_mismatch)
  | (Invalid_utf8_sequence _ ) :: _
    | (Unexpected_character _ ) :: _
    | (Undefined_escape_sequence _ ) :: _
    | (Missing_break_after_number _ ) :: _
    | (Unterminated_string _ ) :: _
    | (Unterminated_integer _ ) :: _
    | (Odd_lengthed_bytes _ ) :: _
    | (Unterminated_comment _ ) :: _
    | (Annotation_length _ ) :: _
    | (Unclosed _ ) :: _
    | (Unexpected _ ) :: _
    | (Extra _ ) :: _
    | (Misaligned _ ) :: _
    | Empty :: _ -> Answer.fail (Rejection Michelson_parser_error)
  | errs ->
     let open Base in
     let last_err = List.hd errs in
     match last_err with
     | None -> Answer.fail (Unknown "Empty trace")
     | Some err ->
        begin
          let err_str = err_to_str err in
          let rec match_error l str = match l with
            | [] -> Unknown err_str
            | x::xs -> (
              let r = Str.regexp x in
              if string_match r err_str 0 then (Base.Map.find_exn errors_of_strings x)
              else match_error xs str
            )
          in
          let keys = Base.Map.keys errors_of_strings in
          Answer.fail (match_error keys err_str)
        end

