module Ast = Ast
module Pp_ast = Pp_ast

let maybe_pprint_tezos_ast (a : Ast.ast) ~verbose =
  if verbose then (Pp_ast.pp_ast Fmt.stdout a; a)
  else a

let cast_ep (tag, pat) =
  match tag with
  | Some t -> (t, pat)
  | None -> ("default", pat)

let cast_ast ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  ({entrypoint = cast_ep ep; body = a} : Ast.ast)

let cast asts ~verbose =
  List.map (fun ast -> cast_ast ast |> maybe_pprint_tezos_ast ~verbose) asts
