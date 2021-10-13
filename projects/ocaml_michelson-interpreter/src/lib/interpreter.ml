open Base
open Lexing

type tx_data = { (* transaction parameters *)
  balance : value ; (* IMutez  *)
  source : value ; (* IAdress *)
  sender : value ; (* IAdress *)
  self : value ; (* IContract *)
  self_address : value ; (* IAdress *)
  amount : value ; (* IMutez *)
  timestamp : value ; (* ITimestamp, (minimal injection time for the current block, used in the NOW instruction) *)
  (*level : value ; (* INat *)*)
}
(*[@@deriving eq, show { with_path = false }]*)

type union = L | R
type value =
  | IOperation of typ (* TODO: contract type? *)
  | IContract of typ * string option (* TODO: string = contract address?? *)
  | IList of typ * value list
  | ISet of typ * value list (* FIXME set with comparator witness for all ctypes?*)
  | ITicket of value * value * value (* TODO: first 'value'=IPair *)
  | ILambda of (typ * typ) * instr list
  | IMap of (typ * typ) * (value * value) list (* FIXME use Map? comparator witness for each key ctyp?*)
  | IBig_map of (typ * typ) * (value * value) list
  | IBls_381_g1 of bytes (* FIXME types and operations on this values *)
  | IBls_381_g2 of bytes
  | IBls_381_fr of bytes
  | ISapling_transaction (* TODO: saplings are maybe to be removed? *)
  | ISapling_state
  | IChest of value * value (* TODO bytes * 'parameters to open it' *)
  | IChest_key of value (* TODO Key or Key_hash ? *)
  (* dual (comparable/not comparable) types *)
  | IOption of typ * value option
  | IPair of value * value
  | IOr of typ * union * value (* typ is the type of the other/unused union side *)
  (* comparable types *)
  | IUnit
  | INever
  | IBool of bool
  | IInt of Z.t
  | INat of Z.t
  | IString of string
  | IChain_id of string
  | IBytes of bytes (* FIXME: string or bytes? conersion? fix byte instructions *)
  | IMutez of int64
  | IKey_hash of string
  | IKey of string
  | ISignature of string
  | ITimestamp of Z.t
  | IAddress of string
type typ =
  | TOperation of typ
  | TContract of typ (* ignore typ? *)
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
  | IOperation (ty)           -> TOperation (ty)
  | IContract (ty, _)         -> TContract (ty)
  | IList (ty, _)             -> IList (ty)
  | ISet (ty, _)              -> TSet (ty)
  | ITicket _                 -> TTicket
  | ILambda ((ty0, ty), _)    -> TLambda (ty0, ty)
  | IMap ((ty0, ty), _)       -> TMap (ty0, ty)
  | IBig_map ((ty0, ty), _)   -> TBig_map (ty0, ty)
  | IBls_381_g1 _             -> TBls_381_g1
  | IBls_381_g2 _             -> TBls_381_g2
  | IBls_381_fr _             -> TBls_381_fr
  | ISapling_transaction      -> TSapling_transaction
  | ISapling_state            -> TSapling_state
  | IChest _                  -> TChest
  | IChest_key _              -> TChest_key
  (* dual (comparable/not comparable) types *)
  | IOption (ty, _)           -> TOption (ty)
  | IPair(v0, v)              -> TPair (typeof(v0), typeof(v))
  | IOr (ty, union, x)        -> TOr (ty, typeof(x))
  (* comparable types *)
  | IUnit                     -> TUnit
  | INever                    -> TNever
  | IBool _                   -> TBool
  | IInt _                    -> TInt
  | INat _                    -> TNat
  | IString _                 -> TString
  | IChain_id _               -> TChain_id
  | IBytes _                  -> TBytes
  | IMutez _                  -> TMutez
  | IKey_hash _               -> TKey_hash
  | IKey _                    -> TKey
  | ISignature _              -> TSignature
  | ITimestamp _              -> TTimestamp
  | IAddress _                -> TAddress

