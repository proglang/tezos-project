open Core
open Print_parsed_ast

let%expect_test "missing assert" =
  print_past
   "(entrypoint (b: bool) b)" ;
  [%expect
    {|:1:24: syntax error |}]

let%expect_test "non-expression in if condition" =
  print_past
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "expression in if body" =
  print_past
   "(entrypoint (b: bool)
      (if true true))" ;
  [%expect
      {|:2:20: syntax error |}]

let%expect_test "non-expression in if condition" =
  print_past
   "(entrypoint (b: bool)
      (if (assert true) (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "missing if condition" =
  print_past
   "(entrypoint (b: bool)
      (if (assert true)))" ;
  [%expect
    {|:2:18: syntax error |}] 

let%expect_test "missing if body" =
  print_past
    "(entrypoint (b: bool)
     (if b ))" ;
  [%expect
      {|:2:13: syntax error |}] 

 let%expect_test "missing forall predicate" =
  print_past
   "(entrypoint _
      (forall
         (assert true)))" ;
  [%expect
   {|:3:17: syntax error |}]

  let%expect_test "missing forall body" =
  print_past
   "(entrypoint _
      (forall (a: int)))" ;
  [%expect
   {|:2:24: syntax error |}]

     let%expect_test "missing exists predicate" =
  print_past
   "(entrypoint _
      (exists
         (assert true)))" ;
  [%expect
   {|:3:17: syntax error |}]

  let%expect_test "missing exists body" =
  print_past
   "(entrypoint _
      (exists (a: int)))" ;
  [%expect
   {|:2:24: syntax error |}]

  let%expect_test "quantifier  wrong predicate declaration" =
  print_past
   "(entrypoint (b: bool)
      (forall (assert true) (assert true)))" ;
  [%expect
    {|:2:22: syntax error |}] 

let%expect_test "expression in quantifier body" =
  print_past
   "(entrypoint (b: bool)
      (exists (a: int) true))" ;
  [%expect
    {|:2:28: syntax error |}] 

