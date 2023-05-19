open Ast
open Symbolic_execution

(** Defining Exceptions **)
exception SystermErr of string

(** Defining External Types for the Static Checker **)
(* Assertion type *)
type assertion = 
  | Assertion of term
  | Forall of term * assertion
  | Exists of  term * assertion
  | Cons of assertion * assertion

(** Parsing a Contract in the DSL **)
let parse_contract (s : string) : contract =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

(** Converting The DSL To The Symbolic (Types, Terms, Instructions) **)
(* Converting types *)
let rec convert_types = function
  | `Unit -> TUnit
  | `Never -> TNever
  | `Bool -> TBool
  | `Int -> TInt
  | `Nat -> TNat
  | `String -> TString
  | `Chain_id -> TChain_id
  | `Bytes -> TBytes
  | `Mutez -> TMutez
  | `Key_hash -> TKey_hash
  | `Key -> TKey
  | `Signature -> TSignature
  | `Timestamp -> TTimestamp
  | `Address -> TAddress
  | `Tx_rollup_12_address -> TTx_rollup_12_address
  | `Option ty  -> TOption (convert_types ty)
  | `Or (ty1, ty2)  -> TOr (convert_types ty1, convert_types ty2)
  | `Pair (ty1, ty2) -> TPair (convert_types ty1, convert_types ty2)
  | `List ty -> TList (convert_types ty)
  | `Set ty -> TSet (convert_types ty)
  | `Operation -> TOperation
  | `Contract ty -> TContract (convert_types ty)
  | `Map (ty1, ty2) -> TMap (convert_types ty1, convert_types ty2)
  | `Big_map (ty1, ty2) -> TBig_map (convert_types ty1, convert_types ty2)
  | `Lambda (ty1, ty2) -> TLambda (convert_types ty1, convert_types ty2)
  | `Ticket ty -> TTicket (convert_types ty)
  | `Bls12_381_g1 -> TBls12_381_g1
  | `Bls12_381_g2 -> TBls12_381_g2
  | `Bls12_381_fr -> TBls12_381_fr
  | `Sapling_transaction i -> TSapling_transaction i
  | `Sapling_state i -> TSapling_state i
  | `Chest -> TChest
  | `Chest_key -> TChest_key
(* Converting a list of instructions *)
let rec convert_instr_list f = function
  | [] -> []
  | hd :: tl -> (f hd) :: (convert_instr_list f tl)
(* Converting instructions *)
let rec convert_instr f = function
  | `APPLY -> APPLY
  | `EXEC -> EXEC
  | `FAILWITH s -> FAILWITH s
  | `IF (l1, l2) -> IF (convert_instr_list (convert_instr f) l1, convert_instr_list (convert_instr f) l2)
  | `IF_CONS (l1, l2) -> IF_CONS (convert_instr_list (convert_instr f) l1, convert_instr_list (convert_instr f) l2)
  | `IF_LEFT (l1, l2) -> IF_LEFT (convert_instr_list (convert_instr f) l1, convert_instr_list (convert_instr f) l2)
  | `IF_NONE (l1, l2) -> IF_NONE (convert_instr_list (convert_instr f) l1, convert_instr_list (convert_instr f) l2)
  | `ITER l1 -> ITER (convert_instr_list (convert_instr f) l1)
  | `LAMBDA (ty1, ty2, l) -> LAMBDA (convert_types ty1, convert_types ty2, convert_instr_list (convert_instr f) l)
  | `LAMBDA_REC (ty1, ty2, l)-> LAMBDA_REC (convert_types ty1, convert_types ty2, convert_instr_list (convert_instr f) l)
  | `LOOP l1-> LOOP (convert_instr_list (convert_instr f) l1)
  | `LOOP_LEFT l1-> LOOP_LEFT (convert_instr_list (convert_instr f) l1)
  | `DIG i -> DIG (SNat i)
  | `DIP l -> DIP (convert_instr_list (convert_instr f) l)
  | `DIP_N (i, l) -> DIP_N ((SNat i), convert_instr_list (convert_instr f) l)
  | `DROP -> DROP
  | `DROP_N i -> DROP_N (SNat i)
  | `DUG i -> DUG (SNat i)
  | `DUP -> DUP
  | `DUP_N i -> DUP_N (SNat i)
  | `PUSH (ty, m) -> PUSH (convert_types ty, f m)
  | `SWAP -> SWAP
  | `ABS -> ABS
  | `ADD -> ADD
  | `COMPARE -> COMPARE
  | `EDIV -> EDIV
  | `EQ -> EQ
  | `NEQ -> NEQ
  | `GE -> GE
  | `GT -> GT
  | `INT -> INT
  | `LE -> LE
  | `LSL -> LSL
  | `LSR -> LSR
  | `LT -> LT
  | `MUL -> MUL
  | `NEG -> NEG
  | `SUB -> SUB
  | `AND -> AND
  | `NOT -> NOT
  | `OR -> OR
  | `XOR -> XOR
  | `BLAKE2B -> BLAKE2B
  | `CHECK_SIGNATURE -> CHECK_SIGNATURE
  | `HASH_KEY -> HASH_KEY
  | `KECCAK -> KECCAK
  | `PAIRING_CHECK -> PAIRING_CHECK
  | `SHA256 -> SHA256
  | `SHA3 -> SHA3
  | `SHA512 -> SHA512
  | `ADDRESS -> ADDRESS
  | `AMOUNT -> AMOUNT
  | `BALANCE -> BALANCE
  | `CHAIN_ID -> CHAIN_ID
  | `CONTRACT ty -> CONTRACT (convert_types ty)
  | `IMPLICIT_ACCOUNT -> IMPLICIT_ACCOUNT
  | `LEVEL -> LEVEL
  | `NOW -> NOW
  | `SELF -> SELF
  | `SELF_ADDRESS -> SELF_ADDRESS
  | `SENDER -> SENDER
  | `SET_DELEGATE -> SET_DELEGATE
  | `SOURCE -> SOURCE
  | `TOTAL_VOTING_POWER -> TOTAL_VOTING_POWER
  | `TRANSFER_TOKENS -> TRANSFER_TOKENS
  | `VOTING_POWER -> VOTING_POWER
  | `CAR -> CAR
  | `CDR -> CDR
  | `CONCAT -> CONCAT
  | `CONS -> CONS
  | `EMPTY_BIG_MAP (ty1, ty2) -> EMPTY_BIG_MAP (convert_types ty1, convert_types ty2)
  | `EMPTY_MAP (ty1, ty2) -> EMPTY_MAP (convert_types ty1, convert_types ty2)
  | `EMPTY_SET ty  -> EMPTY_SET (convert_types ty)
  | `GET -> GET
  | `GET_N i -> GET_N (SNat i)
  | `GET_AND_UPDATE -> GET_AND_UPDATE
  | `LEFT ty -> LEFT (convert_types ty)
  | `MAP l1 -> MAP (convert_instr_list (convert_instr f) l1)
  | `MEM -> MEM
  | `NEVER -> NEVER
  | `NIL ty -> NIL (convert_types ty)
  | `NONE ty -> NONE (convert_types ty)
  | `PACK -> PACK
  | `PAIR -> PAIR
  | `PAIR_N i -> PAIR_N (SNat i)
  | `RIGHT ty -> RIGHT (convert_types ty)
  | `SIZE -> SIZE
  | `SLICE -> SLICE
  | `SOME -> SOME
  | `UNIT -> UNIT
  | `UNPACK ty -> UNPACK (convert_types ty)
  | `UNPAIR -> UNPAIR
  | `UNPAIR_N i -> UNPAIR_N (SNat i)
  | `UPDATE -> UPDATE
  | `UPDATE_N i -> UPDATE_N (SNat i)
  | `JOINT_TICKETS -> JOINT_TICKETS
  | `READ_TICKETS -> READ_TICKETS
  | `SPLIT_TICKET -> SPLIT_TICKET
  | `TICKET -> TICKET
  | _ -> raise (SystermErr ("Illegal Instruction"))
