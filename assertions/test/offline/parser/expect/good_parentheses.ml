open Core
open Parser_wrapper

let%expect_test "different styles" =
  parse
    "(entrypoint [a: int]
       (assert
         [eq (or [le a 1] (neq a 0)) [and (ge 1 1) [and (lt a 10) [gt a 0]]]]))";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
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

let%expect_test "different styles inverted" =
  parse
    "[entrypoint (a: int)
       [assert
         (eq [or (le a 1) [neq a 0]] (and [ge 1 1] (and [lt a 10] (gt a 0))))]]";
  [%expect
    {|
    AST
    └──Entrypoint: %default
      └──Pattern: Var:a
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
