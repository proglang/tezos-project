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
   
let get_puk name =
  let ctxt = context in
  alias_keys ctxt name
  >>=? function
  | Some (_,pk,_) -> (
    match pk with
    | Some pk -> 
       ctxt#message "Pubkey: %a" Signature.Public_key.pp pk
       >>= fun () -> return 1
    |None -> 
      ctxt#message "No key found for address"
      >>= fun () -> return 0
  )
  | None ->
     ctxt#message "No key found for address"
     >>= fun () -> return 0

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
  >>=? fun l ->
  return @@ filter_map
    (fun (_, pkh, pk,_) ->
      if pkh = pk_hash then Some pk else None
    )
    l
  >>=? function
  | pk::_ -> return pk
  | [] -> return None
       
