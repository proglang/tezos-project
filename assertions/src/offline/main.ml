open Parsing.Lex_and_parse
open Check_and_compile
open Dao_type

let tza_path = ref "./test.tza"
let tz_dao = ref (DAO_File "./test.tz")
let verbose_arg = ref false

let set_tz_dao_file path = tz_dao := DAO_File path
let set_tz_dao_chain addr = tz_dao := DAO_Chain addr
let set_tz_dao_string s = tz_dao := DAO_String s

let usage = "Usage: " ^ Sys.argv.(0) ^ "--tza <path> (-a <address> | -f <path>) [-v]"
let spec_list = [
    ("-a", Arg.String (set_tz_dao_chain), "Address of the parent contract");
    ("-f", Arg.String (set_tz_dao_file), "File path of the parent contract code");
    ("-s", Arg.String (set_tz_dao_string), "Script of the parent contract");
    ("--tza", Arg.Set_string tza_path, "File path of the assertion contract");
    ("-v", Arg.Set verbose_arg, "Verbose mode - prints out intermediate results")
    (* Can be used later when API is used *)
    (*
    ("-p", Arg.Set_int port, ": specifies RPC port of the Tezos node; default =8732");
    ("-d", Arg.Set_string basedir, ": specifies base directory of the Tezos client; default = /home/tezos/.tezos-client");
    ("-v", Arg.Set debug, ": enables debug mode (prints the whole Tezos error trace)")*)
  ]

let read_tza path = let open Core in
                    In_channel.read_all path

let main =
  Arg.parse
           spec_list
           (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
           usage;
  let verbose = !verbose_arg in
  try
    read_tza !tza_path
    |> parse_contract ~verbose
    |> Transformation.transform ~verbose
    |> check_and_compile !tz_dao ~verbose
    >>= fun () -> Lwt.return 1
  with
  | Failure s -> Printf.eprintf "%s\n" s; Lwt.return 0
  | e -> Printf.eprintf "%s\n" (Printexc.to_string e); Lwt.return 0

(* The example contract is first parsed and then transformed by the backend *)
let () =
  Stdlib.exit @@ Lwt_main.run main
