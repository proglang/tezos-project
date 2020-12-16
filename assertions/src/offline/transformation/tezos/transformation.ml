
type ast = Parsing.Assertion.assertion_ast
   
let rec negate_expr = function
  | `Int _ as i -> i 
  | `Bool true -> `Bool false
  | `Bool false -> `Bool true
  | `String _ as s -> s
  | `Ident _ as i -> i
  | `IfThenElse (cond, then_expr, else_expr) ->
     let then_transformed = negate_expr then_expr in
     let else_transformed = negate_expr else_expr in
     `IfThenElse (cond, then_transformed, else_transformed)
  | `Unop (`Size, _)
    | `Unop (`Abs, _)
    | `Unop (`Neg, _) as unop -> unop
  | `Unop (`Not, e) -> e
  | `Binop (`Nth, _, _)
    | `Binop (`Add, _, _)
    | `Binop (`Sub, _, _)
    | `Binop (`Mul, _, _)
    | `Binop (`Div, _, _)
    | `Binop (`Mod, _, _) as binop -> binop 
  | `Binop (`Or, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`And, e1_transformed, e2_transformed)
  | `Binop (`And, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Or, e1_transformed, e2_transformed)
  | `Binop (`Eq, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Neq, e1_transformed, e2_transformed)
  | `Binop (`Neq, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Eq, e1_transformed, e2_transformed)
  | `Binop (`Lt, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Ge, e1_transformed, e2_transformed)
  | `Binop (`Gt, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Le, e1_transformed, e2_transformed)
  | `Binop (`Le, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Gt, e1_transformed, e2_transformed)
  | `Binop (`Ge, e1, e2) ->
     let e1_transformed = negate_expr e1 in
     let e2_transformed = negate_expr e2 in
     `Binop (`Lt, e1_transformed, e2_transformed)
                 
let rec negate_assertion = function
  | `Assert expr ->
     let expr_transformed = negate_expr expr in
     `Assert expr_transformed
  | `If (cond, a) ->
     let a_transformed = negate_assertion a in
     `If (cond, a_transformed)
  | `Forall (predicate, a) ->
     let a_transformed = negate_assertion a in
     `Exists (predicate, a_transformed)
  | `Exists (predicate, a) ->
     let a_transformed = negate_assertion a in
     `Forall (predicate, a_transformed)

let break_conjunctions formula =
  let rec rec_break  = function
    | `If ((e : Parsing.Assertion.expression), body) as i ->
       begin
         match e with
         | `Binop (`And, e1, e2) ->
            `If (e1, `If (e2, (rec_break body)))
         | _ -> i
       end
    | `Forall (predicate, a) -> `Forall (predicate, (rec_break a))
    | `Exists (predicate, a) -> `Exists (predicate, (rec_break a))
    | `Assert (_ : Parsing.Assertion.expression) as a -> a
  in
  rec_break formula
     
     
let transform ({entrypoint = ep; body = a} : Parsing.Assertion.assertion_ast) =
  negate_assertion a
  |> break_conjunctions
  |> (fun b -> ({entrypoint = ep; body = b}: ast))

let pp_ast = Parsing.Pp_ast.pp_ast
