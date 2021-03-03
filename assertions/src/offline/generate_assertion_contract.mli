open Cli_args

(** This is the entry point for execution of the pipeline *)
val generate_assertion_contract : cli_args -> unit Lwt.t
