open Dao_type

type cli_args =
  {
    verbose: bool;
    assertion_file: string;
    dao_contract: dao_type;
    (* out_file: string; *)
    node_port: int option;
    node_basedir: string option;
    tezos_api_verbose: bool;
  }

val build_args : bool -> string -> dao_type -> int option -> string option -> bool -> cli_args