(* TODO First try of a function that returns comparators/the modules for comparable types (needed for Sets and Maps) *)
(*let rec comparator (t : typ) =
  else match v with
  | TOption (ty) -> comparator ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> (compartor ty0, comparator ty)
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
  | TAddress
  | _ -> raise failwith "comparator casted for not comparable type"*)

(* Type class membership checker functions
   based on table at https://tezos.gitlab.io/michelson-reference/#types *)
(* FIXME: (e.g.) operation is not storable, but NIL operation (list of type operation) is to be stored at the end of the contract
 -> does that mean that some types are 'part' of a class as long as they are wrapped in a pair/list/... ?
 https://tezos.gitlab.io/michelson-reference/#type-operation *)
let rec comparable (t : typ (* comparable typ *)) : bool =
  match t with
  | TOption (ty) -> comparable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> comparable ty0 && ty
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
  | TOperation (ty)
  | TContract (ty)
  | TList (ty)
  | TSet (ty) -> duplicable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty)
  | TBig_map (ty0, ty) -> duplicable ty0 && duplicable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TSapling_state
  | TChest
  | TChest_key -> true
  | TOption (ty) -> duplicable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> duplicable ty0 && ty
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
  | TContract (ty)
  | TList (ty)
  | TSet (ty) -> packable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> packable ty0 && ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption (ty) -> packable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> packable ty0 && ty
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
  | TList (ty)
  | TSet (ty) -> pushable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> pushable ty0 && ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption (ty) -> pushable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> pushable ty0 && ty
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
  (* all types except contract and operation are storable *)
  | TTicket -> true
  | TList (ty)
  | TSet (ty) -> storable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty)
  | TBig_map (ty0, ty) -> storable ty0 && storable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TSapling_state
  | TChest
  | TChest_key -> true
  | TOption (ty) -> storable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> storable ty0 && ty
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
let rec passable (t: typ) : bool =
  match t with
  | TContract (ty)
  | TList (ty)
  | TSet (ty) -> passable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> passable ty0 && passable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption (ty) -> passable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> passable ty0 && ty
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
let rec big_map_domain (t: typ) : bool =
  match t with
  | TTicket -> true
  | TList (ty)
  | TSet (ty) -> big_map_domain ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> big_map_domain ty0 && big_map_domain ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption (ty) -> big_map_domain ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> big_map_domain ty0 && ty
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

let comparable_pair (t0, t : typ * typ) : bool =
  duplicable t0 && duplicable t



exception Illegal_Instruction of string * AbsMichelson.instr
exception StackTypeError of string * AbsMichelson.instr * typ list
let raise_InstrValue_Mismatch (instr : AbsMichelson.instr) (x : value list) : unit = raise StackTypeError ("Instr & Stack value type mismatch", instr, List.map x ~f:(fun x -> typeof(x)))
exception TypeInstrError of string * AbsMichelson.instr * (typ * typ)
exception TypeError of string * typ
exception TypeDataError of string * typ * AbsMichelson.data
exception Failwith of string * value


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
  iter_list instr typ lst st data (* TODO as long as ISet definition is the same as IList *)
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
  (* TODO: implementation depends on if map is implemented as List or Map
  maybe using List.find_map?
  returns IOption(evalTyp typ, None/Some z):: st
  *)
let get_big_map (instrs : AbsMichelson.instr list) (x : value) typ (lst : value list) (st : value list) (data : tx_data) : value list =
  ()
  (* TODO: implementation depends on if big_map is implemented as List or Map
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
      | [z] -> if (typeof(z) = snd tys) then z else raise TypeInstrError ("Lambda output type mismatch", AbsMichelson.EXEC, (typeof(rst), snd tys))
      | _ -> raise Illegal_Instruction ("Lambda output should be exactly one value", AbsMichelson.EXEC)
    else raise TypeInstrError ("Lambda input type mismatch", AbsMichelson.EXEC, (typeof(x), fst tys))
  in
  match y with
  | ILambda(tys, instrs) -> f instrs tys data
  | _ -> raise_InstrValue_Mismatch AbsMichelson.EXEC [x; y]

(* DIP_n instr *)
let dip_n (instrs : AbsMichelson.instr list) (n : int) (st : value list) (data : tx_data) : value list =
  let (fst, snd) = List.split_n instrs n in
  match (fst, snd) with
  | (_, []) -> raise Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DIP_N (n))
  | (fst, snd) -> fst @ (evalList evalInstr instr snd data) (* this case also matches n=0 *)




