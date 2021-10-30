open Base
open Lexing
open Value


type env_var = { (* transaction parameters *)
  source : value ; (* IAdress *)
  sender : value ; (* IAdress *)
  self : value ; (* IContract *)
  self_address : value ; (* IAdress *)
  balance : value ; (* IMutez  *)
  amount : value ; (* IMutez *)
  timestamp : value ; (* ITimestamp, (minimal injection time for the current block +60s, used in the NOW instruction) *)
  chain_id : value ; (* bytes? *)
  level : value ; (* INat *)
  tot_voting_power : value ; (* nat? *)
  (*chain-data : ? ;*) (* map of environment contract data *)
}

let parse_env env contract_typ : env_var =
  let env = String.split env ~on:',' in
  match env with
  | source :: sender :: self_address :: balance :: amount :: timestamp :: chain_id :: level :: tot_voting_power :: [] ->
    {
      source = IAddress source;
      sender = IAddress sender;
      self = IContract (contract_typ, self_address);
      self_address = IAddress self_address;
      balance = IMutez (Mutez.of_string balance);
      amount = IMutez (Mutez.of_string amount);
      timestamp = ITimestamp (Tstamp.of_rfc3339 timestamp);
      chain_id = IBytes (Bytes.of_string chain_id)  ;
      level = INat (Z.of_string level) ;
      tot_voting_power = INat (Z.of_string tot_voting_power) ;
      (*chain-data : ? ;*) (* map of environment contract data *)
    }
  | _ -> failwith "Interpreter.parse_env: Illegal input"


exception Illegal_Instruction of string * AbsMichelson.instr
exception StackTypeError of string * AbsMichelson.instr * typ list
exception TypeInstrError of string * AbsMichelson.instr * (typ * typ)
exception TypeError of string * typ
exception TypeDataError of string * typ * AbsMichelson.data
exception Failwith of string * value


(* TODO Funktionsübergaben als pointers? *)

(* TYPE EVALUATION FUNCTIONS *)
(* Type and Value evaluations *)
let rec evalTyp (ty : AbsMichelson.typ) : typ = match ty with
  | AbsMichelson.TCtype ctyp                  -> evalCTyp ctyp
  | AbsMichelson.TOperation                   -> TOperation
  | AbsMichelson.TContract typ                -> TContract (evalTyp typ)
  | AbsMichelson.TOption typ                  -> TOption (evalTyp typ)
  | AbsMichelson.TList typ                    -> TList (evalTyp typ)
  | AbsMichelson.TSet ctyp                    -> TSet (evalCTyp ctyp)
  | AbsMichelson.TTicket ctyp                 -> TTicket (evalCTyp ctyp)
  | AbsMichelson.TPair (typ, typeseqs)        -> TPair (evalTyp typ, evalTypePair evalTypSeq typeseqs)
  | AbsMichelson.TOr (typ0, typ)              -> TOr (evalTyp typ0, evalTyp typ)
  | AbsMichelson.TLambda (typ0, typ)          -> TLambda (evalTyp typ0, evalTyp typ)
  | AbsMichelson.TMap (ctyp, typ)             -> TMap (evalCTyp ctyp, evalTyp typ)
  | AbsMichelson.TBig_map (ctyp, typ)         -> TBig_map (evalCTyp ctyp, evalTyp typ)
  | AbsMichelson.TBls_381_g1                  -> TBls_381_g1
  | AbsMichelson.TBls_381_g2                  -> TBls_381_g2
  | AbsMichelson.TBls_381_fr                  -> TBls_381_fr
  | AbsMichelson.TSapling_transaction _       -> TSapling_transaction
  | AbsMichelson.TSapling_state _             -> TSapling_state
  | AbsMichelson.TChest                       -> TChest
  | AbsMichelson.TChest_key                   -> TChest_key
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
  | AbsMichelson.CPair (ctyp, ctypeseqs) -> TPair (evalCTyp ctyp, evalCTypePair evalCTypSeq ctypeseqs)
