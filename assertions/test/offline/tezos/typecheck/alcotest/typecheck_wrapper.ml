open Transformation
open Parsing.Lex_and_parse
open Dao_type
open Check_and_compile
open Cli_args

let typecheck input script () =
  let args = {verbose = false; assertion_file = "";
              dao_contract = (DAO_String script); node_port = None;
              node_basedir = None; tezos_api_verbose = false}
  in
  parse_contract input
  |> transform
  |> check_and_compile args
