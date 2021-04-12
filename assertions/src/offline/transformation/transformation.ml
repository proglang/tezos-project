open List
open Parsing.Assertion

(* Negates an expression *)
let rec negate_expr = function
  | `Int _ as i -> i
  | `Bool true -> `Bool false
  | `Bool false -> `Bool true
  | `String _ as s -> s
  (* it's not apparent whether a variable is of type bool or not; if this function should
   * be called recursively for arguments is handled by the operators *)
  | `Ident _ as i -> `Unop (`Not, i)
  (* Conditions are skipped *)
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
  | `Slice _ as slice -> slice
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
let rec negate = function
  (* Negate the body of an assert *)
  | `Assert expr ->
     let expr_transformed = negate_expr expr in
     `Assert expr_transformed
  (* Skip conditions *)
  | `If (cond, a) ->
     let a_transformed = negate a in
     `If (cond, a_transformed)
  (* Forall -> Exists *)
  | `Forall (predicate, a, bs) ->
     let a_transformed = negate a in
     `Exists (predicate, a_transformed, bs)
  (* Using distributed assertions to find proofs not supported yet *)
  | `Exists _ -> failwith "Existential quantifiers are not supported yet."

(* Split conjunctions in if-conditions into separate if conditions *)
let break_conjunctions ast =
  let rec rec_break = function
    | `If ((e : expression), (body : assertion)) as i ->
       begin
         match e with
         | `Binop (`And, e1, e2) ->
            rec_break (`If (e1, rec_break (`If (e2, body))))
         | _ -> i
       end
    | `Forall (predicate, a, bs) -> `Forall (predicate, (rec_break a), bs)
    | `Exists (predicate, a, bs) -> `Exists (predicate, (rec_break a), bs)
    | `Assert (_ : expression) as a -> a
  in
  rec_break ast

module VariableDepth = Map.Make(String)

(* Traverses the AST and builds a map of quantification predicates and their
 * depth in the quantifier nesting, as well as a list of all conditions except
 * the ones containing certain operators.
 * returns (variables = {<Id>:<depth>}, conditions = [<expression>])
*)
let build_generator_index a =
  let rec traverse vars conds depth (x : assertion) =
    match x with
    | `Forall ((v, _), a, _)
      | `Exists ((v, _), a, _) ->
       (* Add the quantification predicate and its depth to the map *)
       traverse (VariableDepth.add v depth vars) conds (depth + 1) a
    | `Assert _ -> (vars, conds)
    | `If (cond, body) ->
       match cond with
       (* <> || xor conditions are skipped, as they're not easily mergable with any generator *)
       | `Binop (`Neq, _, _)
         | `Binop (`Or, _, _)
         | `Binop (`Xor, _, _) -> traverse vars conds depth body
       (* Other conditions are added to the list *)
       | _ -> traverse vars (cond :: conds) depth body
  in
  traverse VariableDepth.empty [] 0 a

(* Returns a list of variables present in the given expression *)
let get_variables_of_expr expr =
  let rec traverse acc = function
    | `Int _ -> acc
    | `Bool _ -> acc
    | `String _ -> acc
    | `Ident i -> (cons i acc)
    | `IfThenElse _ -> acc
    | `Unop (_, e) -> traverse acc e
    | `Binop (_, e1, e2) -> traverse (traverse acc e1) e2
    | `Slice (e1, e2, e3) -> traverse (traverse (traverse acc e1) e2) e3
  in
  traverse [] expr

(* returns true if any variable in the given list is a quantification predicate, i.e.
 * if the variable is present in the variable map
 *)
let rec is_quantifier_var vars = function
  | e :: es -> if VariableDepth.mem e vars then true else is_quantifier_var vars es
  | [] -> false

(* Returns the list of conditions, i.e. bounds, that can be merged with the quantifier of
   the given predicate *)
let get_bounds vars conds var =
  (* returns the maximum between the current max level and the level of the given variable *)
  let max acc v =
    match VariableDepth.find_opt v vars with
    | Some l -> if l > acc then l else acc
    | None -> acc
  in
  (* Add the condition to the list of bounds if the predicate is present in the condition
   * and the predicate has the highest depth of all predicates in the condition
   *)
  let add_bounds acc c =
    let vs = get_variables_of_expr c in
    match List.mem var vs with
    | true ->
       begin
         match VariableDepth.find_opt var vars with
         | Some lvl ->
            begin
              let max_lvl = List.fold_left max lvl vs in
              if lvl = max_lvl then (cons c acc) else acc
            end
         | None -> acc
       end
    | false -> acc
  in
  (* Extract the conditions from the list of conditions that should be merged with the
   * generator of the given quantification predicate
   *)
  List.fold_left add_bounds [] conds

(* Merges conditions (bounds) to the respective quantifiers and removes the condition
   from the AST *)
let rec rec_merge_bounds vars conds = function
  | `Forall ((v, t), a, _) ->
     (* Get the list of conditions that can be merged with this quantifier *)
     `Forall ((v, t), rec_merge_bounds vars conds a, get_bounds vars conds v)
  | `Exists ((v, t), a, _) ->
     (* Get the list of conditions that can be merged with this quantifier *)
     `Exists ((v, t), rec_merge_bounds vars conds a, get_bounds vars conds v)
  | `If (c, a) ->
     (* Remove the condition if it's mergable (i.e. it contains a predicate and is not skipped) *)
     begin
       match List.mem c conds with
       | true ->
          begin
            let vs = get_variables_of_expr c in
            match is_quantifier_var vars vs with
            | true -> rec_merge_bounds vars conds a
            | false -> `If (c, rec_merge_bounds vars conds a)
          end
       | false -> `If (c, rec_merge_bounds vars conds a)
     end
  | `Assert expr -> `Assert expr

(* Merge conditions to the respective quantifiers (generators)
 * Traverses the AST twice:
 * 1. Build an index of the quantifier predicates and their depth; build a list of all conditions
 * 2. Merge the conditions into the respective quantifiers and delete the if conditions from
 *    the AST
 *)
let merge_generator_bounds t_ast =
  let (vars, conds) = build_generator_index t_ast in
  rec_merge_bounds vars conds t_ast

let transform_single ({entrypoint = ep; body = a} : assertion_ast) =
  (* negate the formula *)
  negate a
  (* split up conjunctive conditions to simplify the later steps *)
  |> break_conjunctions
  (* assign conditions (bounds) to the respective quantifiers *)
  |> merge_generator_bounds
  |> (fun b -> ({entrypoint = ep; body = b}: assertion_ast))

let rec transform = function
  | a :: rest ->
     let a_t = transform_single a in
     a_t :: (transform rest)
  | [] -> []
