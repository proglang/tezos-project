open Parsing.Lex_and_parse
open Check_and_compile

let tza_path = ref "./test.tza"
let tz_dao = ref (DAO_File "./test.tz")
let verbose_arg = ref false

let set_tz_dao_file path = tz_dao := DAO_File path
let set_tz_dao_chain addr = tz_dao := DAO_Chain addr

let usage = "Usage: " ^ Sys.argv.(0) ^ "--tza <path> (-a <address> | -f <path>) [-v]"
let spec_list = [
    ("-a", Arg.String (set_tz_dao_chain), "Address of the parent contract");
    ("-f", Arg.String (set_tz_dao_file), "File path of the parent contract code");
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

let main () =
  let verbose = !verbose_arg in
  read_tza !tza_path
  |> parse_contract ~verbose
  |> Transformation.transform ~verbose
  |> check_and_compile ~verbose

(* The example contract is first parsed and then transformed by the backend *)
let () = Arg.parse
           spec_list
           (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
           usage;
         main ()
