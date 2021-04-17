(* dune runtest *)
open Core
open Parser_wrapper

let%expect_test "missing name indicator" =
  parse
   "(entrypoint name a
      (assert true))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:19: syntax error |}]

let%expect_test "incomplete pattern" =
  parse
   "(entrypoint (pair (a:int))
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:27: syntax error |}]

let%expect_test "illegal pattern" =
  parse
   "(entrypoint (a: list _)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:21: syntax error |}]

let%expect_test "illegal identifier" =
  parse
   "(entrypoint ( _a : int)
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:16: syntax error |}]

let%expect_test "missing entrypoint syntax" =
  parse
   "( a: int
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:4: syntax error |}]

let%expect_test "missing pattern" =
  parse
   "(entrypoint
      (forall (b:bool)
        (assert b)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:14: syntax error |}]
