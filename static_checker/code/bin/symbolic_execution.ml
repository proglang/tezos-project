(** Symbolic execution of Michelson programs. **)
(* Symbolic types. *)
type ty =
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey
  | TKey_hash
  | TSignature
  | TTimestamp
  | TAddress
  | TOption of ty
  | TOr of ty * ty
  | TPair of ty * ty
  | TList of ty
  | TSet of ty
  | TOperation
  | TContract of ty
  | TMap of ty * ty
  | TBig_map of ty * ty
  | TLambda of ty * ty
  | TTicket of ty
  | TBls12_381_g1
  | TBls12_381_g2
  | TBls12_381_fr
  | TSapling_transaction of int
  | TSapling_state of int
  | TChest
  | TChest_key
  | TTx_rollup_12_address
  | TError
  | TSelf
(* Symbolic terms. *)
type term =
  | SVar of string * int * ty
  | SInt of Int.t
  | SNat of Int.t    
  | SBool of bool 
  | SBytes of bytes    
  | SString of string
  | SMutez of Int.t  
  | STimestamp of Int.t 
  | SKey of string
  | SKey_Hash of string
  | SAddress of string
  | SSignature of string
  | SChain_Id of string    
  | SUnit
  | SNever
  | SAmount
  | SBalance
  | SChain_id
  | SLevel
  | SMin_block_time
  | SNow
  | SSender
  | SSelf
  | SSelf_address
  | SSource
  | STotal_voting
  | SNone of ty
  | SSome of term 
  | SLeft of term
  | SRight of term
  | SPair of term * term
  | SElt of term * term
  | SContract of ty * term
  | SMap of term list
  | SBig_Map of term list
  | SSet of term list   
  | SList of term list
  | SInstr of instr list
  | SCons of term * term
  | SEmpty of ty
  | SAdd of term * term
  | SSub of term * term
  | SMul of term * term
  | SDiv of term * term
  | SMod of term * term
  | SRem of term * term
  | SAbs of term
  | SNeg of term
  | SAnd of term * term
  | SOr of term * term
  | SXor of term * term
  | SNot of term
  | SImply of term * term
  | SEq of term * term
  | SGt of term * term
  | SGe of term * term
  | SLt of term * term
  | SLe of term * term
  | SFconcat_string of term * term
  | SFconcat_bytes of term * term
  | SContain of term * term
  | SAt of term * term
  | SFsubstring of term * term * term
  | SFsubbytes of term * term * term
  | SSelect of term * term
  | SStore of term * term
  | SInsert of term * term
  | SFlen_string of term
  | SFlen_bytes of term
  | SFlen_list of term
  | SFlen_set of term
  | SFlen_map of term
  | STo_int of term
  | SFrom_int of term
  | SLength of term
  | SHead of term
  | STail of term
  | SFirst of term
  | SSecond of term  
  | SFhash_blake2b of term
  | SFcheck_signature of term * term * term
  | SFhash_key of term
  | SFhash_keccak of term
  | SEdiv of term * term
  | SLsl of term * term
  | SLsr of term * term
  | SFpack of term
  | SSet_Delegate of term
  | SFsha256 of term
  | SFsha3 of term
  | SFsha521 of term
  | SSlice of term * term * term
  | STransfer_Token of term * term * term
  | SFailwith of string
  | SGet_contract of ty * term 
  | SGet_address of term 
  | SGet_implicit_account of term 
  | SGet_voting_power of term 
  | SFGet_map of term * term
  | SFmem_set of term * term
  | SFmem_map of term * term
  | SFGet_big_map of term * term
  | SFunpack of term
  | SEmit_operation of ty * ty
  | SGet_address_new_contract of term
  | SFunc of term * term * term
  | SFuncl of term * term * ((term * ty * (term list)) list)
  | SFold of term * term * term
  | SFoldf of term * term * ((term * term) list)
  | SFuncLoop of (term list) * term * (term list)
  | SFuncLoopCondi of (term list) * (term list) * (term list)
  | SUnsat of term list
  | SSat_true of term list
  | SSat_false of term list
  | SFuncMap of term * ((term * term list) list)
  | SFmap of term * term 
and instr =
  | APPLY
  | EXEC
  | FAILWITH of string
  | IF of instr list * instr list
  | IF_CONS of instr list * instr list
  | IF_LEFT of instr list * instr list
  | IF_NONE of instr list * instr list
  | ITER of instr list 
  | LAMBDA of ty * ty * instr list
  | LAMBDA_REC of ty * ty * instr list
  | LOOP of instr list
  | LOOP_LEFT of instr list
  | DIG of term
  | DIP of instr list
  | DIP_N of term * instr list
  | DROP
  | DROP_N of term
  | DUG of term
  | DUP
  | DUP_N of term
  | PUSH of ty * term
  | SWAP
  | ABS
  | ADD
  | COMPARE
  | EDIV
  | EQ
  | NEQ
  | GE
  | GT
  | INT
  | LE
  | LSL
  | LSR
  | LT
  | ISNAT
  | MUL
  | NEG
  | SUB
  | AND
  | NOT
  | OR
  | XOR
  | BLAKE2B
  | CHECK_SIGNATURE
  | HASH_KEY
  | KECCAK
  | PAIRING_CHECK
  | SAPLING_EMPTY_STATE of term
  | SAPLING_VERIFY_UPDATE
  | SHA256
  | SHA3
  | SHA512
  | ADDRESS
  | AMOUNT
  | BALANCE
  | CHAIN_ID
  | CONTRACT of ty
  | IMPLICIT_ACCOUNT
  | CREATE_CONTRACT of ty * ty * instr list
  | LEVEL
  | NOW
  | SELF
  | SELF_ADDRESS
  | SENDER
  | SET_DELEGATE
  | SOURCE
  | TOTAL_VOTING_POWER
  | MIN_BLOCK_TIME
  | TRANSFER_TOKENS
  | VOTING_POWER
  | CAR
  | CDR
  | CONCAT
  | CONS
  | EMPTY_BIG_MAP of ty * ty
  | EMPTY_MAP of ty * ty
  | EMPTY_SET of ty 
  | GET
  | GET_N of term
  | GET_AND_UPDATE
  | LEFT of ty
  | MAP of instr list
  | MEM
  | NEVER
  | NIL of ty
  | NONE of ty
  | PACK
  | PAIR
  | PAIR_N of term
  | RIGHT of ty
  | SIZE
  | SLICE
  | SOME
  | UNIT
  | UNPACK of ty
  | UNPAIR
  | UNPAIR_N of term
  | UPDATE
  | UPDATE_N of term
  | JOINT_TICKETS
  | READ_TICKETS
  | SPLIT_TICKET
  | TICKET

(* Each element in the stack is composed of a term and its corresponding type. *)
type selt = {
  eterm : term;
  etype : ty;
}
(* The system state is comprised of a list of instructions, a stack, 
  a list of predicates, and the current index of the symbolic variable. *)
type sbsystem = {
  einstr : instr list;
  estack : selt list;
  epredicate : term list;
  ecounter : int;
  eloop : int;
}
(* Exceptions *)
exception WrongTypeFor of string 
exception WrongStackFor of string 
exception FunctionFail of string
exception TODO of string
exception SymbolicExecutionError of string
(* Set loop limit. *)
let loop_limit = 1000
(* List of functions. *)
(* Get the head element of a list. *)
let get_head_of_list = function
    | hd :: tl -> hd
    | [] -> raise (FunctionFail "get_head_of_list: Empty List")
(* Get the tail  of a list. *)
let get_tail_of_list = function
    | hd :: tl -> tl
    | [] -> []
(* Check whether the first element of a stack is a Failwith. *)
let check_failwith stack =
  match stack with
    | {eterm = SFailwith x; _} :: tl -> true
    | _  -> false
(* Merge a system state with a list of system states, where the first 
  represents the main system state consisting of a instruction list, 
  a stack and a predicate list, and the second list represents 
  the system state list obtained after executing a temporary execution. *)
let rec merger_systems_for_compare_pair pre_ins_list pre_stack pre_predicate = function
  | hd :: tl ->
    (
      if (check_failwith hd.estack) then
        (
          {einstr = [];
          estack = hd.estack @ pre_stack; 
          epredicate = hd.epredicate @ pre_predicate; 
          ecounter = hd.ecounter;
          eloop = hd.eloop} :: 
          (merger_systems_for_compare_pair pre_ins_list pre_stack pre_predicate tl)
        )
      else 
        (
          {einstr = hd.einstr @ pre_ins_list;
          estack = hd.estack @ pre_stack; 
          epredicate = hd.epredicate @ pre_predicate; 
          ecounter = hd.ecounter; 
          eloop = hd.eloop} :: 
          (merger_systems_for_compare_pair pre_ins_list pre_stack pre_predicate tl)
        )
    )
  | [] -> []
(* Compare two pairs: Pair (a1, b1) and Pair (a2, b2)
  if a1 > a2 then return 1;
  if a1 < a2 then return -1; 
  if a1 = a2 then return compare b1 b2. *)
let rec modify_systems_for_compare_pair b1 b2 ty2 ty4 = function
   | hd :: tl ->
      (
        match (hd.estack) with
          | {eterm = SInt (-1); etype = TInt} :: []
          | {eterm = SInt 1; etype = TInt} :: [] ->  hd  :: (modify_systems_for_compare_pair b1 b2 ty2 ty4 tl)
          | {eterm = SInt 0; etype = TInt} :: [] -> 
            (
              {hd with einstr = [COMPARE]; 
              estack = [{eterm = b1; etype = ty2}; {eterm = b2; etype = ty4}]} 
              :: (modify_systems_for_compare_pair b1 b2 ty2 ty4 tl)
            )     
          | _ -> raise (FunctionFail "modify_systems_for_compare_pair: Invalid Result")
       )
    | [] -> []
(* Merge a list of system states with a list of instructions *) 
let rec merger_ins ins = function
    | [] -> []
    | hd :: tl ->
      (
        if check_failwith hd.estack then 
          (
            ({hd with einstr = []}) :: (merger_ins ins tl)
          )
        else 
          (
            ({hd with einstr = ins}) :: (merger_ins ins tl)
          )
      )

let rec merger_dip s1 ins = function
    | [] -> []
    | hd :: tl ->
      (
        let old_estack = hd.estack in 
        ({hd with estack = (s1 @ old_estack); einstr = ins}) 
        :: (merger_dip s1 ins tl)
      ) 

let rec merger tl_list s1 ins =
  match tl_list with
    | [] -> []
    | hd :: tl ->
      (
        let old_estack = hd.estack in 
        ({hd with estack = (s1 ::  old_estack); einstr = ins}) 
        :: (merger tl s1 ins)
      ) 

let rec merger_stack_ins tl_list stack ins =
  match tl_list with
    | [] -> []
    | hd :: tl ->
      (
        let estack = hd.estack in 
        ({hd with estack = (estack @ stack); einstr = ins}) 
        :: (merger_stack_ins tl stack ins)
      ) 
let rec merger_iter tl_list ins pre =
  match tl_list with
    | [] -> []
    | hd :: tl ->
     (
        if check_failwith hd.estack then 
          (
            ({hd with einstr = []; epredicate = pre}) :: (merger_iter tl ins pre)

          )
        else 
          (
            ({hd with einstr = ins; epredicate = pre}) :: (merger_iter tl ins pre)

          )
      )
       
let rec merger_compare tl_list b1 ty3 b2 ty4 ins=
  match tl_list with
    | [] -> []
    | hd :: tl ->
      (
        match hd.estack with
          | hd_stack :: tl_stack ->
            if hd_stack.eterm = SInt 0 then
              ({hd with einstr = COMPARE :: ins; 
              estack = {eterm = b1; etype = ty3} 
              :: {eterm = b2; etype = ty4} :: tl_stack}) 
              :: (merger_compare tl b1 ty3 b2 ty4 ins)
            else 
              ({hd with einstr = ins}) 
              :: (merger_compare tl b1 ty3 b2 ty4 ins)
          | _ -> ({hd with einstr = ins}) 
              :: (merger_compare tl b1 ty3 b2 ty4 ins)
      )
(* Functions for MEM instruction *)
let rec merger_compare_men tl_temp s1 tl2 ins =
  match tl_temp with
    | [] -> []
    | hd :: tl -> 
      (
        match hd.estack with
          | hd_stack :: tl_stack ->
            (
              match hd_stack.eterm with
                | SInt 0 -> 
                  ({hd with einstr = ins; estack = ({eterm =  SBool true; etype = TBool} :: tl_stack)})
                  :: (merger_compare_men tl s1 tl2 ins)
                | SInt (-1) -> {hd with einstr = ins; estack = ({eterm =  SBool false; etype = TBool} :: tl_stack)} :: 
                  (merger_compare_men tl s1 tl2 ins)
                | SInt 1 -> {hd with einstr = (MEM :: ins); estack = (s1 :: tl2 :: tl_stack)} :: 
                  (merger_compare_men tl s1 tl2 ins)
                | _ -> raise (FunctionFail "merger_compare_men: Wrong Compare Result")
            )
          | [] -> raise (FunctionFail "merger_compare_men: Emprty Stack Result")
      )
(* Matching two types *)
let rec compare_ty ty1 ty2 =
  match (ty1, ty2) with
  | (TBool, TBool)
  | (TInt, TInt)
  | (TNat, TNat)
  | (TString, TString)
  | (TUnit, TUnit)
  | (TAddress, TAddress)
  | (TChain_id, TChain_id)
  | (TMutez, TMutez)
  | (TTimestamp, TTimestamp)
  | (TOperation, TOperation)
  | (TKey, TKey)
  | (TKey_hash, TKey_hash)
  | (TSignature, TSignature)
  | (TBytes, TBytes)
  | (TBls12_381_g1, TBls12_381_g1)
  | (TBls12_381_g2, TBls12_381_g2)
  | (TBls12_381_fr, TBls12_381_fr)
  | (TChest, TChest)
  | (TChest_key, TChest_key)
  | (TTx_rollup_12_address, TTx_rollup_12_address)
  | (TNever, TNever) -> true
  | (TSapling_transaction i1, TSapling_transaction i2)
  | (TSapling_state i1, TSapling_state i2) -> (i1 = i2)
  | (TTicket sty1, TTicket sty2) -> compare_ty sty1 sty2
  | (TList sty1, TList sty2) -> compare_ty sty1 sty2
  | (TOption sty1, TOption sty2) -> compare_ty sty1 sty2
  | (TSet sty1, TSet sty2)  -> compare_ty sty1 sty2
  | (TContract sty1, TContract sty2) -> compare_ty sty1 sty2
  | (TMap (sty1, sty2), TMap (sty3, sty4)) -> 
    (compare_ty sty1 sty2) && (compare_ty sty3 sty4)
  | (TBig_map (sty1, sty2), TBig_map (sty3, sty4)) -> 
    (compare_ty sty1 sty2) && (compare_ty sty3 sty4)
  | (TOr (sty1, sty2), TOr (sty3, sty4) ) -> 
    (compare_ty sty1 sty2) && (compare_ty sty3 sty4)
  | (TPair (sty1, sty2), TPair (sty3, sty4)) -> 
    (compare_ty sty1 sty2) && (compare_ty sty3 sty4)
  | (TLambda (sty1, sty2), TLambda (sty3, sty4)) -> 
    (compare_ty sty1 sty2) && (compare_ty sty3 sty4)
  | _ -> false
(* Make an system state with a given inital stack and a list of instructions *)
let mk_sbsystem stack instr = 
  {
    einstr = instr;
    estack = stack;
    epredicate = [];
    ecounter = 0;
    eloop = 0;
  }

(* Compare two numbers of type int. *)
let compare_num x y = Int.compare x y
(* Compare two bools. *)
let compare_bool x y = Bool.compare x y
(* Compare two strings *)
let compare_str x y = String.compare x y
(* Compare two bytes *)
let compare_bytes x y = Bytes.compare x y
(* And two bools. *)
let and_bool x y = (x && y)
(* Not a bool. *)
let not_bool x = not x
(* Or two bools. *)
let or_bool x y = x || y
(* Xor two bools. *)
let xor_bool x y = 
  match x, y with
    | true, true -> false
    | false, false -> false
    | _ -> true
