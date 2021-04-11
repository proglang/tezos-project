(** This module defines a pretty printer for the AST of a parsed assertion *)

open Assertion

(** Returns the string representation of a type *)
val str_of_ty : ty -> string

(** Prints the given AST *)
val pp_ast : Format.formatter -> assertion_ast -> unit
