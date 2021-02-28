open Dao_type
open Tezos_ast.Ast

module EntrypointAssertionMapping : Map.S with type key = string

val type_check : dao_type -> ast list -> ast EntrypointAssertionMapping.t Lwt.t
