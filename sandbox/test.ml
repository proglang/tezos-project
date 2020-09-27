open Tezos_api
open Format
open Error_monad
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
   
let command = ref "puk_alias"
let port = ref 0
let basedir = ref "/home/tamara/Studium/Tezos/project/tezos-project/sandbox"

let usage = "Usage: " ^ Sys.argv.(0) ^ " -c (puk_alias | puk_hash | pukh_alias | get_contr | tez | transfer | query)"
let spec_list = [
    ("-c", Arg.Set_string command, ": specifies which command should be executed; default = " ^ !command);
    ("-p", Arg.Set_int port, ": specifies RPC port of the Tezos node; default =8732");
    ("-d", Arg.Set_string basedir, ": specifies base directory of the Tezos client; default = /home/tezos/.tezos-client")
  ]

let str_of_err err = match err with
  | Api.Insufficient_balance -> "Insufficient_balance"
  | Api.Insufficient_fee -> "Insufficient_fee"
  | Api.Counter_mismatch -> "Counter_mismatch"
  | Api.Invalid_receiver -> "Invalid_receiver"
  | Api.Reached_burncap -> "Reached_burncap"
  | Api.Reached_feecap -> "Reached_feecap"
  | Api.Unknown_failure str -> str

let str_of_status st = match st with
  | Api.Still_pending -> "Still_pending"
  | Api.Accepted r -> "Accepted - block " ^ (asprintf "%a" Block_hash.pp r.block_hash)
  | Api.Missing -> "Missing"
  | Api.Rejected (Reason r) -> (
     let err_str = str_of_err r in
     "Rejected - " ^ err_str)
  | Api.Rejected Timeout -> "Rejected - Timeout"
  | Api.Rejected Skipped -> "Rejected - Skipped"
  | Api.Rejected Backtracked -> "Rejected - Backtracked"
  | Api.Unprocessed -> "Unprocessed"
  | Api.Error (Unknown_error str) -> str
  | Api.Error Unexpected_result -> "Error - Unexpected_result"
  | Api.Error RPC_error _ -> "Error - RPC"

let run_puk_from_alias () =
  Api.get_puk_from_alias "tamara"
   >>= function
  | Some pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | None -> print_endline "Unknown key alias"; Lwt.return 0

let run_puk_from_hash () =
  Api.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= function
  | Some pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | None -> print_endline "Invalid public key hash"; Lwt.return 0

let run_pukh_from_alias () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Some pkh -> Format.fprintf std_formatter "%a\n" Signature.Public_key_hash.pp pkh ;
              Lwt.return 1
  | None -> print_endline "Unknown key alias"; Lwt.return 0

let run_get_contract () =
  Api.get_contract "tamara"
  (* Api.get_contract "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S" alternatively *)
  >>= function
  | Some c -> Format.fprintf std_formatter "%a\n" Contract.pp c ;
            Lwt.return 1
  | None -> print_endline "Invalid contract notation/Unknown contract"; Lwt.return 0

let run_transfer () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Some pkh_1 -> (
    Api.get_contract "tamara"
    >>= function
    | Some contr -> (
      let amount = Api.Tez_t.tez 10.0 in
      let fees = Api.Tez_t.tez 0.0001 in
       Api.transfer amount pkh_1 contr fees
       >>= function
       | Fail err -> print_endline @@ str_of_err err; Lwt.return 0
       | Pending oph -> Format.fprintf std_formatter "%a\n" Operation_hash.pp oph ; Lwt.return 0
    )
    | None -> print_endline "Invalid/unknown destination contract"; Lwt.return 0 )
  | None -> print_endline "Unknown source key alias"; Lwt.return 0

let run_query () =
  let oph = Operation_hash.of_b58check "opFVcseqXgajPVLzXisws6912Sxy8ifpr9y3xFYNp6KjEG6Nj8u" in
  match oph with
  | Ok oph -> (
    Api.query oph
    >>= fun st ->
    print_endline @@ str_of_status st;
    Lwt.return 1
  )
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; Api.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return 1

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  Internal_event_unix.init ()
  >>= fun () ->
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  if !command = "puk_alias" then run_puk_from_alias ()
  else if !command = "puk_hash" then run_puk_from_hash ()
  else if !command = "pukh_alias" then run_pukh_from_alias ()
  else if !command = "transfer" then run_transfer ()
  else if !command = "query" then run_query ()
  else if !command = "get_contr" then run_get_contract ()
  else if !command = "tez" then run_tez ()
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode ->
  Internal_event_unix.close () >>= fun () -> Lwt.return retcode 

let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run main

  
