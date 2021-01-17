open Core
open Parsing.Lex_and_parse

let%expect_test "negation quantifiers" =
  parse_contract
    {|(entrypoint _
        (forall (n : int)
          (exists (m: int)
            (assert true))))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Id:n
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Forall
        └──Pattern: Id:m
          └──Type: Int_t
        └──Bounds:
        └──Assertion: Assert
          └──Expr: Bool:false|}]

let%expect_test "negation bools w/ quantifiers" =
  parse_contract
    {|(entrypoint %e1 _
        (forall (i:int)
          (assert true)))
      (entrypoint %e2 _
        (forall (i:int)
          (assert false)))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %e1
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:false
    AST
    └──Entrypoint: %e2
      └──Pattern: Wildcard
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bool:true|}]

let%expect_test "negation bools w/o quantifiers" =
  parse_contract
    {|(entrypoint %e1 _
        (assert true))
      (entrypoint %e2 _
          (assert false))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %e1
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Bool:true
    AST
    └──Entrypoint: %e2
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Bool:false|}]

let%expect_test "negation logic operators w/ quantifiers" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (forall (i:int)
          (assert (and (or (not a) b) b))))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Id:a
          └──Type: Bool_t
        └──Pattern: Id:b
          └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Id:i
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
  
let%expect_test "negation logic operators w/o quantifiers" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (assert (and (or (not a) b) b)))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Id:a
          └──Type: Bool_t
        └──Pattern: Id:b
          └──Type: Bool_t 
    └──Assertion: Assert
      └──Expr: Bin Op: And
        └──Expr: Bin Op: Or
          └──Expr: Un Op: Not
            └──Expr: Id:a
          └──Expr: Id:b
        └──Expr: Id:b|}]

let%expect_test "negation xor w/ quantifiers" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (forall (i:int)
          (assert (xor (and a b) (not b)))))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Id:a
          └──Type: Bool_t
        └──Pattern: Id:b
          └──Type: Bool_t
    └──Assertion: Exists
      └──Pattern: Id:i
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

let%expect_test "negation xor w/o quantifiers" =
  parse_contract
    {|(entrypoint (pair (a: bool) (b: bool))
        (assert (xor (and a b) (not b))))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Pair
        └──Pattern: Id:a
          └──Type: Bool_t
        └──Pattern: Id:b
          └──Type: Bool_t 
    └──Assertion: Assert
      └──Expr: Bin Op: Xor
        └──Expr: Bin Op: And
          └──Expr: Id:a
          └──Expr: Id:b  
        └──Expr: Un Op: Not
          └──Expr: Id:b|}]

let%expect_test "negation relation operators w/ quantifiers" =
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
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %eq_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Neq
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %neq_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Eq
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %gt_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Le
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %lt_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Ge
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %ge_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Lt
          └──Expr: Id:a
          └──Expr: Int:10
    AST
    └──Entrypoint: %le_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Exists
      └──Pattern: Id:i
        └──Type: Int_t
      └──Bounds:
      └──Assertion: Assert
        └──Expr: Bin Op: Gt
          └──Expr: Id:a
          └──Expr: Int:10|}]

let%expect_test "negation relation operators w/o quantifiers" =
  parse_contract
    {|(entrypoint %eq_ (a: int)
        (assert (eq a 10)))

      (entrypoint %neq_ (a: int)
        (assert (neq a 10)))

      (entrypoint %gt_ (a: int)
        (assert (gt a 10)))

      (entrypoint %lt_ (a: int)
        (assert (lt a 10)))

      (entrypoint %ge_ (a: int)
        (assert (ge a 10)))

      (entrypoint %le_ (a: int)
        (assert (le a 10)))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %eq_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Eq
        └──Expr: Id:a
        └──Expr: Int:10
    AST
    └──Entrypoint: %neq_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Neq
        └──Expr: Id:a
        └──Expr: Int:10
    AST
    └──Entrypoint: %gt_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Gt
        └──Expr: Id:a
        └──Expr: Int:10
    AST
    └──Entrypoint: %lt_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Lt
        └──Expr: Id:a
        └──Expr: Int:10
    AST
    └──Entrypoint: %ge_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Ge
        └──Expr: Id:a
        └──Expr: Int:10
    AST
    └──Entrypoint: %le_
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Le
        └──Expr: Id:a
        └──Expr: Int:10|}]
  
let%expect_test "skip ifs" =
  parse_contract
    {|(entrypoint _
        (if true
          (assert true)))|}
  |> Transformation.transform
  |> Transformation.print_transformation ;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: If
      └──Expr: Bool:true
      └──Assertion: Assert
        └──Expr: Bool:true|}]
