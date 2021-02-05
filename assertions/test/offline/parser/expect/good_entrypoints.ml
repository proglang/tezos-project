(* dune runtest *)
open Core
open Parser_wrapper
   
let%expect_test "with name" =
  parse
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
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "without name" =
  parse
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
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "simple param type" =
  parse
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
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "comp param type" =
  parse
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
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Id:b|}]

let%expect_test "typed comp pattern" =
  parse
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
      └──Bounds:
      └──Assertion: Assert 
        └──Expr: Id:b|}]

