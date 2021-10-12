open Base
open Lexing

type tx_data = { (* transaction parameters *)
  balance : value ; (* IMutez (TODO: or 'string' and cast it to IMutez when needed *)
  source : string ; (* FIXME: IKey or IKey_Hash? *)
  sender : string ; (* FIXME: IKey or IKey_Hash? *)
  self : string ; (* FIXME: *)
  self_address : string ; (* FIXME IAdress? *)
  amount : value ; (* IMutez *)
  timestamp : string ; (* FIXME https://tezos.gitlab.io/michelson-reference/#type-timestamp RFC3339 'readable' or nat? "2019-09-26T10:59:51Z" , 1571659294
  timestamp -> nat function needed *)
}
(*[@@deriving eq, show { with_path = false }]*)

type union = L | R
type value =
  | IOperation of typ (* TODO: contract type? *)
  | IContract of typ * string (* TODO: Contract type? *)
  | IList of typ * value list
  | ISet of typ * value list (* FIXME set with comparator witness for all ctypes?*)
  | ITicket of value * value * value (* TODO: first 'value'=IPair *)
  | ILambda of (typ * typ) * instr list
  | IMap of (typ * typ) * (value * value) list (* FIXME use Map? comparator witness for each key ctyp?*)
  | IBig_map of (typ * typ) * (value * value) list
  | IBls_381_g1 of string (* FIXME types and operations on this values *)
  | IBls_381_g2 of string
  | IBls_381_fr of string
  | ISapling_transaction (* TODO: saplings are maybe to be removed? *)
  | ISapling_state
  | IChest of value * value (* TODO bytes * 'parameters to open it' *)
  | IChest_key of value (* TODO Key or Key_hash ? *)
  (* dual types *)
  | IOption of typ * value option
  | IPair of value * value
  | IPair_n of value list (*TODO: maybe as a tree for right combs? or just use Pair(Pair(Pair...))) or some structure (set) with access in O(1) *)
  | IOr of typ * union * value (* typ is the type of the other/unused union side *)
  (* comparable types *)
  | IUnit
  | INever
  | IBool of bool
  | IInt of Z.t
  | INat of Z.t
  | IString of string
  | IChain_id of string
  | IBytes of string
  | IMutez of Z.t
  | IKey_hash of string
  | IKey of string
  | ISignature of string
  | ITimestamp of Z.t
  | IAddress of string
type typ =
  | TOperation of typ
  | TContract of typ
  | TList of typ
  | TSet of typ
  | TTicket (* TODO *)
  | TLambda of typ * typ
  | TMap of typ * typ
  | TBig_map of typ * typ
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TSapling_state
  | TChest
  | TChest_key
  (* dual (comparable/not comparable) types *)
  | TOption of typ
  | TPair of typ * typ
  | TPair_n (* TODO: typ list for 'Pair n' or ignore types ? *)
  | TOr of typ * typ
  (* comparable types *)
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress

let rec typeof (v : value) =
  match v with
  | IOperation(ty)        -> TOperation(ty)
  | IContract(ty, _)      -> TContract(ty)
  | IOption(ty, _)        -> TOption(ty)
  | IList(ty, _)          -> IList(ty)
  | ISet(ty, _)           -> TSet(ty)
  | ITicket(_)            -> TTicket
  | IPair(v0, v)          -> TPair(typeof(v0), typeof(v))
  | IPair_n(_)            -> TPair_n
  | IOr(ty, union, x)     -> TOr(ty, typeof(x))
  | ILambda(ty0, ty)      -> TLambda(ty0, ty)
  | IMap(ty0, ty)         -> TMap(ty0, ty)
  | IBig_map(ty0, ty)     -> TBig_map(ty0, ty)
  | IBls_381_g1(_)        -> TBls_381_g1
  | IBls_381_g2(_)        -> TBls_381_g2
  | IBls_381_fr(_)        -> TBls_381_fr
  | ISapling_transaction  -> TSapling_transaction
  | ISapling_state        -> TSapling_state
  | IChest(_)             -> TChest
  | IChest_key(_)         -> TChest_key
  (* comparable types *)
  | IUnit                 -> TUnit
  | INever                -> TNever
  | IBool(_)              -> TBool
  | IInt(_)               -> TInt
  | INat(_)               -> TNat
  | IString(_)            -> TString
  | IChain_id(_)          -> TChain_id
  | IBytes(_)             -> TBytes
  | IMutez(_)             -> TMutez
  | IKey_hash(_)          -> TKey_hash
  | IKey(_)               -> TKey
  | ISignature(_)         -> TSignature
  | ITimestamp(_)         -> TTimestamp
  | IAddress(_)           -> TAddress

(* TODO First try of a function that returns comparators/the modules for comparable types (needed for Sets and Maps) *)
(*let comparator (t : typ) =
  else match v with
  | TOption(ty) -> comparable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> comparable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt -> module Int
  | TNat ->
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> raise failwith "comparator casted for not comparable type"*)

