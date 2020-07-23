open Client_keys
open Client_context_unix

(* How to hide this?! *)
type puk = Signature.public_key tzresult Lwt.t

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

let set_port p = (current_config.port) := p

let set_basedir path = (current_config.basedir) := path