(*and evalTypePair (evalFun : ('a -> typ)) (lst : 'a list) : typ = (* TODO: (should, but polymorphism does not work) evaluates sequences of AbsMichelson.typeSeq and AbsMichelson.cTypeSeq  *)
  let rec f ys =
    match ys with
    | [y] -> evalFun y
    | y :: ys -> TPair(evalFun y, f ys)
    | [] -> failwith "Interpreter.evalTypeSeq: Impossible match" (* never happens as there is no recursive call that invokes this case and 'a:typSeq/cTypeSeq is nonempty *)
  in
  f lst;*)
and evalTypePair (evalFun : (AbsMichelson.typeSeq -> typ)) (lst : AbsMichelson.typeSeq list) : typ = (* evaluates sequences of AbsMichelson.typ and AbsMichelson.cTyp *)
  let rec f ys =
    match ys with
    | [y] -> evalFun y
    | y :: ys -> TPair(evalFun y, f ys)
    | [] -> failwith "Interpreter.evalTypeSeq: Impossible match" (* never happens as there is no recursive call that invokes this case and 'a:typSeq/cTypeSeq is nonempty *)
  in
  f lst;
and evalCTypePair (evalFun : (AbsMichelson.cTypeSeq -> typ)) (lst : AbsMichelson.cTypeSeq list) : typ = (* evaluates sequences of AbsMichelson.typ and AbsMichelson.cTyp *)
  let rec f ys =
    match ys with
    | [y] -> evalFun y
    | y :: ys -> TPair(evalFun y, f ys)
    | [] -> failwith "Interpreter.evalCTypeSeq: Impossible match" (* never happens as there is no recursive call that invokes this case and 'a:typSeq/cTypeSeq is nonempty *)
  in
  f lst;
and evalTypSeq (AbsMichelson.TypeSeq0 ty) = evalTyp ty
and evalCTypSeq (AbsMichelson.CTypeSeq0 ty) = evalCTyp ty

(* VALUE/DATA EVALUATION FUNCTIONS *)
let evalStr (AbsMichelson.Str b) : string = b
let evalBytes (AbsMichelson.Hex b) : bytes = Bytes.of_string b  (*TODO, also do bytes really always start with 0x? *)
let evalNeg (AbsMichelson.Neg b) : Z.t = Z.of_string b
let evalNat nat : Z.t = Z.of_int nat

let rec evalValue (t : typ) (e : AbsMichelson.data) : value =
  (*
  Only pushable and storable types are to be evaluated
  -> evalValue expectes the given t to be pushable and storable!

  TypeErrors are catched in the last '_' case. As all recursive calls come back to evaluate
  'evalValue typ data'. This is sufficient to catch all type-data, or rather type-value, mismatches
  *)
  match (t, e) with
    | (TContract ty, AbsMichelson.DStr str)                  -> IContract (ty, evalStr str)
    | (TList ty, AbsMichelson.DBlock datas)                  -> IList (ty, evalDataList ty datas)
    | (TSet ty, AbsMichelson.DBlock datas)                   -> ISet (ty, evalDataSet ty datas)
    | (TLambda (ty0, ty), AbsMichelson.DBlock datas)         -> ILambda ((ty0, ty), evalDataInstr (ty0, ty) datas) (* in-/output type errors are catched on evaluation *)
    | (TMap (ty0, ty), AbsMichelson.DMap mapseqs)            -> IMap ((ty0, ty), evalDataMap (ty0, ty) mapseqs)
    | (TBls_381_g1, AbsMichelson.DBytes b)                   -> IBls_381_g1 (evalBytes b) (*TODO big/little endian encoding = bytes format? *)
    | (TBls_381_g2, AbsMichelson.DBytes b)                   -> IBls_381_g2 (evalBytes b) (*TODO*)
    | (TBls_381_fr, AbsMichelson.DBytes b)                   -> IBls_381_fr (evalBytes b) (*TODO*)
    | (TSapling_transaction, _)                              -> ISapling_transaction (*TODO*)
    | (TChest, _)                                            -> IChest (Bytes.of_string "", "") (*TODO*)
    | (TChest_key, _)                                        -> IChest_key "" (*TODO*)
    (* dual (comparable/not comparable) types *)
    | (TOption ty, AbsMichelson.DSome data)                  -> IOption(ty, Some (evalValue ty data))
    | (TOption ty, AbsMichelson.DNone)                       -> IOption(ty, None)
    | (TPair (ty0, ty), AbsMichelson.DPair (data, pairseqs)) -> IPair(evalValue ty0 data, evalDataPair ty pairseqs)
    | (TOr (ty0, ty), AbsMichelson.DLeft data)               -> IOr(ty, L, evalValue ty0 data)
    | (TOr (ty0, ty), AbsMichelson.DRight data)              -> IOr(ty0, R, evalValue ty data)
    (* comparable types *)
    | (TUnit, AbsMichelson.DUnit)                            -> IUnit
    | (TNever, _)                                            -> INever(* FIXME: when and how does this happen? *)
    | (TBool, AbsMichelson.DTrue)                            -> IBool true
    | (TBool, AbsMichelson.DFalse)                           -> IBool false
    | (TInt, AbsMichelson.DNat nat)                          -> IInt (evalNat nat)
    | (TInt, AbsMichelson.DNeg neg)                          -> IInt (evalNeg neg)
    | (TNat, AbsMichelson.DNat nat)                          -> INat (evalNat nat)
    | (TString, AbsMichelson.DStr str)                       -> IString (evalStr str)
    | (TChain_id, AbsMichelson.DStr str)                     -> IChain_id (evalStr str)
    | (TBytes, AbsMichelson.DBytes b)                        -> IBytes (evalBytes b)
    | (TMutez, AbsMichelson.DNat nat)                        -> IMutez (Mutez.of_Zt (evalNat nat))
    | (TMutez, AbsMichelson.DNeg neg)                        -> IMutez (Mutez.of_Zt (evalNeg neg))
    | (TKey_hash, AbsMichelson.DStr str)                     -> IKey_hash (evalStr str)
    | (TKey, AbsMichelson.DStr str)                          -> IKey (evalStr str)
    | (TSignature, AbsMichelson.DStr str)                    -> ISignature (evalStr str)
    | (TTimestamp, AbsMichelson.DNat nat)                    -> ITimestamp (evalNat nat)
    | (TTimestamp, AbsMichelson.DStr str)                    -> ITimestamp (Tstamp.of_rfc3339 (evalStr str))
    | (TAddress, AbsMichelson.DStr str)                      -> IAddress (evalStr str)
    (* non pushable *)
    | _ -> raise (TypeDataError ("Expected type does not match given data", t, e)) (* TODO: or is not pushable/storeable! *)
and evalDataList (ty : typ) (lst : AbsMichelson.data list) : value list =
  let f (ty : typ) = (fun x ->
    evalValue ty x
    )
  in
  List.map lst ~f:(f ty)
and evalDataSet (ty : typ) (lst : AbsMichelson.data list) : value list =
  let f (ty : typ) = (fun x ->
    evalValue ty x
    )
  in
  List.map lst ~f:(f ty) (* FIXME: implement as (own) Set.t *)
and evalDataMap (t : typ * typ) (lst : AbsMichelson.mapSeq list) : (value * value) list (*IMap*) =
  let f (ty0, ty : typ * typ) = (fun (AbsMichelson.DMapSeq (data0, data)) ->
    (evalValue ty0 data0, evalValue ty data)
    )
  in
  List.map lst ~f:(f t) (* FIXME: implement as (own) Map.t *)
and evalDataInstr (ty0, ty : typ * typ) (lst : AbsMichelson.data list) : AbsMichelson.instr list =
  let rec f = (fun x ->
    (* The instruction list of an AbsMichelson.DBlock can contain AbsMichelson.instr values and other AbsMichelson.DBlock values
    (like a nested list) *)
    match x with
    | AbsMichelson.DInstruction instr -> instr
    | AbsMichelson.DBlock lst -> AbsMichelson.BLOCK (List.map lst ~f:(f)) (* wrap inner list in AbsMichelson.BLOCK value *)
    | _ -> raise (TypeDataError ("lambda type: Expected instruction (list), but got other data type", TLambda (ty0, ty), x))
    )
  in
  List.map lst ~f:(f)
and evalDataPair (t : typ) (lst : AbsMichelson.pairSeq list) : value (*IPair*) =
  match (t, lst) with
  | (TPair (ty0, ty), ((AbsMichelson.DPairSeq data) :: tl)) -> IPair(evalValue ty0 data, evalDataPair ty tl)
  | (ty, [AbsMichelson.DPairSeq data]) -> evalValue ty data
  | _ -> failwith "The lengths of the given pair types & pair values are not equal"


(* INSTRUCTION EVALUATION HELPER FUNCTIONS *)
let drop_n (n : int) (lst : value list) : value list =
   if n = 0 then lst
   else if (List.length lst < n) then raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DROP_N (n)))
   else List.drop lst n
let dup_n (n : int) (lst : value list) : value =
  if n = 0 then raise (Illegal_Instruction ("'n'=0 is illegal", AbsMichelson.DUP_N (n)))
  else
    match List.nth lst (n - 1) with
    | Some x ->
      if (duplicable(typeof x)) then x
      else raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.DUP_N (n), typ_of_lst [x]))
    | None -> raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DUP_N (n)))
