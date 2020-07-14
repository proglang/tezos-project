open Tezos_api
open Format
open Error_monad
   
let command = ref "puk_alias"
let usage = "Usage: " ^ Sys.argv.(0) ^ " -c (puk_alias | puk_hash)"
let spec_list = [
    ("-c", Arg.Set_string command, ": specifies which command should be executed; default = " ^ !command);
  ]

let run_puk_from_alias =
  Api.get_puk_from_alias "tamara"
   >>= fun result ->
  match result with
  | Ok (Some pk) -> Format.fprintf std_formatter "%a" Signature.Public_key.pp pk ; Lwt.return 1
  | Ok None -> print_endline "No pubkey found"; Lwt.return 0
  | Error errs -> Format.fprintf std_formatter "%a" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_puk_from_hash =
  Api.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
   >>= fun result ->
  match result with
  | Ok (Some pk) -> Format.fprintf std_formatter "%a" Signature.Public_key.pp pk ; Lwt.return 1
  | Ok None -> print_endline "No pubkey found"; Lwt.return 0
  | Error errs -> Format.fprintf std_formatter "%a" Error_monad.pp @@ List.hd errs; Lwt.return 0

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  Internal_event_unix.init ()
  >>= fun () ->
  if !command = "puk_alias" then run_puk_from_alias
  else if !command = "puk_hash" then run_puk_from_hash
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode ->
  Internal_event_unix.close () >>= fun () -> Lwt.return retcode 

let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run main

  
