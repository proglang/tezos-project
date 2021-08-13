open Core
open Contract_module_t

let indent_space = "  "

let str_of_ty = function
  | `Int_t -> "Int_t"
  | `Bool_t -> "Bool_t"
  | `Bytes_t -> "Byte_t"
  | `String_t -> "String_t"
  | `Mutez_t -> "Mutez_t"
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


let pp_type_expr_top ppf ~indent t =
  let rec pp_type_expr ppf ~indent t =
    let print_type = Fmt.pf ppf "%sType: %s" indent in
    match t with
    | `List_t tt ->
       print_type (str_of_ty t);
       pp_un_composite ppf tt
    | `Set_t tt ->
       print_type (str_of_ty t);
       pp_un_composite ppf tt
    | `Option_t tt ->
       print_type (str_of_ty t);
     pp_un_composite ppf tt
    | `Or_t (t1, t2) ->
       print_type (str_of_ty t);
       pp_bin_composite ppf t1 t2
    | `Pair_t (t1, t2) ->
       print_type (str_of_ty t);
       pp_bin_composite ppf t1 t2
    | `Lambda_t (t1, t2) ->
       print_type (str_of_ty t);
       pp_bin_composite ppf t1 t2
    | `Map_t (t1, t2) ->
       print_type (str_of_ty t);
       pp_bin_composite ppf t1 t2
    | `Contract_t tt ->
       print_type (str_of_ty t);
       pp_un_composite ppf tt
    | `BigMap_t (t1, t2) ->
       print_type (str_of_ty t);
       pp_bin_composite ppf t1 t2
    | _ -> print_type (str_of_ty t)
  and pp_un_composite ppf t1 =
    Fmt.pf ppf "<" ;
    pp_type_expr ppf ~indent:"" t1;
    Fmt.pf ppf ">"
  and pp_bin_composite ppf t1 t2 =
    Fmt.pf ppf "<" ;
    pp_type_expr ppf ~indent:"" t1;
    Fmt.pf ppf ", " ;
    pp_type_expr ppf ~indent:"" t2;
    Fmt.pf ppf ">"
  in
  pp_type_expr ppf ~indent t;
  Fmt.pf ppf "@."
  
let rec pp_pattern ppf ~indent pat =
  let print_pattern = Fmt.pf ppf "%sPattern: %s@." indent in
  let new_indent = indent_space ^ indent in
  match pat with
  | `Wildcard -> print_pattern "Wildcard"
  | `Ident (s,t) ->
     print_pattern (Fmt.str "Id:%s" s);
     pp_type_expr_top ppf ~indent:new_indent t
  | `Left p ->
     print_pattern "Left";
     pp_pattern ppf ~indent:new_indent p
  | `Right p ->
     print_pattern "Right";
     pp_pattern ppf ~indent:new_indent p

let pp_entrypoint_name ppf ~indent (ep, pat) =
  let print_ep_name = Fmt.pf ppf "%sEntrypoint: %%%s@." indent in
  let new_indent = indent_space ^ indent in
  print_ep_name ep; pp_pattern ppf ~indent:new_indent pat

let rec pp_error_list ppf ~indent l =
  match l with
  | [] ->  Fmt.pf ppf ""; 
  | e :: ls ->  Fmt.pf ppf "%sError: %s@." indent e; pp_error_list ppf ~indent ls

let pp_entrypoint_decl ppf ~indent ({entrypoint = (e, p); errors = er}: entrypoint_decl) =
  let new_indent = indent_space ^ indent in
  pp_entrypoint_name ppf ~indent (e, p); pp_error_list ppf ~indent:new_indent er

let rec pp_emtrypoint_list ppf ~indent (l : entrypoint_list) =
  match l with
  | []  -> Fmt.pf ppf "";
  | e :: ls ->  pp_entrypoint_decl ppf ~indent e; pp_emtrypoint_list ppf ~indent ls

let pp_ast ppf ({contract = ep; body = entrypoint_list}: contract_module_ast) =
  let indent = "└──" in
  let pp_contract_name = Fmt.pf ppf "%sContract: %s@." indent in
  let new_indent = indent_space ^ indent in
  Fmt.pf ppf "AST@." ;
  pp_contract_name ep;
  pp_emtrypoint_list ppf ~indent:new_indent entrypoint_list
