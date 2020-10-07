open Tezos_protocol_environment_007_PsDELPH1
open Tezos_protocol_007_PsDELPH1.Protocol.Alpha_context
open Tezos_protocol_007_PsDELPH1.Protocol.Script_interpreter
open Tezos_raw_protocol_007_PsDELPH1.Contract_repr
open Tezos_micheline.Micheline_parser
open Tezos_rpc_http.RPC_client_errors
open Format
open Str

(** Provides information about why a transaction failed / is invalid *)
type rejection_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Empty_transaction
                     | Empty_implicit_contract
                     | Michelson_parser_error
                     | Michelson_runtime_error

type error = Rejection of rejection_message
           | RPC_error of {uri: string}
           | Node_connection_failed
           | Unexpected_result
           | Unknown_secret_key
           | Unknown_public_key
           | Keys_not_found
           | Wrong_contract_notation of string
           | Invalid_public_key_hash
           | Not_callable
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
      ("no .* alias named .*", Keys_not_found);
      ("Failed to read a b58check_encoding data (Signature.Public_key_hash): .*", Invalid_public_key_hash);
        ("no contract or key named .*", Keys_not_found)
    ]

let err_to_str = asprintf "%a" Error_monad.pp

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

let catch_last_error errs =
  let open Answer in
  match errs with
  | [] -> Answer.fail (Unknown "Empty trace")
  | e :: _s -> Answer.return e
  >>=? fun err ->
  let open Tezos_protocol_007_PsDELPH1.Protocol.Contract_storage in
  match err with
  | Environment.Ecoproto_error (Invalid_contract_notation s) -> Answer.fail (Wrong_contract_notation s)
  | RPC_context.Not_found {uri; _}
    | RPC_context.Gone {uri;_}
    | RPC_context.Generic_error {uri;_} ->
     Answer.fail (RPC_error {uri = Uri.to_string uri })
  | Request_failed {uri; error; _} -> (
     match error with
     | Connection_failed _ -> Answer.fail (Node_connection_failed)
     | _ -> (Answer.fail (RPC_error {uri = Uri.to_string uri})))
  | Environment.Ecoproto_error Contract.Balance_too_low _
    -> Answer.fail (Rejection Insufficient_balance)
  | Environment.Ecoproto_error (Counter_in_the_past _)
    -> Answer.fail (Rejection Counter_mismatch)
  | Environment.Ecoproto_error Counter_in_the_future _
    -> Answer.fail (Rejection Counter_mismatch)
  | Environment.Ecoproto_error Empty_transaction _
    -> Answer.fail (Rejection Empty_transaction)
  | Environment.Ecoproto_error Empty_implicit_contract _
    -> Answer.fail (Rejection Empty_implicit_contract)
  | Invalid_utf8_sequence _
    | Unexpected_character _
    | Undefined_escape_sequence _
    | Missing_break_after_number _
    | Unterminated_string _
    | Unterminated_integer _
    | Odd_lengthed_bytes _
    | Unterminated_comment _
    | Annotation_length _
    | Unclosed _
    | Unexpected _
    | Extra _
    | Misaligned _
    | Empty -> Answer.fail (Rejection Michelson_parser_error)
  | Environment.Ecoproto_error
      ( Reject _
      | Overflow _
      | Runtime_contract_error _
      | Bad_contract_parameter _
      | Cannot_serialize_log
      | Cannot_serialize_failure
      | Cannot_serialize_storage ) -> Answer.fail (Rejection Michelson_runtime_error)
  | _ ->
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

let catch_trace errs =
  let f = (fun s err -> s ^ (err_to_str err) ^ "\n+++++++++++ \n") in
  let trace_str = List.fold_left f "+++ Error trace +++ \n" errs in
  Answer.fail (Unknown trace_str)
