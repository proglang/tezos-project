open Parsing.Assertion

type ast = Tezos_ast.tezos_ast

val transform: assertion_ast list -> ast list
val print_transformation : ast list -> unit