(* Converting a list of terms *)
let rec convert_term_list f = function
  | [] -> []
  | hd :: tl -> (f hd) :: (convert_term_list f tl)
(* Converting terms *)
let rec convert_term = function
  | `Int i -> SInt i
  | `Nat n -> SNat n
  | `Bool b -> SBool b
  | `Bytes b -> SBytes (Bytes.of_string b)
  | `String s -> SString s
  | `Mutez m -> SMutez m
  | `Timestamp t -> STimestamp t
  | `Key k -> SKey k
  | `Key_hash kh -> SKey_Hash kh
  | `Address addr -> SAddress addr
  | `Signature sign -> SSignature sign
  | `Chain_id cid -> SChain_Id  cid
  | `Unit -> SUnit
  | `Never -> SNever
  | `Amount -> SAmount
  | `Balance -> SBalance
  | `CChain_id -> SChain_id
  | `Level -> SLevel
  | `Now -> SNow
  | `Sender -> SSender
  | `Self ty -> SSelf
  | `Self_address -> SSelf_address
  | `Source -> SSource
  | `Total_voting -> STotal_voting
  | `None ty -> SNone (convert_types ty)
  | `Some (t, ty) -> SSome (convert_term t)
  | `Var (x, ty) -> SVar (x, 0, convert_types ty)
  | `Elt (t1, t2) -> SElt (convert_term t1, convert_term t2)
  | `Left (t, ty) -> SLeft (convert_term t)
  | `Right (t, ty) -> SRight (convert_term t)
  | `Pair (t1, t2) -> SPair (convert_term t1, convert_term t2)
  | `Contract (ty, s) -> SContract (convert_types ty, SString s)
  | `Map (l, ty1, ty2) -> SMap (convert_term_list convert_term l)
  | `Set (l, ty) -> SSet (convert_term_list convert_term l)
  | `List (l, ty) -> SList (convert_term_list convert_term l)
  | `Instr l -> SInstr (convert_instr_list (convert_instr convert_term ) l)
  | `Add (t1, t2) -> SAdd (convert_term t1, convert_term t2)
  | `Sub (t1, t2) -> SSub (convert_term t1, convert_term t2)
  | `Mul (t1, t2) -> SMul (convert_term t1, convert_term t2)
  | `Div (t1, t2) -> SDiv (convert_term t1, convert_term t2)
  | `Mod (t1, t2) -> SMod (convert_term t1, convert_term t2)
  | `Rem (t1, t2) -> SRem (convert_term t1, convert_term t2)
  | `And (t1, t2) -> SAnd (convert_term t1, convert_term t2)
  | `Or (t1, t2) -> SOr (convert_term t1, convert_term t2)
  | `Xor (t1, t2) -> SXor (convert_term t1, convert_term t2)
  | `Imply (t1, t2) -> SImply (convert_term t1, convert_term t2)
  | `Eq (t1, t2) -> SEq (convert_term t1, convert_term t2)
  | `Neq (t1, t2) -> SNot (SEq (convert_term t1, convert_term t2))
  | `Gt (t1, t2) -> SGt (convert_term t1, convert_term t2)
  | `Ge (t1, t2) -> SGe (convert_term t1, convert_term t2)
  | `Lt (t1, t2) -> SLt (convert_term t1, convert_term t2)
  | `Le (t1, t2) -> SLe (convert_term t1, convert_term t2)
  | `Concat (t1, t2) -> SCons (convert_term t1, convert_term t2)
  | `Contain (t1, t2) -> SContain (convert_term t1, convert_term t2)
  | `At (t1, t2) -> SAt (convert_term t1, convert_term t2)
  | `Substring (t1, t2, t3) -> SFsubstring (convert_term t1, convert_term t2, convert_term t3)
  | `Select (t1, t2) -> SSelect (convert_term t1, convert_term t2)
  | `Store (t1, t2) -> SStore (convert_term t1, convert_term t2)
  | `Insert (t1, t2) -> SInsert (convert_term t1, convert_term t2)
  | `Not t1 -> SNot (convert_term t1)
  | `Len t1 -> SFlen_string (convert_term t1)
  | `To_int t1 -> STo_int (convert_term t1)
  | `From_int t1 -> SFrom_int (convert_term t1)
  | `Length t1 -> SLength (convert_term t1)
  | `Abs t1 -> SAbs (convert_term t1)
  | `Head t1 -> SHead (convert_term t1)
  | `Tail t1 -> STail (convert_term t1)
  | `First t1 -> SFirst (convert_term t1)
  | `Second t1 -> SSecond (convert_term t1)
  | _ -> raise (SystermErr ("Illegal Term"))
(* Converting the code *)
let convert_code code = convert_instr_list (convert_instr convert_term) code
(* Converting assertions *)
let rec convert_assertion = function
  | `Assertion m  -> Assertion (convert_term m)
  | `Forall (m, ass) -> Forall (convert_term m, convert_assertion ass)
  | `Exists (m, ass) -> Exists (convert_term m, convert_assertion ass)
  | `Cons (ass1, ass2) -> Cons (convert_assertion ass1, convert_assertion ass2)
  | _ -> raise (SystermErr ("Illegal Assertion"))
(* Combining two data types after performing the [add] operation. *)
let combine_type_add ty1 ty2 =
  match (ty1, ty2)  with
    | (TNat, TNat) -> TNat
    | (TMutez, TMutez) -> TMutez
    | (TTimestamp, TTimestamp) -> TTimestamp
    | (TBls12_381_fr, TBls12_381_fr) -> TBls12_381_fr
    | (TBls12_381_g1, TBls12_381_g1) -> TBls12_381_g1
    | (TBls12_381_g2, TBls12_381_g2) -> TBls12_381_g2
    | _ -> TInt
(* Combining two data types after performing the [sub] operation. *)
let combine_type_sub ty1 ty2 =
  match (ty1, ty2)  with
    | (TMutez, TMutez) -> TOption (TMutez)
    | (TTimestamp, TInt) -> TTimestamp
    | (TTimestamp, TTimestamp) -> TInt
    | _ -> TInt
(* Combining two data types after performing the [mul] operation. *)
let combine_type_mul ty1 ty2 =
  match (ty1, ty2)  with
    | (TNat, TNat) -> TNat
    | (TMutez, TNat) -> TMutez
    | (TNat, TMutez) -> TMutez
    | (TTimestamp, TTimestamp) -> TTimestamp
    | (TBls12_381_g1, TBls12_381_fr) -> TBls12_381_g1
    | (TBls12_381_g2, TBls12_381_fr) -> TBls12_381_g2
    | (TBls12_381_fr, TBls12_381_fr) -> TBls12_381_fr
    | (TNat, TBls12_381_fr) -> TBls12_381_fr
    | (TInt, TBls12_381_fr) -> TBls12_381_fr
    | (TBls12_381_fr, TNat) -> TBls12_381_fr
    | (TBls12_381_fr, TInt) -> TBls12_381_fr
    | _ -> TInt
(* Combining two data types after performing the [div] operation. *)
let combine_type_div ty1 ty2 =
  match (ty1, ty2)  with
    | (TNat, TNat) -> TOption (TPair (TNat, TNat))
    | (TNat, TInt) -> TOption (TPair (TNat, TInt))
    | (TInt, TNat) -> TOption (TPair (TInt, TNat))
    | (TInt, TInt) -> TOption (TPair (TInt, TInt)) 
    | (TMutez, TNever) -> TOption (TPair (TInt, TInt))     
    | (TMutez, TMutez) -> TOption (TPair (TInt, TInt))   
    | __ -> raise (SystermErr ("Illegal Type For DIV"))
(* Getting the type of a list*)
let get_head_type = function
  | TList ty -> ty
  | _ -> raise (SystermErr ("Illegal List Type"))
(* Getting the first type of a pair *)
let get_first_ty = function
  | TPair (ty1, ty2) -> ty1
  | _ -> raise (SystermErr ("Illegal Pair Type"))
(* Getting the second type of a pair *)
let get_second_ty = function
  | TPair (ty1, ty2) -> ty2
  | _ -> raise (SystermErr ("Illegal Pair Type"))
(* Getting the type of a DSL term *)
let rec get_term_type = function
  | `Int i -> TInt
  | `Nat n -> TNat
  | `Bool b -> TBool
  | `Bytes b -> TBytes
  | `String s -> TString
  | `Mutez m -> TMutez
  | `Timestamp t -> TTimestamp
  | `Key k -> TKey
  | `Key_hash kh -> TKey_hash
  | `Address addr -> TAddress
  | `Signature sign -> TSignature
  | `Chain_id cid -> TChain_id
  | `Unit -> TUnit
  | `Never -> TNever
  | `Amount -> TMutez
  | `Balance -> TMutez
  | `CChain_id -> TChain_id
  | `Level -> TNat
  | `Now -> TTimestamp
  | `Sender -> TAddress
  | `Self ty -> TContract (convert_types ty)
  | `Self_address -> TAddress
  | `Source -> TAddress
  | `Total_voting -> TNat
  | `None ty -> TOption (convert_types ty)
  | `Some (t, ty) -> TOption (convert_types ty)
  | `Var (x, ty) -> convert_types ty
  | `Left (t, ty) -> TOr (get_term_type t, convert_types ty)
  | `Right (t, ty) -> TOr (convert_types ty, get_term_type t)
  | `Pair (t1, t2) -> TPair (get_term_type t1, get_term_type t2)
  | `Contract (ty, s) -> TContract (convert_types ty)
  | `Map (l, ty1, ty2) -> TMap (convert_types ty1, convert_types ty2)
  | `Set (l, ty) -> TSet (convert_types ty)
  | `List (l, ty) -> TList (convert_types ty)
  | `Add (t1, t2) -> combine_type_add (get_term_type t1) (get_term_type t2)
  | `Sub (t1, t2) -> combine_type_sub (get_term_type t1) (get_term_type t2)
  | `Mul (t1, t2) -> combine_type_mul (get_term_type t1) (get_term_type t2)
  | `Div (t1, t2) -> combine_type_div (get_term_type t1) (get_term_type t2)
  | `Mod (t1, t2) -> TNat
  | `Rem (t1, t2) -> TNat
  | `And (t1, t2) -> TBool
  | `Or (t1, t2) -> TBool
  | `Xor (t1, t2) -> TBool
  | `Imply (t1, t2) -> TBool
  | `Eq (t1, t2) -> TBool
  | `Neq (t1, t2) -> TBool
  | `Gt (t1, t2) -> TBool
  | `Ge (t1, t2) -> TBool
  | `Lt (t1, t2) -> TBool
  | `Le (t1, t2) -> TBool
  | `Concat (t1, t2) -> TString
  | `Contain (t1, t2) -> TBool
  | `At (t1, t2) -> TString
  | `Substring (t1, t2, t3) -> TString
  | `Select (t1, t2) -> get_term_type t1
  | `Store (t1, t2) -> get_term_type t2
  | `Insert (t1, t2) -> get_term_type t2
  | `Not t1 -> TBool
  | `Len t1 -> TNat
  | `To_int t1 -> TInt
  | `From_int t1 -> TString
  | `Length t1 -> TNat
  | `Abs t1 -> TNat
  | `Head t1 -> get_head_type (get_term_type t1)
  | `Tail t1 -> get_term_type t1
  | `First t1 -> get_first_ty (get_term_type t1)
  | `Second t1 -> get_second_ty(get_term_type t1)
  | _ -> raise (SystermErr ("Illegal Term"))
