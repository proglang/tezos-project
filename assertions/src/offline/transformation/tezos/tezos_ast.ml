(* Needs to be changed when the parser is extended with Solidity stuff *)
type ty = Parsing.Assertion_t.ty
type var_decl = Parsing.Assertion_t.var_decl
type pattern = Parsing.Assertion_t.pattern
type unop = Parsing.Assertion_t.unop
type binop = Parsing.Assertion_t.binop
type expression = Parsing.Assertion_t.expression

type bound = Parsing.Assertion_t.expression

type assertion = [
  | `Forall of var_decl * assertion * bound list
  | `Exists of var_decl * assertion * bound list
  | `If of expression * assertion
  | `Assert of expression
  ]

type tezos_ast = {entrypoint : string option * pattern; body : assertion}
