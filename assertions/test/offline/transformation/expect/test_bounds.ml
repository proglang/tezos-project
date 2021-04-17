open Core
open Parsing.Lex_and_parse
open Transformer_wrapper

let%expect_test "condition with single variable" =
  parse_contract
    {|(entrypoint _
        (forall (a: int)
          (if (gt a 10)
            (assert true))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:a
        └──Type: Int_t
      └──Bounds:
        └──Expr: Bin Op: Gt
          └──Expr: Id:a
          └──Expr: Int:10
      └──Assertion: Assert
        └──Expr: Bool:false|}]

let%expect_test "condition with two variables" =
  parse_contract
    {|(entrypoint _
        (forall (a: int)
          (forall (b: int)
            (if (gt a b)
              (assert true)))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:a
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Exists
        └──Pattern: Var:b
          └──Type: Int_t
        └──Bounds:
          └──Expr: Bin Op: Gt
            └──Expr: Id:a
            └──Expr: Id:b
        └──Assertion: Assert
          └──Expr: Bool:false|}]

let%expect_test "condition without generated variable" =
  parse_contract
    {|(entrypoint (a: int)
        (forall (b: int)
          (if (gt a 10)
            (assert true))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:b
        └──Type: Int_t
      └──Bounds:
      └──Assertion: If
        └──Expr: Bin Op: Gt
          └──Expr: Id:a
          └──Expr: Int:10
        └──Assertion: Assert
          └──Expr: Bool:false|}]

let%expect_test "condition before generator" =
  parse_contract
    {|(entrypoint _
        (if (gt a 10)
          (forall (a: int)
            (assert true))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:a
        └──Type: Int_t
      └──Bounds:
        └──Expr: Bin Op: Gt
          └──Expr: Id:a
          └──Expr: Int:10
      └──Assertion: Assert
        └──Expr: Bool:false|}]

let%expect_test "isolated condition" =
  parse_contract
    {|(entrypoint (a: int)
        (if (gt a 10)
          (assert true)))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: If
      └──Expr: Bin Op: Gt
        └──Expr: Id:a
        └──Expr: Int:10
      └──Assertion: Assert
        └──Expr: Bool:false|}]

let%expect_test "skip or/xor" =
  parse_contract
    {|(entrypoint (a: bool)
        (forall (b: int)
          (if (or (gt b 10) a)
            (assert true))))
      (entrypoint (a: bool)
        (forall (b: int)
          (if (xor (gt b 10) a)
            (assert true))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Var:b
        └──Type: Int_t
      └──Bounds:
      └──Assertion: If
        └──Expr: Bin Op: Or
          └──Expr: Bin Op: Gt
            └──Expr: Id:b
            └──Expr: Int:10
          └──Expr: Id:a 
        └──Assertion: Assert
          └──Expr: Bool:false
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Var:b
        └──Type: Int_t
      └──Bounds:
      └──Assertion: If
        └──Expr: Bin Op: Xor
          └──Expr: Bin Op: Gt
            └──Expr: Id:b
            └──Expr: Int:10
          └──Expr: Id:a 
        └──Assertion: Assert
          └──Expr: Bool:false|}]

let%expect_test "skip <>/=" =
  parse_contract
    {|(entrypoint (a: int)
        (forall (b: int)
          (if (eq a b)
            (assert true))))
      (entrypoint (a: int)
        (forall (b: int)
          (if (neq a b)
            (assert true))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:b
        └──Type: Int_t
      └──Bounds:
        └──Expr: Bin Op: Eq
          └──Expr: Id:a
          └──Expr: Id:b
      └──Assertion: Assert
        └──Expr: Bool:false
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:b
        └──Type: Int_t
      └──Bounds:
      └──Assertion: If
        └──Expr: Bin Op: Neq
          └──Expr: Id:a
          └──Expr: Id:b 
        └──Assertion: Assert
          └──Expr: Bool:false|}]
