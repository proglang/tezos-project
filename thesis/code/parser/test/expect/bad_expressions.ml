open Core
open Print_parsed_ast

let%expect_test "missing operator bin op" =
  print_past
   "(entrypoint _ 
      (assert (add 1)))" ;
  [%expect
    {|:2:22: syntax error |}]

let%expect_test "missing operator un op" =
  print_past
   "(entrypoint _ 
      (assert (size)))" ;
  [%expect
      {|:2:21: syntax error |}]

let%expect_test "assertion in then body" =
  print_past
   "(entrypoint _
      (assert 
        (if true (assert true) true)))" ;
  [%expect
      {|:3:25: syntax error |}]

let%expect_test "assertion in else body" =
  print_past
   "(entrypoint _
      (assert 
        (if true true (assert true))))" ;
  [%expect
      {|:3:30: syntax error |}]

let%expect_test "missing IfThenElse body" =
  print_past
   "(entrypoint _
      (assert 
        (if true true))" ;
  [%expect
      {|:3:23: syntax error |}]
