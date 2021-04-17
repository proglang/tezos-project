
type ty = [
  | `Int_t
  | `Bool_t
  | `Bytes_t
  | `String_t
  | `Fmu_t
  | `Nat_t
  | `Address_t
  | `ChainID_t
  | `Key_t
  | `KeyHash_t
  | `Operation_t
  | `Signature_t
  | `Timestamp_t
  | `Unit_t
  | `List_t of ty
  | `Set_t of ty
  | `Option_t of ty
  | `Or_t of ty * ty
  | `Pair_t of ty * ty
  | `Lambda_t of ty * ty
  | `Map_t of ty * ty
  | `Contract_t of ty
  | `BigMap_t of ty * ty
  ]    

type var_decl = string * ty

type pattern = [
  | `Wildcard
  | `Var of var_decl
  | `IdentPat of string
  | `Pair of pattern * pattern
  | `Left of pattern
  | `Right of pattern
  | `None
  | `Some of pattern
  | `Cons of pattern * pattern
  | `Nil
  ]

type unop = [
  | `Size
  | `Abs
  | `Neg
  | `Not
  ]

type binop = [
  | `Nth
  | `Add
  | `Sub
  | `Mul
  | `Div
  | `Mod
  | `Or
  | `And
  | `Xor
  | `Lsl
  | `Lsr
  | `Eq
  | `Neq
  | `Lt
  | `Gt
  | `Le
  | `Ge
  ]

type expression = [
  | `Int of int
  | `Bool of bool
  | `String of string
  | `Ident of string
  | `IfThenElse of expression * expression * expression
  | `Unop of unop * expression
  | `Binop of binop * expression * expression
  (* Ternary operator slice; should be moved to an own type if more are added later on *)
  | `Slice of expression * expression * expression
  ]

type bound = expression

type assertion = [
  | `Forall of var_decl * assertion * bound list
  | `Exists of var_decl * assertion * bound list
  | `If of expression * assertion
  | `Assert of expression
  ]

type assertion_ast = {entrypoint : string option * pattern; body : assertion}
