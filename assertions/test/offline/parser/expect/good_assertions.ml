open Core
open Parser_wrapper

let%expect_test "simple assert" =
  parse
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
  parse
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
  parse
   "(entrypoint _
      (forall (a: int)
         (assert true)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Forall
      └──Pattern: Var:a
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

  let%expect_test "exists" =
  parse
   "(entrypoint _
      (exists (a: int)
         (assert true)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:a
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

let%expect_test "IfThenElse in assert" =
  parse
   "(entrypoint (b:bool)
      (assert 
        (if b true false)))" ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:b
        └──Type: Bool_t
    └──Assertion: Assert
      └──Expr: IfThenElse
        └──Expr: Id:b
        └──Expr: Bool:true
        └──Expr: Bool:false|}]
