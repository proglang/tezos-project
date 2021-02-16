open SyncAPIV1
open Tezos_error_monad.Error_monad

let get_script string =
  Api.parse_script string
  >>= function
  | Ok script -> return script
  | Error err -> failwith "%a" Api_error.pp_error err