(* The functions for ITER instruction *)
let rec syb_stack_iter s index = 
  match s with
    | [] -> []
    | hd :: tl ->
      {eterm = SVar ("y_iter", index, hd.etype); etype = hd.etype} :: (syb_stack_iter tl (index + 1))
let rec check_similar_iter s hd3 = 
  match s with 
    | [] -> true
    | (t, ty, p) :: tl ->
      if (t != hd3.eterm) then false
      else check_similar_iter tl hd3
let rec combine_stack_iter s1 s2 s3 ty l =
  match s1, s2, s3 with 
    | [], [], [] -> []
    | (hd1 :: tl1), (hd2 :: tl2), (hd3 :: tl3) ->
      (
        if  (not (check_similar_iter hd2 hd3)) then
          (
            let f = SFuncl (hd1.eterm, SVar ("x_iter", 0, ty),  hd2) in
              {hd3 with eterm =  SFold (f, hd3.eterm, l)} :: 
              (combine_stack_iter tl1 tl2 tl3 ty l)
          )
        else (hd3 :: (combine_stack_iter tl1 tl2 tl3 ty l))
      )
    | _ -> raise (FunctionFail "combine_stack_iter: Wrong Stack Result")
let rec sub_combine_stack_iter s1 s2 hd s3 ty l =
  match s1, s2, s3 with 
    | [], [], [] -> []
    | (hd1 :: tl1), (hd2 :: tl2), (hd3 :: tl3) ->
        (
          if (not (check_similar_iter hd2 hd1)) then
            (
              let f = SFuncl (hd1.eterm, SVar ("x_iter", 0, ty),  hd2 @ hd) in
              {hd3 with eterm =  SFold (f, hd3.eterm, l)} :: 
              (sub_combine_stack_iter tl1 tl2 hd tl3 ty l)
            )
          else (hd3 :: (sub_combine_stack_iter tl1 tl2 hd tl3 ty l))
        )
    |  _ -> raise (FunctionFail "sub_combine_stack_iter: Wrong Stack Result")

