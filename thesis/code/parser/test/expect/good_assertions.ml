open Core
open Print_parsed_ast
   
let%expect_test "simple assert" =
  print_past
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
  print_past
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
  print_past
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
      └──Assertion: Assert
        └──Expr: Bool:true|}]

  let%expect_test "exists" =
  print_past
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
      └──Assertion: Assert
        └──Expr: Bool:true|}]

let%expect_test "IfThenElse in assert" =
  print_past
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
