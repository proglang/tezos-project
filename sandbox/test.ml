open Tezos_api
open Format
open Error_monad

   
let run =
  Internal_event_unix.init ()
  >>= fun () ->
  Api.get_puk_from_hash
    "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= fun result ->
  match result with
  | Ok (Some pk) -> Format.fprintf std_formatter "%a" Signature.Public_key.pp pk ; Lwt.return 1
  | Ok None -> print_endline "No pubkey for alias found"; Lwt.return 0
  | Error errs -> Format.fprintf std_formatter "%a" Error_monad.pp @@ List.hd errs; Lwt.return 0
  >>= fun retcode ->
  Internal_event_unix.close () >>= fun () -> Lwt.return retcode 

let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run run

  
