open Tezos_api
   
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
  | SyncAPIV0.Insufficient_balance -> "Insufficient_balance"
  | SyncAPIV0.Insufficient_fee -> "Insufficient_fee"
  | SyncAPIV0.Counter_mismatch -> "Counter_mismatch"
  | SyncAPIV0.Invalid_receiver -> "Invalid_receiver"
  | SyncAPIV0.Reached_burncap -> "Reached_burncap"
  | SyncAPIV0.Reached_feecap -> "Reached_feecap"
  | SyncAPIV0.Unknown_failure str -> str

let str_of_status st = match st with
  | SyncAPIV0.Still_pending -> "Still_pending"
  | SyncAPIV0.Accepted _ -> "Accepted"
  | SyncAPIV0.Missing -> "Missing"
  | SyncAPIV0.Rejected (Reason r) -> (
     let err_str = str_of_err r in
     "Rejected - " ^ err_str)
  | SyncAPIV0.Rejected Timeout -> "Rejected - Timeout"
  | SyncAPIV0.Rejected Skipped -> "Rejected - Skipped"
  | SyncAPIV0.Rejected Backtracked -> "Rejected - Backtracked"
  | SyncAPIV0.Unprocessed -> "Unprocessed"
  | SyncAPIV0.Error (Unknown_error str) -> str
  | SyncAPIV0.Error Unexpected_result -> "Error - Unexpected_result"
  | SyncAPIV0.Error RPC_error _ -> "Error - RPC"

let run_puk_from_alias () =
  SyncAPIV0.get_puk_from_alias "tamara"
   >>= function
  | Some _ -> print_endline "Found public key" ; Lwt.return 1
  | None -> print_endline "Unknown key alias"; Lwt.return 0

let run_puk_from_hash () =
  SyncAPIV0.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= function
  | Some _ -> print_endline "Found public key" ; Lwt.return 1
  | None -> print_endline "Invalid public key hash"; Lwt.return 0

let run_pukh_from_alias () =
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Some _ -> print_endline "Found public key hash" ; Lwt.return 1
  | None -> print_endline "Unknown key alias"; Lwt.return 0

let run_get_contract () =
  SyncAPIV0.get_contract "tamara"
  (* SyncAPIV0.get_contract "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S" alternatively *)
  >>= function
  | Some _ -> print_endline "Found contract" ; Lwt.return 1
  | None -> print_endline "Invalid contract notation/Unknown contract"; Lwt.return 0

let run_transfer () =
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Some pkh_1 -> (
    SyncAPIV0.get_contract "tamara"
    >>= function
    | Some contr -> (
      let amount = SyncAPIV0.Tez_t.tez 10.0 in
      let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.transfer amount pkh_1 contr fees
       >>= function
       | Fail err -> print_endline @@ str_of_err err; Lwt.return 0
       | Pending _ -> print_endline "Operation is pending" ; Lwt.return 0
    )
    | None -> print_endline "Invalid/unknown destination contract"; Lwt.return 0 )
  | None -> print_endline "Unknown source key alias"; Lwt.return 0

let run_query () =
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Some pkh_1 -> (
    SyncAPIV0.get_contract "tamara"
    >>= function
    | Some contr -> (
      let amount = SyncAPIV0.Tez_t.tez 10.0 in
      let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.transfer amount pkh_1 contr fees
       >>= function
       | Fail err -> print_endline @@ str_of_err err; Lwt.return 0
       | Pending oph -> (
         SyncAPIV0.query oph
         >>= fun st ->
         print_endline @@ str_of_status st;
         Lwt.return 1
       ))
    | None -> print_endline "Invalid/unknown destination contract"; Lwt.return 0 )
  | None -> print_endline "Unknown source key alias"; Lwt.return 0

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; SyncAPIV0.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return 1

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  if !port != 0 then SyncAPIV0.set_port !port;
  if !basedir <> "" then SyncAPIV0.set_basedir !basedir;
  if !command = "puk_alias" then run_puk_from_alias ()
  else if !command = "puk_hash" then run_puk_from_hash ()
  else if !command = "pukh_alias" then run_pukh_from_alias ()
  else if !command = "transfer" then run_transfer ()
  else if !command = "query" then run_query ()
  else if !command = "get_contr" then run_get_contract ()
  else if !command = "tez" then run_tez ()
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode -> Lwt.return retcode 

let () =
  Stdlib.exit @@ Lwt_main.run main

  