let dig_n (n : int) (lst : value list) : value list =
  let (fst, snd) = List.split_n lst n in
  match (fst, snd) with
  | ([], _) -> raise (Illegal_Instruction ("DIG 0 is illegal", AbsMichelson.DIG_N (n)))
  | (fst, (x :: st)) -> x :: (fst @ st)
  | (_, []) -> raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DIG_N (n)))
let dug_n (n : int) (lst : value list) : value list =
  let (fst, snd) = List.split_n lst (n + 1) in
  match (fst, snd) with
  | (_, []) -> raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DUG_N (n)))
  | ((x :: st), snd) -> st @ (x :: snd)
  | ([], _) -> raise (Illegal_Instruction ("DUG 0 is illegal", AbsMichelson.DUG_N (n)))
let pair_n (n : int) (lst : value list) : value list =
  let rec f (lst : value list) : value = (* not tail recursive *)
    match lst with
    | [x] -> x
    | x :: tl -> IPair (x, f tl)
    | _ -> failwith "Interpreter.pair_n: this case should be impossible"
  in
  if (n <= 1) then raise (Illegal_Instruction ("'n' needs to be higher then 1", AbsMichelson.PAIR_N (n)))
  else
    let (fst, snd) = List.split_n lst n in
    match (fst, snd) with
    | (_, []) -> raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.PAIR_N (n)))
    (* Note: case ([], _) does not happen because of the if(n<=1) before*)
    | (fst, snd) -> (f fst) :: snd
let rec unpair_n (n : int) (x : value (*IPair*)) : value list =
    (* not tail recursive *)
    if (n <= 1) then raise (Illegal_Instruction ("'n' needs to be higher then 1", AbsMichelson.UNPAIR_N (n)))
    else
      match x with
      | IPair(y, z) -> y :: (unpair_n (n-1) z)
      | x when n = 1 -> [x]
      | _ -> raise (Illegal_Instruction ("'n' not equal to size of right comb", AbsMichelson.UNPAIR_N (n)))
