open Core
open Parsing.Lex_and_parse
open Transformer_wrapper

let%expect_test "negation universal quantifier" =
  parse_contract
    {|(entrypoint _
        (forall (n : int)
          (assert true)))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:n
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:false|}]

let%expect_test "negation existential quantifier" =
  (
  try
    parse_contract
    {|(entrypoint _
        (exists (m: int)
          (assert true)))|}
    |> transform
  with
  | Failure s -> Printf.eprintf "%s" s
  | _ -> Printf.eprintf "Caught exception");
  [%expect
    {|Existential quantifiers are not supported yet.|}]

let%expect_test "negation bools w/ quantifiers" =
  parse_contract
    {|(entrypoint %e1 _
        (forall (i:int)
          (assert true)))
      (entrypoint %e2 _
        (forall (i:int)
          (assert false)))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %e1
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:false
    AST
    └──Entrypoint: %e2
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

let%expect_test "negation logic operators" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (forall (i:int)
          (assert (and (or (not a) b) b))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Var:a
          └──Type: Bool_t
        └──Pattern: Var:b
          └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Or
          └──Expr: Bin Op: And
            └──Expr: Id:a
            └──Expr: Un Op: Not
              └──Expr: Id:b
          └──Expr: Un Op: Not
            └──Expr: Id:b|}]

let%expect_test "negation xor" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (forall (i:int)
          (assert (xor (and a b) (not b)))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Var:a
          └──Type: Bool_t
        └──Pattern: Var:b
          └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Or
          └──Expr: Bin Op: And
            └──Expr: Bin Op: And
              └──Expr: Id:a
              └──Expr: Id:b
            └──Expr: Un Op: Not
              └──Expr: Id:b
          └──Expr: Bin Op: And
            └──Expr: Bin Op: Or
              └──Expr: Un Op: Not
                └──Expr: Id:a
              └──Expr: Un Op: Not
                └──Expr: Id:b
            └──Expr: Id:b|}]

let%expect_test "negation relation operator" =
  parse_contract
    {|(entrypoint %eq_ (a: int)
        (forall (i:int)
          (assert (eq a 10))))

      (entrypoint %neq_ (a: int)
        (forall (i:int)
          (assert (neq a 10))))

      (entrypoint %gt_ (a: int)
        (forall (i:int)
          (assert (gt a 10))))

      (entrypoint %lt_ (a: int)
        (forall (i:int)
          (assert (lt a 10))))

      (entrypoint %ge_ (a: int)
        (forall (i:int)   
          (assert (ge a 10))))

      (entrypoint %le_ (a: int)
        (forall (i:int)
          (assert (le a 10))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %eq_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Neq
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %neq_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Eq
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %gt_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Le
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %lt_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Ge
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %ge_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Lt
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %le_
      └──Pattern: Var:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Gt
          └──Expr: Id:a
          └──Expr: Int:10|}]

let%expect_test "byte/string op" =
  parse_contract
    {|(entrypoint %slice_ (s: string)
        (forall (i : int)
          (assert (eq (slice 0 1 s) "h"))))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %slice_
      └──Pattern: Var:s
        └──Type: String_t
    └──Assertion: Exists
      └──Pattern: Var:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Neq
          └──Expr: Op: Slice
            └──Expr: Int:0
            └──Expr: Int:1
            └──Expr: Id:s
          └──Expr: Str:"h"|}]

let%expect_test "skip ifs" =
  parse_contract
    {|(entrypoint _
        (if true
          (assert true)))|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: If
      └──Expr: Bool:true
      └──Assertion: Assert
        └──Expr: Bool:false|}]
