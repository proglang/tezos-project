(* dune runtest *)

open Core
open Parsing.Lex_and_parse

let%expect_test "missing name indicator" =
  parse_and_print
   "(entrypoint name a
        (assert true))" ;
  [%expect
      {|:1:17: syntax error |}]

let%expect_test "missing type notation" =
  parse_and_print
   "(entrypoint a
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:14: syntax error |}]

let%expect_test "incomplete pattern" =
  parse_and_print
   "(entrypoint (pair (a:int))
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:27: syntax error |}]

let%expect_test "illegal pattern" =
  parse_and_print
   "(entrypoint (a: list _)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:21: syntax error |}]

let%expect_test "illegal identifier" =
  parse_and_print
   "(entrypoint ( _a : int)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:16: syntax error |}]

let%expect_test "missing entrypoint syntax" =
  parse_and_print
   "( a: int
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:4: syntax error |}]

let%expect_test "missing pattern" =
  parse_and_print
   "(entrypoint
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:2:14: syntax error |}]
