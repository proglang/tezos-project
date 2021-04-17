open Core
open Assertion

let indent_space = "  "

let str_of_unop = function
  | `Size -> "Size"
  | `Abs -> "Abs"
  | `Neg -> "Neg"
  | `Not -> "Not"

let str_of_binop = function
  | `Nth -> "Nth"
  | `Add -> "Add"
  | `Sub -> "Sub"
  | `Mul -> "Mul"
  | `Div -> "Div"
  | `Mod -> "Mod"
  | `Or -> "Or"
  | `And -> "And"
  | `Xor -> "Xor"
  | `Lsl -> "Lsl"
  | `Lsr -> "Lsr"
  | `Eq -> "Eq"
  | `Neq -> "Neq"
  | `Lt -> "Lt"
  | `Gt -> "Gt"
  | `Le -> "Le"
  | `Ge -> "Ge"

let str_of_ty = function
  | `Int_t -> "Int_t"
  | `Bool_t -> "Bool_t"
  | `Bytes_t -> "Byte_t"
  | `String_t -> "String_t"
  | `Fmu_t -> "Fmu_t"
  | `Nat_t -> "Nat_t"
  | `Address_t -> "Address_t"
  | `ChainID_t -> "ChainID_t"
  | `Key_t -> "Key_t"
  | `KeyHash_t -> "KeyHash_t"
  | `Operation_t -> "Operation_t"
  | `Signature_t -> "Signature_t"
  | `Timestamp_t -> "Timestamp_t"
  | `Unit_t -> "Unit_t"
  | `List_t _ -> "List_t"
  | `Set_t _ -> "Set_t"
  | `Option_t _ -> "Option_t"
  | `Or_t _ -> "Or_t" 
  | `Pair_t _ -> "Pair_t"
  | `Lambda_t _ -> "Lambda_t"
  | `Map_t _ -> "Map_t"
  | `Contract_t _ -> "Contract_t"
  | `BigMap_t _ -> "BigMap_t"

let rec pp_expr ppf ~indent expr =
  let print_expr = Fmt.pf ppf "%sExpr: %s@." indent in
  let new_indent = indent_space ^ indent in
  match expr with
  | `Int i -> print_expr (Fmt.str "Int:%d" i)
  | `Bool b -> print_expr (Fmt.str "Bool:%b" b)
  | `String s -> print_expr (Fmt.str "Str:\"%s\"" s)
  | `Ident id -> print_expr (Fmt.str "Id:%s" id)
  | `IfThenElse (e1, e2, e3) ->
     print_expr "IfThenElse" ;
     pp_expr ppf ~indent:new_indent e1 ;
     pp_expr ppf ~indent:new_indent e2 ;
     pp_expr ppf ~indent:new_indent e3
  | `Unop (op, expr) ->
     print_expr (Fmt.str "Un Op: %s" (str_of_unop op)) ;
     pp_expr ppf ~indent:new_indent expr
  | `Binop (op, expr1, expr2) ->
     print_expr (Fmt.str "Bin Op: %s" (str_of_binop op)) ;
     pp_expr ppf ~indent:new_indent expr1 ;
     pp_expr ppf ~indent:new_indent expr2
  | `Slice (e1, e2, e3) ->
     print_expr (Fmt.str "Op: Slice");
     pp_expr ppf ~indent:new_indent e1 ;
     pp_expr ppf ~indent:new_indent e2 ;
     pp_expr ppf ~indent:new_indent e3

