open Format

module Ast = Ast
module Pp_ast = Pp_ast

let error_fmt = asprintf "Casting the AST failed.@.---@.%s@."

let rec cast_ty : Parsing.Assertion.ty -> Ast.ty = function
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
    | `Unit_t as ty -> ty
  | `List_t ty -> `List_t (cast_ty ty)
  | `Set_t ty -> `Set_t (cast_ty ty)
  | `Option_t ty -> `Option_t (cast_ty ty)
  | `Or_t (ty1, ty2) -> `Or_t (cast_ty ty1, cast_ty ty2)
  | `Pair_t (ty1, ty2) -> `Pair_t (cast_ty ty1, cast_ty ty2)
  | `Lambda_t (ty1, ty2) -> `Lambda_t (cast_ty ty1, cast_ty ty2)
  | `Map_t (ty1, ty2) -> `Map_t (cast_ty ty1, cast_ty ty2)
  | `Contract_t ty -> `Contract_t (cast_ty ty)
  | `BigMap_t (ty1, ty2) -> `BigMap_t (cast_ty ty1, cast_ty ty2)

let rec cast_pattern : Parsing.Assertion.pattern -> Ast.pattern = function
  | `None
    | `Nil
    | `Wildcard
    | `IdentPat _ as p -> p
  | `Var (s,t) -> `Var (s, cast_ty t)
  | `Pair (p1, p2) -> `Pair (cast_pattern p1, cast_pattern p2)
  | `Left p -> `Left (cast_pattern p)
  | `Right p -> `Right (cast_pattern p)
  | `Some p -> `Some (cast_pattern p)
  | `Cons (p1, p2) -> `Cons (cast_pattern p1, cast_pattern p2)

(* Autofill missing tag with the default tag used in Tezos *)
let cast_ep (tag, pat) =
  match tag with
  | Some t -> (t, cast_pattern pat)
  | None -> ("default", cast_pattern pat)

let cast_unop : Parsing.Assertion.unop -> Ast.unop = function
  | `Size
    | `Abs
    | `Neg
    | `Not as op -> op

let cast_binop : Parsing.Assertion.binop -> Ast.binop = function
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
    | `Ge as op -> op

let rec cast_expr : Parsing.Assertion.expression -> Ast.expression = function
  | `Int _
    | `Bool _
    | `String _
    | `Ident _ as e -> e
  | `IfThenElse (e1, e2, e3) ->
     `IfThenElse (cast_expr e1, cast_expr e2, cast_expr e3)
  | `Unop (op, e) -> `Unop (cast_unop op, cast_expr e)
  | `Binop (op, e1, e2) -> `Binop (cast_binop op, cast_expr e1, cast_expr e2)
  | `Slice (e1, e2, e3) -> `Slice (cast_expr e1, cast_expr e2, cast_expr e3)

let rec cast_assertion : Parsing.Assertion.assertion -> Ast.assertion = function
  (* Only support numerical predicate variables for now *)
  | `Forall ((_, `Int_t) as v, a, bounds) ->
     `Forall (v, cast_assertion a, bounds)
  | `Forall ((_, `Nat_t) as v, a, bounds) ->
     `Forall (v, cast_assertion a, bounds)
  | `Exists ((_, `Int_t) as v, a, bounds) ->
     `Exists (v, cast_assertion a, bounds)
  | `Exists ((_, `Nat_t) as v, a, bounds) ->
     `Exists (v, cast_assertion a, bounds)
  | `Forall ((_, ty), _, _ )
    | `Exists ((_, ty), _, _ ) ->
     let ty_str = Parsing.Pp_ast.str_of_ty ty in
     let err_str = asprintf "Unsupported type for predicate variable: %s" ty_str in
     failwith @@ error_fmt err_str
  | `If (e, a) -> `If (cast_expr e, cast_assertion a)
  | `Assert e -> `Assert (cast_expr e)

(* Add semantic checks here if the grammar gets extended with Solidity types/operators *)
let cast_ast ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  ({entrypoint = cast_ep ep; body = cast_assertion a} : Ast.ast)

let cast asts =
  List.map (fun ast -> cast_ast ast) asts
