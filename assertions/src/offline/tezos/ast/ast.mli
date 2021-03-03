(** Defines how the Tezos specific AST is built. *)

type ty = Parsing.Assertion.ty
type var_decl = Parsing.Assertion.var_decl
type pattern = Parsing.Assertion.pattern
type unop = Parsing.Assertion.unop
type binop = Parsing.Assertion.binop
type expression = Parsing.Assertion.expression

type bound = Parsing.Assertion.expression

type assertion = Parsing.Assertion.assertion

type ast = {entrypoint : string * pattern; body : assertion}
