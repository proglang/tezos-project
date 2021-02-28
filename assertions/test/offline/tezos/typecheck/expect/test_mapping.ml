open Core
open Parsing.Lex_and_parse
open Dao_type

let exec tz tza =
  let open Type_checker.Entrypoint_mapping in
  let dao_t = DAO_String tz in
  parse_contract ~verbose:false tza
  |> Tezos_ast.cast ~verbose:false
  |> Type_checker.type_check dao_t
  |> Lwt_main.run
  |> pp_mapping Fmt.stdout

let%expect_test "test" =
  exec
    {|parameter int; storage unit; code {UNIT ; NIL operation ; PAIR }\n|}
    {|(entrypoint %A (i : int)
        (assert true))|};
  [%expect
    {|
    T: Entrypoint: %A
         └──Pattern: Id:i
           └──Type: Bool_t|}]