let slice_str (offset : Z.t) (len : Z.t) (s : string) : value =
  (* String.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IOption (TString, Some(IString(String.sub s ~pos:(Z.to_int offset) ~len:(Z.to_int len))))
  with
  	| _ -> IOption(TString, None)
let slice_bytes (offset : Z.t) (len : Z.t) (b : bytes) : value =
  (* String.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IOption (TBytes, Some(IBytes(Bytes.sub b ~pos:(Z.to_int offset) ~len:(Z.to_int len))))
  with
  	| _ -> IOption(TBytes, None)


(* INSTRUCTION EVALUATION FUNCTIONS *)
let rec evalInstr (instr : AbsMichelson.instr) (stack : value list) (data : env_var) : value list =
  (* Error Reporting: if an instruction works on an existing stack, then these match cases are programmed such that they either
   do not match if the stack does not contain the expected number of values (wich causes the last match case to throw an exception)
   or they match, but raise an error in the subsequent evaluation if the number of values is not enough
   and if they match, then an error is thrown for illegal value types *)
  match (instr, stack) with
  | (AbsMichelson.BLOCK instrs, _) ->  evalList instrs stack data
  | (AbsMichelson.DROP, (_ :: st)) -> st
  | (AbsMichelson.DROP_N integer, _) -> drop_n integer stack
  | (AbsMichelson.DUP, (x :: _)) -> (dup_n 1 [x]) :: stack
  | (AbsMichelson.DUP_N integer, _) -> (dup_n integer stack) :: stack
  | (AbsMichelson.SWAP, (x :: y :: st)) -> y :: x :: st
  | (AbsMichelson.DIG_N integer, _) -> dig_n integer stack
  | (AbsMichelson.DUG_N integer, _) ->  dug_n integer stack
  | (AbsMichelson.PUSH (typ, data), _) ->
    if (pushable(evalTyp typ)) then ((evalValue (evalTyp typ) data) :: stack)
    else raise (Illegal_Instruction ("This type is not pushable.", instr))
  | (AbsMichelson.SOME, (x :: st)) ->  IOption ((typeof x), Some x) :: st
  | (AbsMichelson.NONE typ, st) ->  IOption(evalTyp typ, None) :: st
  | (AbsMichelson.UNIT, _) -> IUnit :: stack
  | (AbsMichelson.NEVER, _) -> INever :: stack
  | (AbsMichelson.IF_NONE (instrs0, instrs), ((IOption (_, x)) :: st)) ->
    (match x with
    | Some y -> evalList instrs0 (y :: st) data
    | None   -> evalList instrs st data
    )
  | (AbsMichelson.PAIR, (x :: y :: st)) -> IPair (x, y) :: st
  | (AbsMichelson.PAIR_N integer, _) -> pair_n integer stack
  | (AbsMichelson.CAR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.CDR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> z :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.UNPAIR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> y :: z :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.UNPAIR_N integer, (x :: st)) ->
     (match x with
     | IPair (y, z) -> unpair_n integer x @ stack
     | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
     )
  | (AbsMichelson.LEFT typ, (x :: st)) -> IOr (evalTyp typ , L, x) :: st
  | (AbsMichelson.RIGHT typ, (x :: st)) ->  IOr (evalTyp typ, R, x) :: st
  | (AbsMichelson.IF_LEFT (instrs0, instrs), (x :: st)) ->
    (match x with
    | IOr (_, L, y) -> evalList instrs0 (y :: st) data
    | IOr (_, R, y) -> evalList instrs (y :: st) data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x])) (* TODO/Problem: IF_RIGHT is macro of IF_LEFT and therefore will return errors of IF_LEFT*)
    )
  | (AbsMichelson.NIL typ, _) ->  IList (evalTyp typ, []) :: stack
  | (AbsMichelson.CONS, (x :: y :: st)) ->
    (match (x, y) with
    | (x, IList(typ, lst)) (*FIXME: Currently no check if typeof x =typ. What about (recursive) types? List of different operations are ok, List of different Pairs not? *) -> IList(typ, (x :: lst)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))  (* TODO understandable errors *)
    )
  | (AbsMichelson.IF_CONS (instrs0, instrs), (x :: st)) ->
    (match x with
    | IList (typ, x :: tl) -> evalList instrs0 (x :: IList (typ, tl) :: st) data
    | IList (_, []) -> evalList instrs st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.SIZE, (x :: st)) ->
    (match x with
    | IString y      -> INat(Z.of_int (String.length y)) :: st
    | IBytes y       -> INat(Z.of_int (Bytes.length y)) :: st
    | ISet (_, lst)  -> INat(Z.of_int (List.length lst)) :: st
    | IList (_, lst) -> INat(Z.of_int (List.length lst)) :: st
    | IMap (_, lst)  -> INat(Z.of_int (List.length lst)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.EMPTY_SET ctyp, _) -> ISet (evalCTyp ctyp, []) :: stack
  | (AbsMichelson.EMPTY_MAP (ctyp, typ), _) ->  IMap ((evalCTyp ctyp, evalTyp typ), []) :: stack (*Map.empty with given types?? would need a reversed evalTyp typ function *)
  | (AbsMichelson.EMPTY_BIG_MAP (ctyp, typ), _) ->  IBig_map ((evalCTyp ctyp, evalTyp typ), []) :: stack
  | (AbsMichelson.MAP instrs, (x :: st)) ->
    (match x with
    | IList (typ, lst) -> map_list instrs typ lst st data
    | IMap (typ, lst)  -> map_map instrs typ lst st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.ITER instrs, (x :: st)) ->
    (match x with
    | IList (typ, lst) -> iter_list instrs typ lst st data
    | IMap (typ, lst)  -> iter_map instrs typ lst st data
    | ISet (typ, lst)  -> iter_set instrs typ lst st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.MEM, (x :: y :: st)) ->
    (match y with (* TODO!*)
    | ISet (_, lst)     -> mem_set x lst :: st
    | IMap (_, lst)     -> mem_map x lst :: st
    | IBig_map (_, lst) -> mem_big_map x lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))
    )
  | (AbsMichelson.GET, (x :: y :: st)) ->
    (match y with
    | IMap (typ, lst)     -> get_map x lst :: st
    | IBig_map (typ, lst) -> get_big_map x lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))
    )
  | (AbsMichelson.GET_N integer, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.UPDATE, (x :: y :: st)) -> st (*TODO handle types carefully! *)
  | (AbsMichelson.UPDATE_N integer, (x :: st)) ->  st (*TODO*)
  | (AbsMichelson.IF (instrs0, instrs), (x :: st)) ->
    (match x with
    | IBool true  -> evalList instrs0 st data
    | IBool false -> evalList instrs st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.LOOP instrs, (x :: st)) -> (* REMOVE: loop instrs stack data*)
    (match x with
    | IBool true  -> evalInstr (AbsMichelson.LOOP instrs) (evalList instrs st data) data
    | IBool false -> st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.LOOP_LEFT instrs, (x :: st)) -> (* REMOVE: loop_left instrs stack data*)
    (match x with
    | IOr (_, L, y) -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList instrs (y :: st) data) data
    | IOr (_, R, y) -> y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.LAMBDA (typ0, typ, instrs), _) -> ILambda((evalTyp typ0, evalTyp typ), instrs) :: stack
  | (AbsMichelson.EXEC, (x :: y :: st)) -> (exec x y data) :: st
  | (AbsMichelson.APPLY, (x :: st)) ->  st (* TODO Values that are not both pushable and storable (values of type operation, contract _ and big_map _ _) cannot be captured by APPLY (cannot appear in ty1).*)
  | (AbsMichelson.DIP instrs, (x :: st)) -> x :: (evalList instrs st data)
  | (AbsMichelson.DIP_N (integer, instrs), _) ->  dip_n instrs integer stack data
  | (AbsMichelson.FAILWITH, (x :: st)) -> raise (Failwith ("Evaluation failed with FAILWITH instruction", x))
  | (AbsMichelson.CAST, (x :: st)) -> st(* TODO: 1. shouldnt it be 'CAST typ'? 2. What are two different compatible types? only e.g. CPair -> TPair?  *)
  | (AbsMichelson.RENAME, (x :: st)) ->  st(* TODO: depends on variable annotations*)
  | (AbsMichelson.CONCAT, (x :: y :: st)) ->
    (match (x, y) with
    | (IString(s0), IString(s))             -> IString(s0 ^ s) :: st
    | (IBytes(b0), IBytes(b))               -> IBytes(Stdlib.Bytes.cat b0 b) :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))
    )
  | (AbsMichelson.CONCAT, (x :: st)) ->
    (match x with
    | IList(TString, lst) -> concat_s_lst lst :: st
    | IList(TBytes, lst)  -> concat_b_lst lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.SLICE, (x :: y :: z :: st)) ->
    (match (x, y, z) with
    | (INat(offset), INat(len), IString(s)) -> slice_str offset len s :: st
    | (INat(offset), INat(len), IBytes(b))  -> slice_bytes offset len b :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y; z]))
    )
  | (AbsMichelson.PACK, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.UNPACK typ, (x :: st)) ->
    (match x with
    | IBytes b -> unpack (evalTyp typ) b :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.ADD, (x :: y :: st)) ->
    (match (x, y) with
    | (INat (x), INat (y))               -> INat (Z.add x y) :: st
    | (INat (x), IInt (y))
    | (IInt (x), INat (y))
    | (IInt (x), IInt (y))               -> IInt (Z.add x y) :: st
    | (IInt (x), ITimestamp (y))
    | (ITimestamp (x), IInt (y))         -> ITimestamp (Z.add x y) :: st
    | (IMutez (x), IMutez (y))           -> IMutez (Mutez.add x y) :: st
    | (IBls_381_g1 (x), IBls_381_g1 (y)) -> (*IBls_381_g1 (Bls.add x y) ::*) st (*TODO https://tezos.gitlab.io/alpha/michelson.html#bls12-381-primitives*)
    | (IBls_381_g2 (x), IBls_381_g2 (y)) -> (*IBls_381_g2 (Bls.add x y) ::*) st (*TODO*)
    | (IBls_381_fr (x), IBls_381_fr (y)) -> (*IBls_381_fr (Bls.add x y) ::*) st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))
    )
  | (AbsMichelson.SUB, (x :: y :: st)) ->
    (match (x, y) with
    | (INat (x), INat (y))               -> INat (Z.sub x y) :: st
    | (INat (x), IInt (y))
    | (IInt (x), INat (y))
    | (IInt (x), IInt (y))               -> IInt (Z.sub x y) :: st
    | (ITimestamp (x), IInt (y))         -> ITimestamp (Z.sub x y) :: st
    | (ITimestamp (x), ITimestamp (y))   -> IInt (Z.sub x y) :: st
    | (IMutez (x), IMutez (y))           -> IMutez (Mutez.sub x y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x ; y]))
    )
  | (AbsMichelson.MUL, (x :: y :: st)) ->
    (match (x, y) with
    | (INat (x), INat (y))               -> INat (Z.mul x y) :: st
    | (INat (x), IInt (y))
    | (IInt (x), INat (y))
    | (IInt (x), IInt (y))               -> IInt (Z.mul x y) :: st
    | (IMutez (x), INat (y))             -> IMutez (Mutez.mul x (Mutez.of_Zt y)) :: st
    | (INat (x), IMutez (y))             -> IMutez (Mutez.mul (Mutez.of_Zt x) y) :: st
    | (IBls_381_g1 (x), IBls_381_fr (y)) -> (*IBls_381_g1 (Bls.mul x y) ::*) st
    | (IBls_381_g2 (x), IBls_381_fr (y)) -> (*IBls_381_g2 (Bls.mul x y) ::*) st
    | (IBls_381_fr (x), IBls_381_fr (y)) -> (*IBls_381_fr (Bls.mul x y) ::*) st
    | (INat (x), IBls_381_fr (y))        -> (*IBls_381_fr (Bls.mul x y) ::*) st
    | (IInt (x), IBls_381_fr (y))        -> (*IBls_381_fr (Bls.mul x y) ::*) st
    | (IBls_381_fr (x), INat (y))        -> (*IBls_381_fr (Bls.mul x y) ::*) st
    | (IBls_381_fr (x), IInt (y))        -> (*IBls_381_fr (Bls.mul x y) ::*) st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x; y]))
    )
  | (AbsMichelson.EDIV, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.ABS, (x :: st)) -> st (* FIXME syntax error in exactly this line*)
  | (AbsMichelson.SNAT, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.INT, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.NEG, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.LSL, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.LSR, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.OR, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.AND, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.XOR, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.NOT, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.COMPARE, (x :: y :: st)) -> st (*TODO*)
  | (AbsMichelson.EQ, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.NEQ, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.LT, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.GT, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.LE, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.GE, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SELF, _) -> data.self :: stack
  | (AbsMichelson.SELF_ADDRESS, _) -> data.self_address :: stack
  | (AbsMichelson.CONTRACT typ, (x :: st)) ->
    let ty = evalTyp typ in
    (match x with
    | IAddress (y) -> IOption(TContract ty, Some (IContract (ty, y))) :: st (* TODO: check if adress exists and what type it is and what parameter type it has? *)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.TRANSFER_TOKENS, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SET_DELEGATE, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.CREATE_CONTRACT (typ0, typ, instrs), _) -> stack (*" evalList (vll evalDataInstr instrs"*)
  | (AbsMichelson.IMPLICIT_ACCOUNT, (x :: st)) -> st (* TODO: Contract related*)
  | (AbsMichelson.CHECK_SIGNATURE, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.VOTING_POWER, (x :: st)) ->
    (match x with
    | IKey_hash s -> st (* TODO: iterate through map and return voting power of contract*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.BLAKE2B, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.KECCAK, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA3, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA256, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA512, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.HASH_KEY, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.NOW, _) -> data.timestamp :: stack
  | (AbsMichelson.LEVEL, _) -> data.level :: stack (* TODO: Contract related*)
  | (AbsMichelson.AMOUNT, _) -> data.amount :: stack
  | (AbsMichelson.BALANCE, _) -> data.balance :: stack
  | (AbsMichelson.SOURCE, _) -> data.source :: stack
  | (AbsMichelson.SENDER, _) -> data.sender :: stack
  | (AbsMichelson.ADDRESS, (x :: st)) ->
    (match x with
    | IContract(_, y) -> IAddress y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", instr, typ_of_lst [x]))
    )
  | (AbsMichelson.CHAIN_ID, _) -> data.chain_id :: stack (* TODO: Contract related*)
  | (AbsMichelson.TOTAL_VOTING_POWER, _) -> data.tot_voting_power :: stack
  | (AbsMichelson.PAIRING_CHECK, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SAPLING_EMPTY_STATE integer, (x :: st)) ->  st (*TODO*)
  | (AbsMichelson.SAPLING_VERIFY_UPDATE, (x :: st)) -> st  (*TODO*)
  | (AbsMichelson.TICKET, (x :: st)) -> st (* TODO: Contract related*)
  | (AbsMichelson.READ_TICKET, (x :: st)) -> st (* TODO: Contract related*)
  | (AbsMichelson.SPLIT_TICKET, (x :: st)) -> st (* TODO: Contract related*)
  | (AbsMichelson.JOIN_TICKETS, (x :: st)) -> st (* TODO: Contract related*)
  | (AbsMichelson.OPEN_CHEST, (x :: st)) -> st (* TODO: Contract related*)
  (* raise exception for instructions that need one or more elements on the stack but the stack does not contain this much values *)
  | (_, (INever :: st)) -> failwith "never types was executed" (* TODO: is this needed? or will there be a typeerror anyway, when instructions trys to acces the value? *)
  | _ -> raise (Illegal_Instruction ("Stack does not contain the necessary amount of values", instr))

(* SECONDARY INSTRUCTION EVALUATION FUNCTIONS (These evaluate lists of instructions) *)
and evalList (instrs : AbsMichelson.instr list) (st : value list) (data : env_var) : value list =
(*  let rec f ys stack data = match ys with
    | y :: ys -> f ys (evalInstr y stack data) data
    | [y]     -> evalInstr y stack data
    | []      -> stack (* case needed as empty instruction-lists are allowed *)
  in
  f instrs st data;*)
  match instrs with
  | []      -> st (* case needed as empty instruction-lists are allowed *)
  | [y]     -> evalInstr y st data (* case actually not necessary *)
  | y :: ys -> evalList ys (evalInstr y st data) data

(* MAP instr *)
and map_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : env_var) : value list =
  if (List.is_empty lst) then IList(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      match (evalList instrs (el :: acc) data) with
      | hd :: tl -> (tl, hd) (* (new_acc, new_element) *)
      | [] -> failwith "Interpreter.map_list: this case should be impossible"
    )
    in
    let (new_st, new_lst) = List.fold_map lst ~init:st ~f:(f instrs data) in (* val fold_map : 'a list -> init:'b -> f:('b -> 'a -> 'b * 'c) -> 'b * 'c list = <fun> *)
    match List.hd lst with
    | Some x -> IList((typeof x), lst) :: new_st
    | None   -> failwith "Interpreter.map_list: this case should be impossible"
