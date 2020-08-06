open Client_keys
open Client_context_unix
open Tezos_client_006_PsCARTHA.Client_proto_context
open Tezos_client_006_PsCARTHA.Protocol_client_context
open Tezos_client_006_PsCARTHA.Injection
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_client_006_PsCARTHA.Client_proto_contracts

(* How to hide this?! *)
type puk = Signature.public_key
type pukh = Signature.public_key_hash
type contract = Contract.t
type 'a tz_result = 'a tzresult Lwt.t
type tez = float

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
  new unix_full
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

let get_contract_from_alias name =
  let ctxt = context () in
  ContractAlias.get_contract ctxt name
  >>=? fun (_, contract) ->
  return contract

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
  >>=? fun (_, src_pk, src_sk) ->
  let ctxt_proto = new wrap_full ctxt in
  let amount_tez = tez_of_float amount
  in
  let fees_tez = tez_of_float fees in
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
      ()
