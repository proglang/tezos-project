(* dune runtest *)

open Core
open Parsing.Lex_and_parse
   
let%expect_test "with name" =
  parse_and_print
   " 
  (entrypoint %someName _
  (forall (b:bool)
    (assert b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %someName
      └──Pattern: Wildcard
    └──Assertion: Forall
      └──Pattern: Id:b
        └──Type: Bool_t
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "without name" =
  parse_and_print
   " 
  (entrypoint _
  (forall (b:bool)
    (assert b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Forall
      └──Pattern: Id:b
        └──Type: Bool_t
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "simple param type" =
  parse_and_print
   " 
  (entrypoint none
  (forall (b:bool)
    (assert b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: None
    └──Assertion: Forall
      └──Pattern: Id:b
        └──Type: Bool_t
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "comp param type" =
  parse_and_print
   " 
  (entrypoint (left (pair _ (a: (list int))))
  (forall (b:bool)
    (assert b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Left
        └──Pattern: Pair
          └──Pattern: Wildcard
          └──Pattern: Id:a
            └──Type: List_t<Type: Int_t>
    └──Assertion: Forall
      └──Pattern: Id:b
        └──Type: Bool_t
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "typed comp pattern" =
  parse_and_print
   " 
  (entrypoint (a: (pair int bool) )
  (forall (b:bool)
    (assert b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Pair_t<Type: Int_t, Type: Bool_t>
    └──Assertion: Forall
      └──Pattern: Id:b
        └──Type: Bool_t
      └──Assertion: Assert 
        └──Expr: Id:b|}]

