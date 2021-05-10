open SyncAPIV1
open SyncAPIV1.Api_error.Answer

let port = ref 8732
let basedir = ref "/home/tezos/.tezos-client/"
let debug = ref false

let usage = "Usage: " ^ Sys.argv.(0) ^ "[-p port] [-d client_dir] [-v]"
let spec_list = [
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
  | Api_error.Rejection Empty_transaction -> "Empty_transaction"
  | Api_error.Rejection Empty_implicit_contract -> "Empty_implicit_contract"
  | Api_error.Rejection Michelson_runtime_error s -> "Michelson_runtime_error: " ^ s
  | Api_error.RPC_error {uri} -> "RPC error at " ^ uri
  | Api_error.Node_connection_failed -> "Node_connection_failed"
  | Api_error.Unexpected_result -> "Unexpected_result"
  | Api_error.Unknown_public_key -> "Unknown public key"
  | Api_error.Unknown_secret_key -> "Unknown secret_key"
  | Api_error.Keys_not_found -> "Keys not found"
  | Api_error.Wrong_contract_notation s -> "Wrong_contract_notation " ^ s
  | Api_error.Invalid_public_key_hash -> "Invalid_public_key_hash"
  | Api_error.Michelson_parser_error s -> "Michelson_parser_error: " ^ s
  | Api_error.Not_callable -> "Not_callable"
  | Api_error.Unknown e -> e

let str_of_status st = match st with
  | Api.Still_pending -> "Still_pending"
  | Api.Accepted _ -> "Accepted"
  | Api.Missing -> "Missing"
  | Api.Rejected (Reason r) -> (
     let err_str = str_of_err (Rejection r) in
     "Rejected - " ^ err_str)
  | Api.Rejected (Unknown_reason s) -> "Rejected - " ^ s
  | Api.Rejected Timeout -> "Rejected - Timeout"
  | Api.Rejected Skipped -> "Rejected - Skipped"
  | Api.Rejected Backtracked -> "Rejected - Backtracked"
  | Api.Unprocessed -> "Unprocessed"

let run_puk_from_alias () =
  Api.get_puk_from_alias "tamara"
   >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_puk_from_hash () =
  Api.get_puk_from_hash "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S"
  >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_pukh_from_alias () =
  Api.get_pukh_from_alias "tamara"
  >>= function
  | Ok _ -> print_endline "Ok"; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_get_contract () =
  Api.get_contract "tamara"
  (* Api.get_contract "tz1XGXdyCAeAsZ8Qo4BFQVkLCnfQ4ZyLgJ1S" alternatively *)
  >>= function
  | Ok _ -> print_endline "Ok" ; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_transfer () =
  Api.get_pukh_from_alias "tamara"
  >>=? fun pukh ->
  Api.get_contract "tamara"
  >>=? fun contr ->
  let amount = Api.Tez_t.tez 10.0 in
  let fees = Api.Tez_t.tez 0.0001 in
  Api.transfer amount pukh contr fees
  >>= function
    | Ok _ -> print_endline "Ok" ; Lwt.return_ok ()
    | Error err -> Lwt.return_error err

(*
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
 *)

let run_tez () =
  let eq_classes = [1.0; 0.000001; 0.0000001] in
  let f = (fun tz -> print_endline @@ string_of_float tz; Api.Tez_t.tez tz) in
  let _ = List.map f eq_classes in
  Lwt.return_ok ()

let run_get_balance () =
  Api.get_contract "tamara"
  >>=? fun contr ->
  Api.get_balance contr
  >>= function
    | Ok _ -> print_endline "Ok"; Lwt.return_ok ()
    | Error err -> Lwt.return_error err

let run_call_contract () =
  Api.get_pukh_from_alias "tamara"
  >>=? fun pukh ->
  Api.get_contract "tamara"
  >>=? fun contr ->
  let amount = Api.Tez_t.tez 10.0 in
  let fees = Api.Tez_t.tez 0.0001 in
  Api.call_contract amount pukh contr fees
  >>= function
    | Ok _ -> print_endline "Ok" ; Lwt.return_ok ()
    | Error err -> Lwt.return_error err

let run_get_code () =
  Api.get_contract "auction"
  >>=? fun c ->
  Api.get_contract_code c
  >>= function
  | Ok _ -> print_endline "Ok"; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_parse_top () =
  let src = let open Core in
            In_channel.read_all "/home/bernhard/tezos-project/sandbox/test.tz"
  in
  Api.parse_script src
  >>= function
  | Ok _ -> print_endline "Ok"; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let run_parse_expr () =
  let expr = "{UNIT ; NIL operation ; PAIR }" in
  Api.parse_script expr
  >>= function
  | Ok _ -> print_endline "Ok"; Lwt.return_ok ()
  | Error err -> Lwt.return_error err

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  if !port != 0 then Api.set_port !port;
  if !basedir <> "" then Api.set_basedir !basedir;
  if !debug then Api.set_debugmode true;
  begin
    print_endline "Test puk_from_alias";
    run_puk_from_alias ()
    >>=? fun _ ->
    print_endline "Test puk_from_hash";
    run_puk_from_hash ()
    >>=? fun _ ->
    print_endline "Test pukh_from_alias";
    run_pukh_from_alias ()
    >>=? fun _ ->
    print_endline "Test transfer";
    run_transfer ()
    >>=? fun _ ->
    print_endline "Test get_contract";
    run_get_contract ()
    >>=? fun _ ->
    print_endline "Test tez";
    run_tez ()
    >>=? fun _ ->
    print_endline "Test get_balance";
    run_get_balance ()
    >>=? fun _ ->
    print_endline "Test call_contract";
    run_call_contract ()
    >>=? fun _ ->
    print_endline "Test get_code";
    run_get_code ()
    >>=? fun _ ->
    print_endline "Test parse_toplevel";
    run_parse_top ()
    >>=? fun _ ->
    print_endline "Test parse_expression";
    run_parse_expr ()
  end
  >>= function
          | Ok () -> Lwt.return 0
          | Error err -> print_endline @@ str_of_err err; Lwt.return 1

let () =
  Stdlib.exit @@ Lwt_main.run main