and map_map (instrs : AbsMichelson.instr list) typ (lst : (value * value) list) (st : value list) (data : env_var) : value list =
  (* key value pairs are handeled as pairs! *)
  if (List.is_empty lst) then IMap(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      match (evalList instrs (IPair(fst el, snd el) :: acc) data) with
      | hd :: tl -> (tl, (fst el, hd)) (* (new_acc, (type, new_element)) *)
      | [] -> failwith "Interpreter.map_map: this case should be impossible"
    )
    in
    let (new_st, new_lst) = List.fold_map lst ~init:st ~f:(f instrs data) in
    match List.hd lst with
    | Some (x, y) -> IMap(((typeof x), (typeof y)), new_lst) :: new_st
    | None   -> failwith "Interpreter.map_map: this case should be impossible"

(* ITER instr *)
and iter_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : env_var) : value list =
  if (List.is_empty lst) then st
  else
    let f instrs data  = ( fun acc el ->
      evalList instrs (el :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data) (* val fold : 'a t -> init:'accum -> f:('accum -> 'a -> 'accum) -> 'accum *)
and iter_map (instrs : AbsMichelson.instr list) typ (lst : (value * value) list) (st : value list) (data : env_var) : value list =
  (* key value pairs are handeled as pairs! *)
  if (List.is_empty lst) then IMap(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      evalList instrs (IPair(fst el, snd el) :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data)
and iter_set (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : env_var) : value list =
  iter_list instrs typ lst st data (* TODO as long as ISet definition is the same as IList *)
(* MEM instr *)
(* todo: mem functions could be the merged as long as as they all are implemented over a list (which I guess is not a good idea) *)
and mem_set (x : value) (lst : value list) : value =
  let bool = List.exists lst ~f:(fun z -> equal_value x z) in (* val exists : 'a t -> f:('a -> bool) -> bool *)
  IBool(bool)
and mem_map (x : value) (lst : (value * value) list) : value = (* TODO*)
  let bool = List.exists lst ~f:(fun (z, _) -> equal_value x z) in
  IBool(bool)
and mem_big_map (x : value) (lst : (value * value) list) : value = (* TODO*)
  mem_map x lst
(* GET instr*)
and get_map (x : value) (lst : (value * value) list) : value =
  IMap ((TNat, TNat), [(INat Z.zero, INat Z.zero)])
  (* TODO: implementation depends on if map is implemented as List or Map
  maybe using List.find_map?
  returns IOption(evalTyp typ, None/Some z):: st
  *)
and get_big_map (x : value) (lst : (value * value) list) : value =
  IBig_map ((TNat, TNat), [(INat Z.zero, INat Z.zero)])
  (* TODO: implementation depends on if big_map is implemented as List or Map
  maybe using List.find_map?
  returns IOption(evalTyp typ, None/Some z):: st
  *)

(*(* LOOP instr *)
and loop (instrs : AbsMichelson.instr list) (st : value list) (data : tx_data) : value list =
  match st with
  | IBool true :: st -> loop instrs (evalList instrs st data) data
  | IBool false :: st -> st
  | x :: st -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.LOOP,typ_of_lst [x]))
  | [] ->
(* LOOP_LEFT instr *)
and loop_left (instrs : AbsMichelson.instr list) (st : value list) (data : tx_data) : value list =
  match st with
  | IOr (_, L, x) :: st -> loop_left instrs (evalList instrs (x :: st) data) data
  | IOr (_, R, x) :: st -> x :: st
  | x :: st -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.LOOP_LEFT,typ_of_lst [x]))
  | [] -> *)

