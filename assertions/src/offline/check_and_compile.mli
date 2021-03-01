open Parsing.Assertion
open Cli_args

val check_and_compile: cli_args -> assertion_ast list -> unit Lwt.t
