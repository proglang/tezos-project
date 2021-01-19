open Core
open Parsing.Lex_and_parse

let%expect_test "missing operator bin op" =
  parse_and_print
   "(entrypoint _ 
      (assert (add 1)))" ;
  [%expect
    {|:2:22: syntax error |}]

let%expect_test "missing operator un op" =
  parse_and_print
   "(entrypoint _
      (assert (size)))" ;
  [%expect
      {|:2:21: syntax error |}]

let%expect_test "missing operator in op" =
  parse_and_print
   "(entrypoint _
      (assert (slice 0 1)))" ;
  [%expect
      {|:2:26: syntax error |}]

let%expect_test "assertion in then body" =
  parse_and_print
   "(entrypoint _
      (assert 
        (if true (assert true) true)))" ;
  [%expect
      {|:3:25: syntax error |}]

let%expect_test "assertion in else body" =
  parse_and_print
   "(entrypoint _
      (assert 
        (if true true (assert true))))" ;
  [%expect
      {|:3:30: syntax error |}]

let%expect_test "missing IfThenElse body" =
  parse_and_print
   "(entrypoint _
      (assert 
        (if true true))" ;
  [%expect
      {|:3:23: syntax error |}]