(* EXEC instr *)
and exec (x : value) (y : value) (data : env_var) : value =
  let f (instrs : AbsMichelson.instr list) (tys : typ * typ) (data : env_var) =
    if (equal_typ (typeof x) (fst tys)) then
      let st = evalList instrs [x] data in
      match st with
      | [z] -> if (equal_typ (typeof z) (snd tys)) then z else raise (TypeInstrError ("Lambda output type mismatch.", AbsMichelson.EXEC, (typeof z, snd tys)))
      | _ -> raise (Illegal_Instruction ("Lambda output should be exactly one value", AbsMichelson.EXEC))
    else raise (TypeInstrError ("Lambda input type mismatch.", AbsMichelson.EXEC, (typeof x, fst tys)))
  in
  match y with
  | ILambda(tys, instrs) -> f instrs tys data
  | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.EXEC, typ_of_lst [x ; y]))

(* DIP_n instr *)
and dip_n (instrs : AbsMichelson.instr list) (n : int) (st : value list) (data : env_var) : value list =
  let (fst, snd) = List.split_n st n in
  match (fst, snd) with
  | (_, []) -> raise (Illegal_Instruction ("'n' greater or equal to the Stack size", AbsMichelson.DIP_N (n, instrs)))
  | (fst, snd) -> fst @ (evalList instrs snd data) (* this case also matches n=0 *)