(* Type class membership checker functions *)
(* FIXME: (e.g.) operation is not storable, but NIL operation (list of type operation) is to be stored at the end of the contract
 -> does that mean that some types are 'part' of a class as long as they are wrapped in a pair/list/... ?
 https://tezos.gitlab.io/michelson-reference/#type-operation *)
let rec comparable (t : typ) : bool =
  match t with
  | TOption(ty) -> comparable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> comparable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let rec duplicable (t: typ) : bool =
  match t with
  (* all types except ticket are duplicable *)
  | TOperation(ty)
  | TContract(ty)
  | TList(ty)
  | TSet(ty) -> duplicable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty)
  | TBig_map(ty0, ty) -> duplicable ty0 && duplicable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TSapling_state
  | TChest
  | TChest_key -> true
  | TOption(ty) -> duplicable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> duplicable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let rec packable (t : typ) : bool =
  match t with
  | TContract(ty)
  | TList(ty)
  | TSet(ty) -> packable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty) -> packable ty0 && ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption(ty) -> packable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> packable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let rec pushable (t: typ) : bool =
  match t with
  | TList(ty)
  | TSet(ty) -> packable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty) -> packable ty0 && ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption(ty) -> packable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> packable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let rec storable (t: typ) : bool =
  match t with
  (* all types except contract and operation are duplicable *)
  | TTicket -> true
  | TList(ty)
  | TSet(ty) -> duplicable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty)
  | TBig_map(ty0, ty) -> duplicable ty0 && duplicable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TSapling_state
  | TChest
  | TChest_key -> true
  | TOption(ty) -> duplicable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> duplicable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let passable (t: typ) : bool =
  match t with
  | TContract(ty)
  | TList(ty)
  | TSet(ty) -> duplicable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty) -> duplicable ty0 && duplicable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption(ty) -> duplicable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> duplicable ty0 && ty
  | TPair_n (* TODO *)
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false
let big_map_domain (t: typ) : bool =
  match t with
  | TTicket -> true
  | TList(ty)
  | TSet(ty) -> duplicable ty
  | TLambda(ty0, ty)
  | TMap(ty0, ty) -> duplicable ty0 && duplicable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption(ty) -> duplicable ty
  | TOr(ty0, ty)
  | TPair(ty0, ty) -> duplicable ty0 && ty
  | TPair_n
  | TUnit
  | TNever
  | TBool
  | TInt
  | TNat
  | TString
  | TChain_id
  | TBytes
  | TMutez
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress -> true
  | _ -> false


exception Illegal_Instruction of string * AbsMichelson.instr
exception StackTypeError of string * AbsMichelson.instr * typ list
let raise_InstrValue_Mismatch (instr : AbsMichelson.instr) (x : value list) = raise StackTypeError ("Instr & Stack value type mismatch", instr, List.map x ~f:(fun x -> typeof(x)))
exception TypeError of string * AbsMichelson.instr * (typ * typ)
exception Failwith of string * value
(* TODO: error reporting with stack typing *)

(* minor evaluation/helper functions *)
let drop_n (n : int) (lst : value list) : value =
   if n = 0 then lst
   else if (List.length lst < n) then raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DROP_N (n))
   else List.drop stack integer
let dup_n (n : int) (x : value) (lst : value list) : value =
  if n = 0 then raise Illegal_Instruction ("'n'=0 is illegal", AbsMichelson.DUP_N)
  else if (pushable(typeof(x))) then
    match List.nth lst (n - 1) with
    | Some x -> x
    | None -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DUP_N (n))
  else raise_InstrValue_Mismatch instr [x]
let dig_n (n : int) (lst : value list) : value list =
  let (fst, snd) = List.split_n lst n in
  match (fst, snd) with
  | ([], _) -> raise Illegal_Instruction ("DIG 0 is illegal", AbsMichelson.DIG_N (n))
  | (fst, (x :: st)) -> x :: (fst @ st)
  | (_, []) -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DIG_N (n))
let dug_n (n : int) (lst : value list) : value list =
  let (fst, snd) = List.split_n lst (n + 1) in
  match (fst, snd) with
  | (_, []) -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DUG_N (n))
  | ((x :: st), snd) -> st @ (x :: snd)
  | ([], _) -> raise Illegal_Instruction ("DUG 0 is illegal", AbsMichelson.DUG_N (n))
let pair_n (n : int) (lst : value list) : value list =
  if (n <= 1) then raise Illegal_Instruction ("'n' needs to be higher then 1", AbsMichelson.PAIR_N (n))
  else
    let (fst, snd) = List.split_n lst n in
    match (fst, snd) with
    | (_, []) -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.PAIR_N (n))
    (* Note: case ([], _) does not happen because of the if(n<=1) before*)
    | (fst, snd) -> IPair_n (fst) :: snd
let unpair_n (n : int) (lst : value list) (values : value list) : value list =
  if (List.length values <> n) then raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.UNPAIR_N (n))
  else if (n <= 1) then raise Illegal_Instruction ("'n' needs to be higher then 1", AbsMichelson.UNPAIR_N (n))
  else values @ lst
