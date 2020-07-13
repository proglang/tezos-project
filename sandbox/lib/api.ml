open Client_keys
open List
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
    ~base_dir:"~/.tezos-node/"
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
  list_keys ctxt
  >>=? fun keys ->
  Public_key_hash.of_source pk_hash
  >>=? fun pk_hash_ ->
  let filtered = filter_map (fun (_, pkh, pk,_) ->
      if pkh = pk_hash_ then pk else None
    )
    keys
  in
  match filtered with
  | pk::_ -> return @@ Some pk
  | [] -> return None
