module Ast = Ast

let maybe_pprint_tezos_ast (a : Ast.ast) ~verbose =
  if verbose then (Pp_ast.pp_ast Fmt.stdout a; a)
  else a

let cast asts ~verbose =
  List.map (fun ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) -> maybe_pprint_tezos_ast ({entrypoint = ep; body = a} : Ast.ast) ~verbose) asts
