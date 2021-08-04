open Michelsym
(* print symbolic values in smtlib syntax *)

let itable_assoc = [
  "NOT", "not";
  "CAR", "first";
  "CDR", "second";
  "GET", "get";
  (* nullary *)
  "SENDER", "SENDER";
  "BALANCE", "BALANCE";
  "AMOUNT", "AMOUNT";
  "SOURCE", "SOURCE";
  "NOW", "NOW";
  "SELF_ADDRESS", "SELF_ADDRESS"
]
let itable = Hashtbl.create 10
let () = List.iter (fun (k, v) -> Hashtbl.add itable k v) itable_assoc

let ctable_assoc = [
  "EQ", "=";
  "LT", "<";
  "GT", ">";
  "LE", "<=";
  "GE", ">="
]
let ctable = Hashtbl.create 10
let () = List.iter (fun (k,v) -> Hashtbl.add ctable k v) ctable_assoc

let rec smt_of_ty t =
  match t with
  | TBool -> "bool"
  | TInt -> "int"
  | TNat -> "nat"
  | TList (t1) -> "(list "^ smt_of_ty t1 ^")"
  | TOption (t1) -> "(option "^ smt_of_ty t1 ^")"
  | TSet (t1) -> "(set "^ smt_of_ty t1 ^")"
  | TMap (t1, t2) -> "(map "^ smt_of_ty t1 ^" "^ smt_of_ty t2 ^")"
  | TOr (t1,t2) -> "(or "^ smt_of_ty t1 ^" "^ smt_of_ty t2 ^")"
  | TPair (t1, t2) -> "(pair "^ smt_of_ty t1 ^" "^ smt_of_ty t2 ^")"
  | TLambda (t1, t2) -> "(lambda "^ smt_of_ty t1 ^" "^ smt_of_ty t2 ^")"
  | TString -> "string"
  | TUnit -> "unit"
  | TAddress -> "address"
  | TMutez -> "mutez"
  | TTimestamp -> "timestamp"
  | TContract (t1) -> "(contract "^ smt_of_ty t1 ^")"
  | TOperation -> "operation"
  | TKey -> "key"
  | TKey_Hash -> "key_hash"
  | TSignature -> "signature"
  | TBytes -> "bytes"
  | TNever -> "never"

let print_ty t =
  print_string (smt_of_ty t)

let smt_of_lr lr =
  match lr with
  | L -> "as-left"
  | R -> "as-right"

let smt_of_step stp =
  match stp with
  | SLeft -> "as-left"
  | SRight -> "as-right"
  | SFirst -> "first"
  | SSecond -> "second"
  | SCar -> "car"
  | SCdr -> "cdr"
  | SSome -> "as-some"
  | SInset -> "IN_SET"
  | SInlist -> "IN_LIST"
  | SInmap -> "IN_MAP"
  | WSome -> "WRAPPED_SOME"

let rec smt_of_sval s =
  match s with
  | VBool b -> Bool.to_string b
  | VInt i -> Z.to_string i
  | VNat n -> Z.to_string n
  | VOr (lr, s, _t) -> "("^smt_of_lr lr^" "^smt_of_sval s^")"
  | VPair (s1,s2) -> "(mk-pair "^smt_of_sval s1^" "^smt_of_sval s2^")"
  | VLambda (t1,t2, _ins_body) -> "(mk-lambda "^smt_of_ty t1^" "^smt_of_ty t2^" ...)"
  | VString (st) -> "\"" ^ st ^ "\""
  | VSet (ss, _t) -> "(mk-set "^smt_of_svals ss^")" (* TODO: encode as list *)
  | VUnit -> "unit"
  | VNil (_) -> "nil"
  | VCons (s1, s2) -> "(insert "^smt_of_sval s1^" "^smt_of_sval s2^")"
  | VNone (_) -> "mk-none"
  | VSome (s1) -> "(mk-some "^smt_of_sval s1^")"
  | VMap (ssl, _, _) -> "(mk-map "^String.concat ", " (List.map (fun (s1, s2) -> smt_of_sval s1^" -> "^smt_of_sval s2) ssl) ^")"
  | VAddress (s1) -> "(mk-address "^s1^")"
  | VKey (s1) -> "(key "^s1^")"
  | VKey_Hash (s1) -> "(key_hash "^s1^")"
  | VSignature (s1) -> "(signature "^s1^")"
  | VBytes (s1) -> "(bytes "^s1^")"
  | VMutez (i) -> "(mk-mutez "^Z.to_string i^")"
  | VTimestamp (i) -> "(mk-timestamp "^Z.to_string i^")"
  | VContract (st, _t1) -> "(mk-contract "^st^")"
  | VSymbolic (d, t1) ->
    (let str_desc = smt_of_desc d in
     match t1 with
     | TOption _ -> "(is-none "^str_desc^")"
     | _ -> str_desc)
      
