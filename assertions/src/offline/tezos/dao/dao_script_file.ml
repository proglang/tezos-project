open SyncAPIV1
open Tezos_error_monad.Error_monad

let read_toplevel path = let open Core in
                         In_channel.read_all path

let get_script ~path =
  Api.parse_script @@ read_toplevel path
  >>= function
  | Ok script -> return script
  | Error err -> failwith "Parsing the contract code failed. @.--- @.%a@." Api_error.pp_error err
