open Dao_type

type cli_args =
  {
    verbose: bool;
    assertion_file: string;
    dao_contract: dao_type;
    (* out_file: string; -> not clear yet, how the output will look like *)
    node_port: int option;
    node_basedir: string option;
    tezos_api_verbose: bool;
  }

let sanity_check_assertion_path p =
  if p = "" then raise @@ Invalid_argument "no assertion file given!"
  else p

let sanity_check_dao_contract dao =
  match dao with
  | DAO_File s
    | DAO_Chain s
    | DAO_String s ->
     if s = "" then raise @@ Invalid_argument "no contract given!"
     else dao

let sanity_check_port port =
  match port with
  | Some p ->
     if p >= 0 then port else raise @@ Invalid_argument "ports must be >= 0"
  | None -> port

let build_args v assertion_f dao port basedir tzv =
  {
      verbose = v;
      assertion_file = sanity_check_assertion_path assertion_f;
      dao_contract = sanity_check_dao_contract dao;
      node_port = sanity_check_port port;
      node_basedir = basedir;
      tezos_api_verbose = tzv
    }
