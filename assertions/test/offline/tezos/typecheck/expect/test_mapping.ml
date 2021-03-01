open Core
open Parsing.Lex_and_parse
open Dao_type
open Format

let tz_code = asprintf "parameter %s; storage unit; code {UNIT ; NIL operation ; PAIR}"

let exec tz tza =
  let open Type_checker.Entrypoint_mapping in
  let dao_t = DAO_String tz in
  parse_contract ~verbose:false tza
  |> Tezos_ast.cast ~verbose:false
  |> Type_checker.type_check dao_t
  |> Lwt_main.run
  |> pp_mapping Fmt.stdout

let%expect_test "Tz w/ tags; assertions w/o tags" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (right (b: bool)) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %default
    └──Pattern: Right
      └──Pattern: Id:b
        └──Type: Bool_t
    LT:
    Entrypoint: %default
    └──Pattern: Left
      └──Pattern: Id:a
        └──Type: Int_t|}]

 let%expect_test "Tz w/o tags; assertions w/ tags" =
  exec
    (tz_code "(or int bool)")
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: bool) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %B
    └──Pattern: Id:b
      └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Id:a
      └──Type: Int_t|}]

 let%expect_test "Tz w/o tags; assertions w/o tags" =
  exec
    (tz_code "(or int bool)")
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (right (b: bool)) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %default
    └──Pattern: Right
      └──Pattern: Id:b
        └──Type: Bool_t
    LT:
    Entrypoint: %default
    └──Pattern: Left
      └──Pattern: Id:a
        └──Type: Int_t|}]

 let%expect_test "Tz w/ tags; assertions w/ tags" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: bool) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %B
    └──Pattern: Id:b
      └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Id:a
      └──Type: Int_t|}]

 let%expect_test "Mixed tags" =
  exec
    (tz_code "(or (int %A) bool)")
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (right (b: bool)) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %default
    └──Pattern: Right
      └──Pattern: Id:b
        └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Id:a
      └──Type: Int_t|}]

 let%expect_test "Unambiguous" =
  exec
    (tz_code "(or (int %A) (int %B))")
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: int) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %B
    └──Pattern: Id:b
      └──Type: Int_t
    LT:
    Entrypoint: %A
    └──Pattern: Id:a
      └──Type: Int_t|}]

let%expect_test "Non-matching tags but unambiguous types" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint %C (a: int) (assert true))
      (entrypoint %D (b: bool) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %D
    └──Pattern: Id:b
      └──Type: Bool_t
    LT:
    Entrypoint: %C
    └──Pattern: Id:a
      └──Type: Int_t|}]
