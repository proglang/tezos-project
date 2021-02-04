open Tezos_ast.Ast
open Tezos_ast.Pp_ast

let rec maybe_pprint_tezos_ast (asts : ast list) ~verbose =
  if verbose then
    begin
      match asts with
      | a :: rest -> pp_ast Fmt.stdout a; (maybe_pprint_tezos_ast rest ~verbose)
      | [] -> asts
    end
  else asts

let check_and_compile dao_t t_asts ~verbose =
  cast t_asts
  |> maybe_pprint_tezos_ast ~verbose
  |> Type_checker.type_check dao_t
