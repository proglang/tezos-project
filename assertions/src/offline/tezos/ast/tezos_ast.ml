module Ast = Ast
module Pp_ast = Pp_ast

(* Autofill missing tag with the default tag used in Tezos *)
let cast_ep (tag, pat) =
  match tag with
  | Some t -> (t, pat)
  | None -> ("default", pat)

(* Add semantic checks here if the grammar gets extended with Solidity types/operators
   For now, not much to be done here. *)
let cast_ast ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  ({entrypoint = cast_ep ep; body = a} : Ast.ast)

let cast asts =
  List.map (fun ast -> cast_ast ast) asts
