open Static_checker
open Symbolic_execution

(** The Printers for the Domain Specific Language (DSL). **)
(* Print a type. *)
let rec string_of_ty = function
  | `Unit -> "unit"
  | `Never -> "never"
  | `Bool -> "bool"
  | `Int -> "int"
  | `Nat -> "nat"
  | `String -> "string"
  | `Chain_id -> "chain_id"
  | `Bytes -> "bytes"
  | `Mutez -> "mutez"
  | `Key_hash -> "key_hash"
  | `Key -> "key"
  | `Signature -> "signature"
  | `Timestamp -> "timestamp" 
  | `Address -> "address"
  | `Tx_rollup_12_address -> "tx_rollup_12_address"
  | `Option ty -> "option " ^ (string_of_ty ty)
  | `Or (ty1, ty2) -> "or (" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"
  | `Pair (ty1, ty2) -> "pair (" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"
  | `List ty -> "list " ^ (string_of_ty ty)
  | `Set ty -> "set " ^ (string_of_ty ty)
  | `Operation -> "operation"
  | `Contract ty -> "contract " ^ (string_of_ty ty)
  | `Map (ty1, ty2) -> "map (" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"
  | `Big_map (ty1, ty2) -> "big_map (" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"
  | `Lambda (ty1, ty2) -> "lambda (" ^ (string_of_ty ty1) ^ ", " ^ (string_of_ty ty2) ^ ")"
  | `Ticket ty -> "ticket" ^ (string_of_ty ty)
  | `Bls12_381_g1 -> "bls12_381_g1"
  | `Bls12_381_g2 -> "bls12_381_g2"
  | `Bls12_381_fr -> "bls12_381_fr"
  | `Sapling_transaction i -> "sapling_transaction " ^ (string_of_int i)
  | `Sapling_state i -> "sapling_state " ^ (string_of_int i)
  | `Chest -> "chest"
  | `Chest_key -> "chest_key"
  | _ -> raise (SystermErr ("string_of_ty: Illegal Type"))
(* Print a list of instructions. *)
let rec print_instr_list f_instr = function
  | [] -> " "
  | hd :: [] -> (f_instr hd)
  | hd :: tl -> (f_instr hd) ^ "; " ^ print_instr_list f_instr tl
(* Print an instruction. *)
let rec print_instr f_mterm = function
  | `APPLY -> "APPLY"
  | `EXEC -> "EXEC"
  | `FAILWITH s -> "FAILWITH" ^ s
  | `IF (l1, l2) -> "IF {" ^ (print_instr_list (print_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_instr_list (print_instr f_mterm) l2) ^ "}"
  | `IF_CONS (l1, l2) -> "IF_CONS {" ^ (print_instr_list (print_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_instr_list (print_instr f_mterm) l2) ^ "}"
  | `IF_LEFT (l1, l2) -> "IF_LEFT {" ^ (print_instr_list (print_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_instr_list (print_instr f_mterm) l2) ^ "}"
  | `IF_NONE (l1, l2) -> "IF_NONE {" ^ (print_instr_list (print_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_instr_list (print_instr f_mterm) l2) ^ "}"
  | `ITER l -> "ITER {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `LAMBDA (ty1, ty2, l) -> "LAMBDA " ^ (string_of_ty ty1) ^ " " ^ (string_of_ty ty2) ^ " {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `LAMBDA_REC (ty1, ty2, l)-> "LAMBDA_REC" ^ (string_of_ty ty1) ^ " " ^ (string_of_ty ty2) ^ " {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `LOOP l-> "LOOP {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `LOOP_LEFT l-> "LOOP_LEFT {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `DIG n -> "DIG " ^ string_of_int n
  | `DIP l -> "DIP {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `DIP_N (n, l) -> "DIP_N " ^ (string_of_int n) ^ " {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `DROP -> "DROP"
  | `DROP_N n -> "DROP_N " ^ string_of_int n
  | `DUG n -> "DUG " ^ string_of_int n
  | `DUP -> "DUP"
  | `DUP_N n -> "DUP_N" ^ string_of_int n
  | `PUSH (ty, m) -> "PUSH " ^ (string_of_ty ty) ^ (f_mterm m) 
  | `SWAP -> "SWAP"
  | `ABS -> "ABS"
  | `ADD -> "ADD"
  | `COMPARE -> "COMPARE"
  | `EDIV -> "EDIV"
  | `EQ -> "EQ"
  | `NEQ -> "NEQ"
  | `GE -> "GE"
  | `GT -> "GT"
  | `INT -> "INT"
  | `LE -> "LE"
  | `LSL -> "LSL"
  | `LSR -> "LSR"
  | `LT -> "LT"
  | `MUL -> "MUL"
  | `NEG -> "NEG"
  | `SUB -> "SUB"
  | `AND -> "AND"
  | `NOT -> "NOT"
  | `OR -> "OR"
  | `XOR -> "XOR"
  | `BLAKE2B -> "BLAKE2B"
  | `CHECK_SIGNATURE -> "CHECK_SIGNATURE"
  | `HASH_KEY -> "HASH_KEY"
  | `KECCAK -> "KECCAK"
  | `PAIRING_CHECK -> "PAIRING_CHECK"
  | `SHA256 -> "SHA256"
  | `SHA3 -> "SHA3"
  | `SHA512 -> "SHA512"
  | `ADDRESS -> "ADDRESS"
  | `AMOUNT -> "AMOUNT"
  | `BALANCE -> "BALANCE"
  | `CHAIN_ID -> "CHAIN_ID"
  | `CONTRACT ty -> "CONTRACT" ^ (string_of_ty ty)
  | `IMPLICIT_ACCOUNT -> "IMPLICIT_ACCOUNT"
  | `LEVEL -> "LEVEL"
  | `NOW -> "NOW"
  | `SELF -> "SELF"
  | `SELF_ADDRESS -> "SELF_ADDRESS"
  | `SENDER -> "SENDER"
  | `SET_DELEGATE -> "SET_DELEGATE"
  | `SOURCE -> "SOURCE"
  | `TOTAL_VOTING_POWER -> "TOTAL_VOTING_POWER"
  | `TRANSFER_TOKENS -> "TRANSFER_TOKENS"
  | `VOTING_POWER -> "VOTING_POWER"
  | `CAR -> "CAR"
  | `CDR -> "CDR"
  | `CONCAT -> "CONCAT"
  | `CONS -> "CONS"
  | `EMPTY_BIG_MAP (ty1, ty2) -> "EMPTY_BIG_MAP " ^ (string_of_ty ty1) ^ " " ^ (string_of_ty ty2)
  | `EMPTY_MAP (ty1, ty2) -> "EMPTY_MAP " ^ (string_of_ty ty1) ^ " " ^ (string_of_ty ty2)
  | `EMPTY_SET ty  -> "EMPTY_SET " ^ (string_of_ty ty)
  | `GET -> "GET"
  | `GET_N n -> "GET_N" ^ string_of_int n
  | `GET_AND_UPDATE -> "GET_AND_UPDATE"
  | `LEFT ty -> "LEFT " ^ (string_of_ty ty)
  | `MAP l -> "MAP {" ^ (print_instr_list (print_instr f_mterm) l) ^ "}"
  | `MEM -> "MEM"
  | `NEVER -> "NEVER"
  | `NIL ty -> "NIL" ^ (string_of_ty ty)
  | `NONE ty -> "NONE " ^ (string_of_ty ty)
  | `PACK -> "PACK"
  | `PAIR -> "PAIR"
  | `PAIR_N n -> "PAIR_N " ^ string_of_int n
  | `RIGHT ty -> "RIGHT " ^ (string_of_ty ty)
  | `SIZE -> "SIZE"
  | `SLICE -> "SLICE"
  | `SOME -> "SOME"
  | `UNIT -> "UNIT"
  | `UNPACK ty -> "UNPACK " ^ (string_of_ty ty)
  | `UNPAIR -> "UNPAIR"
  | `UNPAIR_N n -> "UNPAIR_N" ^ string_of_int n
  | `UPDATE -> "UPDATE"
  | `UPDATE_N n -> "UPDATE_N" ^ string_of_int n
  | `JOINT_TICKETS -> "JOINT_TICKETS"
  | `READ_TICKETS -> "READ_TICKETS"
  | `SPLIT_TICKET -> "SPLIT_TICKET"
  | `TICKET -> "TICKET"
  | _ -> raise (SystermErr ("print_instr: Illegal Instruction"))
(* Print a list of mterms. *)
let rec print_mterm_list f_mterm = function
  | [] -> " "
  | hd :: [] -> (f_mterm hd)
  | hd :: tl -> (f_mterm hd) ^ "; " ^ print_mterm_list f_mterm tl
(* Print a mterm. *)
let rec print_mterm = function
  | `Int i -> "Int " ^ string_of_int i
  | `Nat n -> "Nat " ^ string_of_int n
  | `Bool b -> "Bool " ^ string_of_bool b
  | `Bytes b -> "Bytes " ^  b
  | `String s -> "String " ^  s
  | `Mutez m -> "Mutez " ^ string_of_int m
  | `Timestamp t -> "Timestamp " ^ string_of_int t
  | `Key k -> "Key " ^  k
  | `Key_hash kh -> "Key_hash " ^  kh
  | `Address addr -> "Address " ^  addr
  | `Signature sign -> "Signature " ^  sign
  | `Chain_id cid -> "Chain_id" ^  cid
  | `Unit -> "Unit"
  | `Never -> "Never"
  | `Min_block_time -> "Min_block_time"
  | `Amount -> "Amount"
  | `Balance -> "Balance"
  | `CChain_id -> "Chain_id"
  | `Level -> "Level"
  | `Now -> "Now"
  | `Sender -> "Sender" 
  | `Self ty -> "Self" ^ (string_of_ty ty)
  | `Self_address -> "Self_address"
  | `Source -> "Source"
  | `Total_voting -> "Total_voting"
  | `None ty -> "None " ^ (string_of_ty ty)
  | `Some (t, ty) -> "Some (" ^ (print_mterm t) ^ ", " ^ (string_of_ty ty) ^ ")"
  | `Var (x, ty) -> "(" ^ x ^ ":" ^ (string_of_ty ty) ^ ")"
  | `NVar x -> x
  | `Elt (t1, t2) -> "Elt (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Left (t, ty) -> "Left (" ^ (print_mterm t) ^ ", " ^ (string_of_ty ty) ^ ")"
  | `Right (t, ty) -> "Right (" ^ (print_mterm t) ^ ", " ^ (string_of_ty ty) ^ ")"
  | `Pair (t1, t2) -> "Pair (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^")"
  | `Contract (ty, s) -> "Contract (" ^ (string_of_ty ty) ^ ", " ^ s ^ ")"
  | `Map (l, ty1, ty2) -> "Map {" ^ (print_mterm_list print_mterm l) ^ "} : " ^ (string_of_ty ty1) ^ " " ^ (string_of_ty ty2)
  | `Set (l, ty) -> "Set {" ^ (print_mterm_list print_mterm l) ^ "} : " ^ (string_of_ty ty) 
  | `List (l, ty) -> "List [" ^ (print_mterm_list print_mterm l) ^ "] : " ^ (string_of_ty ty) 
  | `Instr l -> "Instr_list {" ^ (print_instr_list (print_instr print_mterm) l) ^ "}"
  | `Add (t1, t2) -> "Add (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Sub (t1, t2) -> "Sub (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Mul (t1, t2) -> "Mul (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Div (t1, t2) -> "Div (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Mod (t1, t2) -> "Mod (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Rem (t1, t2) -> "Rem (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `And (t1, t2) -> "And (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Or (t1, t2) -> "Or (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Xor (t1, t2) -> "Xor (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Imply (t1, t2) -> "Imply (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Eq (t1, t2) -> "Eq (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Neq (t1, t2) -> "Neq (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Gt (t1, t2) -> "Gt (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Ge (t1, t2) -> "Ge (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Lt (t1, t2) -> "Lt (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Le (t1, t2) -> "Le (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Concat (t1, t2) -> "Concat (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Contain (t1, t2) -> "Contain (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `At (t1, t2) -> "At (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Substring (t1, t2, t3) -> "Substring (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ", " ^ (print_mterm t3) ^ ")"
  | `Select (t1, t2) -> "Select (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Store (t1, t2) -> "Store (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Insert (t1, t2) -> "Insert (" ^ (print_mterm t1) ^ ", " ^ (print_mterm t2) ^ ")"
  | `Not t1 -> "Not (" ^ (print_mterm t1) ^ ")"
  | `Len t1 -> "Len (" ^ (print_mterm t1) ^ ")"
  | `To_int t1 -> "To_int (" ^ (print_mterm t1) ^ ")"
  | `From_int t1 -> "From_int (" ^ (print_mterm t1) ^ ")"
  | `Length t1 -> "Length (" ^ (print_mterm t1) ^ ")"
  | `Abs t1 -> "Abs (" ^ (print_mterm t1) ^ ")"
  | `Head t1 -> "Head (" ^ (print_mterm t1) ^ ")"
  | `Tail t1 -> "Tail (" ^ (print_mterm t1) ^ ")"
  | `First t1 -> "First (" ^ (print_mterm t1) ^ ")"
  | `Second t1 -> "Second (" ^ (print_mterm t1) ^ ")"
  | _ -> raise (SystermErr "print_mterm: Illegal Term")
(* Print an assertion. *)
let rec print_assertion = function
  | `Assertion m -> "`Assertion" ^ print_mterm m
  | `Forall (m, ass) -> "Forall (" ^ (print_mterm m) ^ ") (" ^ (print_assertion ass) ^ ")"
  | `Exists (m, ass) -> "Exist (" ^ (print_mterm m) ^ ") (" ^ (print_assertion ass) ^ ")"
  | `Cons (ass1, ass2) ->  "`Cons (" ^ (print_assertion ass1) ^ ", " ^ (print_assertion ass2) ^ ")"
  | _ -> raise (SystermErr "print_assertion: Illegal Assertion")
(* Print an entrypoint assertion. *)
let rec print_entrypoint_assertion = function
  | `Lead_no (s1, s2) -> "`Lead_no (" ^ s1 ^ " -> " ^ s2 ^ ")"
  | `Lead_co (antry_ass, ass) -> "`Lead_co (" ^ (print_entrypoint_assertion antry_ass) ^ "), (" ^ (print_mterm ass) ^ ")"
  | `NLead_no (s1, s2) -> "`NLead_no (" ^ s1 ^ ", " ^ s2 ^ ")"
  | `Lead_co (antry_ass, ass) -> "`Lead_co (" ^ (print_entrypoint_assertion antry_ass) ^ ") and (" ^ (print_mterm ass) ^ ")"
  | `Cons (antry_ass1, antry_ass2) ->  "`Cons" ^ (print_entrypoint_assertion antry_ass1) ^ ", " ^ (print_entrypoint_assertion antry_ass2) ^ ")"
  | _ -> raise (SystermErr "print_entrypoint_assertion: Illegal Entrypoint_assertion")
(* Print a condition. *)
let print_condition = function
  | `Condition (art1, art2) -> "Pre-condition := " ^ (print_assertion art1) 
    ^ "\nPost-condition := " ^ (print_assertion art2)
  | _ -> raise (SystermErr ("print_condition: Illegal Condition"))
(* Print a requirement. *)
let print_requirement = function
  | `Req art1-> "Requirement := " ^ (print_assertion art1) 
  | _ -> raise (SystermErr ("print_requirement: Illegal Requirement"))
(* Print an input. *)
let print_input = function
  | `Input m -> "Input := " ^ (print_mterm m) 
  | _ -> raise (SystermErr ("print_input: Illegal Input"))
(* Print an output. *)
let print_output = function
  | `Output m-> "Output := " ^ (print_mterm m) 
  | _ -> raise (SystermErr ("print_output: Illegal Output"))
(* Print a parameter. *)
let print_parameter = function
  | `Parameter m -> "Parameter := " ^ (print_mterm m) 
  | _ -> raise (SystermErr ("print_parameter: Illegal Parameter"))
(* Print a storage. *)
let print_storage = function
  | `Storage m -> "Storage := " ^ (print_mterm m) 
  | _ -> raise (SystermErr ("print_storage: Illegal Storage"))
(* Print a check statement. *)
let print_check_statement = function
  | `Check_sta_1 out -> print_output out
  | `Check_sta_2 rq -> print_requirement rq
  | `Check_sta_3 (out, rq) -> print_output out ^ "\n" ^ print_requirement rq
  | `Check_sta_4 (out, cd) -> print_output out ^ "\n" ^ print_condition cd
  | `Check_sta_5 (out, rq, cd) -> print_output out ^ "\n" ^ print_requirement rq ^ "\n" ^ print_condition cd
  | _ -> raise (SystermErr ("print_check_statement: Illegal Check-statement"))
(* Print a code. *)
let print_code = function
  | `Code l -> "Code := {" ^ (print_instr_list (print_instr print_mterm) l) ^ "}"
  | _ -> raise (SystermErr ("print_code: Illegal Code"))
(* Print a body check. *)
let print_body_check = function
  | `Body (cd, input, ck) -> (print_code cd) ^ "\n" ^ (print_input input) ^ "\n" ^ (print_check_statement ck)
  | _ -> raise (SystermErr ("print_body_check: Illegal Body-check"))
(* Print an entrypoint. *)
let print_entrypoint = function
  | `Entrypoint (s, b) -> "Entrypoint %" ^ s ^ "\n" ^ (print_body_check b)
  | _ -> raise (SystermErr ("print_entrypoint: Illegal Entrypoint"))
(* Print a list of entrypoints. *)
let rec print_entrypoint_list = function
  | [] -> " "
  | hd :: tl -> (print_entrypoint hd) ^ "\n" ^ (print_entrypoint_list tl)
(* Print a pentrypoint.  *)
let print_pentrypoint = function
  | `PEntrypoint (s, p) -> "Entrypoint %" ^ s ^ "\n" ^ (print_parameter p)
  | _ -> raise (SystermErr ("print_pentrypoint: Illegal Entrypoint"))
(* Print a list of pentrypoint. *)
let rec print_pentrypoint_list = function
  | [] -> " "
  | hd :: tl -> (print_pentrypoint hd) ^ "\n" ^ (print_pentrypoint_list tl)
(* Print a contract body.  *)
let print_contract_body = function
  | `Entrypoint_list empl -> (print_entrypoint_list empl)
  | `Entrypoint_list_assert (empl, art1) -> (print_entrypoint_list empl) ^ (print_assertion art1)
  | `PEntrypoint_list (cd, stor, entry_list, ass) -> (print_code cd) ^ "\n" ^ (print_storage stor) 
  ^ "\n" ^ (print_pentrypoint_list entry_list) ^ (print_entrypoint_assertion ass)
  | `Body_check b -> print_body_check b
  | _ -> raise (SystermErr ("print_contract_body: Illegal Entrypoint"))
(* Print a contract.  *) 
let print_contract = function
  | `Contract (s, b) -> "Contract " ^ s ^ " With " ^ "\n" ^ (print_contract_body b)
  | _ -> raise (SystermErr ("print_contract: Illegal Contract"))

(** The Printers for the Symbolic Execution **)
(* Print a symbolic type *)
let rec string_of_symbolic_ty = function
  | TUnit -> "TUnit"
  | TNever -> "TNever"
  | TBool -> "TBool"
  | TInt -> "TInt"
  | TNat -> "TNat"
  | TString -> "TString"
  | TChain_id -> "TChain_id"
  | TBytes -> "TBytes"
  | TMutez -> "TMutez"
  | TKey_hash -> "TKey_hash"
  | TKey -> "TKey"
  | TSignature -> "TSignature"
  | TTimestamp -> "TTimestamp" 
  | TAddress -> "TAddress"
  | TTx_rollup_12_address -> "TTx_rollup_12_address"
  | TOption ty -> "TOption " ^ (string_of_symbolic_ty ty)
  | TOr (ty1, ty2) -> "TOr (" ^ (string_of_symbolic_ty ty1) ^ ", " ^ (string_of_symbolic_ty ty2) ^ ")"
  | TPair (ty1, ty2) -> "TPair (" ^ (string_of_symbolic_ty ty1) ^ ", " ^ (string_of_symbolic_ty ty2) ^ ")"
  | TList ty -> "TList " ^ (string_of_symbolic_ty ty)
  | TSet ty -> "TSet " ^ (string_of_symbolic_ty ty)
  | TOperation -> "TOperation"
  | TContract ty -> "TContract " ^ (string_of_symbolic_ty ty)
  | TMap (ty1, ty2) -> "TMap (" ^ (string_of_symbolic_ty ty1) ^ ", " ^ (string_of_symbolic_ty ty2) ^ ")"
  | TBig_map (ty1, ty2) -> "TBig_map (" ^ (string_of_symbolic_ty ty1) ^ ", " ^ (string_of_symbolic_ty ty2) ^ ")"
  | TLambda (ty1, ty2) -> "TLambda (" ^ (string_of_symbolic_ty ty1) ^ ", " ^ (string_of_symbolic_ty ty2) ^ ")"
  | TTicket ty -> "TTicket" ^ (string_of_symbolic_ty ty)
  | TBls12_381_g1 -> "TBls12_381_g1"
  | TBls12_381_g2 -> "TBls12_381_g2"
  | TBls12_381_fr -> "TBls12_381_fr"
  | TSapling_transaction i -> "TSapling_transaction " ^ (string_of_int i)
  | TSapling_state i -> "TSapling_state " ^ (string_of_int i)
  | TChest -> "TChest"
  | TChest_key -> "TChest_key"
  | TError -> "TError"
  | TSelf -> "TSelf"
  | _ -> raise (SystermErr ("string_of_symbolic_ty: Illegal Symbolic Type"))
(* Print a list of symbolic instructions *)
let rec print_symbolic_instr_list f_symbolic_instr = function
  | [] -> ""
  | hd :: [] -> (f_symbolic_instr hd)
  | hd :: tl -> (f_symbolic_instr hd) ^ "; " ^ print_symbolic_instr_list f_symbolic_instr tl
(* Print a symbolic instruction *)
let rec print_symbolic_instr f_mterm = function
  | APPLY -> "APPLY"
  | EXEC -> "EXEC"
  | FAILWITH s -> "FAILWITH '" ^ s ^ "'" 
  | IF (l1, l2) -> "IF {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l2) ^ "}"
  | IF_CONS (l1, l2) -> "IF_CONS {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l2) ^ "}"
  | IF_LEFT (l1, l2) -> "IF_LEFT {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l2) ^ "}"
  | IF_NONE (l1, l2) -> "IF_NONE {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l1) ^ "}" ^ "{" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l2) ^ "}"
  | ITER l -> "ITER {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | LAMBDA (ty1, ty2, l) -> "LAMBDA " ^ (string_of_symbolic_ty ty1) ^ " " ^ (string_of_symbolic_ty ty2) ^ " {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | LAMBDA_REC (ty1, ty2, l)-> "LAMBDA_REC" ^ (string_of_symbolic_ty ty1) ^ " " ^ (string_of_symbolic_ty ty2) ^ " {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | LOOP l-> "LOOP {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | LOOP_LEFT l-> "LOOP_LEFT {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | DIG t -> "DIG " ^ (f_mterm t)
  | DIP l -> "DIP {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | DIP_N (t, l) -> "DIP_N " ^ (f_mterm t) ^ " {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | DROP -> "DROP"
  | DROP_N t -> "DROP_N " ^ f_mterm t
  | DUG t -> "DUG " ^ f_mterm t
  | DUP -> "DUP"
  | DUP_N t -> "DUP_N" ^ f_mterm t
  | PUSH (ty, m) -> "PUSH " ^ (string_of_symbolic_ty ty) ^ (f_mterm m) 
  | SWAP -> "SWAP"
  | ABS -> "ABS"
  | ADD -> "ADD"
  | COMPARE -> "COMPARE"
  | EDIV -> "EDIV"
  | EQ -> "EQ"
  | NEQ -> "NEQ"
  | GE -> "GE"
  | GT -> "GT"
  | INT -> "INT"
  | LE -> "LE"
  | LSL -> "LSL"
  | LSR -> "LSR"
  | LT -> "LT"
  | MUL -> "MUL"
  | NEG -> "NEG"
  | SUB -> "SUB"
  | AND -> "AND"
  | NOT -> "NOT"
  | OR -> "OR"
  | XOR -> "XOR"
  | BLAKE2B -> "BLAKE2B"
  | CHECK_SIGNATURE -> "CHECK_SIGNATURE"
  | HASH_KEY -> "HASH_KEY"
  | KECCAK -> "KECCAK"
  | PAIRING_CHECK -> "PAIRING_CHECK"
  | SHA256 -> "SHA256"
  | SHA3 -> "SHA3"
  | SHA512 -> "SHA512"
  | ADDRESS -> "ADDRESS"
  | AMOUNT -> "AMOUNT"
  | BALANCE -> "BALANCE"
  | CHAIN_ID -> "CHAIN_ID"
  | CONTRACT ty -> "CONTRACT" ^ (string_of_symbolic_ty ty)
  | IMPLICIT_ACCOUNT -> "IMPLICIT_ACCOUNT"
  | LEVEL -> "LEVEL"
  | NOW -> "NOW"
  | SELF -> "SELF"
  | SELF_ADDRESS -> "SELF_ADDRESS"
  | SENDER -> "SENDER"
  | SET_DELEGATE -> "SET_DELEGATE"
  | SOURCE -> "SOURCE"
  | TOTAL_VOTING_POWER -> "TOTAL_VOTING_POWER"
  | TRANSFER_TOKENS -> "TRANSFER_TOKENS"
  | VOTING_POWER -> "VOTING_POWER"
  | CAR -> "CAR"
  | CDR -> "CDR"
  | CONCAT -> "CONCAT"
  | CONS -> "CONS"
  | EMPTY_BIG_MAP (ty1, ty2) -> "EMPTY_BIG_MAP " ^ (string_of_symbolic_ty ty1) ^ " " ^ (string_of_symbolic_ty ty2)
  | EMPTY_MAP (ty1, ty2) -> "EMPTY_MAP " ^ (string_of_symbolic_ty ty1) ^ " " ^ (string_of_symbolic_ty ty2)
  | EMPTY_SET ty  -> "EMPTY_SET " ^ (string_of_symbolic_ty ty)
  | GET -> "GET"
  | GET_N t -> "GET_N" ^ f_mterm t
  | GET_AND_UPDATE -> "GET_AND_UPDATE"
  | LEFT ty -> "LEFT " ^ (string_of_symbolic_ty ty)
  | MAP l -> "MAP {" ^ (print_symbolic_instr_list (print_symbolic_instr f_mterm) l) ^ "}"
  | MEM -> "MEM"
  | NEVER -> "NEVER"
  | NIL ty -> "NIL" ^ (string_of_symbolic_ty ty)
  | NONE ty -> "NONE " ^ (string_of_symbolic_ty ty)
  | PACK -> "PACK"
  | PAIR -> "PAIR"
  | PAIR_N t -> "PAIR_N " ^ f_mterm t
  | RIGHT ty -> "RIGHT " ^ (string_of_symbolic_ty ty)
  | SIZE -> "SIZE"
  | SLICE -> "SLICE"
  | SOME -> "SOME"
  | UNIT -> "UNIT"
  | UNPACK ty -> "UNPACK " ^ (string_of_symbolic_ty ty)
  | UNPAIR -> "UNPAIR"
  | UNPAIR_N t -> "UNPAIR_N" ^ f_mterm t
  | UPDATE -> "UPDATE"
  | UPDATE_N t -> "UPDATE_N" ^ f_mterm t
  | JOINT_TICKETS -> "JOINT_TICKETS"
  | READ_TICKETS -> "READ_TICKETS"
  | SPLIT_TICKET -> "SPLIT_TICKET"
  | TICKET -> "TICKET"
  | _ -> raise (SystermErr ("print_symbolic_instr: Illegal Instruction"))
(* Print a list of symbolic terms *)
let rec print_symbolic_term_list f_term = function
| [] -> " "
| hd :: [] -> (f_term hd)
| hd :: tl -> (f_term hd) ^ "; " ^ print_symbolic_term_list f_term tl
(* Print a symbolic term *)
let rec print_symbolic_term = function
  | SVar (s, n, ty) -> "SVar (" ^ s ^ ", " ^ (string_of_int n) ^ ", " ^ (string_of_symbolic_ty ty) ^ ")"
  | SInt i -> "SInt " ^ string_of_int i
  | SNat n -> "SNat " ^ string_of_int n
  | SBool b -> "SBool " ^ string_of_bool b
  | SBytes b -> "SBytes " ^  Bytes.to_string b
  | SString s -> "SString " ^  s
  | SMutez m -> "SMutez " ^ string_of_int m
  | STimestamp t -> "STimestamp " ^ string_of_int t
  | SKey k -> "SKey " ^  k
  | SKey_Hash kh -> "SKey_hash " ^  kh
  | SAddress addr -> "SAddress " ^  addr
  | SSignature sign -> "SSignature " ^  sign
  | SChain_id -> "SChain_id"
  | SUnit -> "SUnit"
  | SNever -> "SNever"
  | SAmount -> "SAmount"
  | SBalance -> "SBalance"
  | SChain_id -> "SChain_id"
  | SLevel -> "SLevel"
  | SMin_block_time -> "SMin_block_time"
  | SNow -> "SNow"
  | SSender -> "SSender"
  | SSelf -> "SSelf"
  | SSelf_address -> "SSelf_address"
  | SSource -> "SSource"
  | STotal_voting -> "STotal_voting"
  | SNone ty -> "SNone " ^ (string_of_symbolic_ty ty)
  | SSome t -> "SSome " ^ (print_symbolic_term t)
  | SLeft t -> "SLeft " ^ (print_symbolic_term t) 
  | SRight t -> "SRight " ^ (print_symbolic_term t) 
  | SPair (t1, t2) -> "SPair (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^")"
  | SElt (t1, t2) -> "SElt (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SContract (ty, t) -> "SContract (" ^ (string_of_symbolic_ty ty) ^ ", " ^ (print_symbolic_term t) ^ ")"
  | SMap l -> "SMap {" ^ (print_symbolic_term_list print_symbolic_term l) ^ "}"
  | SBig_Map l -> "SBig_Map {" ^ (print_symbolic_term_list print_symbolic_term l) ^ "}"
  | SSet l -> "SSet {" ^ (print_symbolic_term_list print_symbolic_term l) ^ "}"
  | SList l -> "SList [" ^ (print_symbolic_term_list print_symbolic_term l) ^ "] "
  | SInstr l -> "SSInstr [" ^ (print_symbolic_instr_list (print_symbolic_instr print_symbolic_term) l) ^ "]"
  | SCons (t1, t2) -> "SCons (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SEmpty ty -> "SEmpty " ^ (string_of_symbolic_ty ty)
  | SAdd (t1, t2) -> "SAdd (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SSub (t1, t2) -> "SSub (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SMul (t1, t2) -> "SMul (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SDiv (t1, t2) -> "SDiv (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SMod (t1, t2) -> "SMod (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SRem (t1, t2) -> "SRem (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SAbs t -> "SAbs (" ^ (print_symbolic_term t) ^ ")"
  | SAnd (t1, t2) -> "SAnd (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SOr (t1, t2) -> "SOr (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SXor (t1, t2) -> "SXor (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SNot t1 -> "SNot (" ^ (print_symbolic_term t1) ^ ")"
  | SImply (t1, t2) -> "SImply (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SEq (t1, t2) -> "SEq (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SNeg t -> "SNeg (" ^ (print_symbolic_term t) ^ ")"
  | SGt (t1, t2) -> "SGt (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SGe (t1, t2) -> "SGe (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SLt (t1, t2) -> "SLt (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SLe (t1, t2) -> "SLe (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFconcat_string (t1, t2) -> "SSFconcat_string (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFconcat_bytes (t1, t2) -> "SSFconcat_bytes (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SAt (t1, t2) -> "SAt (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFsubstring (t1, t2, t3) -> "SSFsubstring (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SFsubbytes (t1, t2, t3) -> "SSFsubbytes (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SSelect (t1, t2) -> "SSelect (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SStore (t1, t2) -> "SStore (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SInsert (t1, t2) -> "SInsert (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFlen_string t1 -> "SSFlen_string (" ^ (print_symbolic_term t1) ^ ")"
  | SFlen_bytes t1 -> "SSFlen_bytes (" ^ (print_symbolic_term t1) ^ ")"
  | SFlen_list t1 -> "SSFlen_list (" ^ (print_symbolic_term t1) ^ ")"
  | SFlen_set t1 -> "SSFlen_set (" ^ (print_symbolic_term t1) ^ ")"
  | SFlen_map t1 -> "SSFlen_map (" ^ (print_symbolic_term t1) ^ ")"
  | STo_int t1 -> "STo_int (" ^ (print_symbolic_term t1) ^ ")"
  | SFrom_int t1 -> "SFrom_int (" ^ (print_symbolic_term t1) ^ ")"
  | SLength t1 -> "SLength (" ^ (print_symbolic_term t1) ^ ")"
  | SHead t1 -> "SHead (" ^ (print_symbolic_term t1) ^ ")"
  | STail t1 -> "STail (" ^ (print_symbolic_term t1) ^ ")"
  | SFirst t1 -> "SFirst (" ^ (print_symbolic_term t1) ^ ")"
  | SSecond t1 -> "SSecond (" ^ (print_symbolic_term t1) ^ ")"
  | SFcheck_signature (t1, t2, t3) -> "SCheck_Sig (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SEdiv (t1, t2) -> "SEdiv (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFhash_key t -> "SHash_Key " ^ (print_symbolic_term t)
  | SFhash_keccak t -> "SSFhash_keccak " ^ (print_symbolic_term t)
  | SLsl (t1, t2) -> "SLsl (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SLsr (t1, t2) -> "SLsr (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFpack t -> "SPack " ^ (print_symbolic_term t)
  | SSet_Delegate t -> "SSet_Delegate " ^ (print_symbolic_term t)
  | SFsha256 t -> "SSha256 " ^ (print_symbolic_term t)
  | SFsha3 t -> "SSha3 " ^ (print_symbolic_term t)
  | SFsha521 t -> "SSha521 " ^ (print_symbolic_term t)
  | SSlice (t1, t2, t3) -> "SSlice (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | STransfer_Token (t1, t2, t3) -> "STransfer_Token (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SFunpack t -> "SSFunpack (" ^ (print_symbolic_term t) ^ ")"
  | SFailwith s -> "SFailwith " ^ s
  | SGet_contract (ty, t) -> "SGet_contract (" ^ (string_of_symbolic_ty ty) ^ ", " ^ (print_symbolic_term t) ^ ")"
  | SFunc (t1, t2, t3) -> "SFunc (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SFuncl (t1, t2, l) -> "SFuncl (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFold (t1, t2, t3) -> "SFold (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ", " ^ (print_symbolic_term t3) ^ ")"
  | SFoldf (t1, t2, l) -> "SFoldf (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | SFuncLoop (l1, t, l2) -> "SFuncLoop (" ^ (print_symbolic_term_list print_symbolic_term l1) ^ ", " ^ (print_symbolic_term t) ^ ", " ^ (print_symbolic_term_list print_symbolic_term l2) ^ ")"
  | SFuncLoopCondi (l1, l2, l3) -> "SFuncLoopCondi ("  ^ (print_symbolic_term_list print_symbolic_term l1) ^ ", " ^ (print_symbolic_term_list print_symbolic_term l2) ^ ", " ^ (print_symbolic_term_list print_symbolic_term l3) ^ ")"
  | SUnsat l -> "SUnsat [" ^ (print_symbolic_term_list print_symbolic_term l) ^ "] "
  | SSat_true l -> "SSat_true [" ^ (print_symbolic_term_list print_symbolic_term l) ^ "] "
  | SSat_false l -> "SSat_false [" ^ (print_symbolic_term_list print_symbolic_term l) ^ "] "
  | SFuncMap (t, l) -> "SFuncMap " ^ (print_symbolic_term t)
  | SFmap (t1, t2) -> "SFmap (" ^ (print_symbolic_term t1) ^ ", " ^ (print_symbolic_term t2) ^ ")"
  | _ -> raise (SystermErr "print_symbolic_term: Illegal Symbolic Term")
(* Print a stack *)
let rec print_symbolic_stack_element_list f_stack_element = function
  | [] -> ""
  | hd :: [] -> (f_stack_element hd)
  | hd :: tl -> (f_stack_element hd) ^ "; " ^ (print_symbolic_stack_element_list f_stack_element tl)
(* Print an element of a symbolic stack *)
let print_symbolic_stack_element = function
  | {eterm = t; etype = ty} -> "{eterm = " ^ (print_symbolic_term t) ^ "; etype = " ^ (string_of_symbolic_ty ty) ^ "}"
  | _ -> raise (SystermErr "print_stack_element: Illegal Symbolic Stack Element")
(* Print a list of symbolic system states *)
let rec print_symbolic_system_state_list f_system_state = function
  | [] -> ""
  | hd :: [] -> (f_system_state hd)
  | hd :: tl -> (f_system_state hd) ^ "; " ^ (print_symbolic_system_state_list f_system_state tl)
(* Print a symbolic system state *)
let print_symbolic_system_state = function
  | {einstr = ins; estack = s; epredicate = pred; ecounter = n; eloop = n1} -> 
    "{einstr = {" ^ (print_symbolic_instr_list (print_symbolic_instr print_symbolic_term) ins) 
    ^ "}; \nestack = [" ^ (print_symbolic_stack_element_list print_symbolic_stack_element s) 
    ^ "]; \nepredicate = [" ^ (print_symbolic_term_list print_symbolic_term pred) ^ "]; \necounter = " 
    ^ (string_of_int n) ^  "; \neloop = " 
    ^ (string_of_int n1) ^ "}\n"
  | _ -> raise (SystermErr "print_symbolic_system_state: Illegal Symbolic System State") 
(* Print a result of a symbolic execution *)
let print_symbolic_execution = (print_symbolic_system_state_list print_symbolic_system_state)
(* Print requirement. *)
let print_requirement = print_symbolic_term_list print_symbolic_term

(** SOME TESTS **)
let () = print_endline "Hello, Some tests are being conducted!"

let contract_1 = "MContract 'Add' With 
Code := {UNPAIR; DUP; GE; IF {ADD} {PUSH string 'Fail'; FAILWITH}}
Input-stack := Pair (x : int) (y : int)
Output-stack := (z : int)
Requirement := (x >= 0)
Pre-condition := (x >= 3) | (y > 5)
Post-condition :=  (z >= 8)"

let () = Printf.printf "\nSymbolic Execution_1 : %s\n" (print_symbolic_execution (run_symbolic_execution contract_1))
let () = Printf.printf "Check_Output_1 : %b\n" (check_output contract_1)
let () = Printf.printf "Check_Requirement_1 : %b\n" (check_requirement contract_1)
let () = Printf.printf "Generate_Requirement_1  : %s\n" (print_requirement (generate_requirement contract_1))
let () = Printf.printf "Check_Pass_1 : %b\n" (check_pass contract_1)
let () = Printf.printf "user requirement  : %s\n" (print_requirement (get_user_requirement contract_1))

let contract_2 = "MContract 'Add' With 
Code := {UNPAIR; ADD}
Input-stack := Pair (x : int) (y : int)
Output-stack := (z : int)"
let () = Printf.printf "\nSymbolic Execution_2 : %s\n" (print_symbolic_execution (run_symbolic_execution contract_2))
let () = Printf.printf "Check_Output_2 : %b\n" (check_output contract_2)
let () = Printf.printf "Generate_Requirement_2  : %s\n" (print_requirement (generate_requirement contract_2))
let () = Printf.printf "Check_Pass_2 : %b\n" (check_pass contract_2)
(*let () = Printf.printf "user requirement  : %s\n" (print_requirement (get_user_requirement contract_2))*)

let contract_auction = "MContract 'Auction' With 
Code := {CDR; DUP; CAR; IF {} {PUSH string 'already closed'; FAILWITH};
CDR; UNPAIR; SWAP; CONTRACT unit; IF_NONE {PUSH string 'bad high bidder address'; FAILWITH} {}; AMOUNT; BALANCE;
SUB; IF_NONE {PUSH string 'insufficient fund'; FAILWITH} {}; PUSH unit Unit; TRANSFER_TOKENS; NIL operation; SWAP; CONS;
DIP {SENDER; SWAP; PAIR; PUSH bool true; PAIR}; PAIR}
Input-stack := Pair Unit (Pair (b : bool) (Pair ('Address1': address) ('Address2': address)))
Output-stack := (Pair true (Pair (x: address) (y: address)))
Requirement := (b = true) | ((Balance - Amount) >= 0)
"
let () = Printf.printf "\nSymbolic Execution_Auction : %s\n" (print_symbolic_execution (run_symbolic_execution contract_auction))
let () = Printf.printf "Check_Output_Auction : %b\n" (check_output contract_auction)
let () = Printf.printf "Generate_Requirement_Auction  : %s\n" (print_requirement (generate_requirement contract_auction))
let () = Printf.printf "Check_Requirement_Auction : %b\n" (check_requirement contract_auction)
let () = Printf.printf "Check_Pass_Auction : %b\n" (check_pass contract_auction)
let () = Printf.printf "user requirement  : %s\n" (print_requirement (get_user_requirement contract_auction))
let x = generate_requirement contract_auction
let y = get_user_requirement contract_auction
let test = compare_requirement_list y x
let () = Printf.printf "check test : %b\n" test

(*let c = parse_contract contract_auction
let () = Printf.printf "contract  : %s\n" (print_contract c)*)
(*let () = Printf.printf "Generate_Requirement_Auction  : %s\n" (print_requirement (generate_requirement contract_1))
let () = Printf.printf "Check_Pass_Auction : %b\n" (check_pass contract_1)*)

(*Code := {CDR; DUP; CAR; IF {} {PUSH string 'already closed'; FAILWITH};
CDR; UNPAIR; SWAP; CONTRACT unit; IF_NONE {PUSH string 'bad high bidder address'; FAILWITH} {};
AMOUNT; BALANCE; SUB; PUSH unit Unit; TRANSFER_TOKENS; 
NIL operation; SWAP; CONS;
DIP {SENDER; SWAP; PAIR; PUSH bool true; PAIR}; PAIR}*)

(*Code := {CDR; DUP; CAR; IF {} {PUSH string 'already closed'; FAILWITH};
CDR; UNPAIR; SWAP; CONTRACT unit; IF_NONE {PUSH string 'bad high bidder address'; FAILWITH} {}; AMOUNT; BALANCE;
DUP; DIP 2 {DUP}; DIP 1 {SWAP}; COMPARE; GT; IF {} {PUSH string 'insufficient fund'; FAILWITH}; 
SUB; PUSH unit Unit; TRANSFER_TOKENS; NIL operation; SWAP; CONS;
DIP {SENDER; SWAP; PAIR; PUSH bool true; PAIR}; PAIR}
Input-stack := Pair Unit (Pair true (Pair ('Address1': address) ('Address2': address)))
Output-stack := (Pair true (Pair (x: address) (y: address)))*)

(*let x = get_convert_output_program_selt contract_auction

let () = Printf.printf "\nOutput Stack : %s\n" (print_symbolic_stack_element x)

let y = get_output_symbolic_term_list_of_program contract_auction
let () = Printf.printf "\nOutput Stack User : %s\n" (print_symbolic_stack_element_list print_symbolic_stack_element y)


(*(Balance - Amount >= 0)*)


let t = check_output_pass ({eterm = SPair (SBool true, SPair (SVar ("x", 0, TAddress), SVar ("y", 0, TAddress))); 
etype = TPair (TBool, TPair (TAddress, TAddress))}) 
([{eterm = SPair (SBool true, SPair (SAddress "Address1", SSender)); 
etype = TPair (TBool, TPair (TAddress, TAddress))}; 
{eterm = SFailwith "insufficient fund"; etype = TError}; 
{eterm = SFailwith "bad high bidder address"; etype = TError}])
let () = Printf.printf "\n Check : %b\n" (t) 

let t1 = matching_symbolic_term {eterm = SPair (SBool true, SPair (SVar ("x", 0, TAddress), SVar ("y", 0, TAddress))); 
etype = TPair (TBool, TPair (TAddress, TAddress))} {eterm = SPair (SBool true, SPair (SAddress "Address1", SSender)); 
etype = TPair (TBool, TPair (TAddress, TAddress))}
let () = Printf.printf "\n Check : %b\n" (t1) *)
(*DUP; DIP 2 {DUP}; DIP 1 {SWAP}; COMPARE; GT; IF {} {PUSH string 'insufficient fund'; FAILWITH}; *)