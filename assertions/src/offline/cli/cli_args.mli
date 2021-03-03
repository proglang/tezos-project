(** This module defines the CLI arguments and wraps them into a record type *)

open Dao_type

type cli_args =
  {
    verbose: bool; (** Enables printing of intermediate results - used for debugging *)
    assertion_file: string; (** The path to the assertion contract *)
    dao_contract: dao_type; (** Access object to the parent contract code (backend arg) *)
    (* out_file: string; *)
    node_port: int option; (** The port where the local node is reachable (backend arg) *)
    node_basedir: string option; (** The base directory of the local node/client (backend arg) *)
    tezos_api_verbose: bool; (** Toggles the verbose mode of the Tezos API (Tezos specific flag) *)
  }

(** Takes all CLI arguments, performs sanity checks and returns them wrapped in the cli_args type *)
val build_args : bool -> string -> dao_type -> int option -> string option -> bool -> cli_args
