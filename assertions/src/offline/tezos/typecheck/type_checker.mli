open Dao_type
open Tezos_ast.Ast
open Entrypoint_mapping

module Entrypoint_mapping = Entrypoint_mapping

val type_check : dao_type -> ast list -> ast EntrypointAssertionMapping.t Lwt.t