(* main evaluation functions *)
(* TODO: remove evalFun if it is always = evalInstr*)
let evalList (evalFun : (AbsMichelson.instr -> value list -> tx_data -> value list)) (xs : 'a list) (st : value list) (data : tx_data) : value list =
  let rec f ys stack data = match ys with
    | []      -> stack (* case needed as empty instruction-lists are allowed *)
    | [y]     -> evalFun y stack data
    | y :: ys -> f ys (evalFun y stack data) data
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
    let value = evalValue (evalTyp typ) data in
    if (pushable(typeof(value))) then (value :: stack)
    else raise Illegal_Instruction ("value type to be pushed is not pushable", instr)
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
  | (AbsMichelson.UNPAIR_N integer, (x :: st)) ->
     match x with
     | IPair_n (x) -> unpair_n integer stack x
     | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LEFT typ, (x :: st)) -> IOr (evalTyp typ , L, x)
  | (AbsMichelson.RIGHT typ, (x :: st)) ->  IOr (evalTyp typ, R, x)
  | (AbsMichelson.IF_LEFT (instrs0, instrs), (x :: st)) ->
    match x with
    | IOr (_, L, y) -> evalList evalInstr instrs0 (y :: st) data
    | IOr (_, R, y) -> evalList evalInstr instrs (y :: st) data
    | _ -> raise_InstrValue_Mismatch instr [x] (* TODO/Problem: IF_RIGHT is macro of IF_LEFT and therefore will return errors of IF_LEFT*)
  | (AbsMichelson.NIL typ, _) ->  IList (evalTyp typ, []) :: stack
  | (AbsMichelson.CONS, (x :: y :: st)) ->
    match (x, y) with
    | (x, IList(typ, lst)) when typ = typeof(x) -> IList(typ, (x :: lst)) :: st
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
  | (AbsMichelson.EMPTY_SET ctyp, _) -> ISet (evalCTyp ctyp, []) :: stack
  | (AbsMichelson.EMPTY_MAP (ctyp, typ), _) ->  IMap ((evalTyp ctyp, evalTyp typ), []) :: stack (*Map.empty with given types?? would need a reversed evalTyp typ function *)
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
  | (AbsMichelson.GET_N integer, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.UPDATE, (x :: y :: st)) -> st (*TODO handle types carefully! *)
  | (AbsMichelson.UPDATE_N integer, (x :: st)) ->  st (*TODO*)
  | (AbsMichelson.IF (instrs0, instrs), (x :: st)) ->
    match x with
    | IBool true  -> evalList evalInstr instrs0 st data
    | IBool false -> evalList evalInstr instrs st data
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LOOP instrs, (x :: st)) -> (*loop instrs stack data*)
    match x with
    | IBool true  -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList evalInstr instrs st data) data (* TODO not sure if loop-function is more efficient then recursively evaluating evalInstr *)
    | IBool false -> st
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LOOP_LEFT instrs, (x :: st)) -> (*loop_left instrs stack data*)
    match x with
    | IOr (_, L, y) -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList evalInstr instrs (y :: st) data) data
    | IOr (_, R, y) -> y :: st
    | _ -> raise_InstrValue_Mismatch instr [x]
  | (AbsMichelson.LAMBDA (typ0, typ, instrs), _) -> ILambda(evalTyp typ0, evalTyp typ, instrs) :: stack
  | (AbsMichelson.EXEC, (x :: y :: st)) -> (exec x y data) :: st
  | (AbsMichelson.APPLY, (x :: st)) ->  st (* TODO Values that are not both pushable and storable (values of type operation, contract _ and big_map _ _) cannot be captured by APPLY (cannot appear in ty1).*)
  | (AbsMichelson.DIP instrs, (x :: st)) -> x :: (evalList evalInstr instrs st data)
  | (AbsMichelson.DIP_N (integer, instrs), _) ->  dip_n instrs n stack data
  | (AbsMichelson.FAILWITH, (x :: st)) -> raise Failwith ("Evaluation failed with FAILWITH instruction", x)
  | (AbsMichelson.CAST, (x :: st)) -> st(* TODO: 1. shouldnt it be 'CAST typ'? 2. What are two different compatible types? only e.g. CPair -> TPair?  *)
  | (AbsMichelson.RENAME, (x :: st)) ->  st(* TODO: depends on variable annotations*)
  | (AbsMichelson.CONCAT, (x :: y :: st)) ->
    match (x, y) with
    | (IString(s0), IString(s))             -> IString(s0 ^ s) :: st
    | (IList(AbsMichelson.CString, lst), _) -> IString(String.concat lst) :: st (* includes case where lst=[] (adds empty string) *)
    | (IBytes(b0), IBytes(b))               -> IBytes(b0 ^ b) :: st
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
  | (AbsMichelson.ADD, x :: y :: st) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.add x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.add x y) :: st
    | (IInt (x) :: ITimestamp (y))
    | (ITimestamp (x) :: IInt (y))         -> ITimestamp ( x y) :: st
    | (IMutez (x) :: IMutez (y))           -> IMutez (Int64.add x y) :: st
    | (IBls_381_g1 (x) :: IBls_381_g1 (y)) -> IBls_381_g1 ( x y) :: st (*TODO https://tezos.gitlab.io/alpha/michelson.html#bls12-381-primitives*)
    | (IBls_381_g2 (x) :: IBls_381_g2 (y)) -> IBls_381_g2 ( x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IBls_381_fr (y)) -> IBls_381_fr ( x y) :: st (*TODO*)
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.SUB, (x :: y :: st)) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.sub x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.sub x y) :: st
    | (ITimestamp (x) :: IInt (y))         -> ITimestamp (Z.sub x y) :: st
    | (ITimestamp (x) :: ITimestamp (y))   -> IInt (Z.sub x y) :: st
    | (IMutez (x) :: IMutez (y))           -> if (Int64.sub x y >= 0) then IMutez (Int64.sub x y) :: st else failwith "Result of mutez substraction is negative"
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.MUL, (x :: y :: st)) ->
    match (x, y) with
    | (INat (x) :: INat (y))               -> INat (Z.mul x y) :: st
    | (INat (x) :: IInt (y))
    | (IInt (x) :: INat (y))
    | (IInt (x) :: IInt (y))               -> IInt (Z.mul x y) :: st
    | (IMutez (x) :: INat (y))             -> IMutez (Int64.add x (Z.to_int64 y)) :: st (* Z.to_int64 my raise Overflow TODO: run-time error if the product overflows *)
    | (INat (x) :: IMutez (y))             -> IMutez (Int64.add (Z.to_int64 x) y) :: st (* TODO: run-time error if the product overflows...or just use Z.int instead *)
    | (IBls_381_g1 (x) :: IBls_381_fr (y)) -> IBls_381_g1 ( x y) :: st (*TODO*)
    | (IBls_381_g2 (x) :: IBls_381_fr (y)) -> IBls_381_g2 ( x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IBls_381_fr (y)) -> IBls_381_fr ( x y) :: st (*TODO*)
    | (INat (x) :: IBls_381_fr (y))        -> IBls_381_fr ( x y) :: st (*TODO*)
    | (IInt (x) :: IBls_381_fr (y))        -> IBls_381_fr ( x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: INat (y))        -> IBls_381_fr ( x y) :: st (*TODO*)
    | (IBls_381_fr (x) :: IInt (y))        -> IBls_381_fr ( x y) :: st (*TODO*)
    | _ -> raise_InstrValue_Mismatch instr [x; y]
  | (AbsMichelson.EDIV, (x :: y :: st)) ->
  | (AbsMichelson.ABS, (x :: st)) -> (* FIXME syntax error in exactly this line*)
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
  | (AbsMichelson.SELF, _) -> data.self :: stack
  | (AbsMichelson.SELF_ADDRESS, _) -> data.self_address :: stack
  | (AbsMichelson.CONTRACT typ, (x :: st)) ->
    match x with
    | IAdress (y) -> IContract (evalTyp typ, Some y) (* TODO: no possibility to check if adress is exists and what type it is? *)
    | _ -> raise_InstrValue_Mismatch instr x
  | (AbsMichelson.TRANSFER_TOKENS, (x :: st)) ->
  | (AbsMichelson.SET_DELEGATE, (x :: st)) ->
  | (AbsMichelson.CREATE_CONTRACT (typ0, typ, instrs), _) -> " evalList evalInstr (vll evalDataInstr instrs"
  | (AbsMichelson.IMPLICIT_ACCOUNT, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.VOTING_POWER, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.NOW, _) -> data.timestamp :: stack
  | (AbsMichelson.LEVEL, _) -> data... :: stack (* TODO: Contract related*)
  | (AbsMichelson.AMOUNT, _) -> data.amount :: stack
  | (AbsMichelson.BALANCE, _) -> data.balance :: stack
  | (AbsMichelson.CHECK_SIGNATURE, (x :: st)) ->
  | (AbsMichelson.BLAKE2B, (x :: st)) ->
  | (AbsMichelson.KECCAK, (x :: st)) ->
  | (AbsMichelson.SHA3, (x :: st)) ->
  | (AbsMichelson.SHA256, (x :: st)) ->
  | (AbsMichelson.SHA512, (x :: st)) ->
  | (AbsMichelson.HASH_KEY, (x :: st)) ->
  | (AbsMichelson.SOURCE, _) -> data.source :: stack
  | (AbsMichelson.SENDER, _) -> data.sender :: stack
  | (AbsMichelson.ADDRESS, _) -> data.address :: stack
  | (AbsMichelson.CHAIN_ID, _) -> data.... :: stack (* TODO: Contract related*)
  | (AbsMichelson.TOTAL_VOTING_POWER, (x :: st)) -> data.... :: stack (* TODO: Contract related*)
  | (AbsMichelson.PAIRING_CHECK, (x :: st)) ->
  | (AbsMichelson.SAPLING_EMPTY_STATE integer, (x :: st)) ->  " evalInt integer"
  | (AbsMichelson.SAPLING_VERIFY_UPDATE, (x :: st)) ->
  | (AbsMichelson.TICKET, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.READ_TICKET, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.SPLIT_TICKET, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.JOIN_TICKETS, (x :: st)) -> (* TODO: Contract related*)
  | (AbsMichelson.OPEN_CHEST, (x :: st)) -> (* TODO: Contract related*)
  (* raise exception for instructions that need one or more elements on the stack but the stack does not contain this much values *)
  | (_, []) -> raise Illegal_Instruction ("Stack does not contain the necessary amount of values" instr)

