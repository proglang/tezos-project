open Tezos_api
open Format
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
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

let str_of_err err = match err with
  | Api_error.Rejection Insufficient_balance -> "Insufficient_balance"
  | Api_error.Rejection Insufficient_fee -> "Insufficient_fee"
  | Api_error.Rejection Counter_mismatch -> "Counter_mismatch"
  | Api_error.Rejection Invalid_receiver -> "Invalid_receiver"
  | Api_error.Rejection Reached_burncap -> "Reached_burncap"
  | Api_error.Rejection Reached_feecap -> "Reached_feecap"
  | Api_error.Rejection Michelson_parser_error -> "Michelson_parser_error"
  | Api_error.Rejection Michelson_runtime_error -> "Michelson_runtime_error"
  | Api_error.RPC_error {uri} -> "RPC error at " ^ uri
  | Api_error.Node_connection_failed -> "Node_connection_failed"
  | Api_error.Unexpected_result -> "Unexpected_result"
  | Api_error.Unknown_public_key -> "Unknown public key"
  | Api_error.Unknown_secret_key -> "Unknown secret_key"
  | Api_error.Keys_not_found -> "Keys not found"
  | Api_error.Wrong_contract_notation s -> "Wrong_contract_notation " ^ s
  | Api_error.Unknown e -> e

let str_of_status st = match st with
  | Api.Still_pending -> "Still_pending"
  | Api.Accepted r -> "Accepted - block " ^ (asprintf "%a" Block_hash.pp r.block_hash)
  | Api.Missing -> "Missing"
  | Api.Rejected (Reason r) -> (
     let err_str = str_of_err (Rejection r) in
     "Rejected - " ^ err_str)
  | Api.Rejected (Unknown_reason s) -> s
  | Api.Rejected Timeout -> "Rejected - Timeout"
  | Api.Rejected Skipped -> "Rejected - Skipped"
  | Api.Rejected Backtracked -> "Rejected - Backtracked"
  | Api.Unprocessed -> "Unprocessed"

let run_puk_from_alias () =
  Api.get_puk_from_alias "tamara"
   >>= function
  | Ok pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_puk_from_hash () =
  Api.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= function
  | Ok pk -> Format.fprintf std_formatter "%a\n" Signature.Public_key.pp pk ; Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_pukh_from_alias () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Ok pkh -> Format.fprintf std_formatter "%a\n" Signature.Public_key_hash.pp pkh ;
              Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_get_contract () =
  Api.get_contract "tamara"
  (* Api.get_contract "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S" alternatively *)
  >>= function
  | Ok c -> Format.fprintf std_formatter "%a\n" Contract.pp c ;
            Lwt.return 1
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_transfer () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Ok pukh -> (
     Api.get_contract "tamara"
     >>= function
     | Ok contr -> (
       let amount = Api.Tez_t.tez 10.0 in
       let fees = Api.Tez_t.tez 0.0001 in
       Api.transfer amount pukh contr fees
       >>= function
       | Ok oph -> Format.fprintf std_formatter "%a\n" Operation_hash.pp oph ;
                   Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_query () =
  let oph = Operation_hash.of_b58check "opFVcseqXgajPVLzXisws6912Sxy8ifpr9y3xFYNp6KjEG6Nj8u" in
  match oph with
  | Ok oph -> (
    Api.query oph
    >>= function
    | Ok st -> print_endline @@ str_of_status st; Lwt.return 1
    | Error err -> print_endline @@ str_of_err err; Lwt.return 0
  )
  | Error errs -> Format.fprintf std_formatter "%a\n" Error_monad.pp @@ List.hd errs; Lwt.return 0

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; Api.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return 1

let run_get_balance () =
  Api.get_contract "tamara"
  >>= function
  | Ok contr -> (
    Api.get_balance contr
    >>= function
    | Ok tz -> (
      let tz_str = string_of_float @@ Api.Tez_t.to_float tz in
      print_endline (tz_str ^ " " ^ Client_proto_args.tez_sym); Lwt.return 1
    )
    | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let run_call_contract () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Ok pukh -> (
     Api.get_contract "tamara"
     >>= function
     | Ok contr -> (
       let amount = Api.Tez_t.tez 10.0 in
       let fees = Api.Tez_t.tez 0.0001 in
       Api.call_contract amount pukh contr fees
       >>= function
       | Ok oph -> Format.fprintf std_formatter "%a\n" Operation_hash.pp oph ;
                   Lwt.return 1
       | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
     | Error err -> print_endline @@ str_of_err err; Lwt.return 0 )
  | Error err -> print_endline @@ str_of_err err; Lwt.return 0

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  if !debug then Api.set_debugmode true;
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

  
