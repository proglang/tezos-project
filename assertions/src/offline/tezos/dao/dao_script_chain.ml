open SyncAPIV1
open Tezos_error_monad.Error_monad

let get_script ~address =
  begin
    let open Api_error.Answer in
    Api.get_contract address
    >>=? fun contr ->
    Api.get_contract_code contr
  end
  >>= function
  | Ok script -> return script
  | Error err -> failwith "Parsing the contract code failed. @.--- @.%a@." Api_error.pp_error err