let slice_str (offset : value (*INat*)) (len : value (*INat*)) (str : string) : value =
  (* String.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IString(Some (String.sub str ~pos:offset ~len))
  with
  	| _ -> IString(None)
let slice_bytes (offset : value (*INat*)) (len : value (*INat*)) (str : string) : value =
  (* String.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IBytes(Some (String.sub str ~pos:offset ~len))
  with
  	| _ -> IBytes(None)

(* secondary evaluation functions (These evaluate a list of instructions) *)
(* MAP instr *)
let map_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  if (List.is_empty lst) then IList(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      let (new_el :: tl) = evalList evalInstr instrs (el :: acc) data in
      (tl, new_el)
    )
    in
    let (new_st, lst) = List.fold_map lst ~init:st ~f:(f instrs data) in (* val fold_map : 'a t -> init:'b -> f:('b -> 'a -> 'b * 'c) -> 'b * 'c t *)
    IList(typeof(List.hd lst), lst) :: new_st
let map_map (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  (* key value pairs are handeled as pairs! *)
  if (List.is_empty lst) then IMap(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      let (new_val :: new_acc) = evalList evalInstr instrs (IPair(fst el, snd el) :: acc) data in
      (new_acc, (fst el, new_val))
    )
    in
    let (new_st, new_lst) = List.fold_map lst ~init:st ~f:(f instrs data) in
    IMap(typeof(List.hd new_lst), new_lst) :: new_st
(* ITER instr *)
let iter_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  if (List.is_empty lst) then st
  else
    let f instrs data  = ( fun acc el ->
      evalList evalInstr instrs (el :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data) (* val fold : 'a t -> init:'accum -> f:('accum -> 'a -> 'accum) -> 'accum *)
let iter_map (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  (* key value pairs are handeled as pairs! *)
  if (List.is_empty lst) then IMap(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      evalList evalInstr instrs (IPair(fst el, snd el) :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data)
let iter_set (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  iter_list instr typ lst st data (* as long as ISet definition is the same as IList *)
(* MEM instr *)
(* todo: mem functions could be the merged as long as as they all are implemented over a list (which I guess is not a good idea) *)
let mem_set (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  let bool = List.exists lst ~f:(fun z -> z = y) in (* FIXME: comparision functions for value types needed!! *) (* val exists : 'a t -> f:('a -> bool) -> bool *)
  IBool(bool) :: st
let mem_map (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  let bool = List.exists lst ~f:(fun (z, v) -> z = y) in (* FIXME: comparision functions for value types needed!! *)
  IBool(bool) :: st
let mem_big_map (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  let bool = List.exists lst ~f:(fun (z, v) -> z = y) in (* FIXME: comparision functions for value types needed!! *)
  IBool(bool) :: st
(* GET instr*)
let get_map (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  ()
  (* TODO: implementation depending on if map is implemented as List or Map
  maybe using List.find_map?
  returns IOption(evalTyp typ, None/Some z):: st
  *)
let get_big_map (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  ()
  (* TODO: implementation depending on if big_map is implemented as List or Map
  maybe using List.find_map?
  returns IOption(evalTyp typ, None/Some z):: st
  *)

(*(* LOOP instr *)
let rec loop (instrs : AbsMichelson.instr list) (st : value list) (data : tx_data) : value list =
  match st with
  | IBool true :: st -> loop instrs (evalList evalInstr instrs st data) data
  | IBool false :: st -> st
  | x :: st -> raise_InstrValue_Mismatch AbsMichelson.LOOP [x]
  | [] ->
(* LOOP_LEFT instr *)
let rec loop_left (instrs : AbsMichelson.instr list) (st : value list) (data : tx_data) : value list =
  match st with
  | IOr (_, L, x) :: st -> loop_left instrs (evalList evalInstr instrs (x :: st) data) data
  | IOr (_, R, x) :: st -> x :: st
  | x :: st -> raise_InstrValue_Mismatch AbsMichelson.LOOP_LEFT [x]
  | [] -> *)

(* EXEC instr *)
let exec (x : value) (y : value) (data : tx_data) : value =
  let f (instrs : AbsMichelson.instrs list) (tys : AbsMichelson.typ * AbsMichelson.typ) (data : tx_data) =
    if (typeof(x) = fst tys) then
      let st = evalList evalInstr instrs [x] data in
      match st with
      | [z] -> if (typeof(z) = snd tys) then z else raise TypeError ("Lambda output type mismatch", AbsMichelson.EXEC, (typeof(rst), snd tys))
      | _ -> raise Illegal_Instruction ("Lambda output should be exactly one value", AbsMichelson.EXEC)
    else raise TypeError ("Lambda input type mismatch", AbsMichelson.EXEC, (typeof(x), fst tys))
  in
  match y with
  | ILambda(tys, instrs) -> f instrs tys data
  | _ -> raise_InstrValue_Mismatch AbsMichelson.EXEC [x; y]

(* DIP_n instr *)
let dip_n (instrs : AbsMichelson.instr list) (n : int) (st : value list) (data : tx_data) : value list =
  let (fst, snd) = List.split_n instrs n in
  match (fst, snd) with
  | (_, []) -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.PAIR_N (n))
  | (fst, snd) -> fst @ (evalList evalInstr instr snd data)





(* main evaluation functions *)
let evalList (evalFun : 'a -> (stack : value list) -> (data : tx_data) -> value list (*FIXME: possibly more polymorphism needed?*)) (xs : 'a list) (st : value list) (data : tx_data) : value list =
  let rec f ys stack data = match ys with
    | [] -> st
    | [y] -> evalFun y st data
    | y::ys -> f ys (evalFun y st data) data
  in
  f xs st data;

let rec evalInstr (instr : AbsMichelson.instr) (st : value list) (data : tx_data) : value list =
  (* Error Reporting: if an instruction works on an existing stack, then these match cases are programmed such that they either
   do not match if the stack does not contain the expected number of values (wich causes the last match case to throw an exception)
   or they match, but raise an error in the subsequent evaluation if the number of values is not enough
   and if they match, then an error is thrown for illegal value types *)
  match (instr, stack) with
  | (AbsMichelson.BLOCK instrs, _) ->  evalList evalInstr instrs stack data
  | (AbsMichelson.DROP, (_ :: st)) -> st
  | (AbsMichelson.DROP_N integer, _) -> drop_n integer stack
  | (AbsMichelson.DUP, (x :: _)) -> dup_n 1 x stack @ stack
  | (AbsMichelson.DUP_N integer, (x :: _)) -> dup_n integer x stack @ stack
  | (AbsMichelson.SWAP, (x :: y :: st)) -> y :: x :: st
  | (AbsMichelson.DIG_N integer, _) -> dig_n integer stack
  | (AbsMichelson.DUG_N integer, _) ->  dug_n integer stack
  | (AbsMichelson.PUSH (typ, data), _) ->
    let value = evalTyp typ data in
    if (pushable(typeof(value)) then (value :: stack)
    else raise Illegal_Instruction ("type to be pushed is not Pushable", instr)
  | (AbsMichelson.SOME, (x :: st)) ->  IOption (typeof(x), Some x) :: st
  | (AbsMichelson.NONE typ, st) ->  IOption(evalTyp typ, None) :: st
  | (AbsMichelson.UNIT, _) -> IUnit :: st
  | (AbsMichelson.NEVER, _) ->  INever :: stack
  | (AbsMichelson.IF_NONE (instrs0, instrs), ((IOption (_, x)) :: st)) ->
    match x with
    | Some y -> evalList evalInstr instrs0 (y :: st) data
    | None   -> evalList evalInstr instrs st data
    | _ -> raise_InstrValue_Mismatch instr, [x]
  | (AbsMichelson.PAIR, (x :: y :: st)) -> IPair (x, y) :: st
  | (AbsMichelson.PAIR_N integer, _) -> pair_n integer stack
  | (AbsMichelson.CAR, (x :: st)) ->
    match x with
    | IPair (y, z) -> y :: st
    | _ -> raise_InstrValue_Mismatch instr, [x]
  | (AbsMichelson.CDR, (x :: st)) ->
    match x with
    | IPair (y, z) -> z :: st
    | _ -> raise_InstrValue_Mismatch instr, [x]
  | (AbsMichelson.UNPAIR, (x :: st)) ->
    match x with
    | IPair (y, z) -> y :: z :: st
    | _ -> raise_InstrValue_Mismatch instr, [z]
  | (AbsMichelson.UNPAIR_N integer, (x :: st) ->
     match x with
     | IPair_n (x) -> unpair_n integer stack x
     | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LEFT typ, (x :: st)) -> IOr (evalTyp typ , L, x) (* FIXME: typ -> ctyp? interpreter.typ ? evalTyp typ?*)
  | (AbsMichelson.RIGHT typ, (x :: st)) ->  IOr (evalTyp typ, R, x)
  | (AbsMichelson.IF_LEFT (instrs0, instrs), (x :: st)) ->
    match x with
    | IOr (_, L, y) -> evalList evalInstr instrs0 (y :: st) data
    | IOr (_, R, y) -> evalList evalInstr instrs (y :: st) data
    | _ -> raise_InstrValue_Mismatch instr [x] (* TODO/Problem: IF_RIGHT is macro of IF_LEFT and therefore will return errors of IF_LEFT*)
  | (AbsMichelson.NIL typ, _) ->  IList (evalTyp typ, []) :: stack
  | (AbsMichelson.CONS, (x :: y :: st)) ->
    match (x, y) with
    | (x, IList(typeof(x), lst)) -> IList(typeof(x), (x :: lst)) :: st
    | _ -> raise_InstrValue_Mismatch instr [x; y]  (* TODO understandable errors *)
  | (AbsMichelson.IF_CONS (instrs0, instrs), (x :: st)) ->
    match x with
    | IList (typ, lst) :: tl -> evalList evalInstr instrs0 (x :: IList (typ, tl) :: st) data
    | IList (_, []) -> evalList evalInstr instrs st data
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.SIZE, (x :: st)) ->
    match x with
    | IString y      -> INat(String.length y) :: st
    | IBytes y       -> INat(String.length y) :: st
    | ISet (_, lst)  -> INat(List.length lst) :: st
    | IList (_, lst) -> INat(List.length lst) :: st
    | IMap (_, lst)  -> INat(String.length lst) :: st
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.EMPTY_SET ctyp, _) -> ISet (evalTyp  ctyp, []) :: stack (* FIXME: or evalCtyp ctyp -> typ ? *)
  | (AbsMichelson.EMPTY_MAP (ctyp, typ), _) ->  IMap ((evalTyp ctyp, evalTyp typ), []) :: stack (*Map.empty with given types?? would need a reversed evalTyp typ function *))
  | (AbsMichelson.EMPTY_BIG_MAP (ctyp, typ), _) ->  IBig_map ((evalTyp ctyp, evalTyp typ), []) :: stack
  | (AbsMichelson.MAP instrs, (x :: st)) ->
    match x with
    | IList (typ, lst) -> map_list instrs typ lst st data
    | IMap (typ, lst)  -> map_map instrs typ lst st data
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.ITER instrs, (x :: st)) ->
    match x with
    | IList (typ, lst) -> iter_list instrs typ lst st data
    | IMap (typ, lst)  -> iter_map instrs typ lst st data
    | ISet (typ, lst)  -> iter_set instrs typ lst st data
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.MEM, (x :: y :: st)) ->
    match y with
    | ISet (typ, lst)     -> mem_set instrs x typ lst st data
    | IMap (typ, lst)     -> mem_map instrs x typ lst st data
    | IBig_map (typ, lst) -> mem_big_map instrs x typ lst st data
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.GET, (x :: y :: st)) ->
    match y with
    | IMap (typ, lst)     -> get_map instrs x typ lst st data
    | IBig_map (typ, lst) -> get_big_map instrs x typ lst st data
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.GET_N integer, (x :: y :: st)) -> st(*TODO*)
  | (AbsMichelson.UPDATE, (x :: y :: st)) -> st(*TODO handle types carefully! *)
  | (AbsMichelson.UPDATE_N integer, ( :: st)) ->  st(*TODO*)
  | (AbsMichelson.IF (instrs0, instrs), (x :: st)) ->
    match x with
    | IBool true  -> evalList evalInstr instrs0 st data
    | IBool false -> evalList evalInstr instrs st data
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LOOP instrs, (x :: st)) -> (*loop instrs stack data*)
    match x with
    | IBool true  -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList evalInstr instrs st data) data (* not sure if loop-function is more efficient then recursively evaluating evalInstr *)
    | IBool false -> st
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LOOP_LEFT instrs, (x :: st)) -> (*loop_left instrs stack data*)
    match x with
    | IOr (_, L, y) -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList evalInstr instrs (y :: st) data) data
    | IOr (_, R, y) -> y :: st
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LAMBDA (typ0, typ, instrs), _) -> ILambda(evalTyp typ0, evalTyp typ, instrs) :: stack
  | (AbsMichelson.EXEC, (x :: y :: st)) -> (exec x y data) :: st
  | (AbsMichelson.APPLY, ( :: st)) ->  st (* TODO Values that are not both pushable and storable (values of type operation, contract _ and big_map _ _) cannot be captured by APPLY (cannot appear in ty1).*)
  | (AbsMichelson.DIP instrs, (x :: st)) -> x :: (evalList evalInstr instrs st data)
  | (AbsMichelson.DIP_N (integer, instrs), _)) ->  dip_n instrs n stack data
  | (AbsMichelson.FAILWITH, (x :: st)) -> raise Failwith ("Evaluation failed with FAILWITH instruction", x)
  | (AbsMichelson.CAST, (x :: st)) -> st(* TODO: 1. shouldnt it be 'CAST typ'? 2. What are two different compatible types? only e.g. CPair -> TPair?  *)
  | (AbsMichelson.RENAME, ( :: st)) ->  st(* TODO: depends on variable annotations*)
  | (AbsMichelson.CONCAT, (x :: y :: st)) ->
    match (x, y) with
    | (IString(s0), IString(s)))            -> IString(s0 ^ s) :: st
    | (IList(AbsMichelson.CString, lst), _) -> IString(String.concat lst) :: st (* includes case where lst=[] (adds empty string) *)
    | (IBytes(b0), IBytes(b)))              -> IBytes(b0 ^ b) :: st
    | (IList(AbsMichelson.CBytes, []), _)   -> IBytes("0x") :: st
    | (IList(AbsMichelson.CBytes, lst), _)  -> IBytes(String.concat lst) :: st
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.SLICE, (x :: y :: z :: st)) ->
    match (x, y, z) with
    | (INat(offset), INat(len), IString(s)) -> slice_str offset len s :: st
    | (INat(offset), INat(len), IBytes(b))  -> slice_bytes offset len s :: st
    | _ -> raise_InstrValue_Mismatch instr [x; y; z]
  | (AbsMichelson.PACK, (x :: st)) ->  st (*TODO*)
  | (AbsMichelson.UNPACK typ, (x :: st)) ->  evalTyp typ :: st (*TODO*)
  | (AbsMichelson.ADD, x :: y :: st)) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.add x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.add x y) :: st
    | (IInt (x) :: ITimestamp (y))
    | (ITimestamp (x) :: IInt (y))         -> ITimestamp (Z.add x y) :: st
    | (IMutez (x) :: IMutez (y))           -> IMutez (Z.add x y) :: st
    | (IBls_381_g1 (x) :: IBls_381_g1 (y)) -> IBls_381_g1 (Z.add x y) :: st (*TODO https://tezos.gitlab.io/alpha/michelson.html#bls12-381-primitives*)
    | (IBls_381_g2 (x) :: IBls_381_g2 (y)) -> IBls_381_g2 (Z.add x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IBls_381_fr (y)) -> IBls_381_fr (Z.add x y) :: st (*TODO*)
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.SUB, (x :: y :: st)) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.sub x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.sub x y) :: st
    | (ITimestamp (x) :: IInt (y))         -> ITimestamp (Z.sub x y) :: st
    | (ITimestamp (x) :: ITimestamp (y))   -> IInt (Z.sub x y) :: st
    | (IMutez (x) :: IMutez (y))           -> if (Z.sub x y >= 0) then IMutez (Z.sub x y) :: st else failwith "Result of mutez substraction is negative"
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.MUL, (x :: y :: st)) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.mul x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.mul x y) :: st
    | (IMutez (x) :: INat (y))
    | (INat (x) :: IMutez (y))             -> IMutez (Z.mul x y) :: st (* TODO: run-time error if the product overflows *)
    | (IBls_381_g1 (x) :: IBls_381_fr (y)) -> IBls_381_g1 (Z.mul x y) :: st (*TODO*)
    | (IBls_381_g2 (x) :: IBls_381_fr (y)) -> IBls_381_g2 (Z.mul x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IBls_381_fr (y)) -> IBls_381_fr (Z.mul x y) :: st (*TODO*)
    | (INat (x) :: IBls_381_fr (y))        -> IBls_381_fr (Z.mul x y) :: st (*TODO*)
    | (IInt (x) :: IBls_381_fr (y))        -> IBls_381_fr (Z.mul x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: INat (y))        -> IBls_381_fr (Z.mul x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IInt (y))        -> IBls_381_fr (Z.mul x y) :: st (*TODO*)
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.EDIV, (x :: y :: st)) ->
  | (AbsMichelson.ABS, (x :: st)) ->
  | (AbsMichelson.SNAT, (x :: st)) ->
  | (AbsMichelson.INT, (x :: st)) ->
  | (AbsMichelson.NEG, (x :: st)) ->
  | (AbsMichelson.LSL, (x :: y :: st)) ->
  | (AbsMichelson.LSR, (x :: y :: st)) ->
  | (AbsMichelson.OR, (x :: y :: st)) ->
  | (AbsMichelson.AND, (x :: y :: st)) ->
  | (AbsMichelson.XOR, (x :: y :: st)) ->
  | (AbsMichelson.NOT, (x :: st)) ->
  | (AbsMichelson.COMPARE, (x :: y :: st)) ->
  | (AbsMichelson.EQ, (x :: st)) ->
  | (AbsMichelson.NEQ, (x :: st)) ->
  | (AbsMichelson.LT, (x :: st)) ->
  | (AbsMichelson.GT, (x :: st)) ->
  | (AbsMichelson.LE, (x :: st)) ->
  | (AbsMichelson.GE, (x :: st)) ->
  | (AbsMichelson.SELF, _) ->
  | (AbsMichelson.SELF_ADDRESS, _) ->
  | (AbsMichelson.CONTRACT typ, ( :: st)) -> evalTyp typ
  | (AbsMichelson.TRANSFER_TOKENS, ( :: st)) ->
  | (AbsMichelson.SET_DELEGATE, ( :: st)) ->
  | (AbsMichelson.CREATE_CONTRACT instrs, ( :: st)) -> " evalList evalInstr instrs"
  | (AbsMichelson.IMPLICIT_ACCOUNT, ( :: st)) ->
  | (AbsMichelson.VOTING_POWER, ( :: st)) ->
  | (AbsMichelson.NOW, _) ->
  | (AbsMichelson.LEVEL, _) ->
  | (AbsMichelson.AMOUNT, _) ->
  | (AbsMichelson.BALANCE, _) ->
  | (AbsMichelson.CHECK_SIGNATURE, ( :: st)) ->
  | (AbsMichelson.BLAKE2B, ( :: st)) ->
  | (AbsMichelson.KECCAK, ( :: st)) ->
  | (AbsMichelson.SHA3, ( :: st)) ->
  | (AbsMichelson.SHA256, ( :: st)) ->
  | (AbsMichelson.SHA512, ( :: st)) ->
  | (AbsMichelson.HASH_KEY, ( :: st)) ->
  | (AbsMichelson.SOURCE, _) ->
  | (AbsMichelson.SENDER, _) ->
  | (AbsMichelson.ADDRESS, _) ->
  | (AbsMichelson.CHAIN_ID, _) ->
  | (AbsMichelson.TOTAL_VOTING_POWER, ( :: st)) ->
  | (AbsMichelson.PAIRING_CHECK, ( :: st)) ->
  | (AbsMichelson.SAPLING_EMPTY_STATE integer, ( :: st)) ->  " evalInt integer"
  | (AbsMichelson.SAPLING_VERIFY_UPDATE, ( :: st)) ->
  | (AbsMichelson.TICKET, ( :: st)) ->
  | (AbsMichelson.READ_TICKET, ( :: st)) ->
  | (AbsMichelson.SPLIT_TICKET, ( :: st)) ->
  | (AbsMichelson.JOIN_TICKETS, ( :: st)) ->
  | (AbsMichelson.OPEN_CHEST, ( :: st)) ->
  | (_, []) -> raise Illegal_Instruction ("Stack does not contain the necessary amount of values" instr) (* raise exception for instructions that need one or more elements on the stack but the stack does not contain this much values *)

