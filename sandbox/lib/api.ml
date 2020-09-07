open Client_keys
open Tezos_client_006_PsCARTHA.Client_proto_context
open Tezos_client_006_PsCARTHA.Protocol_client_context
open Tezos_client_006_PsCARTHA.Injection
open Tezos_client_006_PsCARTHA.Client_proto_contracts
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_protocol_environment_006_PsCARTHA
open Api_context
open Format
open Base
open Str

(* How to hide this?! *)
type puk = Signature.public_key
type pukh = Signature.public_key_hash
type contract = Contract.t
type 'a tz_result = 'a tzresult Lwt.t
type tez = float
type oph = Operation_hash.t

type failure_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Unknown
type answer = Pending of oph | Fail of failure_message

type config = {port : int ref; basedir : string ref}
let current_config = {port = ref 8732; basedir = ref "/home/tezos/.tezos-client"}

let context () =
  let rpc_config : RPC_client_unix.config = {
      RPC_client_unix.default_config with
      host = "127.0.0.1";
      port = !(current_config.port);
      tls = false;
    }
  in
  new unix_full_silent
    ~chain:Client_config.default_chain
    ~block:Client_config.default_block
    ~confirmations:None
    ~password_filename:None
    ~base_dir: !(current_config.basedir)
    ~rpc_config:rpc_config

let fee_parameter : fee_parameter =
  {
    minimal_fees = (match Tez.of_mutez 100L with None -> assert false | Some t -> t);
    minimal_nanotez_per_byte = Z.of_int 1000;
    minimal_nanotez_per_gas_unit = Z.of_int 100;
    force_low_fee = false;
    fee_cap = (match Tez.of_string "1.0" with None -> assert false | Some t -> t);
    burn_cap = (match Tez.of_string "0" with None -> assert false | Some t -> t);
  }

let exception_handler =
  (function
  | Failure msg ->
     fail (Exn (Failure msg))
  | exn ->
     Lwt.return @@ error_exn exn )

let errors_of_strings =
  Base.Map.of_alist_exn (module String)
    [
      ("The proposed fee .* are higher than the configured fee cap", Reached_feecap);
      ("The proposed fee .* are lower than the fee that baker expect", Insufficient_fee)
    ]

let get_puk_from_alias name =
  let ctxt = context () in
  Public_key_hash.find ctxt name
  >>=? fun pkh ->
  Client_keys.get_key ctxt pkh
  >>=? fun (_, src_pk, _) ->
  return src_pk

let get_puk_from_hash pk_hash =
  let ctxt = context () in
  Public_key_hash.of_source pk_hash
  >>=? fun pk_hash_ ->
  Client_keys.get_key ctxt pk_hash_
  >>=? fun (_, src_pk, _) ->
  return src_pk

let get_pukh_from_alias name =
  let ctxt = context () in
  Public_key_hash.find ctxt name

let get_contract s =
  let ctxt = context () in
  ContractAlias.get_contract ctxt s
  >>= function
  | Ok (_,v) -> return v
  | Error _ -> (
    match Contract.of_b58check s with
    | Error _ as err ->
       Lwt.return (Environment.wrap_error err) |> trace (failure "bad contract notation")
    | Ok v -> return v )

let set_port p = (current_config.port) := p

let set_basedir path = (current_config.basedir) := path

let tez_of_float x =
  let tez_str = Printf.sprintf "%.6f" x in
  match Tez.of_string tez_str with
    | None ->
        invalid_arg "tez_of_float"
    | Some x ->
        x

let setup_remote_signer =
  Client_keys.register_signer (module Tezos_signer_backends.Unencrypted)

let transfer amount src destination fees =
  let ctxt = context () in
  setup_remote_signer;
  Client_keys.get_key ctxt src
  >>= function
  | Error _ -> Lwt.return @@ Fail Invalid_receiver
  | Ok (_, src_pk, src_sk) ->
     begin
       let ctxt_proto = new wrap_full ctxt in
       let amount_tez = tez_of_float amount
       in
       let fees_tez = tez_of_float fees in
       Lwt.catch
         (fun () ->
           transfer
             ctxt_proto
             ~chain:ctxt#chain
             ~block:ctxt#block
             ?confirmations:ctxt#confirmations
             ~dry_run:false
             ~verbose_signing:false
             ~source:src
             ~fee:fees_tez
             ~src_pk
             ~src_sk
             ~destination
             ~amount: amount_tez
             ~fee_parameter
             ())
         exception_handler
       >>= fun res ->
       let open Tezos_protocol_006_PsCARTHA.Protocol.Contract_storage in
       match res with
       | Ok ((oph,_,_),_) -> Lwt.return @@ Pending oph
       | Error ((Environment.Ecoproto_error Contract.Balance_too_low _) :: _)
         -> Lwt.return @@ Fail Insufficient_balance
       | Error ((Environment.Ecoproto_error Counter_in_the_past _) :: _)
         -> Lwt.return @@ Fail Counter_mismatch
       | Error ((Environment.Ecoproto_error Counter_in_the_future _):: _)
         -> Lwt.return @@ Fail Counter_mismatch
       | Error errs ->
          let last_err = List.hd errs in
          match last_err with
          | None -> Lwt.return @@ Fail Unknown
          | Some err ->
             begin
               let err_str = asprintf "%a" Error_monad.pp err in
               let rec match_error l str = match l with
                 | [] -> Fail Unknown
                 | x::xs -> (
                   let r = Str.regexp x in
                   if string_match r err_str 0 then Fail (Base.Map.find_exn errors_of_strings x)
                   else match_error xs str
                 )
               in
               let keys = Base.Map.keys errors_of_strings in
               Lwt.return @@ match_error keys err_str
             end
     end
