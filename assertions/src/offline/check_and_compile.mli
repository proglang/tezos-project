(** This module acts as an interface between the frontend (Parser & Transformer) and the backend
    The backend is responsible for semantics and compilation to the target language and is abstracted
    away.
*)

open Parsing.Assertion
open Cli_args

(** Calls the backend to do semantic and type checks and compile to the target language *)
val check_and_compile: cli_args -> assertion_ast list -> unit Lwt.t
