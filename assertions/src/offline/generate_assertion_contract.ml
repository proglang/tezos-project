open Check_and_compile
open Parsing
open Cli_args

let read_assertion path = let open Core in
                          In_channel.read_all path

let generate_assertion_contract args =
  try
    let verbose = args.verbose in
    read_assertion args.assertion_file
    |> Lex_and_parse.parse_contract ~verbose
    |> Transformation.transform ~verbose
    |> check_and_compile args
    >>= fun () -> Lwt.return 0
  with
  | Failure s -> Printf.eprintf "%s\n" s; Lwt.return 1
  | e -> Printf.eprintf "%s\n" (Printexc.to_string e); Lwt.return 1
