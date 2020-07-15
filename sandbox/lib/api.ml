open Client_keys
open Client_context_unix

let context =
  let rpc_config : RPC_client_unix.config = {
      RPC_client_unix.default_config with
      host = "127.0.0.1";
      port = 8732;
      tls = false;
    }
  in
  new unix_full
    ~chain:Client_config.default_chain
    ~block:Client_config.default_block
    ~confirmations:None
    ~password_filename:None
    ~base_dir:"/home/tezos/.tezos-client"
    ~rpc_config:rpc_config   
   
let get_puk_from_alias name =
  let ctxt = context in
  alias_keys ctxt name
  >>=? function
  | Some (_,pk,_) -> (
    match pk with
    | Some pk -> return @@ Some pk
    |None -> return None )
  | None -> return None

let get_puk_from_hash pk_hash =
  let ctxt = context in
  Public_key_hash.of_source pk_hash
  >>=? fun pk_hash_ ->
  Client_keys.get_key ctxt pk_hash_
  >>=? fun (_, src_pk, _) ->
  return src_pk