and concat_s_lst (lst : value list) : value (*ISTRING*) =
  let f = (fun x ->
    match x with
    | IString y -> y
    | _ -> failwith "Interpreter.concat_s_lst: This case should be impossible"
    )
  in
  IString(String.concat (List.map lst ~f:(f))) (* String.concat = '' if lst=[] *)
and concat_b_lst (lst : value list) : value (*IBytes*) =  (*TODO real bytes implementation *)
  let f = (fun x ->
    match x with
    | IBytes y -> y
    | _ -> failwith "Interpreter.concat_b_lst: This case should be impossible"
    )
  in
  match lst with
  | [] -> IBytes(Bytes.of_string "0x")
  | _ -> IBytes(Stdlib.Bytes.concat Stdlib.Bytes.empty (List.map lst ~f:(f)))
and pack (ty : typ) (x : value) : value (*IOption*) =
  IBytes(Stdlib.Bytes.empty) (*TODO: serialization of values, also serialize the value, not Value.value *)
and unpack (ty : typ) (b : bytes) : value (*IOption*) =
  let deser = INat (Z.zero) (*TODO: deserialize bytes *)
  in
  (*FIXME: in general it should not be the type value that is serialized but its values*)
  if (equal_typ (typeof deser) ty) then
    IOption (ty, Some deser)
  else IOption (ty, None)