let classify_combine_stack_iter s1 (s2, s2') s3 ty l =
  match s2' with
    | [] -> combine_stack_iter s1 s2 s3 ty l
    | hd :: [] -> sub_combine_stack_iter s1 s2 hd s3 ty l
    | _ -> raise (FunctionFail "classify_combine_stack_iter: Wrong Stack Result")

let rec add_predicate_iter s p =
  match s with 
    | [] -> []
    | hd :: tl -> (hd.eterm, hd.etype, p) :: add_predicate_iter tl p
  
let rec collect_sys_iter = function
    | [] -> []
    | hd :: tl -> (add_predicate_iter hd.estack hd.epredicate) :: collect_sys_iter tl


let add_left_element_listpair e (l1, l2) = (e :: l1, l2)
let add_right_element_listpair e (l1, l2) = (l1, e :: l2)
let rec check_failwith_stack = function
    | [] -> false
    | (t, ty, p) :: tl -> 
      (
        if (ty = TError) then true 
        else check_failwith_stack tl
      )
let rec classify = function
    | [] -> ([], [])
    | s :: tl ->
      (
        if (check_failwith_stack s = true) then add_right_element_listpair s (classify tl)
        else add_left_element_listpair s (classify tl)   
      )
let classify_collect_sys_iter sbsys = sbsys |> collect_sys_iter |> classify
let rec add_stack_iter s1 s2 =
  match s1, s2 with
    | [], [] -> []
    | (hd1 :: tl1), [] -> (hd1 :: []) :: (add_stack_iter tl1 [])
    | (hd1 :: tl1) ,  (hd2 :: tl2) -> (List.cons hd1 hd2) :: (add_stack_iter tl1 tl2)
    | _ -> raise (FunctionFail "add_stack_iter: Wrong Stack Result")
let rec collect_stack_iter = function
    | [] -> []
    | hd :: tl -> add_stack_iter hd (collect_stack_iter tl)
let classify_collect_stack_iter (l1, l2) = (collect_stack_iter l1, l2)
let classify_get_stack_iter sbsys = sbsys |> classify_collect_sys_iter |> classify_collect_stack_iter
let classify_modify_iter sbsys s1 s0 ty l = 
    { einstr = [];
      estack = classify_combine_stack_iter s1 (classify_get_stack_iter sbsys) s0 ty l;
      epredicate = [];
      ecounter = 0;
      eloop = 0;
    } :: []
(* Concat a list of strings. *)
let rec concat_string e = 
  match e with
    | SList [] -> SString ""
    | SEmpty (TList TString) -> SString ""
    | SList (hd :: tl) -> 
      (
        match hd, (concat_string (SList tl)) with 
        | SString x, SString y -> SString (x ^ y)
        | _ -> SFconcat_string (hd, concat_string (SList tl))
      )      
    | _ -> 
      (
        let f = SFunc (SVar ("x_string", 0, TString), SVar ("y_string", 0, TString),  
        SFconcat_string (SVar ("x_string", 0, TString), SVar ("y_string", 0, TString))) in
        SFold (f, SString "", e)
      )
(* Concat a list of bytes. *)
let rec concat_byte e =  
  match e with
    | SList [] -> SBytes Bytes.empty
    | SEmpty (TList TBytes) -> SBytes Bytes.empty
    | SList (hd :: tl) -> 
      (
        match hd, (concat_string (SList tl)) with 
        | SBytes x, SBytes y -> SBytes (Bytes.cat x y)
        | _ -> SFconcat_bytes (hd, concat_byte (SList tl))
      )      
    | _ -> 
      (
        let f = SFunc (SVar ("x_byte", 0, TBytes), SVar ("y_byte", 0, TBytes),  
        SFconcat_bytes (SVar ("x_byte", 0, TBytes), SVar ("y_byte", 0, TBytes))) in
        SFold (f, SBytes Bytes.empty, e)
      )

(* Verify whether a stack contains "failwith" statement. *)
let check_failwith_stack = function
    | {eterm = SFailwith x; _} :: tl -> true
    | _  -> false

(* The list of the sub-functions for LOOP *)
(* Transform a provided stack into a stack comprising purely of symbolic loop variables. *)
let rec syb_stack_loop s index = 
  match s with
    | [] -> []
    | hd :: tl ->
      {eterm = SVar ("sbvar_loop", index, hd.etype); etype = hd.etype} 
      :: (syb_stack_loop tl (index + 1))

(* Create a collection of looping functions that accept 
a list of variables as input and return the corresponding element in a stack [s2]. 
These looping functions iterates multiple times using the initial values defined in the list [l0]. *)
let rec define_func_loop l_var l0 = function
    | [] -> []
    | (hd2 :: tl2) ->
      (
        let f = SFuncLoop (l_var, hd2.eterm, l0) in 
        {eterm = f; etype = hd2.etype} 
        :: (define_func_loop l_var l0 tl2)  
      )
(* Retrieve the list of variables from a stack of variables to use as input for the looping functions. *)
let rec get_var_list_loop = function
    | [] -> []
    | hd :: tl -> (hd.eterm) :: (get_var_list_loop tl)
(* Retrieve the list of initial values from a stack before looping to use as input for the looping functions. *)
let rec get_s0_list_loop = function
    | [] -> []
    | hd :: tl -> (hd.eterm) :: (get_s0_list_loop tl)

(* Separate the first element of a stack from the remaining elements. *)
let separete_stack_loop = function
    | hd :: tl -> (hd.eterm, tl)
    | [] -> raise (FunctionFail "separete_stack_loop: Empty Stack")
(* Define a stack for LOOP *)
let rec get_sys_loop l1 sys_list l0 =
  match sys_list with
    | [] -> []
    | hd :: tl ->
      (
        if check_failwith_stack (hd.estack) then
          hd :: (get_sys_loop l1 tl l0)
        else 
          (
            match separete_stack_loop (hd.estack) with
              | (SBool true, s) -> 
                (
                  if hd.epredicate = [] then
                    hd :: (get_sys_loop l1 tl l0)
                  else 
                    (
                      let pre_predicate = hd.epredicate in
                      {hd with estack = (define_func_loop l1 l0 s); 
                      epredicate = [SSat_true pre_predicate] } :: (get_sys_loop l1 tl l0)
                    )
                    
                )
              | (SBool false, s) -> 
                (
                  if hd.epredicate = [] then
                    hd :: (get_sys_loop l1 tl l0)
                  else
                    (
                      let pre_predicate = hd.epredicate in
                      {hd with estack = (define_func_loop l1 l0 s); 
                      epredicate = [SSat_false pre_predicate]} :: (get_sys_loop l1 tl l0)
                    )
                )
              | _ -> raise (FunctionFail "get_sys_loop: Invalid Stack Top")
          )
      )
(* Define a stack for LOOP_LEFT *)
let rec get_sys_loop_left l1 sys_list l0 =
  match sys_list with
    | [] -> []
    | hd :: tl ->
      (
        if check_failwith_stack (hd.estack) then
          hd :: (get_sys_loop_left l1 tl l0)
        else 
          (
            match separete_stack_loop (hd.estack) with
              | (SLeft x, s) -> 
                (
                  if hd.epredicate = [] then
                    hd :: (get_sys_loop_left l1 tl l0)
                  else 
                    (
                      let pre_predicate = hd.epredicate in
                      {hd with estack = (define_func_loop l1 l0 s); 
                      epredicate = [SSat_true pre_predicate] } :: (get_sys_loop_left l1 tl l0)
                    )
                    
                )
              | (SRight x, s) -> 
                (
                  if hd.epredicate = [] then
                    hd :: (get_sys_loop l1 tl l0)
                  else
                    (
                      let pre_predicate = hd.epredicate in
                      {hd with estack = (define_func_loop l1 l0 s); 
                      epredicate = [SSat_false pre_predicate]} :: (get_sys_loop_left l1 tl l0)
                    )
                )
              | _ -> raise (FunctionFail "get_sys_loop_left: Invalid Stack Top")
          )
      )
(* Check wherether the predication list in a system state is empty (for LOOP)*)
let rec check_predicate_loop sys =
  match sys with
    | [] -> true
    | hd :: tl ->
      if (hd.epredicate = []) then check_predicate_loop tl
      else false
(* Combine the system state list generated from executing 
an instruction list for a LOOP instruction with the main execution state. *)
let rec merger_ins_pre_loop tl_list ins pre =
  match tl_list with
    | [] -> []
    | hd :: tl ->
      (
        if (check_failwith_stack hd.estack) then
          (
            let pre_predicate = hd.epredicate in
            ({hd with einstr = []; epredicate = pre @ pre_predicate}) :: (merger_ins_pre_loop tl ins pre)
          )
        else
          (
            let pre_predicate = hd.epredicate in
            ({hd with einstr = ins; epredicate = pre @ pre_predicate}) :: (merger_ins_pre_loop tl ins pre)
          )   
      )
(* MAP sub-functions *)
let rec combine_map_head hd tl =
  match hd.estack with
    | {eterm = hd'; etype = ty} :: [] ->
      (
         match tl with
          | [] -> []
          | hd1 :: tl1 -> 
            (
              match hd1.estack with
                | {eterm = tl'; etype = TList ty1} :: [] -> 
                  (
                    let pre_hd = hd.epredicate in
                    let pre_tl = hd1.epredicate in
                    {hd with estack = ({eterm = SCons (hd', tl'); etype = TList ty1} :: []); epredicate = pre_hd @ pre_tl} :: (combine_map_head hd tl1)
                  )
                | _ -> raise (FunctionFail "combine_map_head")
            )
      )
    | _ -> raise (FunctionFail "combine_map_head")
 
let rec combine_map s_hd s_tl  = 
  match s_hd with
    | [] -> []
    | hd :: tl ->
      (
        (combine_map_head hd s_tl) @ combine_map tl s_tl
      )

let rec merger_map sys s ins pre = 
  match sys with
    | [] -> []
    | hd :: tl -> 
      (
        let pre_stack = hd.estack in
        let pre_predicate = hd.epredicate in
        {hd with estack = pre_stack @ s; einstr = ins; epredicate = pre_predicate @ pre} :: (merger_map tl s ins pre)
      )
(* Combine the system state list generated from executing 
the COMPARE instruction for a GET for a map instruction with the main execution state. *)
let rec merger_get_map t1 y m ty2 ty3 tl tl1 = function
  | hd :: temp_tl ->
    (
      match hd.estack with
        | {eterm = SInt -1; etype = TBool} :: [] -> 
          {hd with estack = {eterm = SNone ty3; etype = TOption ty3} :: tl; einstr = tl1} 
          :: (merger_get_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | {eterm = SInt 0; etype = TBool} :: [] -> 
          {hd with estack = {eterm = SSome y; etype = TOption ty3} 
          :: tl; einstr = tl1} :: (merger_get_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | {eterm = SInt 1; etype = TBool} :: [] ->
          {hd with estack = {eterm = t1; etype = ty2} :: {eterm = SMap m; etype = TMap (ty2, ty3)} 
          :: tl; einstr = [COMPARE] @ tl1} :: (merger_get_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | _ -> raise (FunctionFail "merger_get_map: Wrong Compare Result")
    )
  | [] -> []
(* Combine the system state list generated from executing 
the COMPARE instruction for a GET for a big map instruction with the main execution state. *)
let rec merger_get_big_map t1 y m ty2 ty3 tl tl1 = function
  | hd :: temp_tl ->
    (
      match hd.estack with
        | {eterm = SInt -1; etype = TBool} :: [] -> 
          {hd with estack = {eterm = SNone ty3; etype = TOption ty3} :: tl; einstr = tl1} 
          :: (merger_get_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | {eterm = SInt 0; etype = TBool} :: [] -> 
          {hd with estack = {eterm = SSome y; etype = TOption ty3} 
          :: tl; einstr = tl1} :: (merger_get_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | {eterm = SInt 1; etype = TBool} :: [] ->
          {hd with estack = {eterm = t1; etype = ty2} :: {eterm = SBig_Map m; etype = TBig_map (ty2, ty3)} 
          :: tl; einstr = [COMPARE] @ tl1} :: (merger_get_big_map t1 y m ty2 ty3 tl tl1 temp_tl)
        | _ -> raise (FunctionFail "merger_get_big_map: Wrong Compare Result")
    )
  | [] -> []

let first_term_stack  = function
    | [] -> raise (FunctionFail "first_term_stack: Empty Stack")
    | hd :: tl -> hd.eterm

let rec get_list_func sys =
  match sys with
    | [] -> []
    | hd :: tl ->
      (
        ((first_term_stack hd.estack), hd.epredicate) :: get_list_func tl
      )

let get_map_func sys x = SFuncMap (x, get_list_func sys)
let some_map_sbsys = function
  | {eterm = t; etype = ty} :: tl -> {eterm = SSome t; etype = TOption ty} :: tl
  | _ -> raise (FunctionFail "add_some_map: Empty Stack")
let rec add_some_map = function
  | hd :: tl -> 
    (
      let pre_stack = hd.estack in
      {hd with estack = (some_map_sbsys pre_stack)}:: add_some_map tl
    )
  | [] -> []
let add_head_list_fmap ins tl2 ty sbsys = 
  match sbsys.estack with
    | hd :: tl -> {sbsys with einstr = ins; estack = ({eterm = (SList tl2); etype = TList ty} :: tl) @ [hd]}
    | [] -> raise (FunctionFail "add_head_list_fmap: Empty Stack")
let rec combine_head_list_fmap ty tl2 ins = function
  | hd :: tl -> (add_head_list_fmap ins tl2 ty hd) :: (combine_head_list_fmap ty tl2 ins tl)
  | [] -> []
let add_head_map_fmap ins tl2 ty1 ty2 sbsys = 
  match sbsys.estack with
    | hd :: tl -> {sbsys with einstr = ins; estack = ({eterm = (SMap tl2); etype = TMap (ty1, ty2)} :: tl) @ [hd]}
    | [] -> raise (FunctionFail "add_head_map_fmap: Empty Stack")
let rec combine_head_map_fmap ty1 ty2 tl2 ins = function
  | hd :: tl -> (add_head_map_fmap ins tl2 ty1 ty2 hd) :: (combine_head_map_fmap ty1 ty2 tl2 ins tl)
  | [] -> []
let rec get_last_of_list_fmap = function
  | [] -> raise (FunctionFail "get_last_of_list_map: Empty Stack")
  | hd :: [] -> hd
  | hd :: tl -> get_last_of_list_fmap tl
let get_first_of_list_fmap = function
  | [] -> raise (FunctionFail "get_first_of_list_fmap: Empty Stack")
  | hd :: tl -> hd
let rec get_not_last_of_list_fmap = function
  | [] -> raise (FunctionFail "get_last_of_list_map: Empty Stack")
  | hd :: [] -> []
  | hd :: tl -> hd :: (get_not_last_of_list_fmap tl)
let rec merger_list_fmap tl1 = function
  | hd :: tl -> 
    (
      let d' = get_last_of_list_fmap hd.estack in
      let tl' = get_first_of_list_fmap hd.estack in 
      let s'' = get_not_last_of_list_fmap hd.estack in
      {hd with einstr = tl1; estack = {eterm = SCons ((d'.eterm), (tl'.eterm)); etype = TList d'.etype} :: s''} :: (merger_list_fmap  tl1 tl)
    )
  | [] -> []
let merger_map_fmap k tl1 = function
  | hd :: tl -> 
    (
      let d' = get_last_of_list_fmap hd.estack in
      let tl' = get_first_of_list_fmap hd.estack in 
      let s'' = get_not_last_of_list_fmap hd.estack in
      {hd with einstr = tl1; estack = {eterm = SCons (SElt (k, (d'.eterm)), (tl'.eterm)); etype = tl'.etype} :: s''} :: (merger_list_fmap  tl1 tl)
    )
  | [] -> []
(* Given a stack [s] and a number [n], produce a new stack 
with the element at position [n] at the top. *)
let rec dig_n n head = function
  | hd :: tl -> 
    (
      if n = 0 then [hd] @ head @ tl 
      else dig_n (n-1) (head @ [hd]) tl
    )
  | [] -> raise (FunctionFail "dig_n: The index is out of the Stack")
(* Split a stack [s] at a particular position [n], create two new stacks 
where the first stack contains elements up to position [n], 
and the second stack contains the remaining elements beyond position [n]. *) 
let rec dip_n n head l = 
  if n = 0 then (head, l)
  else 
    (
      match l with 
      | hd :: tl -> dip_n (n-1) (head @ [hd]) tl
      | [] -> raise (FunctionFail "dip_n: The index is out of the Stack") 
    ) 
  
(* Consumes a stack that contains at least n elements. 
It duplicates the nth element of the stack and pushes the duplicate at the top of the stack *)
let rec dup_n n head = function
  | hd :: tl -> 
    (
      if n = 1 then [hd] @ head @ [hd] @ tl
      else dup_n (n-1) (head @ [hd]) tl
    )
  | [] -> raise (FunctionFail "dup_n: The index is out of the Stack") 
(* Drops the n topmost elements of the stack. In particular, drop_n 0 is a noop. *)
let rec drop_n n = function
  | hd :: tl -> 
    (
      if n = 0 then tl
      else drop_n (n-1) tl
    )
  | [] -> raise (FunctionFail "drop_n: The index is out of the Stack") 
(* dug_n consumes an element and a stack [s] that contains at least [n] elements
and inserts it at the nth level in the stack. 
The element on top of the stack is at depth 0 so that [dug_n 0 s] is a no-op *)
let rec dug_n n e head = function
  | hd :: tl -> 
    (
      if n = 0 then head @ (e :: tl)
      else dug_n (n-1) e (head @ [hd]) tl
    )
  | [] -> raise (FunctionFail "dug_n: The index is out of the Stack") 
(* Get size of a list, set and map *)
let rec get_size = function
  | hd :: tl -> 1 + get_size tl
  | [] -> 0 
(* Fold [n] values on the top of the stack [s] into a right comb.  *)
let rec pair_n n l = 
  if n >= 2 then 
    (
      match l with
        | hd1 :: hd2 :: tl -> pair_n (n-2) ({eterm = SPair (hd1.eterm, hd2.eterm); 
          etype = TPair (hd1.etype, hd2.etype)} :: tl) 
        | _ -> raise (FunctionFail "get_size: The index is out of the Stack") 
     )
  else l
(* Unfold [n] values from a right comb on the top of the stack [s]. 
  unpair_n 0 and unpair_n 1 are rejected. unpair_n 2 is equivalent to unpair. *)
let rec unpair_n n l = 
  if n >= 2 then 
    (
      match l with
        | {eterm = SPair (t1, t2); etype = TPair (ty1, ty2)} :: tl -> 
          unpair_n (n-1) ({eterm = t1; etype = ty1} :: {eterm = t2; etype = ty2} :: tl) 
        | _ -> raise (FunctionFail "get_size: The index is out of the Stack") 
    )
  else l
(* Functions for UPDATE instructions *)
let rec  merger_set_update_1 y tl1 tl = function
  | hd :: tl3 ->
    (
      match hd.estack with
        | {eterm = SSet tl'; etype = TSet ty} :: [] ->
          {hd with einstr = tl1; estack = {eterm = SSet (y :: tl'); etype = TSet ty} :: tl} 
          :: (merger_set_update_1 y tl1 tl tl3)
        | {eterm = tl'; etype = TSet ty} :: []  -> 
          {hd with einstr = tl1; estack = {eterm = SCons (y, tl'); etype = TSet ty} :: tl} 
          :: (merger_set_update_1 y tl1 tl tl3)
        | _ -> raise (FunctionFail "merger_set_update_1: Wrong Stack Result")
    )
  | [] -> []
let rec merger_set_update x b y tl2 tl1 tl ty = function
  | hd :: tl3 -> 
    (
      match hd.estack with
        | {eterm = SInt 0; etype = TInt} :: [] -> 
          (
            match b with
              | SBool false -> {hd with einstr = tl1; estack =  {eterm = SSet tl2; etype = TSet ty} :: tl} :: (merger_set_update x b y tl2 tl1 tl ty tl3)
              | SBool true -> {hd with einstr = tl1; estack =  {eterm = SSet (y :: tl2); etype = TSet ty} :: tl} :: (merger_set_update x b y tl2 tl1 tl ty tl3)
              | _ -> 
                (
                  let predicate1 = (SEq (b, SBool false)) :: hd.epredicate in
                  let predicate2 = (SEq (b, SBool true)) :: hd.epredicate in
                  {hd with einstr = tl1; estack =  {eterm = SSet tl2; etype = TSet ty} :: tl; epredicate = predicate1} :: 
                  {hd with einstr = tl1; estack =  {eterm = SSet (y :: tl2); etype = TSet ty} :: tl; epredicate = predicate2} :: 
                  (merger_set_update x b y tl2 tl1 tl ty tl3) 
                )
          )
        | {eterm = SInt -1; etype = TInt} :: [] ->
          (
            match b with
              | SBool false -> {hd with einstr = tl1; estack =  {eterm = SSet (y :: tl2); etype = TSet ty} :: tl} :: (merger_set_update x b y tl2 tl1 tl ty tl3)
              | SBool true -> {hd with einstr = tl1; estack =  {eterm = SSet (x :: y :: tl2); etype = TSet ty} :: tl} :: (merger_set_update x b y tl2 tl1 tl ty tl3)
              | _ -> 
                (
                  let predicate1 = (SEq (b, SBool false)) :: hd.epredicate in
                  let predicate2 = (SEq (b, SBool true)) :: hd.epredicate in
                  {hd with einstr = tl1; estack =  {eterm = SSet (y :: tl2); etype = TSet ty} :: tl; epredicate = predicate1} :: 
                  {hd with einstr = tl1; estack =  {eterm = SSet (x :: y :: tl2); etype = TSet ty} :: tl; epredicate = predicate2} :: 
                  (merger_set_update x b y tl2 tl1 tl ty tl3) 
                )
          )
        | {eterm = SInt 1; etype = TInt} :: [] ->
          (
            raise (FunctionFail "merger_set_update: Wrong Stack Result")
            (*let temp_sbsys_list =  interpeter [{hd with einstr = [COMPARE]; 
            estack = []}] n in []
              
             interpeter ({hd with einstr = [UPDATE]; 
            estack = ({eterm = x; etype = ty} :: {eterm = b; etype = TBool} :: {eterm = SSet tl2; etype = TSet ty} :: [])} :: []) in []
            (merger_set_update_1 y tl1 tl temp_sbsys_list) @ (merger_set_update x b y tl2 tl1 tl ty n tl3)*)
          )
        | _ -> raise (FunctionFail "merger_set_update: Wrong Stack Result")
    )
  | [] -> []

(* Symbolic execution *)
(* Input: a list of the system states and an index indicating the current symbolic variable index. *)
(* Output: a list of the system states *)
let rec interpeter =  function
    | [] -> []
    | sbsys :: sbsys_tl ->
      (
        match sbsys.einstr with
          | [] -> sbsys :: (interpeter sbsys_tl)
          | ins :: tl1 ->
            (
              match ins with
                | APPLY -> 
                  (
                    match sbsys.estack with
                      | {eterm = t; etype = ty1} :: {eterm = SInstr l1; etype = TLambda (TPair (ty1', ty2), ty3)} :: tl -> 
                          (
                            if (ty1' = ty1) then
                              (
                                interpeter ({sbsys with einstr = tl1; estack = ({eterm = SInstr ([PUSH (ty1, t); PAIR] @ l1); 
                                etype = TLambda (ty2, ty3)} :: tl)} :: sbsys_tl)
                              )
                            else raise (WrongTypeFor "APPLY")
                          )
                      | _ -> raise (WrongTypeFor "APPLY")
                  )
                | EXEC ->
                  (
                    match sbsys.estack with
                      | {eterm = t; etype = ty1} :: 
                        {eterm = SInstr l1; etype = TLambda (ty1', ty2)} :: tl -> 
                          if ty1 = ty1' then 
                            (
                              interpeter ({sbsys with einstr = l1 @ tl1; estack = ({eterm = t; etype = ty1} :: tl)} :: sbsys_tl)
                            )
                          else raise (WrongTypeFor "EXEC")
                      | _ -> raise (WrongTypeFor "EXEC")
                  )
                | ADD ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.add x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.add x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.add x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SNat (Int.add x y); 
                        etype = TNat} :: tl)} :: sbsys_tl)
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SMutez y; etype = TMutez} :: tl ->  
                        interpeter ({sbsys with einstr = tl1;  
                        estack = ({eterm = SMutez (Int.add x y); 
                        etype = TMutez} :: tl)} :: sbsys_tl)
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = STimestamp y; etype = TTimestamp} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = STimestamp (Int.add x y); 
                        etype = TTimestamp} :: tl)} :: sbsys_tl)
                      | {eterm = STimestamp x; etype = TTimestamp} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = STimestamp (Int.add x y); 
                        etype = TTimestamp} :: tl)} :: sbsys_tl)
                      | s1 :: s2 :: tl -> 
                        (
                          match (s1.etype, s2.etype) with
                            | TInt, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TInt, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TNat, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TNat, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TNat} :: tl)} :: sbsys_tl)
                            | TMutez, TMutez -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TMutez} :: tl)} :: sbsys_tl)
                            | TTimestamp, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TTimestamp} :: tl)} :: sbsys_tl)
                            | TInt, TTimestamp -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAdd (s1.eterm, s2.eterm); 
                              etype = TTimestamp} :: tl)} :: sbsys_tl)  
                            | _ -> raise (WrongTypeFor "ADD")            
                        )
                      | _ -> raise (WrongTypeFor "ADD")
                  )
                | EDIV ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TNat, TNat))); 
                              etype = (TOption (TPair (TNat, TNat)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SNat (Int.div x y), SNat (Int.rem x y)))); 
                              etype = (TOption (TPair (TNat, TNat)))} :: tl)} :: sbsys_tl)
                          )
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SInt (Int.div x y), SNat (Int.rem x y)))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                          )
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SInt (Int.div x y), SNat (Int.rem x y)))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                          )
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SInt (Int.div x y), SNat (Int.rem x y)))); 
                              etype = (TOption (TPair (TInt, TNat)))} :: tl)} :: sbsys_tl)
                          )
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TMutez, TMutez))); 
                              etype = (TOption (TPair (TMutez, TMutez)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SMutez (Int.div x y), SMutez (Int.rem x y)))); 
                              etype = (TOption (TPair (TMutez, TMutez)))} :: tl)} :: sbsys_tl)
                          )
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SMutez y; etype = TMutez} :: tl ->  
                          (
                            if (y = 0) then 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SNone (TPair (TNat, TMutez))); 
                              etype = (TOption (TPair (TNat, TMutez)))} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = (SSome (SPair (SNat (Int.div x y), SMutez (Int.rem x y)))); 
                              etype = (TOption (TPair (TNat, TMutez)))} :: tl)} :: sbsys_tl)
                          )
                      | s1 :: s2 :: tl -> 
                        (
                          let pre = sbsys.epredicate in 
                            (
                              match (s1.etype, s2.etype) with
                                | TNat, TNat -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TNat, TNat))); 
                                  etype = (TOption (TPair (TNat, TNat)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SNat 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TNat, TNat)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SNat 0))) :: pre} :: sbsys_tl) 
                                | TNat, TInt -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SInt 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SInt 0))) :: pre} :: sbsys_tl)                                 
                                | TInt, TNat -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SNat 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SNat 0))) :: pre} :: sbsys_tl) 
                                | TInt, TInt -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TInt, TNat))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SInt 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TInt, TNat)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SInt 0))) :: pre} :: sbsys_tl) 
                                | TMutez, TNat -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TMutez, TMutez))); 
                                  etype = (TOption (TPair (TMutez, TMutez)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SNat 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TMutez, TMutez)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SNat 0))) :: pre} :: sbsys_tl) 
                                | TMutez, TMutez -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone (TPair (TNat, TMutez))); 
                                  etype = (TOption (TPair (TNat, TMutez)))} :: tl);
                                  epredicate = (SEq (s2.eterm, SMutez 0)) :: pre} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SSome (SPair (SDiv (s1.eterm, s2.eterm), SRem (s1.eterm, s2.eterm)))); 
                                  etype = (TOption (TPair (TNat, TMutez)))} :: tl);
                                  epredicate = (SNot (SEq (s2.eterm, SMutez 0))) :: pre} :: sbsys_tl)                                                                                                       
                                | _ -> raise (WrongTypeFor "EDIV")   
                            )                                   
                        )
                      | _ -> raise (WrongTypeFor "EDIV")
                  )
                | MUL ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.mul x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.mul x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.mul x y); 
                        etype = TInt} :: tl)} :: sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SNat (Int.mul x y); 
                        etype = TNat} :: tl)} :: sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SMutez y; etype = TMutez} :: tl ->  
                        interpeter ({sbsys with einstr = tl1;  
                        estack = ({eterm = SMutez (Int.mul x y); 
                        etype = TMutez} :: tl)} :: sbsys_tl)
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1;  
                        estack = ({eterm = SMutez (Int.mul x y); 
                        etype = TMutez} :: tl)} :: sbsys_tl)
                      | s1 :: s2 :: tl -> 
                        (
                          match (s1.etype, s2.etype) with
                            | TInt, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TInt, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TNat, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TInt} :: tl)} :: sbsys_tl)
                            | TNat, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TNat} :: tl)} :: sbsys_tl)
                            | TMutez, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TMutez} :: tl)} :: sbsys_tl)
                            | TNat, TMutez -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SMul (s1.eterm, s2.eterm); 
                              etype = TMutez} :: tl)} :: sbsys_tl)
                            | _ -> raise (WrongTypeFor "MUL")            
                        )
                      | _ -> raise (WrongTypeFor "MUL")
                  )
                | SUB ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.sub x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.sub x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.sub x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SNat y; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SNat (Int.sub x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SMutez y; etype = TMutez} :: tl ->  
                          (
                            if (Int.sub x y >= 0) then 
                              interpeter ({sbsys with einstr = tl1;  
                              estack = ({eterm = SSome (SMutez (Int.sub x y)); 
                              etype = TOption TMutez} :: tl)} :: sbsys_tl)
                            else 
                              interpeter ({sbsys with einstr = tl1;  
                              estack = ({eterm = SNone TMutez; 
                              etype = TOption TMutez} :: tl)} :: sbsys_tl)
                          )
                        
                      | {eterm = STimestamp x; etype = TTimestamp} :: 
                        {eterm = SInt y; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = STimestamp (Int.sub x y); etype = TTimestamp} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = STimestamp x; etype = TTimestamp} :: 
                        {eterm = STimestamp y; etype = TTimestamp} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.sub x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | s1 :: s2 :: tl -> 
                        (
                          match (s1.etype, s2.etype) with
                            | TInt, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TInt, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TNat, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TNat, TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TMutez, TMutez -> 
                              let pre = sbsys.epredicate in 
                                (
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SSome (SSub (s1.eterm, s2.eterm)); etype = TOption TMutez} :: tl);
                                  epredicate = ((SGe (SSub (s1.eterm, s2.eterm), SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = (SNone TMutez); etype = TOption TMutez} :: tl);
                                  epredicate = ((SNot (SGe (SSub (s1.eterm, s2.eterm), SInt 0))) :: pre)} :: 
                                  sbsys_tl)
                                )
                            | TTimestamp, TTimestamp -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TTimestamp, TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SSub (s1.eterm, s2.eterm); etype = TTimestamp} :: tl)} :: 
                              sbsys_tl) 
                            | _ -> raise (WrongTypeFor "SUB")            
                        )
                      | _ -> raise (WrongTypeFor "SUB")
                  )
                | NEG ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SNat x; etype = TNat} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.neg x); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (Int.neg x); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | s1 :: tl -> 
                        (
                          match s1.etype with
                            | TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SNeg (s1.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SNeg (s1.eterm); etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | _ -> raise (WrongTypeFor "NEG")            
                        )
                      | _ -> raise (WrongTypeFor "NEG")
                  )
                | COMPARE ->  
                  ( 
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: 
                        {eterm = SInt y; etype = TInt} :: tl 
                      | {eterm = SNat x; etype = TNat} :: 
                        {eterm = SNat y; etype = TNat} :: tl 
                      | {eterm = SMutez x; etype = TMutez} :: 
                        {eterm = SMutez y; etype = TMutez} :: tl 
                      | {eterm = STimestamp x; etype = TTimestamp} :: 
                        {eterm = STimestamp y; etype = TTimestamp} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (compare_num x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SUnit; etype = TUnit} :: 
                        {eterm = SUnit; etype = TUnit} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt 0; etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SBool x; etype = TBool} :: 
                        {eterm = SBool y; etype = TBool} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (compare_bool x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | {eterm = SBytes x; etype = TBytes} :: 
                        {eterm = SBytes y; etype = TBytes} :: tl ->
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (compare_bytes x y); etype = TInt} :: tl)} :: 
                        sbsys_tl) 
                      | {eterm = SString x; etype = TString} :: 
                        {eterm = SString y; etype = TString} :: tl
                      | {eterm = SKey_Hash x; etype = TKey_hash} :: 
                        {eterm = SKey_Hash y; etype = TKey_hash} :: tl 
                      | {eterm = SKey x; etype = TKey} :: {eterm = SKey y; etype = TKey} :: tl 
                      | {eterm = SSignature x; etype = TSignature} :: 
                        {eterm = SSignature y; etype = TSignature} :: tl  
                      | {eterm = SChain_Id x; etype = TChain_id} :: 
                        {eterm = SChain_Id y; etype = TChain_id} :: tl 
                      | {eterm = SAddress x; etype = TAddress} :: 
                        {eterm = SAddress y; etype = TAddress} :: tl ->  
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt (compare_str x y); etype = TInt} :: tl)} :: 
                        sbsys_tl)  
                      | {eterm =  SNone ty; etype = TOption ty1} :: 
                        {eterm = SSome y; etype = TOption ty2} :: tl -> 
                        if compare_ty ty1 ty2 then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SInt (-1); etype = TInt} :: tl)} :: sbsys_tl)   
                        else raise (WrongTypeFor "COMPARE") 
                      | {eterm = SSome x; etype = TOption ty1} :: 
                        {eterm = SNone ty; etype = TOption ty2} :: tl -> 
                        if compare_ty ty1 ty2 then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SInt 1; etype = TInt} :: tl)} :: sbsys_tl)  
                        else raise (WrongTypeFor "COMPARE")  
                      | {eterm = SSome x;  etype = TOption ty1} :: 
                        {eterm = SSome y; etype = TOption ty2} :: tl -> 
                        if compare_ty ty1 ty2 then
                          (
                            let sbsys_temp = interpeter ([{einstr = [COMPARE]; 
                            estack = {eterm = x; etype = ty1} :: {eterm = y; etype = ty1} :: [];
                            epredicate = []; ecounter = sbsys.ecounter; eloop = sbsys.eloop}]) in
                            interpeter ((merger_systems_for_compare_pair tl1 tl (sbsys.epredicate) sbsys_temp) @ sbsys_tl)  
                          )  
                        else raise (WrongTypeFor "COMPARE")    
                      | {eterm =  SPair (a1, b1); etype = TPair (ty1, ty2)} :: 
                        {eterm =  SPair (a2, b2); etype = TPair (ty3, ty4)} :: tl -> 
                        if (compare_ty ty1 ty3) && (compare_ty ty3 ty4) then
                          (
                            let sbsys_temp = interpeter ([{einstr = [COMPARE]; 
                            estack = {eterm = a1; etype = ty1} :: {eterm = a2; etype = ty3} :: [];
                            epredicate = []; ecounter = sbsys.ecounter; eloop = sbsys.eloop}]) in
                            let modify_sbsys_temp = modify_systems_for_compare_pair b1 b2 ty2 ty4 sbsys_temp in
                            interpeter ((merger_systems_for_compare_pair tl1 tl (sbsys.epredicate) modify_sbsys_temp) @ sbsys_tl)  
                          )
                        else raise (WrongTypeFor "COMPARE")  
                      | {eterm =  (SLeft a1); etype = TOr (ty1, ty2)} :: 
                        {eterm =  (SRight a2); etype = TOr (ty3, ty4)} :: tl -> 
                        if (compare_ty ty1 ty3) && (compare_ty ty3 ty4) then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SInt (- 1); etype = TInt} :: tl)} :: sbsys_tl)  
                        else raise (WrongTypeFor "COMPARE") 
                      | {eterm =  (SRight a1); etype = TOr (ty1, ty2)} :: 
                        {eterm =  (SLeft a2); etype = TOr (ty3, ty4)} :: tl -> 
                        if (compare_ty ty1 ty3) && (compare_ty ty3 ty4) then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SInt 1; etype = TInt} :: tl)} :: sbsys_tl)  
                        else raise (WrongTypeFor "COMPARE") 
                      | {eterm =  (SRight a1); etype = TOr (ty1, ty2)} :: 
                        {eterm =  (SRight a2); etype = TOr (ty3, ty4)} :: tl -> 
                        if (compare_ty ty1 ty3) && (compare_ty ty3 ty4) then
                          let tl_temp = interpeter ([{sbsys with einstr = [COMPARE]; 
                          estack = {eterm = a1; etype = ty1} :: {eterm = a2; etype = ty3} :: tl}]) in
                          interpeter ((merger_ins tl1 tl_temp) @ sbsys_tl)  
                        else raise (WrongTypeFor "COMPARE") 
                      | {eterm =  (SLeft a1); etype = TOr (ty1, ty2)} :: 
                        {eterm =  (SLeft a2); etype = TOr (ty3, ty4)} :: tl -> 
                        if (compare_ty ty1 ty3) && (compare_ty ty3 ty4) then
                          let tl_temp = interpeter ([{sbsys with einstr = [COMPARE]; 
                          estack = {eterm = a1; etype = ty1} :: {eterm = a2; etype = ty3} :: tl}]) in
                          interpeter ((merger_ins tl1 tl_temp) @ sbsys_tl)  
                        else raise (WrongTypeFor "COMPARE") 
                      | s1 :: s2 :: tl -> 
                        ( 
                          let pre = sbsys.epredicate in 
                          match (s1.etype, s2.etype) with
                            | TInt, TInt 
                            | TNat, TNat
                            | TMutez, TMutez
                            | TTimestamp, TTimestamp
                            | TBool, TBool
                            | TString, TString 
                            | TBytes, TBytes 
                            | TKey, TKey
                            | TKey_hash, TKey_hash
                            | TSignature, TSignature
                            | TChain_id, TChain_id
                            | TAddress, TAddress -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SInt 1; etype = TInt} :: tl); 
                              epredicate = (SGt (s1.eterm, s2.eterm)) :: pre } 
                              :: {sbsys with einstr = tl1; 
                              estack = ({eterm = SInt (-1); etype = TInt} :: tl); 
                              epredicate = (SLt (s1.eterm, s2.eterm)) :: pre } 
                              :: {sbsys with einstr = tl1; 
                              estack = ({eterm = SInt 0; etype = TInt} :: tl); 
                              epredicate = (SEq (s1.eterm, s2.eterm)) :: pre } 
                              :: sbsys_tl)
                            | TOption ty1, TOption ty2 ->
                              if (ty1 = ty2) then
                                interpeter ({sbsys with einstr = tl1; 
                                estack = ({eterm = SInt 0; etype = TInt} :: tl); 
                                epredicate = (SEq (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt 1; etype = TInt} :: tl); 
                                epredicate = (SGt (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt (-1); etype = TInt} :: tl);
                                epredicate = (SLt (s1.eterm, s2.eterm)) :: pre } 
                                :: sbsys_tl)
                              else raise (WrongTypeFor "COMPARE")  
                            | TOr (ty1, ty2), TOr (ty3, ty4) ->
                              if (ty1 = ty3) && (ty2 = ty4) then
                                interpeter ({sbsys with einstr = tl1; 
                                estack = ({eterm = SInt 0; etype = TInt} :: tl); 
                                epredicate = (SEq (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt 1; etype = TInt} :: tl); 
                                epredicate = (SGt (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt (-1); etype = TInt} :: tl); 
                                epredicate = (SLt (s1.eterm, s2.eterm)) :: pre } 
                                :: sbsys_tl)
                              else raise (WrongTypeFor "COMPARE")  
                            | TPair (ty1, ty2), TPair (ty3, ty4)-> 
                              if (ty1 = ty3) && (ty2 = ty4) then
                                interpeter ({sbsys with einstr = [COMPARE] @ tl1; 
                                estack = ({eterm = SInt 0; etype = TInt} :: tl); 
                                epredicate = (SEq (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt 1; etype = TInt} :: tl); 
                                epredicate = (SGt (s1.eterm, s2.eterm)) :: pre } 
                                :: {sbsys with einstr = tl1; 
                                estack = ({eterm = SInt (-1); etype = TInt} :: tl); 
                                epredicate = (SLt (s1.eterm, s2.eterm)) :: pre } 
                                :: sbsys_tl)
                              else raise (WrongTypeFor "COMPARE") 
                            | _ -> raise (WrongTypeFor "COMPARE")            
                        )
                      | _ -> raise (WrongTypeFor "COMPARE")
                  )
                | CDR -> 
                  (
                    match sbsys.estack with
                      | {eterm = SPair (t1, t2); etype = TPair (ty1, ty2)} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = t2; etype = ty2} :: tl)} :: 
                                      sbsys_tl)
                      | _ -> raise (WrongTypeFor "CDR")
                  )
                | CAR -> 
                  (
                    match sbsys.estack with
                      | {eterm = SPair (t1, t2); etype = TPair (ty1, ty2);} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = t1; etype = ty1} :: tl)} :: 
                                      sbsys_tl)
                      | _ -> raise (WrongTypeFor "CAR")
                  )
                | PAIR -> 
                  (
                    match sbsys.estack with
                      | {eterm = t1; etype = ty1;} :: {eterm = t2; etype = ty2;} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SPair (t1, t2); etype = TPair (ty1, ty2);} :: tl)} :: 
                        sbsys_tl)
                      | _ -> raise (WrongTypeFor "PAIR")
                  )
                | PAIR_N t -> 
                  (
                    match t with
                      | SNat n ->
                        (
                          if n < 2 then raise (WrongTypeFor "PAIR_N")
                          else 
                            (
                              interpeter ({sbsys with einstr = tl1; 
                              estack = (pair_n n sbsys.estack)} :: 
                              sbsys_tl)
                            )
                        )
                      | _ -> raise (WrongTypeFor "PAIR_N")
                  )
                | UNPAIR -> 
                  (
                    match sbsys.estack with
                      | {eterm = SPair (t1, t2); etype = TPair (ty1, ty2);} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = t1; etype = ty1;} :: {eterm = t2; etype = ty2;} :: tl)} :: 
                        sbsys_tl)
                      | _ -> raise (WrongTypeFor "UNPAIR")
                  )
                | UNPAIR_N t -> 
                  (
                    match t with
                    | SNat n ->
                      (
                        if n < 2 then raise (WrongTypeFor "UNPAIR_N")
                        else 
                          (
                            interpeter ({sbsys with einstr = tl1; 
                            estack = (unpair_n n sbsys.estack)} :: 
                            sbsys_tl)
                          )
                      )
                    | _ -> raise (WrongTypeFor "UNPAIR_N")
                  )
                | NIL ty -> 
                  (
                    let tl = sbsys.estack in 
                      interpeter ({sbsys with einstr = tl1; 
                      estack = {eterm = SList []; etype = TList ty;} :: tl} :: 
                      sbsys_tl)
                  )
                | CONTRACT ty -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        if s1.etype = TAddress then
                          ( 
                            let pre = sbsys.epredicate in 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = {eterm = SSome (SContract (ty, s1.eterm)); 
                              etype = TOption (TContract ty)} :: tl; 
                              epredicate = (SEq (SGet_contract (ty, s1.eterm), 
                              SContract (ty, s1.eterm))) :: pre;} :: 
                              {sbsys with einstr = tl1; 
                              estack = {eterm = SNone ty; etype = TOption ty} :: tl;
                              epredicate = (SEq (SGet_contract (ty, s1.eterm), 
                              SNone (TContract ty))) :: pre;} 
                              :: sbsys_tl)
                          )   
                        else raise (WrongTypeFor "CONTRACT")
                      | [] -> raise (WrongTypeFor "CONTRACT")
                  ) 
                | CREATE_CONTRACT (ty1, ty2, l) -> 
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: s3 :: tl ->
                        if (s1.etype = (TOption TKey_hash)) && (s2.etype = TMutez) && (s3.etype = ty2) then
                          ( 
                            interpeter ({sbsys with einstr = tl1; 
                            estack = {eterm =  SEmit_operation (ty1, ty2); etype = TOperation} ::
                            {eterm =  SGet_address_new_contract (SEmit_operation (ty1, ty2)); etype = TAddress} :: tl} :: 
                            sbsys_tl) 
                          )   
                        else raise (WrongTypeFor "CREATE_CONTRACT")
                      | _ -> raise (WrongTypeFor "CREATE_CONTRACT")
                  ) 
                | TRANSFER_TOKENS -> 
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: s3 :: tl ->
                        if ((s2.etype = TMutez) || (s2.etype = TOption TMutez)) && ((s3.etype = (TContract s1.etype)) || (s3.etype = (TOption (TContract s1.etype)))) then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = STransfer_Token (s1.eterm, s2.eterm, s3.eterm); 
                          etype = TOperation} :: tl} :: 
                          sbsys_tl)
                        else raise (WrongTypeFor "TRANSFER_TOKENS")
                      | _ -> raise (WrongStackFor "TRANSFER_TOKENS")
                  )  
                | CONS -> 
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: tl ->
                        if (s2.etype = TList s1.etype) then
                          match s2.eterm with
                            | SList l -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = {eterm = SList (s1.eterm :: l); 
                              etype = TList s1.etype} :: tl} :: 
                              sbsys_tl)
                            | _ -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = {eterm = SCons (s1.eterm, s2.eterm); 
                              etype = TList s1.etype} :: tl} :: 
                              sbsys_tl)
                          
                        else raise (WrongTypeFor "CONS")
                      | _ -> raise (WrongStackFor "CONS")
                  )  
                | PUSH (ty1, t1) -> 
                  (
                    let tl = sbsys.estack in 
                      interpeter ({sbsys with einstr = tl1; 
                      estack = {eterm = t1; etype = ty1;} :: tl} :: 
                      sbsys_tl)
                  ) 
                | LEFT ty1 -> 
                  (
                    match sbsys.estack with
                      |  s1 :: tl ->
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = (SLeft s1.eterm); 
                          etype = TOr (ty1, s1.etype);} :: tl} :: 
                          sbsys_tl)
                      | _ -> raise (WrongStackFor "LEFT")
                  ) 
                | RIGHT ty2 -> 
                  (
                    match sbsys.estack with
                      |  s1 :: tl ->
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = (SRight s1.eterm); 
                          etype = TOr (s1.etype, ty2);} :: tl} :: 
                          sbsys_tl)
                      | _ -> raise (WrongStackFor "RIGHT")
                  ) 
                | EQ ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x = 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = ((SNot (SEq (s1.eterm, SInt 0))) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SEq (s1.eterm, SInt 0)) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "EQ")
                        )
                      | _ -> raise (WrongTypeFor "EQ")
                  )
                | NEQ ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x != 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SNot (SEq (s1.eterm, SInt 0))) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = ((SEq (s1.eterm, SInt 0)) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "NEQ")
                        )
                      | _ -> raise (WrongTypeFor "NEQ")
                  )
                | GE ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x >= 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SGe (s1.eterm, SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = (SNot (SGe (s1.eterm, SInt 0)) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "GE")
                        )
                      | _ -> raise (WrongTypeFor "GE")
                  )
                | GT ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x > 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SGt (s1.eterm, SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = ((SNot (SGt (s1.eterm, SInt 0))) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "GT")
                        )
                      | _ -> raise (WrongTypeFor "GT")
                  )
                | LE ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x <= 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SLe (s1.eterm, SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = (SNot (SLe (s1.eterm, SInt 0)) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "LE")
                        )
                      | _ -> raise (WrongTypeFor "LE")
                  )
                | LT ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x < 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool true; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool true; etype = TBool} :: tl); 
                                  epredicate = ((SLt (s1.eterm, SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SBool false; etype = TBool} :: tl); 
                                  epredicate = ((SNot (SLt (s1.eterm, SInt 0))) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "LT")
                        )
                      | _ -> raise (WrongTypeFor "LT")
                  )
                | ABS ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SNat (Int.abs(x)); etype = TNat} :: tl)} :: 
                        sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = SAbs (s1.eterm); etype = TNat} :: tl)} :: 
                              sbsys_tl)
                            | _ -> raise (WrongTypeFor "ABS")
                        )
                      | _ -> raise (WrongTypeFor "ABS")
                    
                  )
                | INT ->
                  (
                    match sbsys.estack with
                      | {eterm = SNat x; etype = TNat} :: tl -> 
                        interpeter ({sbsys with einstr = tl1; 
                        estack = ({eterm = SInt x; etype = TInt} :: tl)} :: 
                        sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TNat -> 
                              interpeter ({sbsys with einstr = tl1; 
                              estack = ({eterm = s1.eterm; etype = TInt} :: tl)} :: 
                              sbsys_tl)
                            | _ -> raise (WrongTypeFor "INT")
                        )
                      | _ -> raise (WrongTypeFor "INT")
                    
                  )
                | ISNAT ->
                  (
                    match sbsys.estack with
                      | {eterm = SInt x; etype = TInt} :: tl ->  
                        if (x >= 0) then 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SSome (SNat x); etype = TOption TNat} :: tl)} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = ({eterm = SNone TNat; etype = TOption TNat} :: tl)} :: 
                          sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TInt -> 
                              (
                                let pre = sbsys.epredicate in 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = ({eterm = SSome (s1.eterm); etype = TOption TNat} :: tl); 
                                  epredicate = ((SGe (s1.eterm, SInt 0)) :: pre)} :: 
                                  {sbsys with einstr = tl1; 
                                  estack = ({eterm = SNone TNat; etype = TOption TNat} :: tl); 
                                  epredicate = (SNot (SGe (s1.eterm, SInt 0)) :: pre)} :: 
                                  sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "ISNAT")
                        )
                      | _ -> raise (WrongTypeFor "ISNAT")
                  )
                | LSL -> raise (TODO "LSL")
                | LSR -> raise (TODO "LSR")
                | AND ->
                  (
                    match sbsys.estack with
                    | {eterm = SBool x; etype = TBool} :: 
                      {eterm = SBool y; etype = TBool} :: tl ->  
                      interpeter ({sbsys with einstr = tl1; 
                      estack = ({eterm = SBool (and_bool x y); 
                      etype = TBool} :: tl)} :: sbsys_tl)
                    | {eterm = SNat x; etype = TNat} :: 
                      {eterm = SNat y; etype = TNat} :: tl -> raise (TODO "AND")     
                    | {eterm = SInt x; etype = TInt} :: 
                      {eterm = SNat y; etype = TNat} :: tl -> raise (TODO "AND")       
                    | s1 :: s2 :: tl -> 
                      (
                        match (s1.etype, s2.etype) with
                          | TBool, TBool -> 
                            let pre = sbsys.epredicate in
                            interpeter ({sbsys with einstr = tl1; 
                            estack = ({eterm = SBool true; etype = TBool} :: tl); 
                            epredicate = SAnd ((SEq (s1.eterm, SBool true)), (SEq (s2.eterm, SBool true))) :: pre } 
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool false; etype = TBool} :: tl); 
                            epredicate =  SNot (SAnd ((SEq (s1.eterm, SBool true)), (SEq (s2.eterm, SBool true)))):: pre } 
                            :: sbsys_tl)
                          | TNat, TNat -> raise (TODO "AND")
                          | TInt, TNat -> raise (TODO "AND")
                          | _ -> raise (WrongTypeFor "AND")
                      )
                    | _ -> raise (WrongTypeFor "AND")
                  )
                | NOT ->
                  (
                    match sbsys.estack with
                    | {eterm = SBool x; etype = TBool} :: tl ->  
                      interpeter ({sbsys with einstr = tl1; 
                      estack = ({eterm = SBool (not_bool x); 
                      etype = TBool} :: tl)} :: sbsys_tl)
                    | {eterm = SNat x; etype = TNat} ::  tl -> raise (TODO "NOT")     
                    | {eterm = SInt y; etype = TInt} :: tl -> raise (TODO "NOT")       
                    | s1 :: tl -> 
                      (
                        match (s1.etype) with
                          | TBool -> 
                            let pre = sbsys.epredicate in
                            interpeter ({sbsys with einstr = tl1; 
                            estack = ({eterm = SBool true; etype = TBool} :: tl); 
                            epredicate = (SEq (s1.eterm, SBool false)) :: pre } 
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool false; etype = TBool} :: tl); 
                            epredicate =  (SEq (s1.eterm, SBool true)):: pre } 
                            :: sbsys_tl)
                          | TNat -> raise (TODO "NOT")
                          | TInt -> raise (TODO "NOT")
                          | _ -> raise (WrongTypeFor "NOT")
                      )
                    | _ -> raise (WrongTypeFor "NOT")
                  )
                | OR ->
                  (
                    match sbsys.estack with
                    | {eterm = SBool x; etype = TBool} :: 
                      {eterm = SBool y; etype = TBool} :: tl ->  
                      interpeter ({sbsys with einstr = tl1; 
                      estack = ({eterm = SBool (or_bool x y); 
                      etype = TBool} :: tl)} :: sbsys_tl)
                    | {eterm = SNat x; etype = TNat} :: 
                      {eterm = SNat y; etype = TNat} :: tl -> raise (TODO "OR")        
                    | s1 :: s2 :: tl -> 
                      (
                        match (s1.etype, s2.etype) with
                          | TBool, TBool -> 
                            let pre = sbsys.epredicate in
                            interpeter ({sbsys with einstr = tl1; 
                            estack = ({eterm = SBool false; etype = TBool} :: tl); 
                            epredicate = SAnd ((SEq (s1.eterm, SBool false)), (SEq (s2.eterm, SBool false))) :: pre } 
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool true; etype = TBool} :: tl); 
                            epredicate =  SNot (SAnd ((SEq (s1.eterm, SBool false)), (SEq (s2.eterm, SBool false)))):: pre } 
                            :: sbsys_tl)
                          | TNat, TNat -> raise (TODO "OR")
                          | _ -> raise (WrongTypeFor "OR")
                      )
                    | _ -> raise (WrongTypeFor "OR")
                  )
                | XOR ->
                  (
                    match sbsys.estack with
                    | {eterm = SBool x; etype = TBool} :: 
                      {eterm = SBool y; etype = TBool} :: tl ->  
                      interpeter ({sbsys with einstr = tl1; 
                      estack = ({eterm = SBool (xor_bool x y); 
                      etype = TBool} :: tl)} :: sbsys_tl)
                    | {eterm = SNat x; etype = TNat} :: 
                      {eterm = SNat y; etype = TNat} :: tl -> raise (TODO "XOR")        
                    | s1 :: s2 :: tl -> 
                      (
                        match (s1.etype, s2.etype) with
                          | TBool, TBool -> 
                            let pre = sbsys.epredicate in
                            interpeter ({sbsys with einstr = tl1; 
                            estack = ({eterm = SBool false; etype = TBool} :: tl); 
                            epredicate = SAnd ((SEq (s1.eterm, SBool false)), (SEq (s2.eterm, SBool false))) :: pre } 
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool false; etype = TBool} :: tl); 
                            epredicate =  SNot (SAnd ((SEq (s1.eterm, SBool true)), (SEq (s2.eterm, SBool true)))):: pre } 
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool true; etype = TBool} :: tl); 
                            epredicate =  (SAnd ((SEq (s1.eterm, SBool false)), (SEq (s2.eterm, SBool true)))):: pre }
                            :: {sbsys with einstr = tl1; 
                            estack = ({eterm = SBool true; etype = TBool} :: tl); 
                            epredicate =  (SAnd ((SEq (s1.eterm, SBool true)), (SEq (s2.eterm, SBool false)))):: pre }
                            :: sbsys_tl)
                          | TNat, TNat -> raise (TODO "XOR")
                          | _ -> raise (WrongTypeFor "XOR")
                      )
                    | _ -> raise (WrongTypeFor "XOR")
                  )
                | IF (l1, l2) -> 
                  (
                    match sbsys.estack with
                      | {eterm = SBool true; etype = TBool} :: tl -> 
                        interpeter ({sbsys with einstr = (l1 @ tl1); 
                        estack = tl} :: sbsys_tl)
                      | {eterm = SBool false; etype = TBool} :: tl -> 
                        interpeter ({sbsys with einstr = (l2 @ tl1); 
                        estack = tl} :: sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBool -> 
                              let pre = sbsys.epredicate in 
                                interpeter ({sbsys with 
                                einstr = l1 @ tl1; 
                                estack = tl; 
                                epredicate = (SEq (s1.eterm, SBool true) :: pre)} :: 
                                {sbsys with einstr = l2 @ tl1; 
                                estack = tl; 
                                epredicate = (SNot (SEq (s1.eterm, SBool true)) :: pre)} :: 
                                sbsys_tl)
                            | _ -> raise (WrongTypeFor "IF")
                        )
                      | _ -> raise (WrongTypeFor "IF")
                  )
                | IF_LEFT (l1, l2) ->
                  (
                    match sbsys.estack with
                      | {eterm = (SLeft x); etype = TOr (ty1, ty2)} :: tl -> 
                        interpeter ({sbsys with einstr = (l1 @ tl1); 
                        estack = ({eterm = x; etype = ty1} :: tl)} :: sbsys_tl)
                      | {eterm = (SRight x); etype = TOr (ty1, ty2)} :: tl -> 
                        interpeter ({sbsys with einstr = (l2 @ tl1); 
                        estack = ({eterm = x; etype = ty2} :: tl)} :: sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TOr (ty1, ty2) -> 
                              let pre = sbsys.epredicate in 
                              let index = sbsys.ecounter in
                                interpeter ({
                                einstr = l1 @ tl1; 
                                estack = ({eterm = SVar ("sbvar", index, ty1); etype = ty1} :: tl); 
                                epredicate = (SEq (s1.eterm, SLeft (SVar ("sbvar", index, ty1))) :: pre); 
                                ecounter = (index + 1); eloop = sbsys.eloop} :: 
                                {einstr = l2 @ tl1; 
                                estack = ({eterm =  SVar ("sbvar", index, ty2); etype = ty2} :: tl); 
                                epredicate = (SEq (s1.eterm, SRight (SVar ("sbvar", index, ty2))) :: pre); 
                                ecounter = (index + 1); eloop = sbsys.eloop} :: sbsys_tl)
                            | _ -> raise (WrongTypeFor "IF_LEFT")
                        )
                      | _ -> raise (WrongTypeFor "IF_LEFT")
                  )
                | IF_CONS (l1, l2) ->
                  (
                    match sbsys.estack with
                      | {eterm = SList []; etype = TList ty} :: tl -> 
                        interpeter ({sbsys with einstr = (l2 @ tl1); 
                        estack = tl} :: sbsys_tl)
                      | {eterm = SEmpty (TList ty); etype = TList ty1} :: tl -> 
                        interpeter ({sbsys with einstr = (l2 @ tl1); 
                        estack = tl} :: sbsys_tl)
                      | {eterm = SList (hd :: l); etype = TList ty} :: tl -> 
                        interpeter ({sbsys with einstr = (l1 @ tl1); 
                        estack = {eterm = hd; etype = ty} :: {eterm = SList l; etype = TList ty} :: tl} :: sbsys_tl)
                      | {eterm = SCons (hd, l); etype = TList ty} :: tl -> 
                        interpeter ({sbsys with einstr = (l1 @ tl1); 
                        estack = {eterm = hd; etype = ty} :: {eterm = l; etype = TList ty} :: tl} :: sbsys_tl)
                      | {eterm = l; etype = TList ty} :: tl -> 
                        (
                          let pre = sbsys.epredicate in 
                          let index = sbsys.ecounter in
                              interpeter ({
                              einstr = l2 @ tl1; 
                              estack = ({eterm = SVar ("sbvar", index, ty); etype = ty} :: tl); 
                              epredicate = (SEq (l, SEmpty (TList ty)) :: pre); 
                              ecounter = (index + 1); eloop = sbsys.eloop} :: 
                              {einstr = l1 @ tl1; 
                              estack = ({eterm =  SVar ("sbvar", index, ty); etype = ty} :: 
                              {eterm =  SVar ("sbvar", index + 1, TList ty); etype = TList ty} :: tl); 
                              epredicate = (SEq (l, SCons (SVar ("sbvar", index, ty), 
                              SVar ("sbvar", index  + 1, TList ty))) :: pre); 
                              ecounter = (index + 2); eloop = sbsys.eloop} :: sbsys_tl)
                        )
                      | _ -> raise (WrongTypeFor "IF_CONS")
                  )
                | IF_NONE (l1, l2) ->
                  (
                    match sbsys.estack with
                      | {eterm = SSome x; etype = TOption ty} :: tl -> 
                        interpeter ({sbsys with einstr = (l2 @ tl1); 
                        estack = ({eterm = x; etype = ty} :: tl)} :: sbsys_tl)
                      | {eterm = SNone ty'; etype = TOption ty} :: tl -> 
                        interpeter ({sbsys with einstr = (l1 @ tl1); 
                        estack = tl} :: sbsys_tl)
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TOption ty -> 
                              let pre = sbsys.epredicate in 
                              let index = sbsys.ecounter in
                                interpeter ({ 
                                einstr = l2 @ tl1; 
                                estack = ({eterm = SVar ("sbvar", index, ty); etype = ty} :: tl); 
                                epredicate = (SEq (s1.eterm, SSome (SVar ("sbvar", index, ty))) :: pre); 
                                ecounter = (index + 1); eloop = sbsys.eloop} :: 
                                {einstr = l1 @ tl1; 
                                estack = tl; 
                                epredicate = ((SEq (s1.eterm, SNone ty)) :: pre); 
                                ecounter = (index + 1); eloop = sbsys.eloop} :: sbsys_tl)
                            | _ -> raise (WrongTypeFor "IF_NONE")
                        )
                      | _ -> raise (WrongTypeFor "IF_NONE")
                  )
                | ITER l1 ->
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TList ty ->
                              (
                                match s1.eterm with
                                  | SList [] ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SEmpty (TList ty) ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SList (hd :: tl2) ->
                                    (
                                      let s1_temp = {eterm = SList tl2; etype = TList ty} in
                                      let tl_temp = interpeter ([{sbsys with einstr = l1; 
                                        estack = ({eterm = hd; etype = ty} :: tl)}]) in
                                        interpeter ((merger tl_temp  s1_temp ((ITER l1) :: tl1)) @ sbsys_tl)
                                    )
                                  | SCons (hd, tl2) ->
                                    (
                                      let s1_temp = {eterm = tl2; etype = TList ty} in
                                      let tl_temp = interpeter ([{sbsys with einstr = l1; 
                                        estack = ({eterm = hd; etype = ty} :: tl)}]) in
                                        interpeter ((merger tl_temp  s1_temp ((ITER l1) :: tl1)) @ sbsys_tl)
                                    )
                                  | _ -> 
                                    (
                                      let pre = sbsys.epredicate in
                                      let tl_old = syb_stack_iter tl 0 in 
                                      let tl_sbl = {eterm = SVar ("x_iter", 0, ty); etype = ty} ::  tl_old in
                                      let new_pre = (SNot (SEq (s1.eterm, (SEmpty (TList ty)))) :: pre) in
                                      let tl_iter = interpeter [{sbsys with einstr = l1; estack = tl_sbl; epredicate = []}] in
                                      let tl_temp = classify_modify_iter tl_iter tl_old tl ty (s1.eterm) in 
                                      interpeter ({sbsys with einstr = tl1; estack = tl; 
                                      epredicate = (SEq (s1.eterm, (SEmpty (TList ty)))) :: pre}
                                      :: (merger_iter tl_temp tl1 new_pre)) @ sbsys_tl
                                    )
                              )
                            | TSet ty ->
                              (
                                match s1.eterm with
                                  | SSet [] ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SEmpty (TSet ty) ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SSet (hd :: tl2) ->
                                    (
                                      let s1_temp = {eterm = SSet tl2; etype = TSet ty} in
                                      let tl_temp = interpeter ([{sbsys with einstr = l1; 
                                        estack = ({eterm = hd; etype = ty} :: tl)}]) in
                                        interpeter ((merger tl_temp  s1_temp ((ITER l1) :: tl1)) @ sbsys_tl)
                                    )
                                  | _ -> 
                                    (
                                      let pre = sbsys.epredicate in
                                      let tl_old = syb_stack_iter tl 0 in 
                                      let tl_sbl = {eterm = SVar ("x_iter", 0, ty); etype = ty} ::  tl_old in
                                      let new_pre = (SNot (SEq (s1.eterm, SEmpty (TSet ty))) :: pre) in
                                      let tl_iter = interpeter ([{sbsys with einstr = l1; 
                                      estack = tl_sbl; 
                                      epredicate = []}]) in
                                      let tl_temp = classify_modify_iter tl_iter tl_old tl ty (s1.eterm) in 
                                        interpeter ({sbsys with einstr = tl1; 
                                        estack = tl; 
                                        epredicate = (SEq (s1.eterm, (SEmpty (TSet ty)))) :: pre} 
                                        :: (merger_iter tl_temp tl1 new_pre) @ sbsys_tl)
                                    )
                              )
                            | TMap (ty1, ty2) -> 
                              (
                                match s1.eterm with
                                  | SMap [] ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SEmpty (TMap (ty1, ty2)) ->
                                    interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                                  | SMap (SElt (k, v) :: tl2) ->
                                    (
                                      let s1_temp = {eterm = SMap tl2; etype = TMap (ty1, ty2)} in
                                      let tl_temp = interpeter ([{sbsys with einstr = l1; 
                                      estack = ({eterm = SPair (k, v); etype = TPair (ty1, ty2)} :: tl)}]) in
                                      interpeter ((merger tl_temp  s1_temp ((ITER l1) :: tl1)) @ sbsys_tl)
                                    )
                                  | _ -> 
                                    (
                                      let pre = sbsys.epredicate in
                                      let tl_old = syb_stack_iter tl 0 in 
                                      let tl_sbl = {eterm = SVar ("x_iter", 0, TPair (ty1, ty2)); etype = TPair (ty1, ty2)} ::  tl_old in
                                      let new_pre = (SNot (SEq (s1.eterm, SEmpty (TMap (ty1, ty2)))) :: pre) in
                                      let tl_iter = interpeter ([{sbsys with einstr = l1; 
                                      estack = tl_sbl; 
                                      epredicate = []}]) in
                                      let tl_temp = classify_modify_iter tl_iter tl_old tl (TPair (ty1, ty2)) (s1.eterm) in 
                                        interpeter ({sbsys with einstr = tl1; 
                                        estack = tl; 
                                        epredicate = (SEq (s1.eterm, (SEmpty (TMap (ty1, ty2))))) :: pre} 
                                        :: (merger_iter tl_temp tl1 new_pre) @ sbsys_tl)
                                    )
                              )
                            | _ -> raise (WrongTypeFor "ITER")  
                        )
                      | _ -> raise (WrongStackFor "ITER")  
                  )
                | LAMBDA (ty1, ty2, l) ->
                  (
                    let pre_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = ({eterm = SInstr l; etype = TLambda (ty1, ty2)} :: pre_stack)} :: sbsys_tl)
                  )
                | LAMBDA_REC (ty1, ty2, l) -> raise (TODO "LAMBDA_REC")
                | LOOP l1 -> 
                  (
                    if sbsys.eloop >= loop_limit then 
                      interpeter ({sbsys with einstr = []; 
                      estack = {eterm = SFailwith "Excee Loop Limit"; etype = TError} :: []} :: sbsys_tl) 
                    else 
                      (
                        match sbsys.estack with
                        | {eterm = SBool true; etype = TBool} :: tl -> 
                          (
                            let pre_eloop = sbsys.eloop in
                            interpeter ({sbsys with einstr = l1 @ [LOOP l1] @ tl1; 
                            estack = tl; eloop = pre_eloop + 1} :: sbsys_tl)
                          )
                        | {eterm = SBool false; etype = TBool} :: tl -> 
                          interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                        | {eterm = b; etype = TBool} :: tl ->
                          (
                            let syb_stack = syb_stack_loop tl 0 in
                            let pre = (sbsys.epredicate) in
                            let pre_predicate = (SEq (b, SBool true)) :: pre in
                            let tl_test = interpeter ([{sbsys with estack = tl; einstr = l1; epredicate = []}]) in
                            if (check_predicate_loop tl_test) then
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = tl; 
                                epredicate = (SEq (b, SBool false)) :: pre} :: (merger_ins_pre_loop tl_test tl1 pre_predicate) @ sbsys_tl)
                              )
                            else
                              (
                                let tl_temp = interpeter ([{sbsys with einstr = l1; estack = syb_stack; epredicate = []}]) in
                                interpeter ({sbsys with einstr = tl1; estack = tl; epredicate = (SEq (b, SBool false)) :: pre} 
                                :: (merger_ins_pre_loop (get_sys_loop (get_var_list_loop syb_stack) tl_temp (get_s0_list_loop tl)) (tl1) pre_predicate) @ sbsys_tl)
                              )   
                          )                    
                        | _ -> raise (WrongStackFor "LOOP")
                      )                 
                  )
                | LOOP_LEFT l1 ->
                  (
                    if sbsys.eloop >= loop_limit then 
                      interpeter ({sbsys with einstr = []; 
                      estack = {eterm = SFailwith "Excee Loop Limit"; etype = TError} :: []} :: sbsys_tl) 
                    else 
                      (
                        match sbsys.estack with
                        | {eterm = SLeft x; etype = TOption ty} :: tl -> 
                          (
                            let pre_eloop = sbsys.eloop in
                            interpeter ({sbsys with einstr = l1 @ [LOOP_LEFT l1] @ tl1; 
                            estack = {eterm = x; etype = ty} :: tl; eloop = pre_eloop + 1} :: sbsys_tl)
                          )
                        | {eterm = SRight x; etype = TOption ty} :: tl -> 
                          interpeter ({sbsys with einstr = tl1; estack = {eterm = x; etype = ty} :: tl} :: sbsys_tl)
                        | {eterm = b; etype = TOption ty} :: tl ->
                          (
                            let syb_stack = syb_stack_loop tl 0 in
                            let pre = (sbsys.epredicate) in
                            let index = sbsys.ecounter in
                            let pre_predicate = (SEq (b, SLeft (SVar ("sbvar", index, ty)))) :: pre in
                            let tl_test = interpeter ([{sbsys with estack = {eterm = SVar ("sbvar", index, ty); etype = ty} :: tl; einstr = l1; epredicate = []; ecounter = index + 1}]) in
                            if (check_predicate_loop tl_test) then
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SVar ("sbvar", index, ty); etype = ty} :: tl; 
                                epredicate = (SEq (b, SRight (SVar ("sbvar", index, ty)))) :: pre;
                                ecounter = index + 1} :: (merger_ins_pre_loop tl_test tl1 pre_predicate) @ sbsys_tl)
                              )
                            else
                              (
                                let tl_temp = interpeter ([{sbsys with einstr = l1; estack = syb_stack; epredicate = []}]) in
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SVar ("sbvar", index, ty); etype = ty} :: tl; 
                                epredicate = (SEq (b, SRight (SVar ("sbvar", index, ty)))) :: pre;
                                ecounter = index + 1} 
                                :: (merger_ins_pre_loop (get_sys_loop_left (get_var_list_loop syb_stack) tl_temp (get_s0_list_loop tl)) (tl1) pre_predicate) @ sbsys_tl)
                              )   
                          )                    
                        | _ -> raise (WrongStackFor "LOOP_LEFT")
                      )                 
                  )
                | DUP -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        interpeter ({sbsys with einstr = tl1; estack = (s1 :: s1 :: tl)} :: 
                        sbsys_tl)
                      | [] -> raise (WrongTypeFor "DUP")
                  )
                | DUP_N t -> 
                  (
                    match t with
                      | SNat i -> 
                        (
                          let temp_stack = dup_n i [] sbsys.estack in
                          interpeter ({sbsys with einstr = tl1; estack = temp_stack} :: sbsys_tl)
                        )
                      | _ -> raise (WrongTypeFor "DUP_N")
                  )
                | DUG t -> 
                  (
                    match t with
                      | SNat i -> 
                        (
                          match sbsys.estack with
                            | hd :: tl ->
                              (
                                let temp_stack = dug_n i hd [] sbsys.estack in
                                interpeter ({sbsys with einstr = tl1; estack = temp_stack} :: sbsys_tl)
                              )
                            | [] -> raise (WrongStackFor "DUG_N")
                        )
                      | _ -> raise (WrongTypeFor "DUG_N")
                  )
                | DIG t ->
                  (
                    match t with
                      | SNat i -> 
                        (
                          let temp_stack = dig_n i [] sbsys.estack in
                          interpeter ({sbsys with einstr = tl1; estack = temp_stack} :: sbsys_tl)
                        )
                      | _ -> raise (WrongTypeFor "DIG")
                  )
                | DROP -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        interpeter ({sbsys with einstr = tl1; estack = tl} :: sbsys_tl)
                      | [] -> raise (WrongTypeFor "DROP")
                  )    
                | DROP_N t ->
                  (
                    match t with
                      | SNat i -> 
                        (
                          let temp_stack = drop_n i sbsys.estack in
                          interpeter ({sbsys with einstr = tl1; estack = temp_stack} :: sbsys_tl)
                        )
                      | _ -> raise (WrongTypeFor "DROP_N")
                  )            
                | SWAP ->
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: tl ->
                        interpeter ({sbsys with einstr = tl1; estack = (s2 :: s1 :: tl)} :: 
                        sbsys_tl)
                      | _ -> raise (WrongTypeFor "SWAP")
                  )
                | DIP l1 ->
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          let temp_sbsys_list = interpeter ([{sbsys with einstr = l1; estack = tl}]) in
                            interpeter ((merger_dip [s1] tl1 temp_sbsys_list) @ sbsys_tl)
                        )                       
                      | [] -> raise (WrongTypeFor "DIP")
                  )
                | DIP_N (t, l1) ->
                  (
                    match t with
                    | SNat i -> 
                      (
                        let (s1, s2) = dip_n i [] sbsys.estack in
                        let temp_sbsys_list = interpeter ([{sbsys with einstr = l1; estack = s2}]) in
                        interpeter ((merger_dip s1 tl1 temp_sbsys_list) @ sbsys_tl)
                      )
                    | _ -> raise (WrongTypeFor "DIP_N")                      
                  )
                | ADDRESS ->
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TContract ty ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm =  SGet_address s1.eterm; etype = TAddress} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "ADDRESS")                          
                        )                       
                      | [] -> raise (WrongTypeFor "ADDRESS")
                  ) 
                | BLAKE2B -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBytes ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFhash_blake2b s1.eterm; etype = TBytes} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "BLAKE2B")                          
                        )                       
                      | [] -> raise (WrongStackFor "BLAKE2B") 
                  )
                | CHECK_SIGNATURE -> 
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: s3 :: tl ->
                        (
                          match (s1.etype, s2.etype, s3.etype) with
                            | (TKey, TSignature , TBytes) ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFcheck_signature (s1.eterm, s2.eterm, s3.eterm); etype = TBool} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "CHECK_SIGNATURE")                          
                        )                       
                      | _ -> raise (WrongStackFor "CHECK_SIGNATURE") 
                  )
                | HASH_KEY -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TKey ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFhash_key s1.eterm; etype = TKey_hash} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "HASH_KEY")                          
                        )                       
                      | [] -> raise (WrongStackFor "HASH_KEY") 
                  )
                | KECCAK -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBytes ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFhash_keccak s1.eterm; etype = TBytes} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "KECCAK")                          
                        )                       
                      | [] -> raise (WrongStackFor "KECCAK") 
                  )
                | PAIRING_CHECK -> raise (TODO "PAIRING_CHECK")
                | SAPLING_EMPTY_STATE t -> raise (TODO "SAPLING_EMPTY_STATE")
                | SAPLING_VERIFY_UPDATE -> raise (TODO "SAPLING_VERIFY_UPDATE")
                | SHA256 -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBytes ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFsha256 s1.eterm; etype = TBytes} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "SHA256")                          
                        )                       
                      | [] -> raise (WrongStackFor "SHA256") 
                  )
                | SHA3 -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBytes ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFsha3 s1.eterm; etype = TBytes} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "SHA3")                          
                        )                       
                      | [] -> raise (WrongStackFor "SHA3") 
                  )
                | SHA512 -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TBytes ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = SFsha521 s1.eterm; etype = TBytes} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "SHA512")                          
                        )                       
                      | [] -> raise (WrongStackFor "SHA512") 
                  )
                | IMPLICIT_ACCOUNT ->
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TKey_hash ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm =  SGet_implicit_account s1.eterm; etype = TContract TUnit} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "IMPLICIT_ACCOUNT")                          
                        )                       
                      | [] -> raise (WrongStackFor "IMPLICIT_ACCOUNT")
                  )                  
                | AMOUNT -> 
                  ( 
                    let temp_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SAmount; etype = TMutez} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | BALANCE -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SBalance; etype = TMutez} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | SENDER -> 
                  (
                    let temp_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SSender; etype = TAddress} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | CHAIN_ID -> 
                  (
                    let temp_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SChain_id; etype = TChain_id} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | LEVEL -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SLevel; etype = TNat} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | SOURCE -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SSource; etype = TAddress} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | TOTAL_VOTING_POWER -> 
                  (
                    let temp_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  STotal_voting; etype = TNat} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | VOTING_POWER ->
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TKey_hash ->
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm =  SGet_voting_power s1.eterm; etype = TNat} :: tl} :: 
                                sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "VOTING_POWER")                          
                        )                       
                      | [] -> raise (WrongTypeFor "VOTING_POWER")
                  ) 
                | MIN_BLOCK_TIME -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SMin_block_time; etype = TNat} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | NOW -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SNow; etype = TTimestamp} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | SELF -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SSelf; etype = TContract TSelf} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | SELF_ADDRESS -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm =  SSelf; etype = TAddress} :: temp_stack} :: 
                    sbsys_tl)  
                  ) 
                | MEM ->
                  (
                    match sbsys.estack with
                      | s1 :: s2 :: tl ->
                        (
                          match s2.etype with
                            | TSet ty -> 
                              if s1.etype = ty then
                                (
                                  match s2.eterm with
                                    | SSet [] -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SEmpty (TSet ty) -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SSet (hd :: tl2) ->
                                      (
                                        let tl_temp = interpeter ([{sbsys with einstr = [COMPARE]; 
                                            estack = {eterm = s1.eterm; etype = ty} :: 
                                            {eterm = hd; etype = ty} :: tl}]) in
                                            interpeter ((merger_compare_men tl_temp s1 
                                            ({eterm = SSet tl2; etype = TSet ty}) tl1) 
                                            @ sbsys_tl)
                                      )
                                    | t -> 
                                      (
                                        let pre_predicate1 = (SEq (t, SEmpty (TSet ty))) :: sbsys.epredicate in
                                        let pre_predicate2 = (SNot(SEq (t, SEmpty (TSet ty)))) :: (SEq (SFmem_set (s1.eterm, t), SBool false)) :: sbsys.epredicate in
                                        let pre_predicate3 = (SNot(SEq (t, SEmpty (TSet ty)))) :: (SEq (SFmem_set (s1.eterm, t), SBool true)) :: sbsys.epredicate in
                                        interpeter ({sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate1} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate2} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool true; etype = TBool} :: tl; epredicate = pre_predicate3} :: 
                                        sbsys_tl)
                                      )
                                )
                              else raise (WrongTypeFor "MEM")
                            | TMap (ty1, ty2) ->
                              if s1.etype = ty1 then
                                (
                                  match s2.eterm with
                                    | SMap [] -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SEmpty (TMap (ty1, ty2)) -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SMap ((SElt (k, v)) :: tl2) ->
                                      (
                                        let tl_temp = interpeter ([{sbsys with einstr = [COMPARE]; 
                                            estack = {eterm = s1.eterm; etype = ty1} :: 
                                            {eterm = k; etype = ty1} :: tl}]) in
                                            interpeter ((merger_compare_men tl_temp s1 
                                            ({eterm = SMap tl2; etype = TMap (ty1, ty2)}) tl1) 
                                            @ sbsys_tl)
                                      )
                                    | t -> 
                                      (
                                        let pre_predicate1 = (SEq (t, SEmpty (TMap (ty1, ty2)))) :: sbsys.epredicate in
                                        let pre_predicate2 = (SNot(SEq (t, SEmpty (TMap (ty1, ty2))))) :: (SEq (SFmem_map (s1.eterm, t), SBool false)) :: sbsys.epredicate in
                                        let pre_predicate3 = (SNot(SEq (t, SEmpty (TMap (ty1, ty2))))) :: (SEq (SFmem_map (s1.eterm, t), SBool true)) :: sbsys.epredicate in
                                        interpeter ({sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate1} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate2} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool true; etype = TBool} :: tl; epredicate = pre_predicate3} :: 
                                        sbsys_tl)
                                      )
                                )
                              else raise (WrongTypeFor "MEM")
                            | TBig_map (ty1, ty2) ->
                              if s1.etype = ty1 then
                                (
                                  match s2.eterm with
                                    | SBig_Map [] -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SEmpty (TBig_map (ty1, ty2)) -> 
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SBool false; etype = TBool} :: tl)} :: 
                                      sbsys_tl)
                                    | SBig_Map ((SElt (k, v)) :: tl2) ->
                                      (
                                        let tl_temp = interpeter ([{sbsys with einstr = [COMPARE]; 
                                            estack = {eterm = s1.eterm; etype = ty1} :: 
                                            {eterm = k; etype = ty1} :: tl}]) in
                                            interpeter ((merger_compare_men tl_temp s1 
                                            ({eterm = SBig_Map tl2; etype = TBig_map (ty1, ty2)}) tl1) 
                                            @ sbsys_tl)
                                      )
                                    | t -> 
                                      (
                                        let pre_predicate1 = (SEq (t, SEmpty (TBig_map (ty1, ty2)))) :: sbsys.epredicate in
                                        let pre_predicate2 = (SNot(SEq (t, SEmpty (TBig_map (ty1, ty2))))) :: (SEq (SFmem_map (s1.eterm, t), SBool false)) :: sbsys.epredicate in
                                        let pre_predicate3 = (SNot(SEq (t, SEmpty (TBig_map (ty1, ty2))))) :: (SEq (SFmem_map (s1.eterm, t), SBool true)) :: sbsys.epredicate in
                                        interpeter ({sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate1} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool false; etype = TBool} :: tl; epredicate = pre_predicate2} 
                                        :: {sbsys with einstr = tl1; estack = {eterm = SBool true; etype = TBool} :: tl; epredicate = pre_predicate3} :: 
                                        sbsys_tl)
                                      )
                                )
                              else raise (WrongTypeFor "MEM")
                            | _ -> raise (WrongTypeFor "MEM") 
                        )
                      | _ -> raise (WrongTypeFor "MEM") 
                  )
                | CONCAT -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TList TString ->  
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = concat_string (s1.eterm); 
                                etype = TString} :: tl} :: 
                                sbsys_tl) 
                              )
                            | TList TBytes ->  
                              (
                                interpeter ({sbsys with einstr = tl1; 
                                estack = {eterm = concat_byte (s1.eterm); 
                                etype = TString} :: tl} :: 
                                sbsys_tl) 
                              )
                            | TString ->  
                              (
                                match tl with
                                  | s2 :: tl2 ->
                                    (
                                      if s2.etype = TString then
                                        (
                                          match s1.eterm, s2.eterm with
                                            | (SString x, SString y) -> 
                                              interpeter ({sbsys with einstr = tl1; 
                                              estack = {eterm = SString (x ^ y); 
                                              etype = TString} :: tl2} :: 
                                              sbsys_tl) 
                                            | _ -> 
                                              interpeter ({sbsys with einstr = tl1; 
                                              estack = {eterm = SFconcat_string (s1.eterm, s2.eterm); 
                                              etype = TString} :: tl2} :: 
                                              sbsys_tl)
                                        )
                                      else raise (WrongTypeFor "CONCAT-TString")
                                    )
                                  | _ -> raise (WrongTypeFor "CONCAT-TString")
                              )
                            | TBytes ->  
                              (
                                match tl with
                                  | s2 :: tl2 ->
                                    (
                                      if s2.etype = TBytes then
                                        (
                                          match s1.eterm, s2.eterm with
                                            | (SBytes x, SBytes y) -> 
                                              interpeter ({sbsys with einstr = tl1; 
                                              estack = {eterm = SBytes (Bytes.cat x y); 
                                              etype = TBytes} :: tl2} :: 
                                              sbsys_tl) 
                                            | _ -> 
                                              interpeter ({sbsys with einstr = tl1; 
                                              estack = {eterm = SFconcat_bytes (s1.eterm, s2.eterm); 
                                              etype = TBytes} :: tl2} :: 
                                              sbsys_tl)
                                        )
                                      else raise (WrongTypeFor "CONCAT-TBytes")
                                    )
                                  | _ -> raise (WrongTypeFor "CONCAT-TBytes")
                              )
                            | _ -> raise (WrongTypeFor "CONCAT")
                        )
                      | _ -> raise (WrongStackFor "CONCAT")
                  )
                | EMPTY_BIG_MAP (ty1, ty2) -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm = SEmpty (TBig_map (ty1, ty2)); 
                    etype = TBig_map (ty1, ty2)} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | EMPTY_MAP (ty1, ty2) -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm = SEmpty (TMap (ty1, ty2)); 
                    etype = TMap (ty1, ty2)} :: temp_stack} :: 
                    sbsys_tl)
                  )
                | EMPTY_SET ty -> 
                  (
                    let temp_stack = sbsys.estack in  
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm = SEmpty (TSet ty); 
                    etype = TSet ty} :: temp_stack} :: 
                    sbsys_tl) 
                  )
                | GET -> 
                  (
                    match sbsys.estack with
                      | {eterm = t1; etype = ty1} :: {eterm = t2; etype = TMap (ty2, ty3)} :: tl ->
                        (
                          if (ty1 = ty2) then
                            (
                              match t2 with
                                | SEmpty (TMap (ty2, ty3)) -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = {eterm = SNone ty3; 
                                  etype = TOption ty3} :: tl} :: 
                                  sbsys_tl) 
                                | SMap (SElt (x, y) :: m) ->
                                  (
                                    let sbsys_temp = interpeter ({sbsys with einstr = [COMPARE]; 
                                    estack = [{eterm = t1; etype = ty1}; {eterm = x; etype = ty2}]} :: []) in
                                    interpeter ((merger_get_map t1 y m ty2 ty3 tl tl1 sbsys_temp) @ sbsys_tl) 
                                  )
                                | _ -> 
                                  (
                                    let index = sbsys.ecounter in
                                    let pre_predicate = sbsys.epredicate in
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SSome (SVar ("sbvar", index, ty3)); etype = TOption ty3} :: tl;
                                    epredicate = (SEq (SFGet_map (t1, t2), SVar ("sbvar", index, ty3))) :: pre_predicate;
                                    ecounter = index + 1} :: 
                                    {sbsys with einstr = tl1; 
                                    estack = {eterm = SNone ty3; etype = TOption ty3} :: tl;
                                    epredicate = (SNot (SEq (SFGet_map (t1, t2), SVar ("sbvar", index, ty3)))) :: pre_predicate;
                                    ecounter = index + 1} ::
                                    sbsys_tl) 
                                  )     
                            )
                          else raise (WrongTypeFor "GET")
                        )
                      | {eterm = t1; etype = ty1} :: {eterm = t2; etype = TBig_map (ty2, ty3)} :: tl ->
                        (
                          if (ty1 = ty2) then
                            (
                              match t2 with
                                | SEmpty (TBig_map (ty2, ty3)) -> 
                                  interpeter ({sbsys with einstr = tl1; 
                                  estack = {eterm = SNone ty3; 
                                  etype = TOption ty3} :: tl} :: 
                                  sbsys_tl) 
                                | SBig_Map (SElt (x, y) :: m) ->
                                  (
                                    let sbsys_temp = interpeter ({sbsys with einstr = [COMPARE]; 
                                    estack = [{eterm = t1; etype = ty1}; {eterm = x; etype = ty2}]} :: []) in
                                    interpeter ((merger_get_big_map t1 y m ty2 ty3 tl tl1 sbsys_temp) @ sbsys_tl) 
                                  )
                                | _ -> 
                                  (
                                    let index = sbsys.ecounter in
                                    let pre_predicate = sbsys.epredicate in
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SSome (SVar ("sbvar", index, ty3)); etype = TOption ty3} :: tl;
                                    epredicate = (SEq (SFGet_big_map (t1, t2), SVar ("sbvar", index, ty3))) :: pre_predicate;
                                    ecounter = index + 1} :: 
                                    {sbsys with einstr = tl1; 
                                    estack = {eterm = SNone ty3; etype = TOption ty3} :: tl;
                                    epredicate = (SNot (SEq (SFGet_big_map (t1, t2), SVar ("sbvar", index, ty3)))) :: pre_predicate;
                                    ecounter = index + 1} ::
                                    sbsys_tl) 
                                  )
                            )
                          else raise (WrongTypeFor "GET")
                        )
                      | _ -> raise (WrongStackFor "GET")
                  )
                | GET_N t -> 
                  (
                    match t with
                      | SNat 0 ->
                        (
                          match sbsys.estack with
                            | s1 :: tl -> 
                              interpeter ({sbsys with einstr = tl1} :: 
                              sbsys_tl) 
                            | _ -> raise (WrongStackFor "GET_N")
                        )
                      | SNat 1 ->
                        (
                          match sbsys.estack with
                          | {eterm = SPair (a, b); etype = TPair (ty1, ty2)} :: tl -> 
                            interpeter ({sbsys with einstr = tl1;
                            estack = {eterm = a; etype = ty1} :: tl} :: 
                            sbsys_tl) 
                          | _ -> raise (WrongStackFor "GET_N")
                        )
                      | SNat n -> 
                        (
                          match sbsys.estack with
                          | {eterm = SPair (a, b); etype = TPair (ty1, ty2)} :: tl -> 
                            interpeter ({sbsys with einstr = ((GET_N (SNat (n-2))) :: tl1);
                            estack = ({eterm = b; etype = ty2} :: tl)} :: 
                            sbsys_tl) 
                          | _ -> raise (WrongStackFor "GET_N")
                        )
                      | _ -> raise (WrongTypeFor "GET_N")
                  )
                | GET_AND_UPDATE -> raise (TODO "")
                | NONE ty -> 
                  (
                    match sbsys.estack with
                      |  s1 :: tl ->
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SNone s1.etype; 
                          etype = TOption s1.etype} :: tl} :: 
                          sbsys_tl)
                      | _ -> raise (WrongStackFor "NONE")
                  )
                | PACK -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SFpack s1.eterm; etype = TBytes} :: tl} :: 
                          sbsys_tl)                      
                        )                       
                      | [] -> raise (WrongStackFor "PACK") 
                  )
                | NEVER  -> raise (TODO "")
                | SIZE -> 
                  (
                    match sbsys.estack with
                      | s1 :: tl ->
                        (
                          match s1.etype with
                            | TString ->
                              (
                                match s1.eterm with
                                  | SString s ->
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SNat (String.length s); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                                  | _ -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SFlen_string (s1.eterm); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                              )
                            | TBytes ->
                              (
                                match s1.eterm with
                                  | SBytes s ->
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SNat (Bytes.length s); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                                  | _ -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SFlen_bytes (s1.eterm); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                              )
                            | TSet ty ->
                              (
                                match s1.eterm with
                                  | SSet l -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SNat (get_size l); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                                  | _ -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SFlen_set (s1.eterm); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                              )
                            | TList ty ->
                              (
                                match s1.eterm with
                                  | SList l -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SNat (get_size l); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                                  | _ -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SFlen_list (s1.eterm); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                              )
                            | TMap (ty1, ty2) -> 
                              (
                                match s1.eterm with
                                  | SMap l -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SNat (get_size l); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                                  | _ -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = {eterm = SFlen_map (s1.eterm); etype = TNat} :: tl} :: 
                                    sbsys_tl)
                              )
                            | _ -> raise (WrongTypeFor "SIZE")                          
                        )                       
                      | [] -> raise (WrongStackFor "HASH_KEY") 
                  )
                | SLICE -> 
                  (
                    match sbsys.estack with
                      | {eterm = SNat offset; etype = TNat} ::  {eterm = SNat len; etype = TNat} ::  {eterm = SString s; etype = TString} :: tl ->
                        if (offset + len) < String.length s then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SSome (SString (String.sub s offset len)); 
                          etype = TOption TString} :: tl} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SNone TString; 
                          etype = TOption TString} :: tl} :: 
                          sbsys_tl)
                      | {eterm = SNat offset; etype = TNat} ::  {eterm = SNat len; etype = TNat} ::  {eterm = SBytes s; etype = TBytes} :: tl ->
                        if (offset + len) < Bytes.length s then
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SSome (SBytes (Bytes.sub s offset len)); 
                          etype = TOption TBytes} :: tl} :: 
                          sbsys_tl)
                        else 
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SNone TBytes; 
                          etype = TOption TBytes} :: tl} :: 
                          sbsys_tl)
                      | {eterm = n1; etype = TNat} ::  {eterm = n2; etype = TNat} ::  {eterm = t; etype = TString} :: tl ->
                        (
                          let pre_predicate = sbsys.epredicate in
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SSome (SFsubstring (t, n1, n2)); 
                          etype = TOption TString} :: tl;
                          epredicate = (SLt (SAdd (n1, n2), SLength t)) :: pre_predicate} :: 
                          {sbsys with einstr = tl1; 
                          estack = {eterm = SNone TString; 
                          etype = TOption TString} :: tl;
                          epredicate = (SGe (SAdd (n1, n2), SLength t)) :: pre_predicate} ::
                          sbsys_tl) 
                        )
                      | {eterm = n1; etype = TNat} ::  {eterm = n2; etype = TNat} ::  {eterm = t; etype = TBytes} :: tl ->
                        (
                          let pre_predicate = sbsys.epredicate in
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = SSome (SFsubbytes (t, n1, n2)); 
                          etype = TOption TBytes} :: tl;
                          epredicate = (SLt (SAdd (n1, n2), SLength t)) :: pre_predicate} :: 
                          {sbsys with einstr = tl1; 
                          estack = {eterm = SNone TBytes; 
                          etype = TOption TBytes} :: tl;
                          epredicate = (SGe (SAdd (n1, n2), SLength t)) :: pre_predicate} ::
                          sbsys_tl) 
                        )                      
                      | _ -> raise (WrongStackFor "SOME")
                  )
                | SOME -> 
                  (
                    match sbsys.estack with
                      |  s1 :: tl ->
                          interpeter ({sbsys with einstr = tl1; 
                          estack = {eterm = (SSome s1.eterm); 
                          etype = TOption s1.etype} :: tl} :: 
                          sbsys_tl)
                      | _ -> raise (WrongStackFor "SOME")
                  )
                | UNIT -> 
                  (
                    let temp_stack = sbsys.estack in
                    interpeter ({sbsys with einstr = tl1; 
                    estack = {eterm = SUnit; etype = TUnit} :: temp_stack} :: 
                    sbsys_tl) 
                  )
                | UNPACK ty -> 
                  (
                    match sbsys.estack with
                    | s1 :: tl ->
                      (
                        match s1.etype with
                          | TBytes ->
                            (
                              let pre_predicate = sbsys.epredicate in
                              let index = sbsys.ecounter in
                              interpeter ({sbsys with einstr = tl1; 
                              estack = {eterm =  SNone ty; etype = TOption ty} :: tl;
                              epredicate = (SEq (SFunpack (s1.eterm), SNone ty)) :: pre_predicate} :: 
                              {sbsys with einstr = tl1; 
                              estack = {eterm =  SSome (SVar ("sbvar", index, ty)); etype = TOption ty} :: tl;
                              epredicate = (SEq (SFunpack (s1.eterm), SSome (SVar ("sbvar", index, ty)))) :: pre_predicate} ::
                              sbsys_tl)
                            )
                          | _ -> raise (WrongTypeFor "UNPACK")                          
                      )                       
                    | [] -> raise (WrongStackFor "UNPACK")
                  )
                | UPDATE -> (* Not complete *)
                  (
                    match sbsys.estack with
                      | {eterm = x; etype = ty} :: {eterm = b; etype = TBool} :: {eterm = t; etype = TSet ty1} :: tl ->  
                        if (ty = ty1) then
                          (
                            match t with
                              | SSet [] ->
                                (
                                  match b with
                                    | SBool false ->
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = t; etype = TSet ty1} :: tl)} :: 
                                      sbsys_tl)
                                    | SBool true ->
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SSet [x]; etype = TSet ty1} :: tl)} :: 
                                      sbsys_tl)  
                                    | b ->
                                      (
                                        let pre_predicate1 = (SEq (b, SBool false)) :: sbsys.epredicate in
                                        let pre_predicate2 = (SEq (b, SBool true)) :: sbsys.epredicate in
                                        interpeter ({sbsys with einstr = tl1; 
                                        estack = ({eterm = t; etype = TSet ty1} :: tl);
                                        epredicate = pre_predicate1} :: 
                                        {sbsys with einstr = tl1; 
                                        estack = ({eterm = (SSet [x]); etype = (TSet ty1)} :: tl);
                                        epredicate = pre_predicate2} :: 
                                        sbsys_tl) 
                                      )                                    
                                )
                              | SEmpty (TSet ty1) -> 
                                (
                                  match b with
                                    | SBool false ->
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = t; etype = TSet ty1} :: tl)} :: 
                                      sbsys_tl)
                                    | SBool true ->
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = ({eterm = SSet [x]; etype = TSet ty1} :: tl)} :: 
                                      sbsys_tl)  
                                    | b ->
                                      (
                                        let pre_predicate1 = (SEq (b, SBool false)) :: sbsys.epredicate in
                                        let pre_predicate2 = (SEq (b, SBool true)) :: sbsys.epredicate in
                                        interpeter ({sbsys with einstr = tl1; 
                                        estack = ({eterm = t; etype = TSet ty1} :: tl);
                                        epredicate = pre_predicate1} :: 
                                        {sbsys with einstr = tl1; 
                                        estack = ({eterm = (SSet [x]); etype = (TSet ty1)} :: tl);
                                        epredicate = pre_predicate2} :: 
                                        sbsys_tl) 
                                      )                                    
                                )
                              | SSet (hd :: tl2) -> 
                                (
                                  let temp_sbsys_list = interpeter [{sbsys with einstr = [COMPARE]; 
                                  estack = [{eterm = t; etype = TSet ty1}]}] in
                                  interpeter ((merger_set_update x b hd tl2 tl1 tl ty temp_sbsys_list) @ sbsys_tl)
                                )
                              | _ -> raise (WrongTypeFor "UPDATE")
                          )
                        else raise (WrongTypeFor "UPDATE")
                      | {eterm = kty; etype = ty} :: {eterm = vty; etype = TOption ty1} :: {eterm = t; etype = TMap (ty2, ty3)} :: tl ->  raise (WrongStackFor "UPDATE")
                      | {eterm = kty; etype = ty} :: {eterm = vty; etype = TOption ty1} :: {eterm = t; etype = TBig_map (ty2, ty3)} :: tl ->  raise (WrongStackFor "UPDATE")
                      | _ -> raise (WrongStackFor "UPDATE")
                  )
                | UPDATE_N t -> raise (TODO "") 
                | MAP l1 ->
                  (
                    match sbsys.estack with
                      | s1 :: tl -> 
                        (
                          match s1.etype with
                            | TList ty -> 
                              (
                                match s1.eterm with
                                  | SList [] -> 
                                    (
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = tl} :: 
                                      sbsys_tl) 
                                    )
                                  | SEmpty (TList ty) -> 
                                    (
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = tl} :: 
                                      sbsys_tl) 
                                    )
                                  | SList (hd :: tl2) ->
                                    (
                                      let s_hd = interpeter [{sbsys with einstr = l1; 
                                      estack = ({eterm = hd; etype = ty} :: tl)}] in
                                      let s_tl = interpeter (combine_head_list_fmap ty tl2 [MAP l1] s_hd ) in
                                      let sys_temp = merger_list_fmap tl1 s_tl  in 
                                      interpeter (sys_temp @ sbsys_tl) 
                                    )
                                  | t ->
                                    (
                                      let pre_predicate = sbsys.epredicate in
                                      let pre_predicate1 = (SEq (t, (SEmpty (TList ty)))) :: pre_predicate in 
                                      let pre_predicate2 = (SEq (t, SCons (SVar ("x_fmap", 0, ty), SVar ("y_fmap", 0, TList ty)))) :: pre_predicate in 
                                      let s_hd = interpeter [{sbsys with einstr = l1; 
                                      estack = [{eterm = SVar ("x_fmap", 0, ty); etype = ty}];
                                      epredicate = []}] in
                                      let map_function = SFmap ((get_map_func s_hd (SVar ("x_fmap", 0, ty))), SVar ("y_fmap", 0, TList ty)) in
                                      let sys_temp1 = {sbsys with einstr = tl1; estack = tl; epredicate = pre_predicate1} in 
                                      let sys_temp2 = {sbsys with einstr = tl1; estack = ({eterm = map_function; etype = TList ty} :: tl);
                                      epredicate = pre_predicate2} in
                                      interpeter (sys_temp1 :: sys_temp2 :: sbsys_tl) 
                                    )
                              )
                            | TOption ty ->
                              (
                                match s1.eterm with
                                  | SNone ty -> 
                                    interpeter ({sbsys with einstr = tl1; 
                                    estack = s1 :: tl} :: 
                                    sbsys_tl) 
                                  | SSome d -> 
                                    (
                                      let temp_sbsys_list = interpeter [{sbsys with einstr = l1; 
                                      estack = {eterm = d; etype = ty} :: tl}] in
                                      interpeter ((add_some_map temp_sbsys_list) @ sbsys_tl) 

                                    ) 
                                  | t -> 
                                    (
                                      let index = sbsys.ecounter in
                                      let pre_predicate_none = (SEq (t, SNone ty)) :: sbsys.epredicate  in
                                      let pre_predicate_some = (SEq (t, SSome (SVar("Sbvar", index, ty)))) :: sbsys.epredicate  in
                                      let temp_sbsys_list = interpeter [{sbsys with einstr = l1; 
                                      estack = {eterm = SVar("Sbvar", index, ty); etype = ty} :: tl;
                                      epredicate = pre_predicate_some;
                                      ecounter = index + 1}] in
                                      interpeter ([{sbsys with einstr = tl1; 
                                      estack = s1 :: tl;
                                      epredicate = pre_predicate_none}] @ (add_some_map temp_sbsys_list) @ sbsys_tl) 
                                    )
                              )
                            | TMap (ty1, ty2) -> 
                              (
                                match s1.eterm with
                                  | SMap [] -> 
                                    (
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = tl} :: 
                                      sbsys_tl) 
                                    )
                                  | SEmpty (TMap (ty1, ty2)) -> 
                                    (
                                      interpeter ({sbsys with einstr = tl1; 
                                      estack = tl} :: 
                                      sbsys_tl) 
                                    )
                                  | SMap (SElt (k, v) :: tl2) ->
                                    (
                                      let s_hd = interpeter [{sbsys with einstr = l1; 
                                      estack = ({eterm = SPair (k, v); etype = TPair (ty1, ty2)} :: tl)}]  in
                                      let s_tl = interpeter (combine_head_map_fmap ty1 ty2 tl2 [MAP l1] s_hd ) in
                                      let sys_temp = merger_map_fmap k tl1 s_tl  in 
                                      interpeter (sys_temp @ sbsys_tl) 
                                    )
                                  | _ ->
                                    (
                                      let pre_predicate = sbsys.epredicate in
                                      let pre_predicate1 = (SEq (s1.eterm, (SEmpty (TMap (ty1, ty2))))) :: pre_predicate in 
                                      let pre_predicate2 = (SEq (s1.eterm, SCons (SElt (SVar ("x_fmap", 0, ty1), SVar ("x_fmap", 1, ty2)), SVar ("y_fmap", 0, TMap (ty1, ty2))))) :: pre_predicate in 
                                      let s_hd = interpeter [{sbsys with einstr = l1; 
                                      estack = [{eterm = SPair (SVar ("x_fmap", 0, ty1), SVar ("x_fmap", 1, ty2)); etype = TPair (ty1, ty2)}];
                                      epredicate = []}]  in
                                      let map_function = SFmap ((get_map_func s_hd (SElt (SVar ("x_fmap", 0, ty1), SVar ("x_fmap", 1, ty2)))), SVar ("y_fmap", 0,  TMap (ty1, ty2))) in
                                      let sys_temp1 = {sbsys with einstr = tl1; estack = tl; epredicate = pre_predicate1} in 
                                      let sys_temp2 = {sbsys with einstr = tl1; estack = ({eterm = map_function; etype = TMap (ty1, ty2)} :: tl);
                                      epredicate = pre_predicate2} in
                                      interpeter (sys_temp1 :: sys_temp2 :: sbsys_tl) 
                                    )
                              )
                            | _ -> raise (WrongTypeFor "MAP")
                        )
                      | _ -> raise (WrongStackFor "MAP")
                  )
                | FAILWITH str -> 
                  (
                    
                    interpeter ({sbsys with einstr = []; 
                    estack = {eterm = SFailwith str; etype = TError} :: []} :: sbsys_tl) 

                  )
                | JOINT_TICKETS -> raise (TODO "JOINT_TICKETS")
                | READ_TICKETS -> raise (TODO "READ_TICKETS")
                | SPLIT_TICKET -> raise (TODO "SPLIT_TICKET")
                | TICKET -> raise (TODO "TICKET")
                | _ -> raise (SymbolicExecutionError  "Undefined Instruction")   
            )
      )


