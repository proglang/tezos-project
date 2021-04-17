open Core
open Parser_wrapper

let%expect_test "missing module ()" =
  parse
   "entrypoint _ 
     (assert true)" ;
  [%expect
    {|
     Parsing the assertion failed.
     ---
     :1:11: syntax error |}]

let%expect_test "missing pattern ()" =
  parse
   "(entrypoint a:bool
      (assert a))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:15: syntax error |}]

let%expect_test "missing composite type ()" =
  parse
   "(entrypoint (a: list bool)
      (assert true))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:21: syntax error |}]

let%expect_test "wildcard" =
  parse
   "(entrypoint ( _ )
      (forall (b:bool)
        (assert b)))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:16: syntax error |}]

let%expect_test "missing primitive ()" =
  parse
   "(entrypoint _ (assert not false))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:26: syntax error |}]

let%expect_test "missing assertion ()" =
  parse
   "(entrypoint _ assert true))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:21: syntax error |}]

let%expect_test "missing predicate decl ()" =
  parse
   "(entrypoint _ (forall i: int (assert true)))" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:24: syntax error |}]

let%expect_test "unclosed paren style 1" =
  parse
   "(entrypoint _ (assert true)" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:28: syntax error |}]

let%expect_test "unclosed paren style 2" =
  parse
   "[entrypoint _ (assert true)" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:28: syntax error |}]

let%expect_test "mismatched paren" =
  parse
   "(entrypoint _ (assert true)]" ;
  [%expect
      {|
       Parsing the assertion failed.
       ---
       :1:29: syntax error |}]
