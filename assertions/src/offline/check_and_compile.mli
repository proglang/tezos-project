open Parsing.Assertion

type dao_type = DAO_File of string | DAO_Chain of string

val check_and_compile: assertion_ast list -> verbose:bool -> unit
