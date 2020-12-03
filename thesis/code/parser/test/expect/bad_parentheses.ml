open Core
open Print_parsed_ast

let%expect_test "missing module ()" =
  print_past
   "entrypoint _ 
     (assert true)" ;
  [%expect
    {|:1:11: syntax error |}]

let%expect_test "missing pattern ()" =
  print_past
   "(entrypoint a:bool
      (assert a))" ;
  [%expect
      {|:1:14: syntax error |}]

let%expect_test "missing composite type ()" =
  print_past
   "(entrypoint (a: list bool)
      (assert true))" ;
  [%expect
      {|:1:21: syntax error |}]

let%expect_test "wildcard" =
  print_past
   "(entrypoint ( _ )
      (forall (b:bool)
        (assert b)))" ;
  [%expect
      {|:1:16: syntax error |}]

let%expect_test "missing primitive ()" =
  print_past
   "(entrypoint _ (assert not false))" ;
  [%expect
      {|:1:26: syntax error |}]

let%expect_test "missing assertion ()" =
  print_past
   "(entrypoint _ assert true))" ;
  [%expect
      {|:1:21: syntax error |}]

let%expect_test "missing predicate decl ()" =
  print_past
   "(entrypoint _ (forall i: int (assert true)))" ;
  [%expect
      {|:1:24: syntax error |}]

let%expect_test "unclosed paren style 1" =
  print_past
   "(entrypoint _ (assert true)" ;
  [%expect
      {|:1:28: syntax error |}]

let%expect_test "unclosed paren style 2" =
  print_past
   "[entrypoint _ (assert true)" ;
  [%expect
      {|:1:28: syntax error |}]

let%expect_test "mismatched paren" =
  print_past
   "(entrypoint _ (assert true)]" ;
  [%expect
      {|:1:29: syntax error |}]
