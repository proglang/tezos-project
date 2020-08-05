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
type 'a tz_result = 'a tzresult Lwt.t
type tez = int

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

let setup_remote_signer =
  Client_keys.register_signer (module Tezos_signer_backends.Unencrypted)

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

let set_port p = (current_config.port) := p

let set_basedir path = (current_config.basedir) := path

let tez_of_int x =
    match Tez.of_mutez (Int64.mul (Int64.of_int x) 1_000_000L) with
    | None ->
        invalid_arg "tez_of_int"
    | Some x ->
        x

let transfer amount src dst fees =
  let ctxt = context () in
  setup_remote_signer;
  Client_keys.get_key ctxt src
  >>=? fun (_, src_pk, src_sk) ->
  let ctxt_proto = new wrap_full ctxt in
  let fee_param : fee_parameter =
    {
      minimal_fees = (match Tez.of_mutez 100L with None -> assert false | Some t -> t);
      minimal_nanotez_per_byte = Z.of_int 1000;
      minimal_nanotez_per_gas_unit = Z.of_int 100;
      force_low_fee = false;
      fee_cap = (match Tez.of_string @@ string_of_int fees with None -> assert false | Some t -> t);
      burn_cap = (match Tez.of_string "0" with None -> assert false | Some t -> t);
    }
  in
  let amount_tez = tez_of_int amount
  in
  let fees_tez = tez_of_int fees in
  ContractAlias.get_contract ctxt dst
  >>=? fun (_, dst_contract) ->
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
      ~destination:dst_contract
      ~amount: amount_tez
      ~fee_parameter:fee_param
      ()