(** Perform the symbolic execution. **)
let symbolic_execution code input_stack = 
  let init_state = mk_sbsystem  input_stack  code in
  interpeter [init_state]
  
(** SOME TESTS **)
(* Test APPLY *)
let code_apply = [APPLY]
let input_stack_apply = [{eterm = SInt 10 ; etype = TInt}; 
  {eterm = SInstr ([UNPAIR; ADD]); etype = TLambda (TPair (TInt, TInt), TInt)}]
let output_stack_apply = symbolic_execution code_apply input_stack_apply

(* Test EXEC *)
let code_exec = [EXEC]
let input_stack_exec = [{eterm = SPair (SInt 10, SVar("x", 0, TInt)) ; 
  etype = TPair (TInt, TInt)}; {eterm = SInstr ([UNPAIR; ADD]); 
  etype = TLambda (TPair (TInt, TInt), TInt)}]
let output_stack_exec = symbolic_execution code_exec input_stack_exec

(* Test COMPARE *)
let code_compare1 = [COMPARE; DUP]
let input_stack_compare1 = [{eterm = SPair (SInt 10, SInt (-7)); 
  etype = TPair (TInt, TInt)}; 
  {eterm = SPair (SInt 10, SInt 8) ; etype = TPair (TInt, TInt)}]
