open Core
open Parsing.Lex_and_parse

let%expect_test "missing assert" =
  parse_and_print
   "(entrypoint (b: bool) b)" ;
  [%expect
    {|:1:24: syntax error |}]

let%expect_test "non-expression in if condition" =
  parse_and_print
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "expression in if body" =
  parse_and_print
   "(entrypoint (b: bool)
      (if true true))" ;
  [%expect
      {|:2:20: syntax error |}]

let%expect_test "non-expression in if condition" =
  parse_and_print
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "missing if condition" =
  parse_and_print
   "(entrypoint (b: bool)
      (if (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "missing if body" =
  parse_and_print
    "(entrypoint (b: bool)
     (if b ))" ;
  [%expect
      {|:2:13: syntax error |}] 

 let%expect_test "missing forall predicate" =
  parse_and_print
   "(entrypoint _
      (forall
         (assert true)))" ;
  [%expect
   {|:3:17: syntax error |}]

  let%expect_test "missing forall body" =
  parse_and_print
   "(entrypoint _
      (forall (a: int)))" ;
  [%expect
   {|:2:24: syntax error |}]

     let%expect_test "missing exists predicate" =
  parse_and_print
   "(entrypoint _
      (exists
         (assert true)))" ;
  [%expect
   {|:3:17: syntax error |}]

  let%expect_test "missing exists body" =
  parse_and_print
   "(entrypoint _
      (exists (a: int)))" ;
  [%expect
   {|:2:24: syntax error |}]

  let%expect_test "quantifier  wrong predicate declaration" =
  parse_and_print
   "(entrypoint (b: bool)
      (forall (assert true) (assert true)))" ;
  [%expect
    {|:2:22: syntax error |}] 

let%expect_test "expression in quantifier body" =
  parse_and_print
   "(entrypoint (b: bool)
      (exists (a: int) true))" ;
  [%expect
    {|:2:28: syntax error |}] 