and evalTyp (typ : AbsMichelson.typ) (st : value list): value = match (instr, st) with
  | AbsMichelson.TCtype ctyp -> evalCTyp ctyp
  | AbsMichelson.TOperation  -> IOperation :: st) (* typ not value here!!! *)
  | AbsMichelson.TContract typ -> IContract (evalTyp typ) :: st)
  | AbsMichelson.TOption typ -> IOption (evalTyp typ) :: st)
  | AbsMichelson.TList typ -> IList (evalTyp typ) :: st)
  | AbsMichelson.TSet ctyp -> ISet (evalCTyp ctyp) :: st)
  | AbsMichelson.TTicket ctyp -> ITicket (evalCTyp ctyp))
  | AbsMichelson.TPair (typ, typeseqs) -> IPair (evalTyp typ, eval))
  | AbsMichelson.TOr (typ0, typ) -> IOr (evalTyp typ0, evalTyp typ))
(*
  | AbsMichelson.TLambda (typ0, typ) ->  "TLambda"  ' '  '('  evalTyp typ0   ", "   evalTyp typ  ')'
  | AbsMichelson.TMap (ctyp, typ) ->  "TMap"  ' '  '('  evalCTyp ctyp   ", "   evalTyp typ  ')'
  | AbsMichelson.TBig_map (ctyp, typ) ->  "TBig_map"  ' '  '('  evalCTyp ctyp   ", "   evalTyp typ  ')'
  | AbsMichelson.TBls_g1  ->  "TBls_g1"
  | AbsMichelson.TBls_g2  ->  "TBls_g2"
  | AbsMichelson.TBls_fr  ->  "TBls_fr"
  | AbsMichelson.TSapling_transaction integer ->  "TSapling_transaction"  ' '  '('  evalInt integer  ')'
  | AbsMichelson.TSapling_state integer ->  "TSapling_state"  ' '  '('  evalInt integer  ')'
  | AbsMichelson.TChest  ->  "TChest"
  | AbsMichelson.TChest_key ->
and evalTypeSeq (e : AbsMichelson.typeSeq) : evalable = match (instr, st) with
       AbsMichelson.TypeSeq0 typ ->  "TypeSeq0"  ' '  '('  evalTyp typ  ')'
and evalCTyp (e : AbsMichelson.cTyp) : evalable = match (instr, st) with
       AbsMichelson.CUnit  ->  "CUnit"
  | AbsMichelson.CNever  ->  "CNever"
  | AbsMichelson.CBool  ->  "CBool"
  | AbsMichelson.CInt  ->  "CInt"
  | AbsMichelson.CNat  ->  "CNat"
  | AbsMichelson.CString  ->  "CString"
  | AbsMichelson.CChain_id  ->  "CChain_id"
  | AbsMichelson.CBytes  ->  "CBytes"
  | AbsMichelson.CMutez  ->  "CMutez"
  | AbsMichelson.CKey_hash  ->  "CKey_hash"
  | AbsMichelson.CKey  ->  "CKey"
  | AbsMichelson.CSignature  ->  "CSignature"
  | AbsMichelson.CTimestamp  ->  "CTimestamp"
  | AbsMichelson.CAddress  ->  "CAddress"
  | AbsMichelson.COption ctyp ->  "COption"  ' '  '('  evalCTyp ctyp  ')'
  | AbsMichelson.COr (ctyp0, ctyp) ->  "COr"  ' '  '('  evalCTyp ctyp0   ", "   evalCTyp ctyp  ')'
  | AbsMichelson.CPair (ctyp, ctypeseqs) ->  "CPair"  ' '  '('  evalCTyp ctyp   ", "   evalList evalCTypeSeq ctypeseqs  ')'
and evalCTypeSeq (e : AbsMichelson.cTypeSeq) : evalable = match (instr, st) with
       AbsMichelson.CTypeSeq0 ctyp ->  "CTypeSeq0"  ' '  '('  evalCTyp ctyp  ')'


let rec evalProg (e : AbsMichelson.prog) : evalable = match (instr, st) with
       AbsMichelson.Contract (typ0, typ, instrs) ->  "Contract"  ' '  '('  evalTyp typ0   ", "   evalTyp typ   ", "   evalList evalInstr instrs  ')'

and evalInte (e : AbsMichelson.inte) : evalable = match (instr, st) with
       AbsMichelson.DIntPos integer ->  "DIntPos"  ' '  '('  evalInt integer  ')'
  | AbsMichelson.DIntNeg integer ->  "DIntNeg"  ' '  '('  evalInt integer  ')'

and evalData (e : AbsMichelson.data) : evalable = match (instr, st) with
  |AbsMichelson.DInt inte ->  "DInt"  ' '  '('  evalInte inte  ')'
  | AbsMichelson.DStr str ->  "DStr"  ' '  '('  evalStr str  ')'
  | AbsMichelson.DBytes hex ->  "DBytes"  ' '  '('  evalHex hex  ')'
  | AbsMichelson.DUnit  ->  "DUnit"
  | AbsMichelson.DTrue  ->  "DTrue"
  | AbsMichelson.DFalse  ->  "DFalse"
  | AbsMichelson.DPair (data, pairseqs) ->  "DPair"  ' '  '('  evalData data   ", "   evalList evalPairSeq pairseqs  ')'
  | AbsMichelson.DLeft data ->  "DLeft"  ' '  '('  evalData data  ')'
  | AbsMichelson.DRight data ->  "DRight"  ' '  '('  evalData data  ')'
  | AbsMichelson.DSome data ->  "DSome"  ' '  '('  evalData data  ')'
  | AbsMichelson.DNone  ->  "DNone"
  | AbsMichelson.DBlock datas ->  "DBlock"  ' '  '('  evalList evalData datas  ')'
  | AbsMichelson.DMap mapseqs ->  "DMap"  ' '  '('  evalList evalMapSeq mapseqs  ')'
  | AbsMichelson.DInstruction instr ->  "DInstruction"  ' '  '('  evalInstr instr  ')'

and evalPairSeq (e : AbsMichelson.pairSeq) : evalable = match (instr, st) with
       AbsMichelson.DPairSeq data ->  "DPairSeq"  ' '  '('  evalData data  ')'

and evalMapSeq (e : AbsMichelson.mapSeq) : evalable = match (instr, st) with
       AbsMichelson.DMapSeq (data0, data) ->  "DMapSeq"  ' '  '('  evalData data0   ", "   evalData data  ')'
*)


