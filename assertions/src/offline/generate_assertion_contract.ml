open Check_and_compile
open Parsing
open Cli_args

let read_assertion path = let open Core in
                          In_channel.read_all path

let maybe_pprint_ast asts ~verbose =
  let rec print = function
    | a :: rest -> Pp_ast.pp_ast Fmt.stdout a; print rest
    | [] -> ()
  in
  if verbose then (print asts; asts) else asts

let generate_assertion_contract args =
  try
    let verbose = args.verbose in
    read_assertion args.assertion_file
    |> Lex_and_parse.parse_contract
    |> maybe_pprint_ast ~verbose
    |> Transformation.transform
    |> maybe_pprint_ast ~verbose
    |> check_and_compile args
    >>= fun () -> Lwt.return 0
  with
  | Failure s -> Printf.eprintf "%s\n" s; Lwt.return 1
  | e -> Printf.eprintf "%s\n" (Printexc.to_string e); Lwt.return 1
