open Base

open Value

(*TODO: base on buffer instead of string concatenation*)

let rec ty_to_str ty =
  match ty with
  | TContract t         -> "contract (" ^ (ty_to_str t) ^ ")"
  | TOperation          -> "operation"
  | TList t             -> "(list " ^ (ty_to_str t) ^ ")"
  | TSet t              -> "(set " ^ (ty_to_str t) ^ ")"
  | TTicket t           -> "ticket (" ^ (ty_to_str t) ^ ")"
  | TLambda (t0, t1)    -> "lambda (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TMap (t0, t1)       -> "map " ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1)
  | TBig_map (t0, t1)   -> "big_map " ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1)
  | TBls_381_g1         -> "bls_381_g1"
  | TBls_381_g2         -> "bls_381_g2"
  | TBls_381_fr         -> "bls_381_fr"
  | TSapling_transaction-> "sapling_transaction"
  | TSapling_state      -> "sapling_state"
  | TChest              -> "chest"
  | TChest_key          -> "chest_key"
  (* dual (comparable/not comparable) types *)
  | TOption t           -> "option (" ^ (ty_to_str t) ^ ")"
  | TPair (t0, t1)      -> "pair (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TOr (t0, t1)        -> "or (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  (* comparable types *)
  | TUnit               -> "unit"
  | TNever              -> "never"
  | TBool               -> "bool"
  | TInt                -> "int"
  | TNat                -> "nat"
  | TString             -> "string"
  | TChain_id           -> "chain_id"
  | TBytes              -> "bytes"
  | TMutez              -> "mutez"
  | TKey_hash           -> "key_hash"
  | TKey                -> "key"
  | TSignature          -> "signature"
  | TTimestamp          -> "timestamp"
  | TAddress            -> "address"
and un_to_str u =
  match u with
  | L -> "Left"
  | R -> "Right"
and op_to_str op =
  match op with
  | OCreate_contract (((t0, t1), _ (*TODO: AbsMichelson.instr list*)), v0, v1, v2, v3) -> "Create_contract (((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), _)," ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ", " ^ (val_to_str v2) ^ ")"
  | OTransfer_tokens (v0, v1, v2) -> "Transfer_tokens (" ^( val_to_str v0)  ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ")"
  | OSet_delegate v -> "Set_delegate (" ^ (val_to_str v) ^ ")"
and val_to_str v =
  match v with
  | IOperation op -> (op_to_str op)
  | IContract (t, s) -> "\"" ^ s ^ "\""
  | IList (t, vs)
  | ISet (t, vs) ->
    let body = ls_to_str vs in
    (match body with
     | "" -> "{}"
     | _ -> "{ " ^ body ^ " }"
     )
  | ITicket (v0, v1, v2) -> "(Pair " ^ (val_to_str v0)  ^ " " ^ (val_to_str v1) ^ " " ^ (val_to_str v2) ^ ")"
  | ILambda ((t0, t1), instrs (*TODO: AbsMichelson.instr list*), vs) -> "{" ^ "INSTRCUTIONS (Lambda" ^ "}"
  | IMap ((t0, t1), vs)
  | IBig_map ((t0, t1), vs) -> "{ " ^ (map_to_str vs) ^ " }"
  | IBls_381_g1 b
  | IBls_381_g2 b
  | IBls_381_fr b -> Bytes.to_string b
  | ISapling_transaction -> "Sapling_transaction"
  | ISapling_state -> "Sapling_state"
  | IChest (b, s) -> "Chest"
  | IChest_key s -> "Chest_key"
  (* dual (comparable/not comparable) values *)
  | IOption (_, op) -> (match op with | Some v -> "(Some " ^ (val_to_str v) ^ ")" | None -> "None")
  | IPair (v0, v1) -> "(Pair " ^ (val_to_str v0) ^ " " ^ (val_to_str v1) ^ ")"
  | IOr (t0, t1, u, v) -> "(" ^ (un_to_str u) ^ " " ^ (val_to_str v) ^ ")"
  (* comparable values *)
  | IUnit -> "Unit"
  | INever -> "Never"
  | IBool b -> (match b with | true -> "True" | false -> "False")
  | IInt z
  | INat z -> (Z.to_string z)
  | IChain_id b
  | IBytes b -> Bytes.to_string b
  | IMutez m -> Mutez.to_string m
  | ITimestamp z -> "\"" ^ Tstamp.to_rfc3339 z ^ "\""
  | IString s
  | IKey_hash s
  | IKey s
  | ISignature s
  | IAddress s -> "\"" ^ s ^ "\""
and ls_to_str vs =
  match vs with
  | [] -> ""
  | [v] -> val_to_str v
  | v :: vs -> (val_to_str v) ^ " ; " ^ (ls_to_str vs)
and map_to_str vs =
  match vs with
  | [] -> ""
  | [(v0, v1)] -> "Elt " ^ val_to_str v0 ^ " " ^ val_to_str v1
  | (v0, v1) :: vs -> "Elt " ^ val_to_str v0 ^ " " ^ val_to_str v1 ^ " ; " ^ (map_to_str vs)



let ty_stack_of_value_list (lst: value list) : string =
  ( (String.concat ~sep:" : " (List.map lst ~f:(fun x -> ty_to_str (typeof x)))) ^ " : []")

let val_stack_of_value_list (lst: value list) : string =
  ( String.concat ~sep:" : " (List.map lst ~f:(val_to_str))) ^ " : []"
