open Transformation

let indent_step = "    "

(*
let rec compile_type id = function
  | `Int_t -> "int" ^ id
  | `Bool_t -> "bool" ^ id
  | `Bytes_t -> "bytes" ^ id
  | `String_t -> "string" ^ id
  | `Mutez_t -> "mutez" ^ id
  | `Nat_t -> "nat" ^ id
  | `Address_t -> "address" ^ id
  | `ChainID_t -> "chain_id" ^ id
  | `Key_t -> "key" ^ id 
  | `KeyHash_t -> "key_hash" ^ id
  | `Operation_t -> "operation" ^ id
  | `Signature_t -> "signature" ^ id
  | `Timestamp_t -> "timestamp" ^ id 
  | `Unit_t -> "unit" ^ id
  | `List_t ty -> "(list %" ^ id ^ " " ^ (compile_type "" ty) 
  | `Set_t ty -> "set %" ^ id ^ " " ^ (compile_type "" ty) 
  | `Option_t -> "option %" ^ id ^ " " ^ (compile_type "" ty)
  | `Or_t (ty1, ty2) -> "or " ^ id ^ " " ^ (compile_type "" ty) 
  | `Pair_t of ty * ty
  | `Lambda_t of ty * ty
  | `Map_t of ty * ty
  | `Contract_t ty -> 
  | `BigMap_t of ty * ty
                
let compile_pattern = function
  | `Wildcard -> "_"
  | `Ident (id, ty) -> 
  | `Pair (p1, p2) ->
  | `Left p ->
  | `Right p ->
  | `None ->
  | `Some x ->
  | `Cons (p1, p2) ->
  | `Nil ->
 *)
                
let compile_header (asts : ast list) =
  let rec build_parameter (asts : ast list) indent =
    match asts with
    | {entrypoint = (None, _); _} :: _ -> "..."
    | {entrypoint = (Some n, _); _} :: [] -> " ( ... %" ^ n ^ ")"
    | {entrypoint = (Some n, _); _} :: rest ->
       let new_indent = indent ^ indent_step in
       let or_right = build_parameter rest new_indent in
       " (or ( ... %" ^ n ^ ")\n" ^ indent ^ or_right ^ ")"
    | [] -> ""
  in
  let indent = "            " in
  let parameter = "parameter" ^ build_parameter asts indent ^ ";" in
  let storage = "storage unit;\n" in
  String.concat "\n" [parameter; storage]
