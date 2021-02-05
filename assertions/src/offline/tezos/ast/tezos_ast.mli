module Ast = Ast

val cast : Parsing.Assertion.assertion_ast list -> verbose:bool -> Ast.ast list
