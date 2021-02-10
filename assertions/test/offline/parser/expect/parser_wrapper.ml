open Parsing.Lex_and_parse

let parse input =
  try
    parse_contract ~verbose:true input
    |> (fun _ -> ())
  with
  | Failure s -> Printf.eprintf "%s" s
  | _ -> Printf.eprintf "Caught exception"
