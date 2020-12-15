open Assertion

val print_past: assertion_ast -> unit
val parse_contract: string -> assertion_ast list
val parse_and_print: string -> unit
