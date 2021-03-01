open Dao_type
open Generate_assertion_contract

let verbose_arg = ref false
let assertion_file_arg = ref ""
let dao_contract_arg = ref (DAO_File "")
let node_port_arg = ref None
let node_basedir_arg = ref None
(* Tezos specific flags *)
let tezos_api_verbose_arg = ref None

let set_dao_file path = dao_contract_arg := DAO_File path
let set_dao_chain addr = dao_contract_arg := DAO_Chain addr
let set_dao_string s = dao_contract_arg := DAO_String s
let set_port p = node_port_arg := Some p
let set_basedir dir = node_basedir_arg := Some dir
let set_tezos_api_verbose v = tezos_api_verbose_arg := Some v

let usage = "Usage: " ^ Sys.argv.(0) ^ "-a <path> (--address <address> | --file <path> | --script string) [-p <port>] [-d <dir>] [--tz-api-v]"
let spec_list = [
    ("-v", Arg.Set verbose_arg, "Verbose mode - prints out intermediate results");
    ("-a", Arg.Set_string assertion_file_arg, "File path of the assertion contract");
    ("--address", Arg.String (set_dao_chain), "Address of the parent contract");
    ("--file", Arg.String (set_dao_file), "File path of the parent contract code");
    ("--script", Arg.String (set_dao_string), "Script of the parent contract");
    ("-p", Arg.Int (set_port), ": specifies RPC port of the node; default depends on the backend");
    ("-d", Arg.String (set_basedir), ": specifies base directory of node or client; default depends on the backend");
    ("--tz-api-v", Arg.Bool (set_tezos_api_verbose), ": enables debug mode of the Tezos API (prints the whole Tezos error trace)")
  ]

let main =
  Arg.parse
           spec_list
           (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
           usage;
  let args = Cli_args.build_args
               !verbose_arg
               !assertion_file_arg
               !dao_contract_arg
               !node_port_arg
               !node_basedir_arg
               !tezos_api_verbose_arg
  in
  generate_assertion_contract args

(* The example contract is first parsed and then transformed by the backend *)
let () =
  Stdlib.exit @@ Lwt_main.run main
