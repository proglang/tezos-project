(* Needs to be changed when the parser is extended with Solidity stuff *)
type ty = Parsing.Assertion.ty
type var_decl = Parsing.Assertion.var_decl
type pattern = Parsing.Assertion.pattern
type unop = Parsing.Assertion.unop
type binop = Parsing.Assertion.binop
type expression = Parsing.Assertion.expression

type bound = Parsing.Assertion.expression

type assertion = Parsing.Assertion.assertion

type ast = {entrypoint : string option * pattern; body : assertion}
