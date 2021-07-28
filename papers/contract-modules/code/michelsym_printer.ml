open Michelsym
(* print types *)

let rec string_of_ty t =
  match t with
  | TBool -> "bool"
  | TInt -> "int"
  | TNat -> "nat"
  | TList (t1) -> "(list "^ string_of_ty t1 ^")"
  | TOption (t1) -> "(option "^ string_of_ty t1 ^")"
  | TSet (t1) -> "(set "^ string_of_ty t1 ^")"
  | TMap (t1, t2) -> "(map "^ string_of_ty t1 ^" "^ string_of_ty t2 ^")"
  | TOr (t1,t2) -> "(or "^ string_of_ty t1 ^" "^ string_of_ty t2 ^")"
  | TPair (t1, t2) -> "(pair "^ string_of_ty t1 ^" "^ string_of_ty t2 ^")"
  | TString -> "string"
  | TUnit -> "unit"
  | TAddress -> "address"
  | TMutez -> "mutez"
  | TTimestamp -> "timestamp"
  | TContract (t1) -> "(contract "^ string_of_ty t1 ^")"
  | TOperation -> "operation"
  | TKey -> "key"
  | TKey_Hash -> "key_hash"
  | TSignature -> "signature"
  | TBytes -> "bytes"
  | TNever -> "never"

let print_ty t =
  print_string (string_of_ty t)

let string_of_lr lr =
  match lr with
  | L -> "L"
  | R -> "R"

let string_of_step stp =
  match stp with
  | SLeft -> "left"
  | SRight -> "right"
  | SFirst -> "first"
  | SSecond -> "second"
  | SCar -> "car"
  | SCdr -> "cdr"
  | SSome -> "some"
  | SInset -> "in_set"
  | SInlist -> "in_list"
  | SInmap -> "in_map"
  | WSome -> "wrapped_some"

let rec string_of_sval s =
  match s with
  | VBool b -> Bool.to_string b
  | VInt i -> Z.to_string i
  | VNat n -> Z.to_string n
  | VOr (lr, s, _t) -> "("^string_of_lr lr^" "^string_of_sval s^")"
  | VPair (s1,s2) -> "(pair "^string_of_sval s1^" "^string_of_sval s2^")"
  | VString (st) -> "\"" ^ st ^ "\""
  | VSet (ss, _t) -> "(set "^string_of_svals ss^")"
  | VUnit -> "unit"
  | VNil (_) -> "nil"
  | VCons (s1, s2) -> "(cons "^string_of_sval s1^" "^string_of_sval s2^")"
  | VNone (_) -> "none"
  | VSome (s1) -> "(some "^string_of_sval s1^")"
  | VMap (ssl, _, _) -> "(map "^String.concat ", " (List.map (fun (s1, s2) -> string_of_sval s1^" -> "^string_of_sval s2) ssl) ^")"
  | VAddress (s1) -> "(address "^s1^")"
  | VKey (s1) -> "(key "^s1^")"
  | VKey_Hash (s1) -> "(key_hash "^s1^")"
  | VSignature (s1) -> "(signature "^s1^")"
  | VBytes (s1) -> "(bytes "^s1^")"
  | VMutez (i) -> Z.to_string i^"M"
  | VTimestamp (i) -> Z.to_string i^"T"
  | VContract (st, t1) -> "(contract "^st^" : "^string_of_ty t1^")"
  | VSymbolic (d, t1) -> "(sym "^string_of_desc d^" : "^string_of_ty t1^")"
and string_of_desc d =
  match d with
  | Step (st, d) -> string_of_step st^">"^string_of_desc d
  | Parameter -> "parameter"
  | Storage -> "storage"
  | Op (str, ss) -> "(op "^str^" "^string_of_svals ss^")"
  | Set (ss) -> "(set"^string_of_svals ss^")"
and string_of_svals ss =
  String.concat " " (List.map string_of_sval ss)
