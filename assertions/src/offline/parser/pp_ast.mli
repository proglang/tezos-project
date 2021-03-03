(** This module defines a pretty printer for the AST of a parsed assertion *)

open Assertion

(** Prints the given AST *)
val pp_ast : Format.formatter -> assertion_ast -> unit
