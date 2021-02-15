open Tezos_api
open Tezos_client_007_PsDELPH1
   
let command = ref "puk_alias"
let port = ref 0
let basedir = ref "/home/tamara/Studium/Tezos/project/tezos-project/sandbox"
let debug = ref false

let usage = "Usage: " ^ Sys.argv.(0) ^ " -c (puk_alias | puk_hash | pukh_alias | get_contr | tez | transfer | query | balance | call | get_code | parse_top | parse_expr)"
let spec_list = [
    ("-c", Arg.Set_string command, ": specifies which command should be executed; default = " ^ !command);
    ("-p", Arg.Set_int port, ": specifies RPC port of the Tezos node; default =8732");
    ("-d", Arg.Set_string basedir, ": specifies base directory of the Tezos client; default = /home/tezos/.tezos-client");
    ("-v", Arg.Set debug, ": enables debug mode (prints the whole Tezos error trace)")
  ]

let str_of_err err = match err with
  | SyncAPIV0_error.Rejection Insufficient_balance -> "Insufficient_balance"
  | SyncAPIV0_error.Rejection Insufficient_fee -> "Insufficient_fee"
  | SyncAPIV0_error.Rejection Counter_mismatch -> "Counter_mismatch"
  | SyncAPIV0_error.Rejection Invalid_receiver -> "Invalid_receiver"
  | SyncAPIV0_error.Rejection Reached_burncap -> "Reached_burncap"
  | SyncAPIV0_error.Rejection Reached_feecap -> "Reached_feecap"
  | SyncAPIV0_error.Rejection Empty_transaction -> "Empty_transaction"
  | SyncAPIV0_error.Rejection Empty_implicit_contract -> "Empty_implicit_contract"
  | SyncAPIV0_error.Rejection Michelson_parser_error -> "Michelson_parser_error"
  | SyncAPIV0_error.Rejection Michelson_runtime_error s -> "Michelson_runtime_error: " ^ s
  | SyncAPIV0_error.RPC_error {uri} -> "RPC error at " ^ uri
  | SyncAPIV0_error.Node_connection_failed -> "Node_connection_failed"
  | SyncAPIV0_error.Unexpected_result -> "Unexpected_result"
  | SyncAPIV0_error.Unknown_public_key -> "Unknown public key"
  | SyncAPIV0_error.Unknown_secret_key -> "Unknown secret_key"
  | SyncAPIV0_error.Keys_not_found -> "Keys not found"
  | SyncAPIV0_error.Wrong_contract_notation s -> "Wrong_contract_notation " ^ s
  | SyncAPIV0_error.Invalid_public_key_hash -> "Invalid_public_key_hash"
  | SyncAPIV0_error.Not_callable -> "Not_callable"
  | SyncAPIV0_error.Unknown e -> e

let str_of_status st = match st with
  | SyncAPIV0.Still_pending -> "Still_pending"
  | SyncAPIV0.Accepted _ -> "Accepted"
  | SyncAPIV0.Missing -> "Missing"
  | SyncAPIV0.Rejected (Reason r) -> (
     let err_str = str_of_err (Rejection r) in
     "Rejected - " ^ err_str)
  | SyncAPIV0.Rejected (Unknown_reason s) -> "Rejected - " ^ s
  | SyncAPIV0.Rejected Timeout -> "Rejected - Timeout"
  | SyncAPIV0.Rejected Skipped -> "Rejected - Skipped"
  | SyncAPIV0.Rejected Backtracked -> "Rejected - Backtracked"
  | SyncAPIV0.Unprocessed -> "Unprocessed"

let run_puk_from_alias () =
  SyncAPIV0.get_puk_from_alias "tamara"
   >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_puk_from_hash () =
  SyncAPIV0.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_pukh_from_alias () =
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Ok _ -> print_endline "Ok"; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_get_contract () =
  SyncAPIV0.get_contract "tamara"
  (* SyncAPIV0.get_contract "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S" alternatively *)
  >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_transfer () =
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Ok pukh -> (
     SyncAPIV0.get_contract "tamara"
     >>= function
     | Ok contr -> (
       let amount = SyncAPIV0.Tez_t.tez 10.0 in
       let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.transfer amount pukh contr fees
       >>= function
       | Ok _ ->print_endline "Ok" ; Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

(*
let run_query () =
  let oph = Operation_hash.of_b58check "opFVcseqXgajPVLzXisws6912Sxy8ifpr9y3xFYNp6KjEG6Nj8u" in
  match oph with
  | Ok oph -> (
    SyncAPIV0.query oph
    >>= function
    | Ok st -> print_endline @@ str_of_status st; Lwt.return 1
    | Error err -> print_endline @@ str_of_err err; Lwt.return 0
  )
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0
 *)

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; SyncAPIV0.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return 1

let run_get_balance () =
  SyncAPIV0.get_contract "tamara"
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
  SyncAPIV0.get_pukh_from_alias "tamara"
  >>= function
  | Ok pukh -> (
     SyncAPIV0.get_contract "tamara"
     >>= function
     | Ok contr -> (
       let amount = SyncAPIV0.Tez_t.tez 10.0 in
       let fees = SyncAPIV0.Tez_t.tez 0.0001 in
       SyncAPIV0.call_contract amount pukh contr fees
       >>= function
       | Ok _ -> print_endline "Ok" ; Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_get_code () =
  let open SyncAPIV0_error.Answer in
  begin
    SyncAPIV0.get_contract "auction"
    >>=? fun c ->
    SyncAPIV0.get_contract_code c
    >>=? fun code ->
    print_endline code.source;
    return ()
  end
  >>= function
  | Ok () -> Lwt.return 0
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_parse_top () =
  let src = let open Core in
            In_channel.read_all "/home/bernhard/tezos-project/sandbox/test.tz"
  in
  SyncAPIV0.parse_script src
  >>= function
  | Ok _ -> Lwt.return 0
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_parse_expr () =
  let expr = "{UNIT ; NIL operation ; PAIR }" in
  SyncAPIV0.parse_script expr
  >>= function
  | Ok _ -> Lwt.return 0
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
  (*else if !command = "query" then run_query ()*)
  else if !command = "get_contr" then run_get_contract ()
  else if !command = "tez" then run_tez ()
  else if !command = "balance" then run_get_balance ()
  else if !command = "call" then run_call_contract ()
  else if !command = "get_code" then run_get_code ()
  else if !command = "parse_top" then run_parse_top ()
  else if !command = "parse_expr" then run_parse_expr ()
  else (print_endline "Unknown command" ; Lwt.return 0)
  >>= fun retcode -> Lwt.return retcode

let () =
  Stdlib.exit @@ Lwt_main.run main

  
