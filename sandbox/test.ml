open Tezos_api
open Format
open Error_monad
   
let command = ref "puk_alias"
let port = ref 0
let basedir = ref "/home/tamara/Studium/Tezos/project/tezos-project/sandbox"

let usage = "Usage: " ^ Sys.argv.(0) ^ " -c (puk_alias | puk_hash | pukh_alias | transfer)"
let spec_list = [
    ("-c", Arg.Set_string command, ": specifies which command should be executed; default = " ^ !command);
    ("-p", Arg.Set_int port, ": specifies RPC port of the Tezos node; default =8732");
    ("-d", Arg.Set_string basedir, ": specifies base directory of the Tezos client; default = /home/tezos/.tezos-client")
  ]

let run_puk_from_alias () =
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  Api.get_puk_from_alias "tamara"
   >>= fun result ->
  match result with
  | Ok pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_puk_from_hash () =
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  Api.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
   >>= fun result ->
  match result with
  | Ok pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_pukh_from_alias () =
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  Api.get_pukh_from_alias "tamara"
  >>= fun result ->
  match result with
  | Ok pkh -> Format.fprintf std_formatter "%a\n" Signature.Public_key_hash.pp pkh ; Lwt.return 1
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_transfer () =
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Ok pkh_1 -> (
     Api.transfer 10 pkh_1 "tamara2" 10
     >>= fun result ->
     match result with
     | Ok ((op_hash,_ ,_), _) -> Format.fprintf std_formatter "%a\n" Operation_hash.pp op_hash ; Lwt.return 1
     | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0 )
  | Error errs ->  Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0


let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  Internal_event_unix.init ()
  >>= fun () ->
  if !command = "puk_alias" then run_puk_from_alias ()
  else if !command = "puk_hash" then run_puk_from_hash ()
  else if !command = "pukh_alias" then run_pukh_from_alias ()
  else if !command = "transfer" then run_transfer ()
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode ->
  Internal_event_unix.close () >>= fun () -> Lwt.return retcode 

let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run main

  
