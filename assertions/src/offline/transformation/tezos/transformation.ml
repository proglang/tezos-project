open List

type ast = Parsing.Assertion.assertion_ast
   
(* Negates an expression *)
let rec negate_expr = function
  | `Int _ as i -> i
  | `Bool true -> `Bool false
  | `Bool false -> `Bool true
  | `String _ as s -> s
  (* it's not apparent whether a variable is of type bool or not; if this function should
   * be called recursively for arguments is handled by the operators
   *)
  | `Ident _ as i -> `Unop (`Not, i)
  (* Condition is skipped *)
  | `IfThenElse (cond, then_expr, else_expr) ->
     let then_transformed = negate_expr then_expr in
     let else_transformed = negate_expr else_expr in
     `IfThenElse (cond, then_transformed, else_transformed)
  (* Non-boolean expressions have no negation *)
  | `Unop (`Size, _)
    | `Unop (`Abs, _)
    | `Unop (`Neg, _) as unop -> unop
  | `Unop (`Not, e) -> e
  | `Binop (`Nth, _, _)
    | `Binop (`Add, _, _)
    | `Binop (`Sub, _, _)
    | `Binop (`Mul, _, _)
    | `Binop (`Div, _, _)
    | `Binop (`Mod, _, _)
    | `Binop (`Lsl, _, _)
    | `Binop (`Lsr, _, _) as binop -> binop
  (* ! || = && *)
  | `Binop (`Or, e1, e2) ->
     (* arguments are boolean expression -> negate them as well *)
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`And, e1_transformed, e2_transformed)
  (* ! && = || *)
  | `Binop (`And, e1, e2) ->
     (* arguments are boolean expression -> negate them as well *)
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Or, e1_transformed, e2_transformed)
  (* ! (a xor b) = (a && b) || (!a && !b) *)
  | `Binop (`Xor, e1, e2) ->
     (* arguments are boolean expression -> negate them as well *)
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     let e1_and_e2 = `Binop (`And, e1, e2) in
     let not_e1_e2 = `Binop (`And, e1_transformed, e2_transformed) in
     `Binop (`Or, e1_and_e2, not_e1_e2)
  (* arguments are not negated *)
  | `Binop (`Eq, e1, e2) -> `Binop (`Neq, e1, e2)
  | `Binop (`Neq, e1, e2) -> `Binop (`Eq, e1, e2)
  | `Binop (`Lt, e1, e2) -> `Binop (`Ge, e1, e2)
  | `Binop (`Gt, e1, e2) -> `Binop (`Le, e1, e2)
  | `Binop (`Le, e1, e2) -> `Binop (`Gt, e1, e2)
  | `Binop (`Ge, e1, e2) -> `Binop (`Lt, e1, e2)

(* Negates and assertion *)
let rec negate_assertion = function
  (* Negate the body of an assert *)
  | `Assert expr ->
     let expr_transformed = negate_expr expr in
     `Assert expr_transformed
  (* Skip conditions *)
  | `If (cond, a) ->
     let a_transformed = negate_assertion a in
     `If (cond, a_transformed)
  (* Forall -> Exists *)
  | `Forall (predicate, a) ->
     let a_transformed = negate_assertion a in
     `Exists (predicate, a_transformed)
  (* Exists -> Forall *)
  | `Exists (predicate, a) ->
     let a_transformed = negate_assertion a in
     `Forall (predicate, a_transformed)

(* Breaks (nested) conjunctions in if-conditions into separate ifs*)
let break_conjunctions formula =
  let rec rec_break = function
    | `If ((e : Parsing.Assertion.expression), body) as i ->
       begin
         match e with
         | `Binop (`And, e1, e2) ->
            rec_break (`If (e1, rec_break (`If (e2, body))))
         | _ -> i
       end
    | `Forall (predicate, a) -> `Forall (predicate, (rec_break a))
    | `Exists (predicate, a) -> `Exists (predicate, (rec_break a))
    | `Assert (_ : Parsing.Assertion.expression) as a -> a
  in
  rec_break formula
let transform_single ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  negate_assertion a
  |> break_conjunctions
  |> (fun b -> ({entrypoint = ep; body = b}: ast))

let pp_ast = Parsing.Pp_ast.pp_ast
let rec transform (asts : Parsing.Assertion.assertion_ast list) =
  match asts with
  | a :: rest -> cons (transform_single a) (transform rest)
  | [] -> []

let rec print_transformation (asts : ast list) =
  match asts with
  | a :: rest -> pp_ast Fmt.stdout a; (print_transformation rest)
  | [] -> ()
