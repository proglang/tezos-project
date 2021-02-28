open Tezos_ast.Ast

module EntrypointAssertionMapping : Map.S with type key = Union_path.union_path
val pp_mapping : Format.formatter -> ast EntrypointAssertionMapping.t -> unit
