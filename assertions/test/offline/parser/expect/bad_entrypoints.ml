(* dune runtest *)
open Core
open Parser_wrapper

let%expect_test "missing name indicator" =
  parse
   "(entrypoint name a
      (assert true))" ;
  [%expect
      {|:1:17: syntax error |}]

let%expect_test "missing type notation" =
  parse
   "(entrypoint a
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:14: syntax error |}]

let%expect_test "incomplete pattern" =
  parse
   "(entrypoint (pair (a:int))
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:27: syntax error |}]

let%expect_test "illegal pattern" =
  parse
   "(entrypoint (a: list _)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:21: syntax error |}]

let%expect_test "illegal identifier" =
  parse
   "(entrypoint ( _a : int)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:16: syntax error |}]

let%expect_test "missing entrypoint syntax" =
  parse
   "( a: int
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:1:4: syntax error |}]

let%expect_test "missing pattern" =
  parse
   "(entrypoint
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|:2:14: syntax error |}]
