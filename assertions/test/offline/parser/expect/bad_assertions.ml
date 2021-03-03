open Core
open Parser_wrapper

let%expect_test "empty assertion contract" =
  parse
    "";
  [%expect
    {|
     Parsing the assertion failed.
     ---
     The assertion contract must contain at least 1 assertion.|}]

let%expect_test "missing assert" =
  parse
   "(entrypoint (b: bool) b)" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:24: syntax error|}]

let%expect_test "non-expression in if condition" =
  parse
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:18: syntax error |}]

let%expect_test "expression in if body" =
  parse
   "(entrypoint (b: bool)
      (if true true))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:20: syntax error |}]

let%expect_test "non-expression in if condition" =
  parse
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:18: syntax error |}]

let%expect_test "missing if condition" =
  parse
   "(entrypoint (b: bool)
      (if (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:18: syntax error |}]

let%expect_test "missing if body" =
  parse
    "(entrypoint (b: bool)
     (if b ))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:13: syntax error |}]

 let%expect_test "missing forall predicate" =
  parse
   "(entrypoint _
      (forall
         (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :3:17: syntax error |}]

  let%expect_test "missing forall body" =
  parse
   "(entrypoint _
      (forall (a: int)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:24: syntax error |}]

     let%expect_test "missing exists predicate" =
  parse
   "(entrypoint _
      (exists
         (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :3:17: syntax error |}]

  let%expect_test "missing exists body" =
  parse
   "(entrypoint _
      (exists (a: int)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:24: syntax error |}]

  let%expect_test "quantifier  wrong predicate declaration" =
  parse
   "(entrypoint (b: bool)
      (forall (assert true) (assert true)))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:22: syntax error |}]

let%expect_test "expression in quantifier body" =
  parse
   "(entrypoint (b: bool)
      (exists (a: int) true))" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :2:28: syntax error |}]

