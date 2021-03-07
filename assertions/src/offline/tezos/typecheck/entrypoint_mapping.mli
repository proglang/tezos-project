(** This module defines the Map type for storing the entrypoint mapping and its pretty printer *)

open Tezos_ast.Ast

(** Stores the entrypoint mapping as Union_path -> assertion ast *)
module EntrypointAssertionMapping : Map.S with type key = Union_path.union_path
type ep_mapping = ast EntrypointAssertionMapping.t

val pp_mapping : Format.formatter -> ep_mapping -> unit
