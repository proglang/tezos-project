open Core
open Parsing.Lex_and_parse

let%expect_test "missing module ()" =
  parse_and_print
   "entrypoint _ 
     (assert true)" ;
  [%expect
    {|:1:11: syntax error |}]

let%expect_test "missing pattern ()" =
  parse_and_print
   "(entrypoint a:bool
      (assert a))" ;
  [%expect
      {|:1:14: syntax error |}]

let%expect_test "missing composite type ()" =
  parse_and_print
   "(entrypoint (a: list bool)
      (assert true))" ;
  [%expect
      {|:1:21: syntax error |}]

let%expect_test "wildcard" =
  parse_and_print
   "(entrypoint ( _ )
      (forall (b:bool)
        (assert b)))" ;
  [%expect
      {|:1:16: syntax error |}]

let%expect_test "missing primitive ()" =
  parse_and_print
   "(entrypoint _ (assert not false))" ;
  [%expect
      {|:1:26: syntax error |}]

let%expect_test "missing assertion ()" =
  parse_and_print
   "(entrypoint _ assert true))" ;
  [%expect
      {|:1:21: syntax error |}]

let%expect_test "missing predicate decl ()" =
  parse_and_print
   "(entrypoint _ (forall i: int (assert true)))" ;
  [%expect
      {|:1:24: syntax error |}]

let%expect_test "unclosed paren style 1" =
  parse_and_print
   "(entrypoint _ (assert true)" ;
  [%expect
      {|:1:28: syntax error |}]

let%expect_test "unclosed paren style 2" =
  parse_and_print
   "[entrypoint _ (assert true)" ;
  [%expect
      {|:1:28: syntax error |}]

let%expect_test "mismatched paren" =
  parse_and_print
   "(entrypoint _ (assert true)]" ;
  [%expect
      {|:1:29: syntax error |}]