(* Getting the list of variables that belong to a specified list of terms. *)
let rec get_variable_list_of_list f = function
  | hd :: tl -> (f hd) @  (get_variable_list_of_list f tl)
  | [] -> []
(* Getting the list of variables belonging to a specified term, including Input and Output terms. *)
let rec get_variable_list = function
  | `Int _
  | `Nat _ 
  | `Bool _ 
  | `Bytes _ 
  | `String _ 
  | `Mutez _ 
  | `Timestamp _ 
  | `Key _ 
  | `Key_hash _ 
  | `Address _ 
  | `Signature _ 
  | `Chain_id _ 
  | `Unit 
  | `Never 
  | `Amount 
  | `Balance 
  | `CChain_id 
  | `Level 
  | `Now 
  | `Sender 
  | `Self _ 
  | `Self_address 
  | `Source 
  | `Total_voting 
  | `None _ -> []
  | `Some (t, ty) -> get_variable_list t
  | `NVar _ -> []
  | `Var (x, ty) -> (x, ty) :: []
  | `Elt (t1, t2) -> (get_variable_list t1) @ (get_variable_list t2)
  | `Left (t, ty) -> get_variable_list t
  | `Right (t, ty) -> get_variable_list t
  | `Pair (t1, t2) -> (get_variable_list t1) @ (get_variable_list t2)
  | `Contract _ -> []
  | `Map (l, ty1, ty2) -> (get_variable_list_of_list get_variable_list l)
  | `Set (l, ty) -> (get_variable_list_of_list get_variable_list l)
  | `List (l, ty) -> (get_variable_list_of_list get_variable_list l)
  | `Add (t1, t2)  
  | `Sub (t1, t2)  
  | `Mul (t1, t2)  
  | `Div (t1, t2)  
  | `Mod (t1, t2)  
  | `Rem (t1, t2)  
  | `And (t1, t2)  
  | `Or (t1, t2)  
  | `Xor (t1, t2)  
  | `Imply (t1, t2)  
  | `Eq (t1, t2)  
  | `Neq (t1, t2)  
  | `Gt (t1, t2) 
  | `Ge (t1, t2)  
  | `Lt (t1, t2)  
  | `Le (t1, t2)  
  | `Concat (t1, t2)  
  | `Contain (t1, t2)  
  | `At (t1, t2) -> (get_variable_list t1) @ (get_variable_list t2)
  | `Substring (t1, t2, t3) -> (get_variable_list t1) @ (get_variable_list t2) @ (get_variable_list t3)
  | `Select (t1, t2)  
  | `Store (t1, t2)  
  | `Insert (t1, t2) -> (get_variable_list t2)
  | `Not t1  
  | `Len t1  
  | `To_int t1  
  | `From_int t1  
  | `Length t1  
  | `Abs t1  
  | `Head t1  
  | `Tail t1   
  | `First t1  
  | `Second t1 -> (get_variable_list t1)
  | _ -> []
(* Determining the data type of a specified variable that exists 
in a list of variables along with their corresponding types.*)
let rec get_variable_type x = function  
  | (x1, ty) :: tl -> 
    (
      if (String.equal x x1) then ty else (get_variable_type x tl)
    )
  | [] -> raise (SystermErr ("get_variable_type: Illegal Variable Name"))
(* Assigning the appropriate data type with each variable in a list of terms. *)
let rec assign_variable_type_term_of_list f l = function
  | hd :: tl -> (f l hd) :: (assign_variable_type_term_of_list f l tl)
  | [] -> []
(* Assigning the appropriate data type with each variable in a term of a DSL. (Output, Requirement, Condition) *)
let rec assign_variable_type_term l = function
  | `Int i -> `Int i
  | `Nat n -> `Nat n
  | `Bool b -> `Bool b
  | `Bytes b -> `Bytes b
  | `String s -> `String s
  | `Mutez m -> `Mutez m
  | `Timestamp t -> `Timestamp t
  | `Key k -> `Key k
  | `Key_hash kh -> `Key_hash kh
  | `Address addr -> `Address addr
  | `Signature s -> `Signature s
  | `Chain_id id -> `Chain_id id
  | `Unit -> `Unit
  | `Never -> `Never
  | `Amount -> `Amount
  | `Balance -> `Balance
  | `CChain_id -> `CChain_id
  | `Level -> `Level
  | `Now -> `Now
  | `Sender -> `Sender
  | `Self ty -> `Self ty
  | `Self_address -> `Self_address
  | `Source -> `Source
  | `Total_voting -> `Total_voting
  | `None ty -> `None ty 
  | `Some (t, ty) -> `Some ((assign_variable_type_term l t), ty)
  | `NVar x -> `Var (x, (get_variable_type x l))
  | `Var (x, ty) ->  `Var (x, ty)
  | `Elt (t1, t2) -> `Elt ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Left (t, ty) -> `Left ((assign_variable_type_term l t), ty)
  | `Right (t, ty) -> `Right ((assign_variable_type_term l t), ty)
  | `Pair (t1, t2) -> `Pair ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Contract ty -> `Contract ty
  | `Map (l1, ty1, ty2) -> `Map ((assign_variable_type_term_of_list assign_variable_type_term l l1), ty1, ty2)
  | `Set (l1, ty) -> `Set ((assign_variable_type_term_of_list assign_variable_type_term l l1), ty)
  | `List (l1, ty) -> `List ((assign_variable_type_term_of_list assign_variable_type_term l l1), ty)
  | `Add (t1, t2) -> `Add ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Sub (t1, t2) -> `Sub ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Mul (t1, t2) -> `Mul ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Div (t1, t2) -> `Div ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Mod (t1, t2) -> `Mod ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Rem (t1, t2) -> `Rem ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `And (t1, t2) -> `And ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Or (t1, t2) -> `Or ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Xor (t1, t2) -> `Xor ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Imply (t1, t2) -> `Imply ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Eq (t1, t2) -> `Eq ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Neq (t1, t2) -> `Neq ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Gt (t1, t2) -> `Gt ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Ge (t1, t2) -> `Ge ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Lt (t1, t2) -> `Lt ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Le (t1, t2) -> `Le ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Concat (t1, t2) -> `Concat ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Contain (t1, t2) -> `Contain ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `At (t1, t2) -> `At ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Substring (t1, t2, t3) -> `Substring ((assign_variable_type_term l t1), 
    (assign_variable_type_term l t2), (assign_variable_type_term l t3))
  | `Select (t1, t2) -> `Select ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Store (t1, t2) -> `Store ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Insert (t1, t2) -> `Insert ((assign_variable_type_term l t1), (assign_variable_type_term l t2))
  | `Not t1 -> `Not (assign_variable_type_term l t1) 
  | `Len t1 -> `Len (assign_variable_type_term l t1)
  | `To_int t1 -> `To_int (assign_variable_type_term l t1)
  | `From_int t1 -> `From_int (assign_variable_type_term l t1)
  | `Length t1 -> `Length (assign_variable_type_term l t1)
  | `Abs t1 -> `Abs (assign_variable_type_term l t1)
  | `Head t1 -> `Head (assign_variable_type_term l t1)
  | `Tail t1 -> `Tail (assign_variable_type_term l t1)
  | `First t1 -> `First (assign_variable_type_term l t1)
  | `Second t1 -> `Second (assign_variable_type_term l t1)
  | _ -> raise (SystermErr ("Fix Variable: Illegal Term"))
