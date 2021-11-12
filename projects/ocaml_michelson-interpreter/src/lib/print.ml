open Value

(*TODO: base on buffer instead of string concatenation*)

let rec ty_to_str ty =
  match ty with
  | TContract t         -> "contract (" ^ (ty_to_str t) ^ ")"
  | TOperation          -> "operation"
  | TList t             -> "list (" ^ (ty_to_str t) ^ ")"
  | TSet t              -> "set (" ^ (ty_to_str t) ^ ")"
  | TTicket t           -> "ticket (" ^ (ty_to_str t) ^ ")"
  | TLambda (t0, t1)    -> "lambda (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TMap (t0, t1)       -> "map (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TBig_map (t0, t1)   -> "mig_map (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
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
  | L -> "L"
  | R -> "R"
and op_to_str op =
  match op with
  | OCreate_contract (((t0, t1), _ (*TODO: AbsMichelson.instr list*)), v0, v1, v2, v3) -> "Create_contract (((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), _)," ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ", " ^ (val_to_str v2) ^ ")"
  | OTransfer_tokens (v0, v1, v2) -> "Transfer_tokens (" ^( val_to_str v0)  ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ")"
  | OSet_delegate v -> "Set_delegate (" ^ (val_to_str v) ^ ")"
and val_to_str v =
  match v with
  | IOperation op -> "Operation " ^ (op_to_str op)
  | IContract (t, s) -> "Contract (" ^ (ty_to_str t) ^ ", " ^ s ^ ")"
  | IList (t, vs) -> "List (" ^ (ty_to_str t) ^ ", [" ^ (ls_to_str vs) ^ "])"
  | ISet (t, vs) -> "Set (" ^ (ty_to_str t) ^ ", " ^ (ls_to_str vs) ^ ")"
  | ITicket (v0, v1, v2) -> "Ticket (" ^ (val_to_str v0)  ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ")"
  | ILambda ((t0, t1), _ (*TODO: AbsMichelson.instr list*), vs) -> "Lambda ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), _, " ^ (ls_to_str vs) ^ ")"
  | IMap ((t0, t1), vs) -> "Map ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), (" ^ (map_to_str vs) ^ "))"
  | IBig_map ((t0, t1), vs) -> "Big_map ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), (" ^ (map_to_str vs) ^ "))"
  | IBls_381_g1 b -> "Bls_381_g1 " ^ (Bytes.to_string b)
  | IBls_381_g2 b -> "Bls_381_g2 " ^ (Bytes.to_string b)
  | IBls_381_fr b -> "Bls_381_fr " ^ (Bytes.to_string b)
  | ISapling_transaction -> "Sapling_transaction"
  | ISapling_state -> "Sapling_state"
  | IChest (b, s) -> "Chest (" ^ (Bytes.to_string b) ^ ", " ^ s ^ ")"
  | IChest_key s -> "Chest_key" ^ s
  (* dual (comparable/not comparable) values *)
  | IOption (t, Some v) -> "Option (" ^ (ty_to_str t) ^ ", Some" ^ (val_to_str v) ^ ")"
  | IOption (t, None) -> "Option (" ^ (ty_to_str t) ^ ", None)"
  | IPair (v0, v1) -> "Pair (" ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ")"
  | IOr (t0, t1, u, v) -> "Or (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ", " ^ (un_to_str u) ^ ", " ^ (val_to_str v) ^ ")"
  (* comparable values *)
  | IUnit -> "Unit "
  | INever -> "Never "
  | IBool b -> "Bool " ^ (Bool.to_string b)
  | IInt z -> "Int " ^ (Z.to_string z)
  | INat z -> "Nat " ^ (Z.to_string z)
  | IString s -> "String " ^ s
  | IChain_id s -> "Chain_id " ^ s
  | IBytes b -> "Bytes " ^ Bytes.to_string b
  | IMutez m -> "Mutez " ^ (Mutez.to_string m)
  | IKey_hash s -> "Key_hash " ^ s
  | IKey s -> "Key " ^ s
  | ISignature s -> "Signature " ^ s
  | ITimestamp z -> "Timestamp " ^ (Z.to_string z)
  | IAddress s -> "Address " ^ s
and ls_to_str vs =
  match vs with
  | [] -> ""
  | [v] -> val_to_str v
  | v :: vs -> (val_to_str v) ^ ", " ^ (ls_to_str vs)
and map_to_str vs =
  match vs with
  | [] -> ""
  | [(v0, v1)] -> "(" ^ val_to_str v0 ^ ", " ^ val_to_str v1 ^ ")"
  | (v0, v1) :: vs -> "(" ^ val_to_str v0 ^ ", " ^ val_to_str v1 ^ ")" ^ ", " ^ (map_to_str vs)