and evalTyp (ty : AbsMichelson.typ) : typ = match ty with
  | AbsMichelson.TCtype ctyp                  -> evalCType ctyp
  | AbsMichelson.TOperation                   -> TOperation
  | AbsMichelson.TContract typ                -> TContract (evalType typ)
  | AbsMichelson.TOption typ                  -> TOption (evalType typ)
  | AbsMichelson.TList typ                    -> TList (evalType typ)
  | AbsMichelson.TSet ctyp                    -> TSet (evalCType ctyp)
  | AbsMichelson.TTicket ctyp                 -> TTicket (evalCType ctyp)
  | AbsMichelson.TPair (typ, typeseqs)        -> TPair (evalType typ, evalTypeSeq evalTyp typeseqs)
  | AbsMichelson.TOr (typ0, typ)              -> TOr (evalType typ0, evalType typ)
  | AbsMichelson.TLambda (typ0, typ)          -> TLambda (evalType typ0, evalType typ)
  | AbsMichelson.TMap (ctyp, typ)             -> TMap (evalCType ctyp, evalType typ)
  | AbsMichelson.TBig_map (ctyp, typ)         -> TBig_map (evalCType ctyp, evalType typ)
  | AbsMichelson.TBls_381_g1                  -> TBls_381_g1
  | AbsMichelson.TBls_381_g2                  -> TBls_381_g2
  | AbsMichelson.TBls_381_fr                  -> TBls_381_fr
  | AbsMichelson.TSapling_transaction _       -> TSapling_transaction
  | AbsMichelson.TSapling_state _             -> TSapling_state
  | AbsMichelson.TChest                       -> TChest
  | AbsMichelson.TChest_key                   -> TChest_key
  | _ -> raise TypeError ("Type not implemented in Interpreter", ty)