let rec pp_type_expr ppf ~indent t =
  let print_type = Fmt.pf ppf "%sType: %s@." indent in
  let new_indent = indent_space ^ indent in
  match t with
  | `List_t tt ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent tt
  | `Set_t tt ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent tt
  | `Option_t tt ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent tt
  | `Or_t (t1, t2) ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent t1;
     pp_type_expr ppf ~indent:new_indent t2
  | `Pair_t (t1, t2) ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent t1;
     pp_type_expr ppf ~indent:new_indent t2
  | `Lambda_t (t1, t2) ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent t1;
     pp_type_expr ppf ~indent:new_indent t2
  | `Map_t (t1, t2) ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent t1;
     pp_type_expr ppf ~indent:new_indent t2
  | `Contract_t tt ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent tt
  | `BigMap_t (t1, t2) ->
     print_type (str_of_ty t);
     pp_type_expr ppf ~indent:new_indent t1;
     pp_type_expr ppf ~indent:new_indent t2
  | _ -> print_type (str_of_ty t)
  
let rec pp_pattern ppf ~indent pat =
  let print_pattern = Fmt.pf ppf "%sPattern: %s@." indent in
  let new_indent = indent_space ^ indent in
  match pat with
  | `Wildcard -> print_pattern "Wildcard"
  | `Var (s,t) ->
     print_pattern (Fmt.str "Var:%s" s);
     pp_type_expr ppf ~indent:new_indent t
  | `IdentPat s ->
     print_pattern (Fmt.str "Id:%s" s);
  | `Pair (p1, p2) ->
     print_pattern "Pair";
     pp_pattern ppf ~indent:new_indent p1 ;
     pp_pattern ppf ~indent:new_indent p2
  | `Left p ->
     print_pattern "Left";
     pp_pattern ppf ~indent:new_indent p
  | `Right p ->
     print_pattern "Right";
     pp_pattern ppf ~indent:new_indent p
  | `None -> print_pattern "None"
  | `Some p ->
     print_pattern "Some";
     pp_pattern ppf ~indent:new_indent p
  | `Cons (p1, p2) ->
     print_pattern "Cons";
     pp_pattern ppf ~indent:new_indent p1 ;
     pp_pattern ppf ~indent:new_indent p2
  | `Nil -> print_pattern "Nil"

let pp_bounds ppf ~indent bounds =
  let rec rec_pp_bound ppf ~indent = function
    | b :: bs -> pp_expr ppf ~indent b; rec_pp_bound ppf ~indent bs
    | [] -> ()
  in
  let new_indent = indent_space ^ indent in
  Fmt.pf ppf "%sBounds: @." indent ;
  rec_pp_bound ppf ~indent:new_indent bounds

 let rec pp_assertion ppf ~indent assertion =
   let print_assertion = Fmt.pf ppf "%sAssertion: %s@." indent in
   let new_indent = indent_space ^ indent in
   match assertion with
   | `Forall (var, body, bounds) ->
      print_assertion "Forall" ;
      pp_pattern ppf ~indent:new_indent (`Var var) ;
      pp_bounds ppf ~indent:new_indent bounds ;
      pp_assertion ppf ~indent:new_indent body
   | `Exists (var, body, bounds) ->
      print_assertion "Exists" ;
      pp_pattern ppf ~indent:new_indent (`Var var) ;
      pp_bounds ppf ~indent:new_indent bounds ;
      pp_assertion ppf ~indent:new_indent body
   | `If (expr, body) ->
      print_assertion "If" ;
      pp_expr ppf ~indent:new_indent expr ;
      pp_assertion ppf ~indent:new_indent body
   | `Assert e ->
      print_assertion "Assert";
      pp_expr ppf ~indent:new_indent e

let pp_entrypoint ppf ~indent (ep, pat) =
  let print_ep_name = Fmt.pf ppf "%sEntrypoint: %%%s@." indent in
  let new_indent = indent_space ^ indent in
  match ep with
  | Some s -> print_ep_name s; pp_pattern ppf ~indent:new_indent pat
  | None -> print_ep_name "default"; pp_pattern ppf ~indent:new_indent pat

let pp_ast ppf ({entrypoint = ep; body = assertion}: assertion_ast) =
  let indent = "└──" in
  Fmt.pf ppf "AST@." ;
  pp_entrypoint ppf ~indent ep;
  pp_assertion ppf ~indent assertion
