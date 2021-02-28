open Dao_type
open Tezos_ast.Ast

module EntrypointAssertionMapping : Map.S with type key = Union_path.union_path

val type_check : dao_type -> ast list -> ast EntrypointAssertionMapping.t Lwt.t
val pp_ep_assertion_map : Format.formatter -> ast EntrypointAssertionMapping.t -> unit
