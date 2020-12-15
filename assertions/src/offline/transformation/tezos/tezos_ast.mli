(* Needs to be changed when the parser is extended with Solidity stuff *)
type ty = Parsing.Assertion.ty
type var_decl = Parsing.Assertion.var_decl
type pattern = Parsing.Assertion.pattern
type unop = Parsing.Assertion.unop
type binop = Parsing.Assertion.binop
type expression = Parsing.Assertion.expression

type bound = Parsing.Assertion.expression

type assertion = [
  | `Forall of var_decl * assertion * bound list
  | `Exists of var_decl * assertion * bound list
  | `If of expression * assertion
  | `Assert of expression
  ]

type tezos_ast = {entrypoint : string option * pattern; body : assertion}