(* Assigning the appropriate data type with each variable in an assertion of a DSL. *)
let rec fix_variable_type_assertion l = function
  | `Assertion m  -> `Assertion (assign_variable_type_term l m)
  | `Forall (m, ass) -> `Forall (assign_variable_type_term l m, fix_variable_type_assertion l ass)
  | `Exists (m, ass) -> `Exists (assign_variable_type_term l m, fix_variable_type_assertion l ass)
  | `Cons (ass1, ass2) -> `Cons (fix_variable_type_assertion l ass1, fix_variable_type_assertion l ass2)
  | _ -> raise (SystermErr ("Illegal Assertion"))
(* Getting all of the components within a contract that has been written in the DSL. *)
let get_all_component_term = function
  | `Contract (s, b) -> 
    (
      match b with
      | `Entrypoint_list empl -> raise (SystermErr ("Not handle yet"))
      | `Entrypoint_list_assert (empl, art1) -> raise (SystermErr ("Not handle yet"))
      | `PEntrypoint_list (cd, st, empl, art1) -> raise (SystermErr ("Not handle yet"))
      | `Body_check body_check -> 
        (
          match  body_check with
            | `Body (cd, input, ck) -> 
              (
                match (cd, input, ck) with
                  | (`Code l, `Input m, `Check_sta_1 (`Output m1))  -> 
                    (
                      let variable_list = (get_variable_list m) @  (get_variable_list m1) in
                      (Some l, Some m, Some (assign_variable_type_term variable_list m1), None, None, None)
                    )
                  | (`Code l, `Input m, `Check_sta_2 (`Req art1))  -> 
                    (
                      let variable_list = (get_variable_list m) in
                      (Some l, Some m, None,  Some (fix_variable_type_assertion variable_list art1), None, None)
                    ) 
                  | (`Code l, `Input m, `Check_sta_3 (`Output m1, `Req art1)) ->
                    (
                      let variable_list = (get_variable_list m) @  (get_variable_list m1) in
                      (Some l, Some m, Some (assign_variable_type_term variable_list m1), 
                      Some (fix_variable_type_assertion variable_list art1), None, None)
                    )   
                  | (`Code l, `Input m, `Check_sta_4 (`Output m1, `Condition (art1, art2))) -> 
                    (
                      let variable_list = (get_variable_list m) @  (get_variable_list m1) in
                      (Some l, Some m, Some (assign_variable_type_term variable_list m1), 
                      None, Some (fix_variable_type_assertion variable_list art1), 
                      Some (fix_variable_type_assertion variable_list art2))
                    )
                  | (`Code l, `Input m, `Check_sta_5 (`Output m1, `Req art, `Condition (art1, art2))) ->
                    (
                      let variable_list = (get_variable_list m) @  (get_variable_list m1) in
                      (Some l, Some m, Some (assign_variable_type_term variable_list m1), 
                      Some (fix_variable_type_assertion variable_list art), 
                      Some (fix_variable_type_assertion variable_list art1), 
                      Some (fix_variable_type_assertion variable_list art2))
                    )   
              )
            | _ -> raise (SystermErr ("Illegal Body-check"))
        )
      | _ -> raise (SystermErr ("Illegal Contract Body"))
    )
  | _ -> raise (SystermErr ("Illegal Contract"))
