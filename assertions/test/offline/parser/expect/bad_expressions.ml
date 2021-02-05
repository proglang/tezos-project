open Core
open Parser_wrapper

let%expect_test "missing operator bin op" =
  parse
   "(entrypoint _ 
      (assert (add 1)))" ;
  [%expect
    {|:2:22: syntax error |}]

let%expect_test "missing operator un op" =
  parse
   "(entrypoint _
      (assert (size)))" ;
  [%expect
      {|:2:21: syntax error |}]

let%expect_test "missing operator in op" =
  parse
   "(entrypoint _
      (assert (slice 0 1)))" ;
  [%expect
      {|:2:26: syntax error |}]

let%expect_test "assertion in then body" =
  parse
   "(entrypoint _
      (assert 
        (if true (assert true) true)))" ;
  [%expect
      {|:3:25: syntax error |}]

let%expect_test "assertion in else body" =
  parse
   "(entrypoint _
      (assert 
        (if true true (assert true))))" ;
  [%expect
      {|:3:30: syntax error |}]

let%expect_test "missing IfThenElse body" =
  parse
   "(entrypoint _
      (assert 
        (if true true))" ;
  [%expect
      {|:3:23: syntax error |}]