and evalCTyp (ty : AbsMichelson.cTyp) : typ = match ty with
  | AbsMichelson.CUnit                   -> TUnit
  | AbsMichelson.CNever                  -> TNever
  | AbsMichelson.CBool                   -> TBool
  | AbsMichelson.CInt                    -> TInt
  | AbsMichelson.CNat                    -> TNat
  | AbsMichelson.CString                 -> TString
  | AbsMichelson.CChain_id               -> TChain_id
  | AbsMichelson.CBytes                  -> TBytes
  | AbsMichelson.CMutez                  -> TMutez
  | AbsMichelson.CKey_hash               -> TKey_hash
  | AbsMichelson.CKey                    -> TKey
  | AbsMichelson.CSignature              -> TSignature
  | AbsMichelson.CTimestamp              -> TTimestamp
  | AbsMichelson.CAddress                -> TAddress
  | AbsMichelson.COption ctyp            -> TOption (evalCTyp ctyp)
  | AbsMichelson.COr (ctyp0, ctyp)       -> TOr (evalCTyp ctyp0, evalCTyp ctyp)
  | AbsMichelson.CPair (ctyp, ctypeseqs) -> TPair (evalCTyp ctyp0, evalTypeSeq evalCType ctypeseqs)
  | _ -> raise TypeError ("Type not implemented in Interpreter", ty)