(* Getting the code. *)
let get_code = function
  | (Some l, _, _, _, _, _) -> l
  | _ -> raise (SystermErr ("None Code"))
(* Getting the input term. *)
let get_input_term = function
  | (_, Some m, _, _, _, _) -> m
  | _ -> raise (SystermErr ("None Input"))
(* Getting the output term. *)
let get_output_term = function
  | (_, _, Some m, _, _, _) -> m
  | _ -> raise (SystermErr ("None Output"))
(* Getting the requirement. *)
let get_requirement_term = function
  | (_, _, _, Some ass, _, _) -> ass
  | _ -> raise (SystermErr ("None Requirement"))
(* Getting the  precondition. *)
let get_precondition_term = function
  | (_, _, _, _, Some ass, _) -> ass
  | _ -> raise (SystermErr ("None Precondition"))
(* Getting the postcondition. *)
let get_postcondition_term = function
  | (_, _, _, _, _, Some ass) -> ass
  | _ -> raise (SystermErr ("None Postcondition"))
(* Getting the converted symbolic output term that was specified 
by the user in a contract written in the DSL.*)
let get_convert_output_program_selt p = 
  (
    let contract = parse_contract p in
    let all_component = get_all_component_term contract in
    let output = get_output_term all_component in
    {eterm = (convert_term output); etype = (get_term_type output)}
  )
(* Getting the symbolic output term obtained from performing symbolic execution
on a contract written in the DSL. *)
let get_output_program p = 
  ( 
    let contract = parse_contract p in
    let all_component = get_all_component_term contract in
    let code = get_code all_component in
    let convert_code = convert_code (code) in
    let input = get_input_term all_component in
    let convert_input = convert_term (input) in
    let input_stack = [{eterm = convert_input; etype = (get_term_type input)}] in
    let init_state = mk_sbsystem  input_stack  convert_code in
    interpeter [init_state] 
  )
(* Matching two symbolic types. *)
let matching_type ty1 ty2 = (ty1 = ty2)
(* Matching two lists of instructions *)
let rec matching_instruction_list f l1 l2 =
  match (l1, l2) with
    | (hd1 :: tl1, hd2 :: tl2) -> (f hd1 hd2) && (matching_instruction_list f tl1 tl2)
    | ([], []) -> true
    | _ -> false 
