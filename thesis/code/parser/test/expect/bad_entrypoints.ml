(* dune runtest *)

open Core
open Print_parsed_ast

let%expect_test "missing name indicator" =
  print_past
   "(entrypoint name a
        (assert true))" ;
  [%expect
      {|:1:17: syntax error |}]

let%expect_test "missing type notation" =
  print_past
   "(entrypoint a
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:14: syntax error |}]

let%expect_test "incomplete pattern" =
  print_past
   "(entrypoint (pair (a:int))
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:27: syntax error |}]

let%expect_test "illegal pattern" =
  print_past
   "(entrypoint (a: list _)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:21: syntax error |}]

let%expect_test "illegal identifier" =
  print_past
   "(entrypoint ( _a : int)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:16: syntax error |}]

let%expect_test "missing entrypoint syntax" =
  print_past
   "( a: int
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:4: syntax error |}]

let%expect_test "missing pattern" =
  print_past
   "(entrypoint
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:2:14: syntax error |}]
