open Core
open Parsing.Lex_and_parse

let%expect_test "bool literal - true" =
  parse_and_print
    "(entrypoint _ 
       (assert true))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Bool:true|}]

let%expect_test "bool literal - false" =
  parse_and_print
    "(entrypoint _ 
       (assert false))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Bool:false|}]

let%expect_test "int literal" =
  parse_and_print
    "(entrypoint _ 
       (assert 1234))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Int:1234|}]

 let%expect_test "string literal" =
  parse_and_print
    "(entrypoint _ 
       (assert \"hello world\"))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Wildcard
    └──Assertion: Assert
      └──Expr: Str:"hello world"|}]

let%expect_test "identifier" =
  parse_and_print
    "(entrypoint (a: bool) 
       (assert a))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Bool_t
    └──Assertion: Assert
      └──Expr: Id:a|}]

let%expect_test "if-then-else" =
  parse_and_print
    "(entrypoint (a: bool)
       (assert
         (if a true false)))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Bool_t
    └──Assertion: Assert
      └──Expr: IfThenElse
        └──Expr: Id:a
        └──Expr: Bool:true
        └──Expr: Bool:false|}]

let%expect_test "arithmetic operators" =
  parse_and_print
    "(entrypoint (a: int)
       (assert
         (neg (mod 42 (div 20 (mul 10 (sub 10 (add (abs a) 1))))))))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Un Op: Neg
        └──Expr: Bin Op: Mod
          └──Expr: Int:42
          └──Expr: Bin Op: Div
            └──Expr: Int:20
            └──Expr: Bin Op: Mul
              └──Expr: Int:10
              └──Expr: Bin Op: Sub
                └──Expr: Int:10
                └──Expr: Bin Op: Add
                  └──Expr: Un Op: Abs
                    └──Expr: Id:a
                  └──Expr: Int:1|}]

let%expect_test "boolean operators" =
  parse_and_print
    "(entrypoint (a: bool)
       (assert
         (and (or false (not a)) (xor true false))))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Bool_t
    └──Assertion: Assert
      └──Expr: Bin Op: And
        └──Expr: Bin Op: Or
          └──Expr: Bool:false
          └──Expr: Un Op: Not
            └──Expr: Id:a
        └──Expr: Bin Op: Xor
          └──Expr: Bool:true
          └──Expr: Bool:false|}]

let%expect_test "shift operators" =
  parse_and_print
  "(entrypoint (i: int)
   (assert (lsl (lsr i 1) 1)))";
  [%expect
  {|
   AST
   └──Entrypoint: %default
     └──Pattern: Id:i
       └──Type: Int_t
   └──Assertion: Assert
     └──Expr: Bin Op: Lsl
       └──Expr: Bin Op: Lsr
         └──Expr: Id:i
         └──Expr: Int:1
       └──Expr: Int:1|}]

let%expect_test "relation operators" =
  parse_and_print
    "(entrypoint (a: int)
       (assert
         (eq (or (le a 1) (neq a 0)) (and (ge 1 1) (and (lt a 10) (gt a 0))))))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Id:a
        └──Type: Int_t
    └──Assertion: Assert
      └──Expr: Bin Op: Eq
        └──Expr: Bin Op: Or
          └──Expr: Bin Op: Le
            └──Expr: Id:a
            └──Expr: Int:1
          └──Expr: Bin Op: Neq
            └──Expr: Id:a
            └──Expr: Int:0
        └──Expr: Bin Op: And
          └──Expr: Bin Op: Ge
            └──Expr: Int:1
            └──Expr: Int:1
          └──Expr: Bin Op: And
            └──Expr: Bin Op: Lt
              └──Expr: Id:a
              └──Expr: Int:10
            └──Expr: Bin Op: Gt
              └──Expr: Id:a
              └──Expr: Int:0
|}]

let%expect_test "list/string operators" =
  parse_and_print
    "(entrypoint %A (a: (list int))
         (forall (i:int) 
           (if (le i (size a))
             (assert (eq (nth a i) i)))))
     (entrypoint %B (s: string)
       (assert (eq (slice 0 (size s) s) s)))";
  [%expect
    {|
    AST
    └──Entrypoint: %A
      └──Pattern: Id:a
        └──Type: List_t<Type: Int_t>
    └──Assertion: Forall
      └──Pattern: Id:i
        └──Type: Int_t
      └──Assertion: If
        └──Expr: Bin Op: Le
          └──Expr: Id:i
          └──Expr: Un Op: Size
            └──Expr: Id:a
        └──Assertion: Assert
          └──Expr: Bin Op: Eq
            └──Expr: Bin Op: Nth
              └──Expr: Id:a
              └──Expr: Id:i
            └──Expr: Id:i
    AST
    └──Entrypoint: %B
      └──Pattern: Id:s
        └──Type: String_t
    └──Assertion: Assert
      └──Expr: Bin Op: Eq
        └──Expr: Op: Slice
          └──Expr: Int:0
          └──Expr: Un Op: Size
            └──Expr: Id:s
          └──Expr: Id:s
        └──Expr: Id:s|}]
