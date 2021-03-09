open Dao_type
open Generate_assertion_contract

let verbose_arg = ref false
let assertion_file_arg = ref ""
let dao_contract_arg = ref (DAO_File "")
let node_port_arg = ref None
let node_basedir_arg = ref None
(* Tezos specific flags *)
let tezos_api_verbose_arg = ref false

let set_dao_file path = dao_contract_arg := DAO_File path
let set_dao_chain addr = dao_contract_arg := DAO_Chain addr
let set_dao_string s = dao_contract_arg := DAO_String s
let set_port p = node_port_arg := Some p
let set_basedir dir = node_basedir_arg := Some dir

let usage = "Usage: " ^ Sys.argv.(0) ^ "-a <path> (--address <address> | --file <path> | --script string) [-p <port>] [-d <dir>] [--tz-api-v]"
let spec_list = [
    ("-v", Arg.Set verbose_arg, "Verbose mode - prints out intermediate results of the pipeline");
    ("-a", Arg.Set_string assertion_file_arg, "File path of the assertion contract");
    ("--address", Arg.String (set_dao_chain), "Address of the parent contract");
    ("--file", Arg.String (set_dao_file), "File path of the parent contract");
    ("--script", Arg.String (set_dao_string), "Raw script of the parent contract");
    ("-p", Arg.Int (set_port), ": specifies RPC port of the node; default depends on the backend");
    ("-d", Arg.String (set_basedir), ": specifies base directory of node or client; default depends on the backend");
    ("--tz-api-v", Arg.Set tezos_api_verbose_arg, ": enables debug mode of the Tezos API (prints the whole Tezos error trace)")
  ]

let main =
  Arg.parse
           spec_list
           (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
           usage;
  Lwt.catch
    (fun () ->
      (* Perform sanity checks on arguments and pass as structure *)
      let args = Cli_args.build_args
                   !verbose_arg
                   !assertion_file_arg
                   !dao_contract_arg
                   !node_port_arg
                   !node_basedir_arg
                   !tezos_api_verbose_arg in
      generate_assertion_contract args
      >>= fun () ->
      Printf.printf "\027[1;4;32mSUCCESS\n";
      Printf.printf "\027[0mThe assertion file is valid. Compile me!\n";
      Lwt.return 0)
    (function
     | Invalid_argument s ->
        Printf.eprintf "\027[1;4;31mERROR:\n";
        Printf.eprintf "\027[0mInvalid argument - %s\n" s; Lwt.return 1
     | Failure s ->
        Printf.eprintf "\027[1;4;31mERROR:\n";
        Printf.eprintf "\027[0m%s" s; Lwt.return 1
     | e ->
        Printf.eprintf "\027[1;4;31mERROR:\n";
        Printf.eprintf "\027[0m%s\n" (Printexc.to_string e); Lwt.return 1)

let () =
  Stdlib.exit @@ Lwt_main.run main
