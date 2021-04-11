open Format

module Ast = Ast
module Pp_ast = Pp_ast

let error_fmt = asprintf "Casting the AST failed.@.---@.%s@."

(* Autofill missing tag with the default tag used in Tezos *)
let cast_ep (tag, pat) =
  match tag with
  | Some t -> (t, pat)
  | None -> ("default", pat)

let cast_expr e = e

let rec cast_assertion = function
  | `Forall ((_, `Int_t) as v, a, bounds) ->
      `Forall ( v, cast_assertion a, bounds)
  | `Exists _ -> failwith @@ error_fmt "Existential quantifiers are not supported yet."
  | `Forall ((_, ty), _, _ ) ->
     let err_str = asprintf "Unsupported type for predicate variable: %s" (Pp_ast.str_of_ty ty) in
     failwith @@ error_fmt err_str
  | `If (e, a) -> `If (cast_expr e, cast_assertion a)
  | `Assert e -> `Assert (cast_expr e)

(* Add semantic checks here if the grammar gets extended with Solidity types/operators *)
let cast_ast ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  ({entrypoint = cast_ep ep; body = cast_assertion a} : Ast.ast)

let cast asts =
  List.map (fun ast -> cast_ast ast) asts