(*
let evalProg (e : AbsMichelson.prog) : evalable = match (instr, st) with
       AbsMichelson.Contract (typ0, typ, instrs) ->  "Contract"  ' '  '('  evalTyp typ0   ", "   evalTyp typ   ", "   evalList instrs  ')'
       (* TODO: diese funktion vll doch als startfunktion verwenden und ihr zusätzlich parameter und storage mitgeben
       Außerdem fehlt ein Endcheck (welcher von Michelson aus aufgerufen werden muss / oder direkt die rückgabe in dieser funktion hier checkt!!), welcher sicherstellt ob die Ausgabe (storage) erlaubt ist*)
*)


let eval_argument (ty : typ) (arg : AbsMichelson.prog) : value =
  match arg with
  | AbsMichelson.Contract _ -> failwith "Interpreter.interpret: Given argument (parameter or storage) invalid"
(*  | AbsMichelson.Code x -> *)
  | AbsMichelson.Argument x -> evalValue ty x

let interpret (prog : AbsMichelson.prog) (parameter : AbsMichelson.prog) (storage : AbsMichelson.prog) env : value =
  let f prog =
    match prog with
    | AbsMichelson.Contract (typ0, typ1, instrs) -> (typ0, typ1, instrs)
    (*| AbsMichelson.Code instrs -> (None, instrs)*)
    | AbsMichelson.Argument _ -> failwith "Interpreter.interpret: Given contract invalid"
  in
  let (typ0, typ1, instrs) = f prog in
  let (ty0, ty1) = (evalTyp typ0, evalTyp typ1) in
  let param = eval_argument ty0 parameter in
  let stor = eval_argument ty1 storage in
  let start_stack = [IPair (param, stor)] in
  let environment = parse_env env ty1 in
  let result_stack : value list = evalList instrs start_stack environment in
  match result_stack with
  | [x] ->
    if (equal_typ (typeof x) ty1) then x
    else failwith "Interpreter.interpret: Wrong output type"
  | [] -> failwith "Interpreter.interpret: Stack empty"
  | _ -> failwith "Interpreter.interpret: Stack contains more then one value" (* TODO: return/show topmost stack?*)
  (* TODO: instr 'FAILWITH' abfangen *)