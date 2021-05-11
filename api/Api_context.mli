class unix_full_silent :
  base_dir:string
  -> chain:Shell_services.chain
  -> block:Shell_services.block
  -> confirmations:int option
  -> password_filename:string option
  -> rpc_config:Tezos_rpc_http_client_unix.RPC_client_unix.config
  -> Client_context.full