and evalTypeSeq (evalFun : ('a -> typ)) 'a : typ = (* evaluates sequences of AbsMichelson.typ and AbsMichelson.cTyp *)
  let rec f ys = match ys with
  | [y] -> evalFun y
  | y :: ys -> TPair(evalFun y, f ys)
  | [] -> failwith "" (* does not happen as there is no recursive call that invokes this case and a:typSeq/cTypeSeq is nonempty *)
  in
  f a;

and evalValue (t : typ) (e : AbsMichelson.data) : value =
  (* TypeErrors are catched in the '_' case. As all recursive calls come back to evaluate
  'evalValue typ data', this is sufficient to catch all type-data or rather type-value mismatches*)
  match (t, e) with
    | (TOperation ty, _)                                     ->
    | (TContract ty, _)                                      -> IContract (ty, )
    | (TList (ty), AbsMichelson.DBlock datas)                -> IList (ty, evalDataList datas ty
    | (TSet (ty), AbsMichelson.DBlock datas)                 -> ISet (ty, evalDataSet datas ty)
    | (TTicket, _)                                           ->
    | (TLambda (ty0, ty), AbsMichelson.DBlock datas)         -> ILambda ((ty0, ty), instrs) (* in-/output type errors are catched when evaluating lambda *)
    | (TMap (ty0, ty), AbsMichelson.DMap mapseqs)            -> IMap ((ty0, ty), evalDataMap mapseqs (ty0, ty))
    | (TBig_map (ty0, ty), AbsMichelson.DMap mapseqs)        -> IBig_map ((ty0, ty), evalDataMap mapseqs (ty0, ty))
    | (TBls_381_g1, )                                        ->
    | (TBls_381_g2, )                                        ->
    | (TBls_381_fr, )                                        ->
    | (TSapling_transaction, )                               ->
    | (TSapling_state, _)                                    ->
    | (TChest, )                                             ->
    | (TChest_key, )                                         ->
    (* dual (comparable/not comparable) types *)
    | (TOption (ty), AbsMichelson.DSome)                     -> IOption(ty, Some (evalValue ty data))
    | (TOption (ty), AbsMichelson.DNone)                     -> IOption(ty, None)
    | (TPair (ty0, ty), AbsMichelson.DPair (data, pairseqs)) -> IPair(evalValue ty0 data, evalDataPair pairseqs ty)
    | (TOr (ty0, ty), AbsMichelson.DLeft data)               -> IOr(ty, L, evalValue ty0 data)
    | (TOr (ty0, ty), AbsMichelson.DRight data)              -> IOr(ty0, R, evalValue ty data)
    (* comparable types *)
    | (TUnit, AbsMichelson.DUnit)                            -> IUnit
    | (TNever, )                                             -> (* FIXME *)
    | (TBool, AbsMichelson.DTrue)                            -> IBool true
    | (TBool, AbsMichelson.DFalse)                           -> IBool false
    | (TInt, AbsMichelson.DInt inte)                         -> evalInt inte
    | (TInt, AbsMichelson.DNat nat)                          -> evalNat nat
    | (TNat, AbsMichelson.DNat nat)                          -> evalNat nat
    | (TString, AbsMichelson.DStr str)                       -> IString str
    | (TChain_id, AbsMichelson.DStr str)                     -> IChain_id str
    | (TBytes, AbsMichelson.DBytes b)                        -> (* TODO:  *)
    | (TMutez, AbsMichelson.DInt inte)                       -> IMutez (Int64.of_int (evalInt inte))
    | (TMutez, AbsMichelson.DNat nat)                        -> IMutez (Int64.of_int (evalNat nat))
    | (TKey_hash, AbsMichelson.DStr str)                     -> IKey_hash str
    | (TKey, AbsMichelson.DStr str)                          -> IKey str
    | (TSignature, AbsMichelson.DStr str)                    -> ISignature str
    | (TTimestamp, AbsMichelson.DNat nat)                    -> ITimestamp nat
    | (TAddress, AbsMichelson.DStr str)                      -> IAddress str
    (* non pushable *)
    | _ -> raise TypeDataError ("Expected type does not match given data", t, e)

and evalDataList (lst : AbsMichelson.data list) (ty : typ) : value list =
  let f (ty : typ) = (fun x ->
    evalValue ty x
    )
  in
  List.map lst ~f:(f ty)
and evalDataSet (lst : AbsMichelson.data list) (ty : typ) : value list =
  let f (ty : typ) = (fun x ->
    evalValue ty x
    )
  in
  List.map lst ~f:(f ty) (* FIXME: implement als Set.t *)
and evalDataMap (lst : AbsMichelson.mapseq list) (ty0, ty : typ * typ) : value (*IMap*) =
  let f (ty0, ty : typ * typ) = (fun AbsMichelson.DMapSeq (data0, data) ->
    (evalValue ty0 data0, evalValue ty data)
    )
  in
  let lst_of_pairs = List.map lst ~f:(f ty) in
  Map.of_lst lst_of_pairs (module given by ty0) (oder so!)  (* FIXME: implement as Map.t *)
and evalDataPair = (lst : AbsMichelson.pairseq list) (t : typ) : value (*IPair*) =
  let rec f t ps = match (t, ps) with
  | (ty, [p])                   -> evalValue p ty
  | (TPair (ty0, ty), (p :: ps) -> IPair(evalValue p ty0, f ps ty)
  | _ -> failwith "The length of the given pair types & pair values is not equal"
  in
  f t lst;



let (rec)) evalInt (e : AbsMichelson.inte) : value = match e with (* TODO *)
  | AbsMichelson.DIntPos integer ->
  | AbsMichelson.D
let (rec) evalNat (e : AbsMichelson.nat) : value = match e with
  | AbsMichelson.DIntPos integer ->
  | AbsMichelson.DIntNeg integer ->

let showInt (i:int) : showable = s2s (Int.to_string i)
let showFloat (f:float) : showable = s2s (string_of_float f)
let rec showStr (AbsMichelson.Str i) : showable = s2s "Str " >> showString i
let rec showHex (AbsMichelson.Hex i) : showable = s2s "Hex " >> showString i
let showString (s:string) : showable = fun buf ->
    Buffer.add_string buf ("\"" ^ String.escaped s ^ "\"")

let eq_typ typ value : bool = (typ = typeof(value))

let evalProg (e : AbsMichelson.prog) : evalable = match (instr, st) with
       AbsMichelson.Contract (typ0, typ, instrs) ->  "Contract"  ' '  '('  evalTyp typ0   ", "   evalTyp typ   ", "   evalList evalInstr instrs  ')'
       (* TODO: diese funktion vll doch als startfunktion verwenden und ihr zusätzlich parameter und storage mitgeben
       Außerdem fehlt ein Endcheck (welcher von Michelson aus aufgerufen werden muss / oder direkt die rückgabe in dieser funktion hier checkt!!), welcher sicherstellt ob die Ausgabe (storage) erlaubt ist*)

let interpret (prog : AbsMichelson.prog) (parameter : string) (storage : string) (data : string * string * string * string * string * string * string) =
  let f data : Interpreter.tx_data = match data with
  | (balance, source, sender, self, self_address, amount, timestamp) ->
    {
      balance = IMutez (Int.of_string balance);
      source = IAddress source;
      sender = IAddress sender;
      self = IContract self;
      self_address = IAddress self_address;
      amount = IMutez (Int.of_string amount);
      timestamp : ITimestamp (tstamp timestamp);
    }
  in
  (* get parameter and storages types 'typ' from ast and add "(Pair parameter storage)" to stack
  or use instruction "PUSH (pair typ1 typ2) (parameter storage)" to ast or add it seperately! *)
  (*let start = parse "PUSH (pair "^ typ1 ^ " "^ typ2 ^") (" ^ parameter ^ " " ^ storage ^ ")" in*)
  match prog with
    | AbsMichelson.Contract (typ1, typ2, instrs) ->
      let (param, stor) = resolve typ1 parameter, resolve typ2 storage in (* resolve should switch ParserTypes to Interpreter.value, maybe it is needed to call the parser for parameter & storage and then run Interpreter.evalType *)
      evalList evalInstr instrs (IPair (param, stor):: []) (f data)
(*    | AbsMichelson.Code instrs -> assert "Code only not implemented"*)
(*      let stack = interpretInstr AbsMichelson.PUSH (AbsMichelson.TPair (* or CPair?? *) typ1 typ2) (AbsMichelson.DPair param stor) in
      interpretInstrs instr stack*)
    | _ -> assert "interpret: Not a contract"

let tstamp (time : string) : Z.t =
  (*
  ptime libary: https://github.com/dbuenzli/ptime
  michelson timestamps are in format RFC 3339 (e.g. "2019-09-26T10:59:51Z")
  or as a number of seconds since Epoch in a natural (e.g. 1571659294)

  TODO: Z.of_float truncates the milliseconds derived from the RFC 3339 format.
  It is not known to me if it is instead rounded in the Michelson implementation.
  In this case the implementation here would cause mismatches when comparing
  two timestamps, where one was deriveded from the RFC 3339 format and the
  other one was given as an integer
  *)
  try
  	Z.of_string(time)
  with _ ->
    let p_t = Ptime.of_rfc3339 ~strict:true time in
    match p_t with
    | Ok (rfc,_,_) -> Z.of_float(Ptime.to_float_s rfc)
    | Error _ -> failwith "timestamp invalid"

(* Conversion of float x to RFC 3339 format:
let rfc3339 (x : float) : string =
  match Ptime.of_float_s x with
  | None -> failwith ...
  | Some y -> Ptime.to_rfc3339(y);
*)
