(* dune runtest *)

open Core
open Print_parsed_ast
   
let%expect_test "with name" =
  print_past
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
  print_past
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
  print_past
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
  print_past
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
  print_past
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

