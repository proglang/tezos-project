open Tezos_api
open Tezos_client_006_PsCARTHA
   
let command = ref "puk_alias"
let port = ref 0
let basedir = ref "/home/tamara/Studium/Tezos/project/tezos-project/sandbox"
let debug = ref false

let usage = "Usage: " ^ Sys.argv.(0) ^ " -c (puk_alias | puk_hash | pukh_alias | get_contr | tez | transfer | query | balance | call)"
let spec_list = [
    ("-c", Arg.Set_string command, ": specifies which command should be executed; default = " ^ !command);
    ("-p", Arg.Set_int port, ": specifies RPC port of the Tezos node; default =8732");
    ("-d", Arg.Set_string basedir, ": specifies base directory of the Tezos client; default = /home/tezos/.tezos-client");
    ("-v", Arg.Set debug, ": enables debug mode (prints the whole Tezos error trace)")
  ]

let str_of_err = function
  | Api_error.Rejection Insufficient_balance -> "Insufficient_balance"
  | Api_error.Rejection Insufficient_fee -> "Insufficient_fee"
  | Api_error.Rejection Counter_mismatch -> "Counter_mismatch"
  | Api_error.Rejection Invalid_receiver -> "Invalid_receiver"
  | Api_error.Rejection Reached_burncap -> "Reached_burncap"
  | Api_error.Rejection Reached_feecap -> "Reached_feecap"
  | Api_error.Rejection Empty_transaction -> "Empty_transaction"
  | Api_error.Rejection Empty_implicit_contract -> "Empty_implicit_contract"
  | Api_error.Rejection Michelson_parser_error -> "Michelson_parser_error"
  | Api_error.Rejection Michelson_runtime_error -> "Michelson_runtime_error"
  | Api_error.RPC_error {uri} -> "RPC error at " ^ uri
  | Api_error.Node_connection_failed -> "Node_connection_failed"
  | Api_error.Unexpected_result -> "Unexpected_result"
  | Api_error.Unknown_public_key -> "Unknown public key"
  | Api_error.Unknown_secret_key -> "Unknown secret_key"
  | Api_error.Keys_not_found -> "Keys not found"
  | Api_error.Wrong_contract_notation s -> "Wrong_contract_notation " ^ s
  | Api_error.Invalid_public_key_hash -> "Invalid_public_key_hash"
  | Api_error.Not_callable -> "Not_callable"
  | Api_error.Unknown e -> e

let str_of_status = function
  | SyncAPIV0.Still_pending -> "Still_pending"
  | SyncAPIV0.Accepted _ -> "Accepted"
  | SyncAPIV0.Missing -> "Missing"
  | SyncAPIV0.Rejected (Reason r) -> (
     let err_str = str_of_err (Rejection r) in
     "Rejected - " ^ err_str)
  | Api.Rejected (Unknown_reason s) -> "Rejected - " ^ s
  | SyncAPIV0.Rejected Timeout -> "Rejected - Timeout"
  | SyncAPIV0.Rejected Skipped -> "Rejected - Skipped"
  | SyncAPIV0.Rejected Backtracked -> "Rejected - Backtracked"
  | SyncAPIV0.Unprocessed -> "Unprocessed"

let run_puk_from_alias () =
  SyncAPIV0.get_puk_from_alias "dummyuser"
   >>= function
  | Ok _ -> print_endline "Found public key"; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_puk_from_hash () =
  SyncAPIV0.get_puk_from_hash "tz1234567890"
  >>= function
  | Ok _ -> print_endline "Found public key" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_pukh_from_alias () =
  SyncAPIV0.get_pukh_from_alias "dummyuser"
  >>= function
  | Ok _ -> print_endline "Found public key hash" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_get_contract () =
  SyncAPIV0.get_contract "dummyuser"
  (* SyncAPIV0.get_contract "tz1234567890" alternatively *)
  >>= function
  | Ok _ -> print_endline "Found contract" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_transfer () =
  SyncAPIV0.get_pukh_from_alias "dummyuser"
  >>= function
  | Ok pukh -> (
     SyncAPIV0.get_contract "dummyuser2"
     >>= function
     | Ok contr -> (
       let amount = SyncAPIV0.Tez_t.tez 10.0 in
       let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.transfer amount pukh contr fees
       >>= function
       | Ok _ -> print_endline "Injection succesful" ; Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_query () =
  SyncAPIV0.get_pukh_from_alias "dummyuser"
  >>= function
  | Ok pkh_1 -> (
    SyncAPIV0.get_contract "dummyuser2"
    >>= function
    | Ok contr -> (
      let amount = SyncAPIV0.Tez_t.tez 10.0 in
      let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.transfer amount pkh_1 contr fees
       >>= function
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0
       | Ok oph -> (
         SyncAPIV0.query oph
         >>= function
         | Ok st -> print_endline @@ str_of_status st; Lwt.return 1
         | Error err -> print_endline @@ str_of_err err; Lwt.return 0
    ))
    | Error err -> print_endline @@ str_of_err err; Lwt.return 0)
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; SyncAPIV0.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return 1

let run_get_balance () =
  SyncAPIV0.get_contract "dummyuser"
  >>= function
  | Ok contr -> (
    SyncAPIV0.get_balance contr
    >>= function
    | Ok tz -> (
      let tz_str = string_of_float @@ SyncAPIV0.Tez_t.to_float tz in
      print_endline (tz_str ^ " " ^ Client_proto_args.tez_sym); Lwt.return 1
    )
    | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_call_contract () =
  SyncAPIV0.get_pukh_from_alias "dummyuser"
  >>= function
  | Ok pukh -> (
     SyncAPIV0.get_contract "KT123456789"
     >>= function
     | Ok contr -> (
       let amount = SyncAPIV0.Tez_t.zero in
       let fees = SyncAPIV0.Tez_t.tez 0.001 in
       let entrypoint = "someEntrypoint" in
       let arg = "Some parameters" in
       SyncAPIV0.call_contract amount pukh contr ~entrypoint ~arg fees
       >>= function
       | Ok _ -> print_endline "Injection succesful"; Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  if !port != 0 then SyncAPIV0.set_port !port;
  if !basedir <> "" then SyncAPIV0.set_basedir !basedir;
  if !debug then SyncAPIV0.set_debugmode true;
  if !command = "puk_alias" then run_puk_from_alias ()
  else if !command = "puk_hash" then run_puk_from_hash ()
  else if !command = "pukh_alias" then run_pukh_from_alias ()
  else if !command = "transfer" then run_transfer ()
  else if !command = "query" then run_query ()
  else if !command = "get_contr" then run_get_contract ()
  else if !command = "tez" then run_tez ()
  else if !command = "balance" then run_get_balance ()
  else if !command = "call" then run_call_contract ()
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode -> Lwt.return retcode

let () =
  Stdlib.exit @@ Lwt_main.run main