(*
let evalValue (typ : AbsMichelson.typ) (dat : AbsMichelson.data) =
  match (typ, dat) with
  | (AbsMichelson.TCtype ctyp, _) -> evalCTyp ctyp
  | (AbsMichelson.TOption typ, AbsMichelson.DSome data) -> IOption (evalTyp typ) :: st)
  | (AbsMichelson.TOption typ, AbsMichelson.DNone) -> IOption (evalTyp typ) :: st)
  | (AbsMichelson.TList typ, AbsMichelson.DBlock datas) -> IList (evalTyp typ) :: st)
  | (AbsMichelson.TSet ctyp, AbsMichelson.DBlock datas) -> ISet (evalCTyp ctyp) :: st)
  | (AbsMichelson.TPair (typ, typeseqs), AbsMichelson.DPair (data, pairseqs) -> IPair (evalTyp typ, eval))
  | (AbsMichelson.TOr (typ0, typ), AbsMichelson.DLeft data -> IOr (evalTyp typ0, evalTyp typ))
  | (AbsMichelson.TOr (typ0, typ), AbsMichelson.DRight data -> IOr (evalTyp typ0, evalTyp typ))
  | (AbsMichelson.TLambda (typ0, typ) ->  "TLambda"  ' '  '('  evalTyp typ0   ", "   evalTyp typ  ')'
  | (AbsMichelson.TMap (ctyp, typ) ->  "TMap"  ' '  '('  evalCTyp ctyp   ", "   evalTyp typ  ')'
  | (AbsMichelson.TBig_map (ctyp, typ) ->  "TBig_map"  ' '  '('  evalCTyp ctyp   ", "   evalTyp typ  ')'
  | (AbsMichelson.TBls_g1  ->  "TBls_g1"
  | (AbsMichelson.TBls_g2  ->  "TBls_g2"
  | (AbsMichelson.TBls_fr  ->  "TBls_fr"
  | (AbsMichelson.TSapling_transaction integer ->  "TSapling_transaction"  ' '  '('  evalInt integer  ')'
  | (AbsMichelson.TSapling_state integer ->  "TSapling_state"  ' '  '('  evalInt integer  ')'
  | (AAbsMichelson.TChest  ->  "TChest"
  | (AAbsMichelson.TChest_key ->
and evalTypeSeq (e : AbsMichelson.typeSeq) : evalable = match (instr, st) with
       AbsMichelson.TypeSeq0 typ ->  "TypeSeq0"  ' '  '('  evalTyp typ  ')'
and evalCTyp (e : AbsMichelson.cTyp) : evalable = match (instr, st) with
       AbsMichelson.CUnit  ->  "CUnit"
  | AbsMichelson.CNever  ->  "CNever"
  | AbsMichelson.CBool  ->  "CBool"
  | AbsMichelson.CInt  ->  "CInt"
  | AbsMichelson.CNat  ->  "CNat"
  | AbsMichelson.CString  ->  "CString"
  | AbsMichelson.CChain_id  ->  "CChain_id"
  | AbsMichelson.CBytes  ->  "CBytes"
  | AbsMichelson.CMutez  ->  "CMutez"
  | AbsMichelson.CKey_hash  ->  "CKey_hash"
  | AbsMichelson.CKey  ->  "CKey"
  | AbsMichelson.CSignature  ->  "CSignature"
  | AbsMichelson.CTimestamp  ->  "CTimestamp"
  | AbsMichelson.CAddress  ->  "CAddress"
  | AbsMichelson.COption ctyp ->  "COption"  ' '  '('  evalCTyp ctyp  ')'
  | AbsMichelson.COr (ctyp0, ctyp) ->  "COr"  ' '  '('  evalCTyp ctyp0   ", "   evalCTyp ctyp  ')'
  | AbsMichelson.CPair (ctyp, ctypeseqs) ->  "CPair"  ' '  '('  evalCTyp ctyp   ", "   evalList evalCTypeSeq ctypeseqs  ')'
and evalCTypeSeq (e : AbsMichelson.cTypeSeq) : evalable = match (instr, st) with
       AbsMichelson.CTypeSeq0 ctyp ->  "CTypeSeq0"  ' '  '('  evalCTyp ctyp  ')'
*)