(* Matching two instruction *)
let rec matching_instruction f_matching_term i1 i2 = 
match (i1, i2) with
  | (APPLY, APPLY) -> true
  | (EXEC, EXEC) -> true
  | (FAILWITH s1, FAILWITH s2) -> (s1 = s2)
  | (IF (l1, l2), IF (l3, l4)) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l3) 
    && (matching_instruction_list (matching_instruction f_matching_term) l2 l4)
  | (IF_CONS (l1, l2), IF_CONS (l3, l4)) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l3) 
  && (matching_instruction_list (matching_instruction f_matching_term) l2 l4)
  | (IF_LEFT (l1, l2), IF_LEFT (l3, l4)) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l3) 
  && (matching_instruction_list (matching_instruction f_matching_term) l2 l4)
  | (IF_NONE (l1, l2), IF_NONE (l3, l4)) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l3) 
  && (matching_instruction_list (matching_instruction f_matching_term) l2 l4)
  | (ITER l1, ITER l2) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (LAMBDA (ty1, ty2, l1), LAMBDA (ty3, ty4, l2)) -> (ty1 = ty3) && (ty2 = ty4) && (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (LAMBDA_REC (ty1, ty2, l1), LAMBDA_REC (ty3, ty4, l2)) -> (ty1 = ty3) && (ty2 = ty4) && (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (LOOP l1, LOOP l2) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (LOOP_LEFT l1, LOOP_LEFT l2) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (DIG t1, DIG t2) -> (f_matching_term t1 t2)
  | (DIP l1, DIP l2) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (DIP_N (t1, l1), DIP_N (t2, l2)) -> (f_matching_term t1 t2) && (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (DROP, DROP) -> true
  | (DROP_N t1, DROP_N t2) -> (f_matching_term t1 t2)
  | (DUG t1, DUG t2) -> (f_matching_term t1 t2)
  | (DUP, DUP) -> true
  | (DUP_N t1, DUP_N t2) -> (f_matching_term t1 t2)
  | (PUSH (ty1, t1), PUSH (ty2, t2)) -> (ty1 = ty2) && (f_matching_term t1 t2) 
  | (SWAP, SWAP) -> true
  | (ABS, ABS) -> true
  | (ADD, ADD) -> true
  | (COMPARE, COMPARE) -> true
  | (EDIV, EDIV) -> true
  | (EQ, EQ) -> true
  | (NEQ, NEQ) -> true
  | (GE, GE) -> true
  | (GT, GT) -> true
  | (INT, INT) -> true
  | (LE, LE) -> true
  | (LSL, LSL) -> true
  | (LSR, LSR) -> true
  | (LT, LT) -> true
  | (ISNAT, ISNAT) -> true
  | (MUL, MUL) -> true
  | (NEG, NEG) -> true
  | (SUB, SUB) -> true
  | (AND, AND) -> true
  | (NOT, NOT) -> true
  | (OR, OR) -> true
  | (XOR, XOR) -> true
  | (BLAKE2B, BLAKE2B) -> true
  | (CHECK_SIGNATURE, CHECK_SIGNATURE) -> true
  | (HASH_KEY, HASH_KEY) -> true
  | (KECCAK, KECCAK) -> true
  | (PAIRING_CHECK, PAIRING_CHECK) -> true
  | (SAPLING_EMPTY_STATE t1, SAPLING_EMPTY_STATE t2) -> (f_matching_term t1 t2)
  | (SAPLING_VERIFY_UPDATE, SAPLING_VERIFY_UPDATE) -> true
  | (SHA256, SHA256) -> true
  | (SHA3, SHA3) -> true
  | (SHA512, SHA512) -> true
  | (ADDRESS, ADDRESS) -> true
  | (AMOUNT, AMOUNT) -> true
  | (BALANCE, BALANCE) -> true
  | (CHAIN_ID, CHAIN_ID) -> true
  | (CONTRACT ty1, CONTRACT ty2) -> (ty1 = ty2)
  | (IMPLICIT_ACCOUNT, IMPLICIT_ACCOUNT) -> true
  | (CREATE_CONTRACT (ty1, ty2, l1), CREATE_CONTRACT (ty3, ty4, l2)) -> (ty1 = ty3) && (ty2 = ty4) 
    && (matching_instruction_list (matching_instruction f_matching_term) l1 l2) 
  | (LEVEL, LEVEL) -> true
  | (NOW, NOW) -> true
  | (SELF, SELF) -> true
  | (SELF_ADDRESS, SELF_ADDRESS) -> true
  | (SENDER, SENDER) -> true
  | (SET_DELEGATE, SET_DELEGATE) -> true
  | (SOURCE, SOURCE) -> true
  | (TOTAL_VOTING_POWER, TOTAL_VOTING_POWER) -> true
  | (MIN_BLOCK_TIME, MIN_BLOCK_TIME) -> true
  | (TRANSFER_TOKENS, TRANSFER_TOKENS) -> true
  | (VOTING_POWER, VOTING_POWER) -> true
  | (CAR, CAR) -> true
  | (CDR, CDR) -> true
  | (CONCAT, CONCAT) -> true
  | (CONS, CONS) -> true
  | (EMPTY_BIG_MAP (ty1, ty2), EMPTY_BIG_MAP (ty3, ty4)) -> (ty1 = ty3) && (ty2 = ty4)
  | (EMPTY_MAP (ty1, ty2), EMPTY_MAP (ty3, ty4)) -> (ty1 = ty3) && (ty2 = ty4)
  | (EMPTY_SET ty1, EMPTY_SET ty2) -> (ty1 = ty2)
  | (GET, GET) -> true
  | (GET_N t1, GET_N t2) -> (f_matching_term t1 t2)
  | (GET_AND_UPDATE, GET_AND_UPDATE) -> true
  | (LEFT ty1, LEFT ty2) -> (ty1 = ty2)
  | (MAP l1, MAP l2) -> (matching_instruction_list (matching_instruction f_matching_term) l1 l2)  
  | (MEM, MEM) -> true
  | (NEVER, NEVER) -> true
  | (NIL ty1, NIL ty2) -> (ty1 = ty2)
  | (NONE ty1, NONE ty2) -> (ty1 = ty2)
  | (PACK, PACK) -> true
  | (PAIR, PAIR) -> true
  | (PAIR_N t1, PAIR_N t2) -> (f_matching_term t1 t2)
  | (RIGHT ty1, RIGHT ty2) -> (ty1 = ty2)
  | (SIZE, SIZE) -> true
  | (SLICE, SLICE) -> true
  | (SOME, SOME) -> true
  | (UNIT, UNIT) -> true
  | (UNPACK ty1, UNPACK ty2) -> (ty1 = ty2)
  | (UNPAIR, UNPAIR) -> true
  | (UNPAIR_N t1, UNPAIR_N t2) -> (f_matching_term t1 t2)
  | (UPDATE, UPDATE) -> true
  | (UPDATE_N t1, UPDATE_N t2) -> (f_matching_term t1 t2)
  | (JOINT_TICKETS, JOINT_TICKETS) -> true
  | (READ_TICKETS, READ_TICKETS) -> true
  | (SPLIT_TICKET, SPLIT_TICKET) -> true
  | (TICKET, TICKET) -> true
  | _ -> false
(* Matching two lists of symbolic terms. *)
let rec matching_term_list f l1 l2 =
  match (l1, l2) with
    | (hd1 :: tl1, hd2 :: tl2) -> (f hd1 hd2) && (matching_term_list f tl1 tl2)
    | ([], []) -> true
    | _ -> false 
(* Matching two symbolic terms. *)
let rec matching_term t1 t2 = 
  match (t1, t2) with
    | (SEq (t1, SBool true), SNot (SEq (t2, SBool false))) -> (matching_term t1 t2)
    | (SEq (t1, SBool false), SNot (SEq (t2, SBool false))) -> (matching_term t1 t2)
    | (SNot (SEq (t1, SBool true)), SEq (t2, SBool false)) -> (matching_term t1 t2)
    | (SNot (SEq (t1, SBool false)), SEq (t2, SBool true)) -> (matching_term t1 t2)
    | (SGt (t1, t2), SNot (SLe (t3, t4))) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SNot (SLe (t3, t4)), SGt (t1, t2)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SGe (t1, t2), SNot (SLt (t3, t4))) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SNot (SLt (t3, t4)), SGe (t1, t2)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SLe (t1, t2), SNot (SGt (t3, t4))) -> (matching_term t1 t3) && (matching_term t2 t4) 
    | (SNot (SGt (t3, t4)), SLe (t1, t2)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SLt (t1, t2), SNot (SGe (t3, t4))) -> (matching_term t1 t3) && (matching_term t2 t4) 
    | (SNot (SGe (t3, t4)), SLt (t1, t2)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SVar (x1, n1, ty1), _) -> true
    | (_, SVar (x2, n2, ty2)) -> true
    | (SVar (x1, n1, ty1), SVar (x2, n2, ty2)) ->  matching_type ty1 ty2
    | (SInt i1, SInt i2) -> (i1 = i2)
    | (SNat n1, SNat n2) -> (n1 = n2)    
    | (SBool b1, SBool b2) -> (b1 = b2)
    | (SMutez i1, SMutez i2) -> (i1 = i2)
    | (STimestamp i1, STimestamp i2) -> (i1 = i2)
    | (SKey s1, SKey s2) -> String.equal s1 s2
    | (SKey_Hash s1, SKey_Hash s2) -> String.equal s1 s2
    | (SAddress s1, SAddress s2) -> String.equal s1 s2
    | (SSignature s1, SSignature s2) -> String.equal s1 s2
    | (SChain_Id s1, SChain_Id s2) -> String.equal s1 s2
    | (SBytes s1 , SBytes s2) -> Bytes.equal s1 s2
    | (SLeft t1, SLeft t2) -> matching_term t1 t2
    | (SRight t1, SRight t2) -> matching_term t1 t2
    | (SPair (t1, t2), SPair  (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SNone ty1, SNone ty2) -> matching_type ty1 ty2
    | (SSome t1, SSome t2) -> matching_term t1 t2
    | (SString s1, SString s2) -> String.equal s1 s2
    | (SSet l1, SSet l2) -> matching_term_list matching_term l1 l2
    | (SUnit, SUnit) -> true
    | (SNever, SNever) -> true
    | (SAmount, SAmount) -> true
    | (SBalance, SBalance) -> true
    | (SChain_id, SChain_id) -> true
    | (SLevel, SLevel) -> true
    | (SMin_block_time, SMin_block_time) -> true
    | (SNow, SNow) -> true
    | (SSender, SSender) -> true
    | (SSelf, SSelf) -> true
    | (SSelf_address, SSelf_address) -> true
    | (SSource, SSource) -> true
    | (STotal_voting, STotal_voting) -> true
    | (SList l1, SList l2) -> matching_term_list matching_term l1 l2
    | (SCons (t1, t2), SCons (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SContain (t1, t2), SContain (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SAt (t1, t2), SAt (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SFsubstring (t1, t2, t3), SFsubstring (t4, t5, t6)) -> (matching_term t1 t2) 
      && (matching_term t2 t3) && (matching_term t3 t6)
    | (SFsubbytes (t1, t2, t3), SFsubbytes (t4, t5, t6)) -> (matching_term t1 t2) 
      && (matching_term t2 t3) && (matching_term t3 t6)
    | (SSelect (t1, t2), SSelect (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SStore (t1, t2), SStore (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SInsert (t1, t2), SInsert (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SEmpty ty1, SEmpty ty2) -> matching_type ty1 ty2
    | (SElt (t1, t2), SElt (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SMap l1, SMap l2) -> matching_term_list matching_term l1 l2
    | (SContract (ty1, t1), SContract (ty2, t2)) -> (matching_type ty1 ty2) && (matching_term t1 t2)
    | (STransfer_Token (t1, t2, t3), STransfer_Token (t4, t5, t6)) -> (matching_term t1 t2) 
      && (matching_term t2 t3) && (matching_term t3 t6)
  (*  | (SInstr instr list, SInstr) -> not handle yet*)
    | (SAdd (t1, t2), SAdd (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SDiv (t1, t2), SDiv (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SMod (t1, t2), SMod (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SRem (t1, t2), SRem (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SAbs t1, SAbs t2) -> matching_term t1 t2
    | (SFcheck_signature (t1, t2, t3), SFcheck_signature (t4, t5, t6)) -> (matching_term t1 t4) 
      && (matching_term t2 t5) && (matching_term t3 t6)
    | (SLt (t1, t2), SLt (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SGt (t1, t2), SGt (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SEq (t1, t2), SEq (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
  (*  | (SNeq (t1, t2), SNeq (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)*)
    | (SGe (t1, t2), SGe (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SLe (t1, t2), SLe (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SFconcat_string (t1, t2), SFconcat_string (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SFconcat_bytes (t1, t2), SFconcat_bytes (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SEdiv (t1, t2), SEdiv (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SFhash_key t1, SFhash_key t2) -> matching_term t1 t2
    | (SFhash_keccak t1, SFhash_keccak t2) -> matching_term t1 t2
    | (SLsl (t1, t2), SLsl (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SLsr (t1, t2), SLsr (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SMul (t1, t2), SMul (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SNot t1, SNot t2) -> (matching_term t1 t2)
    | (SOr (t1, t2), SOr (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SXor (t1, t2), SXor (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SAnd (t1, t2), SAnd (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SImply (t1, t2), SImply (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (SFlen_string t1, SFlen_string t2) -> matching_term t1 t2
    | (SFlen_bytes t1, SFlen_bytes t2) -> matching_term t1 t2
    | (SFlen_list t1, SFlen_list t2) -> matching_term t1 t2
    | (SFlen_set t1, SFlen_set t2) -> matching_term t1 t2
    | (SFlen_map t1, SFlen_map t2) -> matching_term t1 t2
    | (STo_int t1, STo_int t2) -> matching_term t1 t2
    | (SFrom_int t1, SFrom_int t2) -> matching_term t1 t2
    | (SLength t1, SLength t2) -> matching_term t1 t2
    | (SHead t1, SHead t2) -> matching_term t1 t2
    | (STail t1, STail t2) -> matching_term t1 t2
    | (SFirst t1, SFirst t2) -> matching_term t1 t2
    | (SSecond t1, SSecond t2) ->  matching_term t1 t2
    | (SFpack t1, SFpack t2) -> matching_term t1 t2
    | (SSet_Delegate t1, SSet_Delegate t2) -> matching_term t1 t2
    | (SFsha256 t1, SFsha256 t2) -> matching_term t1 t2
    | (SFsha3 t1, SFsha3 t2) -> matching_term t1 t2
    | (SFsha521 t1, SFsha521 t2) -> matching_term t1 t2
    | (SSlice (t1, t2, t3), SSlice (t4, t5, t6)) -> 
      (matching_term t1 t2) && (matching_term t2 t3) && (matching_term t3 t6)
    | (SSub (t1, t2), SSub (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | (STransfer_Token (t1, t2, t3), STransfer_Token (t4, t5, t6)) -> 
      (matching_term t1 t2) && (matching_term t2 t3) && (matching_term t3 t6)
    | (SFunpack t1, SFunpack t2) -> (matching_term t1 t2)
    | (SFailwith s1, SFailwith s2) -> String.equal s1 s2
    | (SGet_contract (ty1, t1), SGet_contract (ty2, t2)) -> 
      (matching_type ty1 ty2) && (matching_term t1 t2)
    | (SFunc (t1, t2, t3), SFunc (t4, t5, t6)) -> (matching_term t1 t2) 
      && (matching_term t2 t3) && (matching_term t3 t6)
  (*  | (SFuncl (t1, t2) * ((t1 * ty * (l1)) list), SFuncl) -> not handle yet *)
    | (SFold (t1, t2, t3), SFold (t4, t5, t6)) -> (matching_term t1 t2) 
      && (matching_term t2 t3) && (matching_term t3 t6)
  (*  | (SFoldf (t1, t2) * (((t1, t2)) list), SFoldf) -> not handle yet *)
    | (SFuncLoop (l1, t1, l2), SFuncLoop (l3, t2, l4)) -> (matching_term t1 t2) 
      && (matching_term_list matching_term l1 l3) && (matching_term_list matching_term l2 l4)
    | (SFuncLoopCondi (l1, l2, l3), SFuncLoopCondi (l4, l5, l6)) -> (matching_term_list matching_term l1 l4) 
      && (matching_term_list matching_term l2 l5) && (matching_term_list matching_term l3 l6)
    | (SUnsat l1, SUnsat l2) -> (matching_term_list matching_term l1 l2)
    | (SSat_true l1, SSat_true l2) -> (matching_term_list matching_term l1 l2)
    | (SSat_false l1, SSat_false l2) -> (matching_term_list matching_term l1 l2)
  (*  | (SFuncMap t1 * (((t1, t2) list) list), SFuncMap) ->  not handle yet*)
    | (SFmap (t1, t2), SFmap (t3, t4)) -> (matching_term t1 t3) && (matching_term t2 t4)
    | _ -> false
(* Matching two symbolic stack elements. *)
let matching_symbolic_term st1 st2 = 
  match (st1, st2) with
    | ({eterm = t1; etype = ty1}, {eterm = t2; etype = ty2}) -> 
      (
        if (ty1 = ty2) then 
          (
             match (t1, t2) with
              | (SVar _, _) -> true
              | (_, SVar _) -> true
              | _ -> matching_term t1 t2
          )
        else false
      )
    | _ -> raise (SystermErr ("Illegal Symbolic Execution Terms"))
(* Getting the storage of a symbolic output term. *)
let get_storage e = 
  match e.etype with
    | TPair ((TList TOperation), ty) -> 
      (
        match e.eterm with
          | SPair (_, t) -> {eterm = t; etype = ty}
          | _ -> raise (SystermErr ("get_output_stack: Illegal Stack Element"))
      )
    | _ -> e
(* Getting the storage of a symbolic output stack. *)
let get_storage_from_stack = function
  | hd :: [] -> get_storage hd
  | _ -> raise (SystermErr ("get_storage_from_stack: Illegal Stack "))
(* Obtaining the list of the symbolic output storages for a specified list of symbolic system states. *)
let rec get_output_symbolic_term_list = function
  | hd :: tl -> (get_storage_from_stack hd.estack) :: 
    (get_output_symbolic_term_list tl)
  | [] -> []
(* Obtaining the list of the symbolic output storages for a contract [p] *)
let get_output_symbolic_term_list_of_program p = 
  p |> get_output_program |> get_output_symbolic_term_list
(* Checking if a system state [sbsys] contains a failwith stack. *)
let check_failwith_sys sbsys =
  match sbsys.estack with
    | hd :: tl -> if (matching_type hd.etype TError) then Some sbsys.epredicate else None
    |  _ -> raise (SystermErr ("check_failwith_sys: Empty system state"))
(* Collecting all system states that include a failwith stack from a given list of system states. *)
let rec get_failwith_sbsys_list = function
  | hd :: tl -> 
    (
      let failwith =  check_failwith_sys hd in
        (
          match failwith with
            | Some a -> a :: (get_failwith_sbsys_list tl)
            | None -> get_failwith_sbsys_list tl
        )
    )
  | _ -> []
(* Checking if a term is a failwith term. *)
  let check_failwith_term  t =
    match t.etype with 
      | TError -> true
      | _ -> false
(* Verifying whether the output provided by the user matches the output obtained 
from the symbolic execution of the contract. *)
let rec check_output_pass output_pterm = function
  | hd :: tl -> 
    if check_failwith_term hd then check_output_pass output_pterm tl
    else (matching_symbolic_term hd output_pterm) && (check_output_pass output_pterm tl)
  | [] -> true
(* Checking if a specified term matches any of the terms within a given list. *)
let rec check_exist_list x = function
  | hd :: tl -> if (matching_term x hd) then true else check_exist_list x tl
  | [] -> false
(* Checking if a term matches any of the terms within a list of lists of terms. *)
let rec check_exist_list_list x = function
  | hd :: tl -> if (check_exist_list x hd) then true else check_exist_list_list x tl
  | [] -> false  
(* Getting the first element of a stack *)
let get_first_elem_of_list = function
  | [] -> None
  | hd :: tl -> Some hd
(* Collecting all requirements of a contract from the results of symbolic execution. *)
let rec collect_requirement = function
  | hd :: tl ->
    (
      match (get_first_elem_of_list hd) with
        | Some a -> a :: (collect_requirement tl)
        | None -> (collect_requirement tl)
    )
  | [] -> []
(* Getting the negated form of an assertion. *)
let opp_assertion = function
  | SLt (t1, t2) -> SGe (t1, t2)
  | SGt (t1, t2) -> SLe (t1, t2)
  | SEq (t1, t2) -> SNot (SEq (t1, t2))
  | SGe (t1, t2) -> SLt (t1, t2)
  | SLe (t1, t2) -> SGt (t1, t2)
  | SNot t -> t
  | _ -> raise (SystermErr ("opp_assertion: invaild assertion"))
(* Getting the negated form of each assertion in a list of assertions. *)
let rec opp_assertion_list = function
  | hd :: tl -> (opp_assertion hd) :: (opp_assertion_list tl)
  | [] -> []
(* Comparing whether two lists of requirements match. *)
let rec compare_requirement_list l1 l2 =
  match l1 with 
    | hd :: tl -> (check_exist_list hd l2) && (compare_requirement_list tl l2)
    | [] -> true
(* Getting the user-specified requirements from a parsed contract. *)
let rec get_user_requirement_list = function
  | Assertion m -> m :: []
  | Cons (ass1, ass2) ->  (get_user_requirement_list ass1) @ (get_user_requirement_list ass2)
  | _ -> raise (SystermErr ("get_user_requirement_list: Invaild requirements"))
(* Converting the user-specified list of requirements to symbolic execution form, 
and obtain the negation form for each element in the list. *)
let get_conver_user_requirement_list ass =  
  ass |> convert_assertion |> get_user_requirement_list
(* Geting the list of user-spcified requirement from a contract *)
let get_user_requirement p = 
    (
      let contract = parse_contract p in
      let all_component = get_all_component_term contract in
      (
        match all_component with
          | (_, _, _, Some ass, _, _) -> 
            get_conver_user_requirement_list ass
          | _ -> raise (SystermErr ("check_requirement: None requirements"))
      )
    )
    
(** STATIC CHECKER **)
(* Running the symbolic execution for a contract [p] written in the DSL. *)
let run_symbolic_execution p =
  (
    let contract = parse_contract p in
    let all_component = get_all_component_term contract in
    let code = get_code all_component in
    let convert_code = convert_code (code) in
    let input = get_input_term all_component in
    let convert_input = convert_term (input) in
    let input_stack = [{eterm = convert_input; etype = (get_term_type input)}] in
    let init_state = mk_sbsystem  input_stack  convert_code in
    interpeter [init_state]
  )
(*  Checking if the specified output in a DSL-written contract [p] is satisfied. *)
let check_output p = 
  (
    let contract = parse_contract p in
    let all_component = get_all_component_term contract in
    (
      match all_component with
        | (_, _, Some m, _, _, _) -> 
          check_output_pass (get_convert_output_program_selt p) 
          (get_output_symbolic_term_list_of_program p)
        | _ -> raise (SystermErr ("check_output: None Output"))
    )
  )
(* Generating the set of symbolic requirements for the DSL-written contract [p]. *)
let generate_requirement p = 
  p |> get_output_program |> get_failwith_sbsys_list |> collect_requirement |> opp_assertion_list
(* Checking if all requirements [p] written in the DSL are satisfied. *)
let check_requirement p = 
      (
        let contract = parse_contract p in
        let all_component = get_all_component_term contract in
        (
          match all_component with
            | (_, _, _, Some ass, _, _) -> 
              compare_requirement_list (get_user_requirement p) (generate_requirement p)
            | _ -> raise (SystermErr ("check_requirement: None requirements"))
        )
      )
(* Verifying pre- and post-conditions for the DSL-written contract [p]. *)
let check_condition p = raise (SystermErr "TODO: check_condition")
(* Checking if all the output, requirements, and conditions for the DSL-written contract [p] are satisfied. *)
(* NOTE: only output and requirements are checked. TODO: pre- and post- conditions. *)
let check_pass p = 
  (
    let contract = parse_contract p in
    let all_component = get_all_component_term contract in
    (
      match all_component with
        | (_, _, Some m, None, _, _) -> 
          check_output_pass (get_convert_output_program_selt p) 
          (get_output_symbolic_term_list_of_program p)
        | (_, _, Some m, Some ass, _, _) -> 
          (check_output_pass (get_convert_output_program_selt p) 
          (get_output_symbolic_term_list_of_program p)) && (check_requirement p)
        | _ -> raise (SystermErr ("check_pass: Not handle yet"))
    )
  )
(* Verifying for an entrypoint for a contract [p] written in the DSL.*)
let check_entrypoint p = raise (SystermErr "TODO: check_entrypoint")
(* Verifying the specified lifecycle in contract [p].*)
let check_life_cycle p = raise (SystermErr "TODO: check_life_cycle")