let output_stack_compare1 = symbolic_execution code_compare1 input_stack_compare1

let code_compare2 = [COMPARE; DUP]
let input_stack_compare2 = [{eterm = SSome (SInt (-1)) ; etype = TOption TInt}; 
  {eterm = SNone TInt ; etype = TOption TInt}]
let output_stack_compare2 = symbolic_execution code_compare2 input_stack_compare2

(* Test BOOLEAN  *)
let code_bool1 = [XOR]
let input_stack_bool1 = [{eterm = SBool true ; etype = TBool}; 
  {eterm = SBool false; etype = TBool}]
let output_stack_bool1 = symbolic_execution code_bool1 input_stack_bool1

let code_bool2 = [XOR]
let input_stack_bool2 = [{eterm = SVar("x", 0, TBool) ; etype = TBool}; 
  {eterm = SVar("y", 0, TBool); etype = TBool}]
let output_stack_bool2 = symbolic_execution code_bool2 input_stack_bool2

(* Test IF_LEFT  *)
let code_if_left = [DUP; CAR; DIP [CDR]; IF_LEFT ([DROP], [ADD]); NIL TOperation; PAIR]
let input_stack_if_left = [{eterm = SPair (SRight (SInt 1), SInt 5) ; 
  etype = TPair ((TOr (TString, TInt)), TInt)}]
