(** This module defines the Tezos AST and supporting functions *)

module Ast = Ast
module Pp_ast = Pp_ast

(** Cast the union assertion AST to the Tezos specific AST performing semantic checks *)
val cast : Parsing.Assertion.assertion_ast list -> Ast.ast list
