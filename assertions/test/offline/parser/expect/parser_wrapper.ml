open Parsing.Lex_and_parse

let parse input =
  parse_contract ~verbose:true input
  |> (fun _ -> ())
