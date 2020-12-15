open Parsing.Assertion

type ast

val transform: assertion_ast -> ast
val pp_ast : Format.formatter -> ast -> unit 
