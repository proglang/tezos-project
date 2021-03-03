open Check_and_compile
open Parsing
open Cli_args

(* Read the assertion contract from file *)
let read_assertion path = let open Core in
                          In_channel.read_all path

let maybe_pprint_ast asts ~verbose =
  let rec print = function
    | a :: rest -> Pp_ast.pp_ast Fmt.stdout a; print rest
    | [] -> ()
  in
  if verbose then (print asts; asts) else asts


let generate_assertion_contract args =
  let verbose = args.verbose in
  read_assertion args.assertion_file
  |> Lex_and_parse.parse_contract
  |> maybe_pprint_ast ~verbose
  |> Transformation.transform
  |> maybe_pprint_ast ~verbose
  |> check_and_compile args
