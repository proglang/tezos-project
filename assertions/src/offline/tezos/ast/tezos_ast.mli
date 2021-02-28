module Ast = Ast
module Pp_ast = Pp_ast

val cast : Parsing.Assertion.assertion_ast list -> verbose:bool -> Ast.ast list
