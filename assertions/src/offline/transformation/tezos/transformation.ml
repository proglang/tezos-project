open List

type ast = Tezos_ast.tezos_ast
let pp_ast = Pp_tezos_ast.pp_ast

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
    | `If ((e : Parsing.Assertion_t.expression), body) as i ->
       begin
         match e with
         | `Binop (`And, e1, e2) ->
            rec_break (`If (e1, rec_break (`If (e2, body))))
         | _ -> i
       end
    | `Forall (predicate, a) -> `Forall (predicate, (rec_break a))
    | `Exists (predicate, a) -> `Exists (predicate, (rec_break a))
    | `Assert (_ : Parsing.Assertion_t.expression) as a -> a
  in
  rec_break formula

module VariableDepth = Map.Make(String)

(* Traverses the AST and builds a map of quantification variables and their
 * depth in the quantifier nesting and a list of unskipped if-conditions.
 * returns (variables = {<Id>:<depth>}, conditions = [<expression>])
*)
let build_generator_index a =
  let rec traverse vars conds depth (x : Parsing.Assertion_t.assertion) =
    match x with
    | `Forall ((v, _), a)
      | `Exists ((v, _), a) ->
       (* Add the quantification variable and its depth to the map *)
       traverse (VariableDepth.add v depth vars) conds (depth + 1) a
    | `Assert _ -> (vars, conds)
    | `If (cond, body) ->
       match cond with
       (* = <> || xor conditions are skipped, as they're not easily mergable with
        * any generator
        *)
       | `Binop (`Neq, _, _)
         | `Binop (`Eq, _, _)
         | `Binop (`Or, _, _)
         | `Binop (`Xor, _, _) -> traverse vars conds depth body
       (* Other conditions are added to the list *)
       | _ -> traverse vars (cons cond conds) depth body
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
  in
  traverse [] expr

(* returns true if any variable in the given list is a quantification variable, i.e.
 * if the variable is present in the variable map
 *)
let rec is_quantifier_var vars = function
  | e :: es -> if VariableDepth.mem e vars then true else is_quantifier_var vars es
  | [] -> false

(* Returns the list of conditions, i.e. bounds, for a quantification variable *)
let get_bounds vars conds var =
  (* returns the maximum between the current max level and the level of the given variable *)
  let max acc v =
    match VariableDepth.find_opt v vars with
    | Some l -> if l > acc then l else acc
    | None -> acc
  in
  (* Add the condition to the list of bounds if the variable is present in the condition
   * and the variable has the highest depth of all variables in the condition
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
   * generator of the given quantification variable
   *)
  List.fold_left add_bounds [] conds

(* When encountering a quantifier, retrieves all bounds for the respective variable and
 * merges it
 * When encountering a mergable if-condition, removes it
 *)
let rec rec_merge_bounds vars conds = function
  | `Forall ((v, t), a) ->
     `Forall ((v, t), rec_merge_bounds vars conds a, get_bounds vars conds v)
  | `Exists ((v, t), a) ->
     `Exists ((v, t), rec_merge_bounds vars conds a, get_bounds vars conds v)
  | `If (c, a) ->
     begin
       (* Remove if condition is in the list of unskipped conditions & it contains a
        * quantification variable
        *)
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

(* Merge conditions to the respective generators
 * Traverses the AST twice:
 * 1. Generate an index of the quantifier variables and the conditions to be merged
 * 2. Merge the conditions to the respective generators and delete the if conditions
 * Returns a new AST type supporting bounds
 *)
let merge_generator_bounds t_ast =
  let (vars, conds) = build_generator_index t_ast in
  rec_merge_bounds vars conds t_ast

let transform_single ({entrypoint = ep; body = a} : Parsing.Assertion_t.assertion_ast) =
  negate_assertion a
  |> break_conjunctions
  |> merge_generator_bounds
  |> (fun b -> ({entrypoint = ep; body = b}: ast))

let transform (asts : Parsing.Assertion_t.assertion_ast list) =
  List.map transform_single asts

let print_transformation =
  List.iter (pp_ast Fmt.stdout)
