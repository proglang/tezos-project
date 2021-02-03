open Core
open Parsing.Lex_and_parse
   
let%expect_test "simple assert" =
  parse_and_print
   "(entrypoint _
      (assert true))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Bool:true|}]

 let%expect_test "if" =
  parse_and_print
   "(entrypoint _
      (if true
         (assert true)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: If
      └──Expr: Bool:true
      └──Assertion: Assert
        └──Expr: Bool:true|}]

  let%expect_test "forall" =
  parse_and_print
   "(entrypoint _
      (forall (a: int)
         (assert true)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Forall
      └──Pattern: Id:a
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

  let%expect_test "exists" =
  parse_and_print
   "(entrypoint _
      (exists (a: int)
         (assert true)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Id:a
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

let%expect_test "IfThenElse in assert" =
  parse_and_print
   "(entrypoint (b:bool)
      (assert 
        (if b true false)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:b
        └──Type: Bool_t
    └──Assertion: Assert
      └──Expr: IfThenElse
        └──Expr: Id:b
        └──Expr: Bool:true
        └──Expr: Bool:false|}]
