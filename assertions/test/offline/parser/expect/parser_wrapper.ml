open Parsing.Lex_and_parse
open Parsing.Pp_ast

let rec print = function
  | a :: rest -> pp_ast Fmt.stdout a; print rest
  | [] -> ()

let parse input =
  try
    parse_contract input
    |> print
  with
  | Failure s -> Printf.eprintf "%s" s
  | _ -> Printf.eprintf "Caught exception"
