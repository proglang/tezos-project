(** This module checks whether there is an unambiguous mapping between assertions and contract
    entrypoints. Assertions are matched to entrypoints through a type check and, if necessary
    by comparing their tags.
    The unit tests provide a good documentation of which assertion contracts are valid and
    which aren't.
*)

open Dao_type
open Tezos_ast.Ast
open Entrypoint_mapping

module Entrypoint_mapping = Entrypoint_mapping

(** Checks if the types of the assertion entrypoint match the types of the contract entrypoints.
    Returns an unambiguous mapping of contract to assertion entrypoints if there exists one.
    Contract entrypoints are represented as their paths within the (possibly nested) union type.
*)
val type_check : dao_type -> ast list -> ep_mapping Lwt.t
