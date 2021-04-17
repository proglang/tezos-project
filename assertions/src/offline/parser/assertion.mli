(** This module defines how the AST of an assertion is built.
    These types contain the union of types, operators and structures of all supported contract languages.
*)


(** Type notation
    Maps the Michelson types; Michelson does not allow all of them as parameter or key type,
    the grammar however allows it anyway since the entrypoint matching/ Tezos typecheck will
    catch it anyway.
*)
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

(** Variable declaration consists of identifier and a type *)
type var_decl = string * ty

(** Patterns to match input parameters *)
type pattern = [
  | `Wildcard (** Matches everything used in assertions as a 'don't care' *)
  | `Var of var_decl (** A variable of explicit type *)
  | `IdentPat of string (** An identifier for a pattern component *)
  | `Pair of pattern * pattern (** Matches a pair (x,y) *)
  | `Left of pattern  (** Matches first type of a union *)
  | `Right of pattern  (** Matches second type of a union *)
  | `None  (** Matches None constructor of the option type *)
  | `Some of pattern  (** Matches the Some t constructor of the option type*)
  | `Cons of pattern * pattern  (** Matches a non empty list *)
  | `Nil  (** Matches an empty list *)
  ]

(** Unary operators *)
type unop = [
  | `Size
  | `Abs
  | `Neg
  | `Not
  ]

(** Binary operators *)
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

(** Types of expressions in assertions *)
type expression = [
  | `Int of int
  | `Bool of bool
  | `String of string
  | `Ident of string
  | `IfThenElse of expression * expression * expression
  | `Unop of unop * expression
  | `Binop of binop * expression * expression
  | `Slice of expression * expression * expression
  ]

(** Typedef for expressions limiting the value range of the random generator; e.g. x > 10 *)
type bound = expression

(** An assertion contains of nested quantifiers, conditions and exactly one assert-expression *)
type assertion = [
  | `Forall of var_decl * assertion * bound list (** Quantifier; consists of a predicate declaration, a body and a list of bounds for its random generator *)
  | `Exists of var_decl * assertion * bound list (** Quantifier; consists of a predicate declaration, a body and a list of bounds for its random generator *)
  | `If of expression * assertion  (** If (condition, assertion) *)
  | `Assert of expression  (** The actual assertion checking a condition *)
  ]

(** An AST consists of a header containing an optional entrypoint tag and a parameter declaration and a body
    containing the code to be compiled *)
type assertion_ast = {entrypoint : string option * pattern; body : assertion}
