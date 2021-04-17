open Core
open Parsing.Lex_and_parse
open Dao_type
open Format

let tz_code = asprintf "parameter %s; storage unit; code {UNIT ; NIL operation ; PAIR}"

let exec tz tza =
  let open Type_checker.Entrypoint_mapping in
  let dao_t = DAO_String tz in
  parse_contract tza
  |> Tezos_ast.cast
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
      └──Pattern: Var:b
        └──Type: Bool_t
    LT:
    Entrypoint: %default
    └──Pattern: Left
      └──Pattern: Var:a
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
    └──Pattern: Var:b
      └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Var:a
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
      └──Pattern: Var:b
        └──Type: Bool_t
    LT:
    Entrypoint: %default
    └──Pattern: Left
      └──Pattern: Var:a
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
    └──Pattern: Var:b
      └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Var:a
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
      └──Pattern: Var:b
        └──Type: Bool_t
    LT:
    Entrypoint: %A
    └──Pattern: Var:a
      └──Type: Int_t|}]

 let%expect_test "Match default ep" =
   exec
    (tz_code "(or (int %A) (int %B))")
    {|(entrypoint _ (assert true))|};
  [%expect
    {|
    T:
    Entrypoint: %default
    └──Pattern: Wildcard|}]

 let%expect_test "Unambiguous" =
  exec
    (tz_code "(or (int %A) (int %B))")
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: int) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %B
    └──Pattern: Var:b
      └──Type: Int_t
    LT:
    Entrypoint: %A
    └──Pattern: Var:a
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
    └──Pattern: Var:b
      └──Type: Bool_t
    LT:
    Entrypoint: %C
    └──Pattern: Var:a
      └──Type: Int_t|}]

let%expect_test "Wildcard" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint %A _ (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Wildcard|}]

let%expect_test "untyped pattern - any" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint %A a (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Id:a|}]

let%expect_test "untyped pattern - pair" =
  exec
    (tz_code "(or (pair %A int string) (bool %B))")
    {|(entrypoint %A (pair a b) (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Pair
      └──Pattern: Id:a
      └──Pattern: Id:b|}]

let%expect_test "untyped pattern - left" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint (left a) (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %default
    └──Pattern: Left
      └──Pattern: Id:a|}]

let%expect_test "untyped pattern - right" =
  exec
    (tz_code "(or (int %A) (bool %B))")
    {|(entrypoint (right a) (assert true))|};
  [%expect
    {|
    RT:
    Entrypoint: %default
    └──Pattern: Right
      └──Pattern: Id:a|}]

let%expect_test "untyped pattern - some" =
  exec
    (tz_code "(or (option %A int) (bool %B))")
    {|(entrypoint %A (some a) (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Some
      └──Pattern: Id:a|}]

let%expect_test "untyped pattern - cons" =
  exec
    (tz_code "(or (list %A int) (bool %B))")
    {|(entrypoint %A (cons a as) (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Cons
      └──Pattern: Id:a
      └──Pattern: Id:as|}]

 let%expect_test "untyped pattern by component" =
  exec
    (tz_code "(or (list %A int) (list %B nat))")
    {|(entrypoint %A (cons (a: int) as) (assert true))|};
  [%expect
    {|
    LT:
    Entrypoint: %A
    └──Pattern: Cons
      └──Pattern: Var:a
        └──Type: Int_t
      └──Pattern: Id:as|}]
