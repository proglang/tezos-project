open Parsing.Assertion_t

type ast

val transform: assertion_ast list -> ast list
val print_transformation : ast list -> unit
