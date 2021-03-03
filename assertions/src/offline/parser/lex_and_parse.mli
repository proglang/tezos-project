(** This module executes the lexer and parser *)

open Assertion

(** Given the assertion code, parse the program and return a list of ASTs if successful
    The parser will terminate when encountering an error during lexing or parsing and throw an error.
    It will also throw an error if no assertion was found.
*)
val parse_contract: string -> assertion_ast list
