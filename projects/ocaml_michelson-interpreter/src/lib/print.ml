open Value

(*TODO: base on buffer instead of string concatenation*)

let rec ty_to_str ty =
  match ty with
  | TContract t         -> "TContract (" ^ (ty_to_str t) ^ ")"
  | TOperation          -> "TOperation"
  | TList t             -> "TList (" ^ (ty_to_str t) ^ ")"
  | TSet t              -> "TSet (" ^ (ty_to_str t) ^ ")"
  | TTicket t           -> "TTicket (" ^ (ty_to_str t) ^ ")"
  | TLambda (t0, t1)    -> "TLambda (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TMap (t0, t1)       -> "TMap (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TBig_map (t0, t1)   -> "TBig_map (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TBls_381_g1         -> "TBls_381_g1"
  | TBls_381_g2         -> "TBls_381_g2"
  | TBls_381_fr         -> "TBls_381_fr"
  | TSapling_transaction-> "TSapling_transaction"
  | TSapling_state      -> "TSapling_state"
  | TChest              -> "TChest"
  | TChest_key          -> "TChest_key"
  (* dual (comparable/not comparable) types *)
  | TOption t           -> "TOption (" ^ (ty_to_str t) ^ ")"
  | TPair (t0, t1)      -> "TPair (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  | TOr (t0, t1)        -> "TOr (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ")"
  (* comparable types *)
  | TUnit               -> "TUnit"
  | TNever              -> "TNever"
  | TBool               -> "TBool"
  | TInt                -> "TInt"
  | TNat                -> "TNat"
  | TString             -> "TString"
  | TChain_id           -> "TChain_id"
  | TBytes              -> "TBytes"
  | TMutez              -> "TMutez"
  | TKey_hash           -> "TKey_hash"
  | TKey                -> "TKey"
  | TSignature          -> "TSignature"
  | TTimestamp          -> "TTimestamp"
  | TAddress            -> "TAddress"
and un_to_str u =
  match u with
  | L -> "L"
  | R -> "R"
and op_to_str op =
  match op with
  | Create_contract (s, v0, v1, v2) -> "Create_contract (" ^ s  ^ ", " ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ")"
  | Transfer_tokens (t, v0, v1) -> "Transfer_tokens (" ^( ty_to_str t)  ^ ", " ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ")"
  | Set_delegate v -> "Set_delegate (" ^ (val_to_str v) ^ ")"
and val_to_str v =
  match v with
  | IOperation op -> "IOperation " ^ (op_to_str op)
  | IContract (t, s) -> "IContract (" ^ (ty_to_str t) ^ ", " ^ s ^ ")"
  | IList (t, vs) -> "IList (" ^ (ty_to_str t) ^ ", [" ^ (ls_to_str vs) ^ "])"
  | ISet (t, vs) -> "ISet (" ^ (ty_to_str t) ^ ", " ^ (ls_to_str vs) ^ ")"
  | ITicket (v0, v1, v2) -> "ITicket (" ^ (val_to_str v0)  ^ ", " ^ (val_to_str v1) ^ ", " ^ (val_to_str v2) ^ ")"
  | ILambda ((t0, t1), _ (*TODO: AbsMichelson.instr list*)) -> "ILambda ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), _)"
  | IMap ((t0, t1), vs) -> "IMap ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), (" ^ (map_to_str vs) ^ "))"
  | IBig_map ((t0, t1), vs) -> "IBig_map ((" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ "), (" ^ (map_to_str vs) ^ "))"
  | IBls_381_g1 b -> "IBls_381_g1 " ^ (Bytes.to_string b)
  | IBls_381_g2 b -> "IBls_381_g2 " ^ (Bytes.to_string b)
  | IBls_381_fr b -> "IBls_381_fr " ^ (Bytes.to_string b)
  | ISapling_transaction -> "ISapling_transaction"
  | ISapling_state -> "ISapling_state"
  | IChest (b, s) -> "IChest (" ^ (Bytes.to_string b) ^ ", " ^ s ^ ")"
  | IChest_key s -> "IChest_key" ^ s
  (* dual (comparable/not comparable) values *)
  | IOption (t, Some v) -> "IOption (" ^ (ty_to_str t) ^ ", Some" ^ (val_to_str v) ^ ")"
  | IOption (t, None) -> "IOption (" ^ (ty_to_str t) ^ ", None)"
  | IPair (v0, v1) -> "IPair (" ^ (val_to_str v0) ^ ", " ^ (val_to_str v1) ^ ")"
  | IOr (t0, t1, u, v) -> "IOr (" ^ (ty_to_str t0) ^ ", " ^ (ty_to_str t1) ^ ", " ^ (un_to_str u) ^ ", " ^ (val_to_str v) ^ ")"
  (* comparable values *)
  | IUnit -> "IUnit "
  | INever -> "INever "
  | IBool b -> "IBool " ^ (Bool.to_string b)
  | IInt z -> "IInt " ^ (Z.to_string z)
  | INat z -> "INat " ^ (Z.to_string z)
  | IString s -> "IString " ^ s
  | IChain_id s -> "IChain_id " ^ s
  | IBytes b -> "IBytes " ^ Bytes.to_string b
  | IMutez m -> "IMutez " ^ (Mutez.to_string m)
  | IKey_hash s -> "IKey_hash " ^ s
  | IKey s -> "IKey " ^ s
  | ISignature s -> "ISignature " ^ s
  | ITimestamp z -> "ITimestamp " ^ (Z.to_string z)
  | IAddress s -> "IAddress " ^ s
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