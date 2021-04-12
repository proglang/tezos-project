open Core
open Parsing.Lex_and_parse
open Transformer_wrapper

let%expect_test "break conjunctions" =
  parse_contract
    {|(entrypoint _
        (if (and a (and b c))
          (assert true)))
      (entrypoint _
        (if (and (and a b) c)
          (assert true)))

|}
  |> transform;
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: If
      └──Expr: Id:a
      └──Assertion: If
        └──Expr: Id:b
        └──Assertion: If
          └──Expr: Id:c
          └──Assertion: Assert
            └──Expr: Bool:false
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: If
      └──Expr: Id:a
      └──Assertion: If
        └──Expr: Id:b
        └──Assertion: If
          └──Expr: Id:c
          └──Assertion: Assert
            └──Expr: Bool:false|}]