and smt_of_desc d =
  match d with
  | Step (st, d) -> "("^smt_of_step st^" "^smt_of_desc d^")"
  | Parameter -> "parameter"
  | Storage -> "storage"
  | Op (str, []) when Hashtbl.mem itable str -> Hashtbl.find itable str 
  | Op (str, ss) when Hashtbl.mem itable str -> "("^Hashtbl.find itable str^" "^smt_of_svals ss^")"
  | Op ("NEQ", [VSymbolic (Op ("COMPARE", ss), _)]) ->
    "(not (= "^smt_of_svals ss^"))"
  | Op (eq, [VSymbolic (Op ("COMPARE", ss), _)]) when Hashtbl.mem ctable eq ->
    "("^Hashtbl.find ctable eq^" "^smt_of_svals ss^")"
  | Op (str, ss) -> "(op "^str^" "^smt_of_svals ss^")"
  | Set (ss) -> "(set "^smt_of_svals ss^")"
and smt_of_svals ss =
  String.concat " " (List.map smt_of_sval ss)
and smt_of_instr ins =
  match ins with
  | I str -> str
  | COND (str, inss_true, inss_false) -> str^" "^smt_of_instrs inss_true^" "^smt_of_instrs inss_false
  | LOOP (str, inss_body) -> str^" "^smt_of_instrs inss_body
  | PUSH sv -> "PUSH "^smt_of_sval sv
  | T (str, t1) -> str^" "^smt_of_ty t1
  | T2 (str, t1, t2) -> str^" "^smt_of_ty t1^" "^smt_of_ty t2
  | DIP (i, inss_body) -> "DIP "^string_of_int i^" "^smt_of_instrs inss_body
  | II (str, i) -> str^" "^string_of_int i
  | CREATE_CONTRACT (t1, t2, inss_body) -> "CREATE_CONTRACT "^smt_of_ty t1^" "^smt_of_ty t2^" "^smt_of_instrs inss_body
  | LAMBDA (t1, t2, inss_body) -> "LAMBDA "^smt_of_ty t1^" "^smt_of_ty t2^" "^smt_of_instrs inss_body
and smt_of_instrs inss =
  "{ "^String.concat "; " (List.map smt_of_instr inss) ^ " }"

let smt_of_failure_value (true_values, false_values, sv) =
  "\nFAILWITH "^smt_of_sval sv^
  "\n  IF TRUE:  "^smt_of_svals true_values^
  "\n  IF FALSE: "^smt_of_svals false_values

let smt_of_constraints {true_values; false_values; failure_values; maybe_reachable} =
  let _ = failure_values in
  "\nTrue values:\n "^String.concat "\n " (List.map smt_of_sval true_values)^
  "\nFalse values:\n "^String.concat "\n " (List.map smt_of_sval false_values)^
  "\nFailure values:\n"^String.concat "\n" (List.map smt_of_failure_value failure_values)^
  "\nMaybe reachable: "^Bool.to_string maybe_reachable
                          
