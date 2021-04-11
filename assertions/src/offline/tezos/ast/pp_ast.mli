(** This module defines a pretty printer for the Tezos AST *)

open Ast

(** Returns the string representation of a type *)
val str_of_ty : ty -> string

(** Print a Tezos AST *)
val pp_ast : Format.formatter -> ast -> unit

(** Print the tag and parameter type part of the Tezos AST (mainly for more compact verbosity & tests)*)
val pp_ast_entrypoint : Format.formatter -> (string * pattern) -> unit
