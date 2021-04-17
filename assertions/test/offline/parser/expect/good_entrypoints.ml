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
      └──Pattern: Var:b
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
      └──Pattern: Var:b
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
      └──Pattern: Var:b
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
          └──Pattern: Var:a
            └──Type: List_t
              └──Type: Int_t
    └──Assertion: Forall
      └──Pattern: Var:b
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
      └──Pattern: Var:a
        └──Type: Pair_t
          └──Type: Int_t
          └──Type: Bool_t
    └──Assertion: Forall
      └──Pattern: Var:b
        └──Type: Bool_t
      └──Bounds:
      └──Assertion: Assert 
        └──Expr: Id:b|}]

let%expect_test "untyped pattern - any" =
  parse
   " 
  (entrypoint a
    (forall (b:bool)
      (assert (and a b))))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
    └──Assertion: Forall
      └──Pattern: Var:b
        └──Type: Bool_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: And
          └──Expr: Id:a
          └──Expr: Id:b|}]

let%expect_test "untyped pattern - left" =
  parse
   " 
  (entrypoint (left a)
    (assert true))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Left
        └──Pattern: Id:a
    └──Assertion: Assert
      └──Expr: Bool:true|}]

let%expect_test "untyped pattern - right" =
  parse
   " 
  (entrypoint (right a)
    (assert true))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Right
        └──Pattern: Id:a
    └──Assertion: Assert
      └──Expr: Bool:true|}]


 let%expect_test "untyped pattern - pair" =
  parse
   " 
  (entrypoint (pair a b)
    (assert (eq a b)))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Id:a
        └──Pattern: Id:b
    └──Assertion: Assert
      └──Expr: Bin Op: Eq
        └──Expr: Id:a
        └──Expr: Id:b|}]

let%expect_test "untyped pattern - some" =
  parse
   " 
  (entrypoint (some a)
    (assert true))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Some
        └──Pattern: Id:a
    └──Assertion: Assert
      └──Expr: Bool:true|}]

let%expect_test "untyped pattern - list" =
  parse
   " 
  (entrypoint (cons a as)
    (assert true))
  " ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Cons
        └──Pattern: Id:a
        └──Pattern: Id:as
    └──Assertion: Assert
      └──Expr: Bool:true|}]
