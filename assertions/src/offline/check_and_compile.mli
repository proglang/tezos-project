open Parsing.Assertion
open Dao_type

val check_and_compile: dao_type -> assertion_ast list -> verbose:bool -> unit Lwt.t
