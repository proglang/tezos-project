open Parsing.Pp_ast

let rec print = function
    | a :: rest -> pp_ast Fmt.stdout a; print rest
    | [] -> ()

let transform asts =
  Transformation.transform asts
  |> print