let output_stack_if_left = symbolic_execution code_if_left input_stack_if_left

(*Test LOOP*)
let input_stack_loop = 
  [{eterm = SPair (SPair (SInt 3, SInt 2), SInt 0); 
  etype = TPair (TPair (TInt, TInt), TInt);}]
let code_loop = 
  [CAR; DUP; UNPAIR; 
  COMPARE; GT; DIP [UNPAIR]; 
  LOOP [DIP [DUP]; DUP; DIP [SWAP]; 
  COMPARE; LE; IF ([PUSH (TBool, SBool false)], 
  [DIP [DUP]; SUB; PUSH (TBool, SBool true)]);];  
  DIP [DROP]; NIL TOperation; PAIR]
let finalSbsys_loop = symbolic_execution code_loop input_stack_loop

(* Test UNPAIR and ADD *)
let code_1 = [UNPAIR; ADD]
let input_stack_1 = [{eterm = SPair (SInt 5, SInt 3); etype = TPair (TInt, TInt)}]
let output_stack_1 = symbolic_execution code_1 input_stack_1

(* Test MAP *)
let code_map = [MAP [PUSH (TInt, SInt 1); ADD]]
let input_stack_map = [{eterm = SList [SInt 1; SInt 5; SInt 3]; etype = TList TInt}]
let output_stack = symbolic_execution code_map input_stack_map

(* Test FAILWITH *)
let code_failwith = [UNPAIR; DUP; GT; IF ([ADD], [FAILWITH "Fail"])]
let input_stack_failwith = [{eterm = SPair (SInt (-5), SInt 3); etype = TPair (TInt, TInt)}]
let output_stack = symbolic_execution code_failwith input_stack_failwith

(* Test FAILWITH  SB *)
let code_failwith_SB = [UNPAIR; DUP; GT; IF ([ADD], [FAILWITH "Fail"])]
let input_stack_SB = [{eterm = SPair (SVar("x", 0, TInt), SVar("y", 0, TInt)); etype = TPair (TInt, TInt)}]
let output_stack = symbolic_execution code_failwith_SB input_stack_SB



