open Transformation
open Parsing.Lex_and_parse
open Dao_type
open Check_and_compile

let typecheck input path () =
   parse_contract ~verbose:false input
   |> transform ~verbose:false
   |> check_and_compile (DAO_File path) ~verbose:false
