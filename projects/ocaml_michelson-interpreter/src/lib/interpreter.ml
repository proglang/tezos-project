open Core
open Base
open Lexing

open Value
open Config
open Eval_utils




(*exception Illegal_Instruction of string * string (* string * AbsMichelson.instr *)
exception StackTypeError of string * string * string list (* string * AbsMichelson.instr * typ list *)*)
exception TypeInstrError of string * string * (string * string) (* string * AbsMichelson.instr * (typ * typ) *)
exception TypeError of string * typ (*FIXME: deriving hier hinzufügen? *)
exception TypeDataError of string * string * string (* string * typ * AbsMichelson.data *)
exception Failwith of string * string (* string * value *)





(* TYPE EVALUATION FUNCTIONS *)
(* Type and Value evaluations *)
let rec evalTyp (ty : AbsMichelson.typ) : typ = match ty with
  | AbsMichelson.TAnnot1 (typ, _)       -> evalTyp typ (* discard annotations *)
  | AbsMichelson.TAnnot2 (_, typ)       -> evalTyp typ (* discard annotations *)
  | AbsMichelson.TCtype ctyp            -> evalCTyp ctyp
  | AbsMichelson.TOperation             -> TOperation
  | AbsMichelson.TContract typ          -> TContract (evalTyp typ)
  | AbsMichelson.TOption typ            -> TOption (evalTyp typ)
  | AbsMichelson.TList typ              -> TList (evalTyp typ)
  | AbsMichelson.TSet ctyp              -> TSet (evalCTyp ctyp)
  | AbsMichelson.TTicket ctyp           -> TTicket (evalCTyp ctyp)
  | AbsMichelson.TPair (typ, typeseqs)  -> TPair (evalTyp typ, evalTypePair evalTypSeq typeseqs)
  | AbsMichelson.TOr (typ0, typ)        -> TOr (evalTyp typ0, evalTyp typ)
  | AbsMichelson.TLambda (typ0, typ)    -> TLambda (evalTyp typ0, evalTyp typ)
  | AbsMichelson.TMap (ctyp, typ)       -> TMap (evalCTyp ctyp, evalTyp typ)
  | AbsMichelson.TBig_map (ctyp, typ)   -> TBig_map (evalCTyp ctyp, evalTyp typ)
  | AbsMichelson.TBls_381_g1            -> TBls_381_g1
  | AbsMichelson.TBls_381_g2            -> TBls_381_g2
  | AbsMichelson.TBls_381_fr            -> TBls_381_fr
  | AbsMichelson.TSapling_transaction _ -> TSapling_transaction
  | AbsMichelson.TSapling_state _       -> TSapling_state
  | AbsMichelson.TChest                 -> TChest
  | AbsMichelson.TChest_key             -> TChest_key
and evalCTyp (ty : AbsMichelson.cTyp) : typ = match ty with
  | AbsMichelson.CAnnot1 (ctyp, _)       -> evalCTyp ctyp (* discard annotations *)
  | AbsMichelson.CAnnot2 (_, ctyp)       -> evalCTyp ctyp (* discard annotations *)
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

(*and evalTypePair (evalFun : ('a -> typ)) (lst : 'a list) : typ = (* evaluates sequences of AbsMichelson.typeSeq and AbsMichelson.cTypeSeq TODO: (This polymorphism does not work)   *)
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
let rec evalValue (t : typ) (e : AbsMichelson.data) : value =
  (*
  Only passable, pushable or storable types are to be evaluated
  -> evalValue expectes the given t to be passable, pushable or storable!

  TypeErrors are catched in the last '_' case. As all recursive calls come back to evaluate
  'evalValue typ data'. This is sufficient to catch all type-data, or rather type-value, mismatches
  *)
  match (t, e) with
    | (TContract ty, AbsMichelson.DStr str)                  -> IContract (ty, (evalAddress (evalStr str)))
    | (TTicket ty, AbsMichelson.DPair (data, pairseqs))      -> (* FIXME *)
      (match pairseqs with
      | [AbsMichelson.DPairSeq x; AbsMichelson.DPairSeq y] -> ITicket (evalValue TAddress data, evalValue ty x, evalValue TNat y)
      | _ -> failwith "Interpreter.evalValue: Given Pair data is not a Ticket"
      )
    | (TList ty, AbsMichelson.DBlock datas)                  -> IList (ty, evalDataList ty datas)
    | (TSet ty, AbsMichelson.DBlock datas)                   -> ISet (ty, evalDataSet ty datas)
    | (TLambda (ty0, ty), AbsMichelson.DBlock datas)         -> ILambda ((ty0, ty), evalDataInstr (ty0, ty) datas, []) (* in-/output type errors are catched on evaluation *)
    | (TMap (ty0, ty), AbsMichelson.DMap mapseqs)            -> IMap ((ty0, ty), evalDataMap (ty0, ty) mapseqs)
    | (TMap (ty0, ty), AbsMichelson.DBlock [])               -> IMap ((ty0, ty), []) (* empty maps are evaluated as a DBlock token *)
    | (TBig_map (ty0, ty), AbsMichelson.DMap mapseqs)        -> IBig_map ((ty0, ty), evalDataMap (ty0, ty) mapseqs)
    | (TBig_map (ty0, ty), AbsMichelson.DBlock [])           -> IBig_map ((ty0, ty), []) (* empty maps are evaluated as a DBlock token *)
    | (TBls_381_g1, AbsMichelson.DBytes b)                   -> IBls_381_g1 (evalBytes b) (*TODO big/little endian encoding vs. bytes format? *)
    | (TBls_381_g2, AbsMichelson.DBytes b)                   -> IBls_381_g2 (evalBytes b) (*TODO*)
    | (TBls_381_fr, AbsMichelson.DBytes b)                   -> IBls_381_fr (evalBytes b) (*TODO*)
    | (TSapling_transaction, _)                              -> ISapling_transaction (*TODO*)
    | (TChest, _)                                            -> IChest (Bytes.of_string "", "") (*TODO*)
    | (TChest_key, _)                                        -> IChest_key "" (*TODO*)
    (* dual (comparable/not comparable) types *)
    | (TOption ty, AbsMichelson.DSome data)                  -> IOption(ty, Some (evalValue ty data))
    | (TOption ty, AbsMichelson.DNone)                       -> IOption(ty, None)
    | (TPair (ty0, ty), AbsMichelson.DPair (data, pairseqs)) -> IPair(evalValue ty0 data, evalDataPair ty pairseqs)
    | (TPair (ty0, ty), AbsMichelson.DBlock datas)           -> evalDataPairList (ty0, ty) datas
    | (TOr (ty0, ty), AbsMichelson.DLeft data)               -> IOr(ty0, ty, L, evalValue ty0 data)
    | (TOr (ty0, ty), AbsMichelson.DRight data)              -> IOr(ty0, ty, R, evalValue ty data)
    (* comparable types *)
    | (TUnit, AbsMichelson.DUnit)                            -> IUnit
    | (TNever, _)                                            -> INever (* TODO: when and how does this happen? *)
    | (TBool, AbsMichelson.DTrue)                            -> IBool true
    | (TBool, AbsMichelson.DFalse)                           -> IBool false
    | (TInt, AbsMichelson.DNat nat)                          -> IInt (evalNat nat)
    | (TInt, AbsMichelson.DNeg neg)                          -> IInt (evalNeg neg)
    | (TNat, AbsMichelson.DNat nat)                          -> INat (evalNat nat)
    | (TString, AbsMichelson.DStr str)                       -> IString ((evalStr str))
    | (TChain_id, AbsMichelson.DStr str)                     -> IChain_id (Bytes.of_string (evalStrLength (evalStr str) 0)) (* TODO: fix length instead of '0'. Byteconversion? *)
    | (TChain_id, AbsMichelson.DBytes b)                     -> IChain_id (evalBytes b) (* TODO: invariants? *)
    | (TBytes, AbsMichelson.DBytes b)                        -> IBytes (evalBytes b)
    | (TMutez, AbsMichelson.DNat nat)                        -> IMutez (Mutez.of_Zt (evalNat nat))
    | (TMutez, AbsMichelson.DNeg neg)                        -> IMutez (Mutez.of_Zt (evalNeg neg))
    | (TKey_hash, AbsMichelson.DStr str)                     -> IKey_hash (evalStrLength (evalStr str) 0)
    | (TKey, AbsMichelson.DStr str)                          -> IKey (evalStrLength (evalStr str) 0)
    | (TSignature, AbsMichelson.DStr str)                    -> ISignature (evalStrLength (evalStr str) 0)
    | (TTimestamp, AbsMichelson.DNat nat)                    -> ITimestamp (evalNat nat)
    | (TTimestamp, AbsMichelson.DStr str)                    -> ITimestamp (Tstamp.of_rfc3339 (evalStr str))
    | (TAddress, AbsMichelson.DStr str)                      -> IAddress (evalAddress (evalStr str))
    | _ -> raise (TypeDataError ("Interpreter.evalValue: Expected type does not match given data", Print.ty_to_str t (*TODO show*), AbsMichelson.show_data e))

and evalDataList (ty : typ) (lst : AbsMichelson.data list) : value list =
  let f (ty : typ) = (fun x ->
    evalValue ty x
    )
  in
  List.map lst ~f:(f ty)

and evalDataSet (ty : typ) (lst : AbsMichelson.data list) : value list =
  let l = List.map lst ~f:(fun x -> evalValue ty x) in
  if (List.is_sorted_strictly l ~compare:Value.compare) then l
  else raise (TypeDataError ("Expected sorted set with unique elements", Print.ty_to_str ty (*TODO show*), String.concat ~sep:" : " (List.map lst ~f:(AbsMichelson.show_data))))

and evalDataMap (ty0, ty as t : typ * typ) (lst : AbsMichelson.mapSeq list) : (value * value) list (*IMap*) =
  let f (ty0, ty : typ * typ) = (fun (AbsMichelson.DMapSeq (data0, data)) ->
    (evalValue ty0 data0, evalValue ty data)
    )
  in
  let l = List.map lst ~f:(f t) in
  if (List.is_sorted_strictly l ~compare:(fun (x,y) (z,v) -> Value.compare x z)) then l
  else raise (TypeDataError ("Expected sorted map/big_map with unique keys", ("(" ^ Print.ty_to_str ty0 ^ ", " ^ Print.ty_to_str ty ^ ")") (*TODO show*), String.concat ~sep:" : " (List.map lst ~f:(AbsMichelson.show_mapSeq))))

and evalDataInstr (ty0, ty : typ * typ) (lst : AbsMichelson.data list) : AbsMichelson.instr list =
  let rec f = (fun x ->
    (* The instruction list of an AbsMichelson.DBlock can contain AbsMichelson.instr values and other AbsMichelson.DBlock values
    (like a nested list) *)
    match x with
    | AbsMichelson.DInstruction instr -> instr
    | AbsMichelson.DBlock lst -> AbsMichelson.BLOCK (List.map lst ~f:(f)) (* wrap inner list in AbsMichelson.BLOCK value *)
    | _ -> raise (TypeDataError ("lambda type: Expected instruction (list), but got other data type", Print.ty_to_str (TLambda (ty0, ty)) (*TODO show*), AbsMichelson.show_data x))
    )
  in
  List.map lst ~f:(f)

and evalDataPair (t : typ) (lst : AbsMichelson.pairSeq list) : value (*IPair*) =
  match (t, lst) with
(*  | (TPair (ty0, ty), [AbsMichelson.DPairSeq (AbsMichelson.DPair (data, pairseqs))]) -> IPair(evalValue ty0 data, evalDataPair ty pairseqs)*)
  | (ty, [AbsMichelson.DPairSeq data]) -> evalValue ty data (* catches last element of right comb and also right combs in form Pair(x, Pair(y, ...), when ty=TPair, data=IPair *)
  | (TPair (ty0, ty), ((AbsMichelson.DPairSeq data) :: tl)) -> IPair(evalValue ty0 data, evalDataPair ty tl)
  | _ -> raise (TypeDataError ("Interpreter.evalDataPair: Expected type does not match given data", Print.ty_to_str t, String.concat ~sep:" : " (List.map lst ~f:(AbsMichelson.show_pairSeq))))

and evalDataPairList (t0, t1 : typ * typ) (lst : AbsMichelson.data list) : value (*IPair*) =
  match ((t0, t1), lst) with
  | ((t0, TPair (t1, t2)), (d :: tl)) -> IPair (evalValue t0 d, evalDataPairList (t1, t2) tl)
  | ((t0, t1), [d0; d1]) -> IPair (evalValue t0 d0, evalValue t1 d1)
  | _ -> raise (TypeDataError ("Interpreter.evalDataPairList: Expected type does not match given data", ("(" ^ Print.ty_to_str t0 ^ ", " ^ Print.ty_to_str t1 ^ ")"), String.concat ~sep:" : " (List.map lst ~f:(AbsMichelson.show_data))))



(* INSTRUCTION EVALUATION FUNCTIONS *)
let rec evalInstr (instr : AbsMichelson.instr) (stack : value list) (data : contract_var) : value list =
  (* Error Reporting: if an instruction works on an existing stack, then these match cases are programmed such that they either
   do not match if the stack does not contain the expected number of values (wich causes the last match case to throw an exception)
   or they match, but raise an error in the subsequent evaluation if the number of values is not enough
   and if they match, then an error is thrown for illegal value types *)

(*
  let () = printf "%s / %s\n" (AbsMichelson.show_instr (instr)) (String.concat ~sep:" : " (List.map (typ_of_lst stack) ~f:(Print.ty_to_str))) in
*)

  match (instr, stack) with
  | (AbsMichelson.ANNOT (instr, _), _) ->  evalInstr instr stack data (* discard annotations *)
  | (AbsMichelson.BLOCK instrs, _) ->  evalList instrs stack data
  | (AbsMichelson.DROP, (_ :: st)) -> st
  | (AbsMichelson.DROP_N integer, _) -> drop_n integer stack
  | (AbsMichelson.DUP, (x :: _)) -> (dup_n 1 [x]) :: stack
  | (AbsMichelson.DUP_N integer, _) -> (dup_n integer stack) :: stack
  | (AbsMichelson.SWAP, (x :: y :: st)) -> y :: x :: st
  | (AbsMichelson.DIG_N integer, _) -> dig_n integer stack
  | (AbsMichelson.DUG_N integer, _) ->  dug_n integer stack
  | (AbsMichelson.PUSH (typ, data), _) ->
    let t = evalTyp typ in
    if (pushable t) then ((evalValue t data) :: stack)
    else raise (Illegal_Instruction ("This type is not pushable.", AbsMichelson.show_instr instr, Print.ty_to_str t))
  | (AbsMichelson.SOME, (x :: st)) ->  IOption ((typeof x), Some x) :: st
  | (AbsMichelson.NONE typ, st) ->  IOption(evalTyp typ, None) :: st
  | (AbsMichelson.UNIT, _) -> IUnit :: stack
  | (AbsMichelson.NEVER, _) -> INever :: stack
  | (AbsMichelson.IF_NONE (instrs0, instrs), (IOption (_, x) :: st)) ->
    (match x with
    | None   -> evalList instrs0 st data
    | Some y -> evalList instrs (y :: st) data
    )
  | (AbsMichelson.PAIR, (x :: y :: st)) -> IPair (x, y) :: st
  | (AbsMichelson.PAIR_N integer, _) -> pair_n integer stack
  | (AbsMichelson.CAR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.CDR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> z :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.UNPAIR, (x :: st)) ->
    (match x with
    | IPair (y, z) -> y :: z :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.UNPAIR_N integer, (x :: st)) ->
     (match x with
     | IPair (y, z) -> unpair_n integer x @ stack
     | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
     )
  | (AbsMichelson.LEFT typ, (x :: st)) -> IOr (typeof x, evalTyp typ, L, x) :: st
  | (AbsMichelson.RIGHT typ, (x :: st)) ->  IOr (evalTyp typ, typeof x, R, x) :: st
  | (AbsMichelson.IF_LEFT (instrs0, instrs), (x :: st)) ->
    (match x with
    | IOr (_, _, L, y) -> evalList instrs0 (y :: st) data
    | IOr (_, _, R, y) -> evalList instrs (y :: st) data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.NIL typ, _) ->  IList (evalTyp typ, []) :: stack
  | (AbsMichelson.CONS, (x :: y :: st)) ->
    (match (x, y) with
    | (x, IList(typ, lst)) when equal_typ (typeof x) typ -> IList(typ, (x :: lst)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.IF_CONS (instrs0, instrs), (x :: st)) ->
    (match x with
    | IList (typ, x :: tl) -> evalList instrs0 (x :: IList (typ, tl) :: st) data
    | IList (_, []) -> evalList instrs st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SIZE, (x :: st)) ->
    (match x with
    | IString y      -> INat(Z.of_int (String.length y)) :: st
    | IBytes y       -> INat(Z.of_int (Bytes.length y)) :: st
    | ISet (_, lst)  -> INat(Z.of_int (List.length lst)) :: st
    | IList (_, lst) -> INat(Z.of_int (List.length lst)) :: st
    | IMap (_, lst)  -> INat(Z.of_int (List.length lst)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.EMPTY_SET ctyp, _) -> ISet (evalCTyp ctyp, []) :: stack
  | (AbsMichelson.EMPTY_MAP (ctyp, typ), _) ->  IMap ((evalCTyp ctyp, evalTyp typ), []) :: stack
  | (AbsMichelson.EMPTY_BIG_MAP (ctyp, typ), _) ->  IBig_map ((evalCTyp ctyp, evalTyp typ), []) :: stack
  | (AbsMichelson.MAP instrs, (x :: st)) ->
    (match x with
    | IList (typ, lst) -> map_list instrs typ lst st data
    | IMap (typ, lst)  -> map_map instrs typ lst st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.ITER instrs, (x :: st)) ->
    (match x with
    | IList (typ, lst) -> iter_list instrs typ lst st data
    | IMap (typ, lst)  -> iter_map instrs typ lst st data
    | ISet (typ, lst)  -> iter_set instrs typ lst st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.MEM, (x :: y :: st)) ->
    (match y with
    | ISet (typ, lst) when equal_typ (typeof x) typ     -> mem_set x lst :: st
    | IMap (typ, lst) when equal_typ (typeof x) (fst typ)     -> mem_map x lst :: st
    | IBig_map (typ, lst) when equal_typ (typeof x) (fst typ)  -> mem_big_map x lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.GET, (x :: y :: st)) ->
    (match y with
    | IMap (typ, lst) when equal_typ (typeof x) (fst typ)     -> get_map x lst :: st
    | IBig_map (typ, lst) when equal_typ (typeof x) (fst typ) -> get_big_map x lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.GET_N integer, (x :: st)) ->
    (match x with
    | IPair _ -> get_n integer x :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.UPDATE, (x :: y :: z :: st)) ->
    (match (z, x, y) with
    | (ISet (t, lst), x, IBool b)
      when (equal_typ t (typeof x))           -> update_set t lst x b :: st
    | (IMap ((t0, t1), lst), x, IOption (t, o))
      when (equal_typ t0 (typeof x) && equal_typ t1 t)                    -> update_map (t0, t1) lst x o :: st
    | (IBig_map ((t0, t1), lst), x, IOption (t, o))
      when (equal_typ t0 (typeof x) && equal_typ t1 t)                    -> update_big_map (t0, t1) lst x o :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y; z]))
    )
  | (AbsMichelson.UPDATE_N integer, (x :: y :: st)) ->
    (match (x, y) with
    | (_, IPair _) -> update_n integer x y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.GET_AND_UPDATE, (x :: y :: z :: st)) ->
    (match (z, x, y) with
    | (IMap ((t0, t1), lst), x, IOption (t, o))
      when (equal_typ t0 (typeof x) && equal_typ t1 t)                    -> get_update_map (t0, t1) lst x o @ st
    | (IBig_map ((t0, t1), lst), x, IOption (t, o))
      when (equal_typ t0 (typeof x) && equal_typ t1 t)                    -> get_update_big_map (t0, t1) lst x o @ st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y; z]))
    )
  | (AbsMichelson.IF (instrs0, instrs), (x :: st)) ->
    (match x with
    | IBool true  -> evalList instrs0 st data
    | IBool false -> evalList instrs st data
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LOOP instrs, (x :: st)) -> (* REMOVE: loop instrs stack data*)
    (match x with
    | IBool true  -> evalInstr (AbsMichelson.LOOP instrs) (evalList instrs st data) data
    | IBool false -> st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LOOP_LEFT instrs, (x :: st)) -> (* REMOVE: loop_left instrs stack data*)
    (match x with
    | IOr (_, _, L, y) -> evalInstr (AbsMichelson.LOOP_LEFT instrs) (evalList instrs (y :: st) data) data
    | IOr (_, _, R, y) -> y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LAMBDA (typ0, typ, instrs), _) -> ILambda((evalTyp typ0, evalTyp typ), instrs, []) :: stack
  | (AbsMichelson.EXEC, (x :: y :: st)) -> (exec x y data) :: st
  | (AbsMichelson.APPLY, (x :: y :: st)) ->
    (match (x, y) with
    | (_, ILambda ((TPair (t1, t2), t3), instrs, vs)) when pushable (typeof x) && storable (typeof x) && equal_typ (typeof x) t1 ->
      ILambda ((t2, t3), instrs, (x :: vs)) :: st (* TODO: does it work? *)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.DIP instrs, (x :: st)) -> x :: (evalList instrs st data)
  | (AbsMichelson.DIP_N (integer, instrs), _) ->  dip_n instrs integer stack data
  | (AbsMichelson.FAILWITH, (x :: st)) -> raise (Failwith ("Evaluation failed with FAILWITH instruction", Print.val_to_str x)) (*TODO: propagation, return topmost stack*)
  | (AbsMichelson.CAST, _) -> stack (* discard CAST instr *)
  | (AbsMichelson.RENAME, _) ->  stack (* discard RENAME instr *)
  | (AbsMichelson.CONCAT, (x :: y :: st)) ->
    (match (x, y) with
    | (IString(s0), IString(s))             -> IString(s0 ^ s) :: st
    | (IBytes(b0), IBytes(b))               -> IBytes(Stdlib.Bytes.cat b0 b) :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.CONCAT, (x :: st)) ->
    (match x with
    | IList(TString, lst) -> concat_s_lst lst :: st
    | IList(TBytes, lst)  -> concat_b_lst lst :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SLICE, (x :: y :: z :: st)) ->
    (match (x, y, z) with
    | (INat(offset), INat(len), IString(s)) -> slice_str offset len s :: st
    | (INat(offset), INat(len), IBytes(b))  -> slice_bytes offset len b :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y; z]))
    )
  | (AbsMichelson.PACK, (x :: st)) ->
    (match x with
    | x when packable (typeof x) -> pack x :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.UNPACK typ, (x :: st)) ->
    (match x with
    | IBytes b when packable (evalTyp typ) -> unpack (evalTyp typ) b :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.ADD, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y)               -> INat (Z.add x y) :: st
    | (INat x, IInt y)
    | (IInt x, INat y)
    | (IInt x, IInt y)               -> IInt (Z.add x y) :: st
    | (IInt x, ITimestamp y)
    | (ITimestamp x, IInt y)         -> ITimestamp (Z.add x y) :: st
    | (IMutez x, IMutez y)           -> IMutez (Mutez.add x y) :: st
    | (IBls_381_g1 x, IBls_381_g1 y) -> IBls_381_g1 x :: st (*TODO https://tezos.gitlab.io/alpha/michelson.html#bls12-381-primitives*)
    | (IBls_381_g2 x, IBls_381_g2 y) -> IBls_381_g2 x :: st (*TODO*)
    | (IBls_381_fr x, IBls_381_fr y) -> IBls_381_fr x :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.SUB, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y)               -> INat (Z.sub x y) :: st
    | (INat x, IInt y)
    | (IInt x, INat y)
    | (IInt x, IInt y)               -> IInt (Z.sub x y) :: st
    | (ITimestamp x, IInt y)         -> ITimestamp (Z.sub x y) :: st
    | (ITimestamp x, ITimestamp y)   -> IInt (Z.sub x y) :: st
    | (IMutez x, IMutez y)           -> IMutez (Mutez.sub x y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.MUL, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y)               -> INat (Z.mul x y) :: st
    | (INat x, IInt y)
    | (IInt x, INat y)
    | (IInt x, IInt y)               -> IInt (Z.mul x y) :: st
    | (IMutez x, INat y)             -> IMutez (Mutez.mul x (Mutez.of_Zt y)) :: st
    | (INat x, IMutez y)             -> IMutez (Mutez.mul (Mutez.of_Zt x) y) :: st
    | (IBls_381_g1 x, IBls_381_fr y) -> IBls_381_g1 x :: st (*TODO*)
    | (IBls_381_g2 x, IBls_381_fr y) -> IBls_381_g2 x :: st (*TODO*)
    | (IBls_381_fr x, IBls_381_fr y) -> IBls_381_fr x :: st (*TODO*)
    | (INat x, IBls_381_fr y)        -> IBls_381_fr y :: st (*TODO*)
    | (IInt x, IBls_381_fr y)        -> IBls_381_fr y :: st (*TODO*)
    | (IBls_381_fr x, INat y)        -> IBls_381_fr x :: st (*TODO*)
    | (IBls_381_fr x, IInt y)        -> IBls_381_fr x :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.EDIV, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y)     -> ediv_natnat x y :: st
    | (INat x, IInt y)
    | (IInt x, INat y)
    | (IInt x, IInt y)     -> ediv_with_int x y :: st
    | (IMutez x, INat y)   -> ediv_muteznat x y :: st
    | (IMutez x, IMutez y) -> ediv_mutezmutez x y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.ABS, (x :: st)) ->
    (match x with
    | IInt x -> INat (Z.abs x) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SNAT, (x :: st)) ->
    (match x with
    | IInt x ->
      if (Z.geq x Z.zero) then IOption(TNat, Some (INat (Z.abs x))) :: st
      else IOption(TNat, None) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.INT, (x :: st)) ->
    (match x with
    | INat x -> IInt x :: st
    | IBls_381_fr x -> IInt Z.one :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.NEG, (x :: st)) ->
    (match x with
    | IInt x
    | INat x -> IInt (Z.neg x) :: st
    | IBls_381_g1 x -> IBls_381_g1 x :: st (*TODO https://tezos.gitlab.io/alpha/michelson.html#bls12-381-primitives*)
    | IBls_381_g2 x -> IBls_381_g2 x :: st (*TODO*)
    | IBls_381_fr x -> IBls_381_fr x :: st (*TODO*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LSL, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y) when Z.leq y (Z.of_int 256) -> INat Z.(x lsl (Z.to_int y)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.LSR, (x :: y :: st)) ->
    (match (x, y) with
    | (INat x, INat y) when Z.leq y (Z.of_int 256) -> INat Z.(x asr (Z.to_int y)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.OR, (x :: y :: st)) ->
    (match (x, y) with
    | (IBool x, IBool y) -> IBool (x || y) :: st
    | (INat x, INat y) -> INat Z.(x lor y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.AND, (x :: y :: st)) ->
    (match (x, y) with
    | (IBool x, IBool y) -> IBool (x && y) :: st
    | (INat x, INat y)
    | (IInt x, INat y) -> INat Z.(x land y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.XOR, (x :: y :: st)) ->
    (match (x, y) with
    | (IBool x, IBool y) -> IBool Bool.(x <> y) :: st
    | (INat x, INat y) -> INat Z.(x lxor y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.NOT, (x :: st)) ->
    (match x with
    | IBool x -> IBool (not x) :: st
    | INat x  -> INat (Z.lognot x) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.COMPARE, (x :: y :: st)) ->
    if comparable (typeof x) (typeof y) && equal_typ (typeof x) (typeof y)
    then IInt (Z.of_int(compare x y)) :: st
    else raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
  | (AbsMichelson.EQ, (x :: st)) ->
    (match x with
    | IInt y -> IBool (Z.equal y Z.zero) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.NEQ, (x :: st)) ->
    (match x with
    | IInt y -> IBool (not (Z.equal y Z.zero)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LT, (x :: st)) ->
    (match x with
    | IInt y -> IBool (Z.lt y Z.zero) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.GT, (x :: st)) ->
    (match x with
    | IInt y -> IBool (Z.gt y Z.zero) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.LE, (x :: st)) ->
    (match x with
    | IInt y -> IBool (Z.leq y Z.zero) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.GE, (x :: st)) ->
    (match x with
    | IInt y -> IBool (Z.geq y Z.zero) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SELF, _) -> data.self :: stack
  | (AbsMichelson.SELF_ADDRESS, _) -> data.self_address :: stack
  | (AbsMichelson.CONTRACT typ, (x :: st)) ->
    let ty = evalTyp typ in
    (match x with
    | IAddress (s) -> contract ty s :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.TRANSFER_TOKENS, (x :: y :: z :: st)) ->
    (match (x, y, z) with
    | (_, IMutez _, IContract (t, _)) when passable (typeof x) && equal_typ t (typeof x) ->
      IOperation (OTransfer_tokens (x, y, z)) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y ;z]))
    )
  | (AbsMichelson.SET_DELEGATE, (x :: st)) ->
    (match x with
    | IOption (TKey_hash, _) -> IOperation (OSet_delegate x) :: st (* TODO: Wrapper, and: The operation fails if kh (key_hash) is the current delegate of the contract or if kh is not a registered delegate.*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.CREATE_CONTRACT (typ0, typ, instrs), (x :: y :: z :: st)) ->
    (match (x, y, z) with
    | (IOption (TKey_hash, _), IMutez _, _) when passable (evalTyp typ0) && storable (typeof z) && equal_typ (evalTyp typ) (typeof z) ->
      let address = IAddress create_address in
      IOperation (OCreate_contract (((evalTyp typ0, evalTyp typ), instrs), x, y, z, address)) :: address :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y ;z]))
    )
  | (AbsMichelson.IMPLICIT_ACCOUNT, (x :: st)) ->
    (match x with
    | IKey_hash s -> IContract (TUnit, create_implicit s) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.CHECK_SIGNATURE, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.VOTING_POWER, (x :: st)) ->
    (match x with
    | IKey_hash s -> st (* TODO: Return the voting power of a given contract. This voting power coincides with the weight of the contract in the voting listings (i.e., the rolls count) which is calculated at the beginning of every voting period.*)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.BLAKE2B, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.KECCAK, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA3, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA256, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.SHA512, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.HASH_KEY, (x :: st)) -> st (*TODO*)
  | (AbsMichelson.NOW, _) -> data.timestamp :: stack
  | (AbsMichelson.LEVEL, _) -> data.level :: stack
  | (AbsMichelson.AMOUNT, _) -> data.amount :: stack
  | (AbsMichelson.BALANCE, _) -> data.balance :: stack
  | (AbsMichelson.SOURCE, _) -> data.source :: stack
  | (AbsMichelson.SENDER, _) -> data.sender :: stack
  | (AbsMichelson.ADDRESS, (x :: st)) ->
    (match x with
    | IContract(_, y) -> IAddress y :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.CHAIN_ID, _) -> data.chain_id :: stack
  | (AbsMichelson.TOTAL_VOTING_POWER, _) -> data.tot_voting_power :: stack
  | (AbsMichelson.PAIRING_CHECK, (x :: st)) ->
    (match x with
    | IList (TPair (TBls_381_g1, TBls_381_g2), []) -> IBool(true) :: st
    | IList (TPair (TBls_381_g1, TBls_381_g2), lst) -> IBool(false) :: st (*TODO: Verify that the product of pairings of the given list of points is equal to 1 in Fq12. *)
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SAPLING_EMPTY_STATE integer, (x :: st)) ->  st (*TODO*)
  | (AbsMichelson.SAPLING_VERIFY_UPDATE, (x :: st)) -> st  (*TODO*)
  | (AbsMichelson.TICKET, (x :: y :: st)) ->
    (match (x, y) with
    | (_, INat _) -> ITicket (data.self_address, x, y) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.READ_TICKET, (x :: st)) ->
    (match x with
    | ITicket (a, v, n) -> IPair (a, IPair (v, n)) :: stack
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.SPLIT_TICKET, (x :: y :: st)) ->
    (match (x, y) with
    | (ITicket (a, v, INat n), IPair (INat n1, INat n2)) ->
      if (Z.equal Z.(n1 + n2) n) then IOption (TPair (typeof x, typeof x), Some (IPair (ITicket (a, v, INat n1), ITicket (a, v, INat n2)))) :: st
      else IOption (typeof x, None) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x; y]))
    )
  | (AbsMichelson.JOIN_TICKETS, (x :: st)) ->
    (match x with
    | IPair (ITicket (a1, v1, INat x), ITicket (a2, v2, INat y)) ->
      if (equal_value a1 a2 && equal_value v1 v2) then IOption (TTicket (typeof v1), Some (ITicket (a1, v1, INat Z.(x + y)))) :: st
      else IOption (TTicket (typeof v1), None) :: st
    | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (instr), Print.ty_stack_of_value_list [x]))
    )
  | (AbsMichelson.OPEN_CHEST, (x :: st)) -> st (*TODO*)
  (* raise exception for instructions that need one or more elements on the stack but the stack does not contain this much values *)
  | _ -> raise (Illegal_Instruction ("Stack does not contain the necessary amount of values", AbsMichelson.show_instr instr, Print.val_stack_of_value_list stack)) (* Careful, this also matches new cases of Instructions *)


(* SECONDARY INSTRUCTION EVALUATION FUNCTIONS (These evaluate lists of instructions) *)
and evalList (instrs : AbsMichelson.instr list) (st : value list) (data : contract_var) : value list =
  match instrs with
  | []      -> st (* case needed as empty instruction-lists are allowed *)
  | [y]     -> evalInstr y st data (* case actually not necessary *)
  | y :: ys -> evalList ys (evalInstr y st data) data

(* MAP instr *)
and map_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : contract_var) : value list =
  if (List.is_empty lst) then IList(typ, []) :: st
  else
    let f instrs data  = ( fun acc el ->
      match (evalList instrs (el :: acc) data) with
      | hd :: tl -> (tl, hd) (* (new_acc, new_element) *)
      | [] -> failwith "Interpreter.map_list: this case should be impossible"
    )
    in
    let (new_st, new_lst) = List.fold_map lst ~init:st ~f:(f instrs data) in (* val fold_map : 'a list -> init:'b -> f:('b -> 'a -> 'b * 'c) -> 'b * 'c list = <fun> *)
    match List.hd new_lst with
    | Some x -> IList((typeof x), new_lst) :: new_st
    | None   -> failwith "Interpreter.map_list: this case should be impossible"
and map_map (instrs : AbsMichelson.instr list) typ (lst : (value * value) list) (st : value list) (data : contract_var) : value list =
  (* key value pairs are handeled as ocaml pairs! *)
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
and iter_list (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : contract_var) : value list =
  if (List.is_empty lst) then st
  else
    let f instrs data  = ( fun acc el ->
      evalList instrs (el :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data) (* val fold : 'a t -> init:'accum -> f:('accum -> 'a -> 'accum) -> 'accum *)
and iter_map (instrs : AbsMichelson.instr list) typ (lst : (value * value) list) (st : value list) (data : contract_var) : value list =
  (* key value pairs are handeled as pairs! *)
  if (List.is_empty lst) then IMap(typ, lst) :: st
  else
    let f instrs data  = ( fun acc el ->
      evalList instrs (IPair(fst el, snd el) :: acc) data
    )
    in
    List.fold lst ~init:st ~f:(f instrs data)
and iter_set (instrs : AbsMichelson.instr list) typ (lst : value list) (st : value list) (data : contract_var) : value list =
  iter_list instrs typ lst st data



(* EXEC instr *)
and exec (x : value) (y : value) (data : contract_var) : value =
(* TODO: missing check "Note that SELF is forbidden in lambdas because it cannot be type-checked"
Also "Note that SELF_ADDRESS inside a lambda returns the address of the contract executing the lambda, which can be different from the address of the contract in which the SELF_ADDRESS instruction is written."
*)
  let f (instrs : AbsMichelson.instr list) (t0, t1 : typ * typ) (vs : value list) (data : contract_var) =
    if (equal_typ (typeof x) t0) then
      let init_stack = solve_partial_apply vs x
      in
      let st = evalList instrs init_stack data in
      match st with
      | [z] -> if (equal_typ (typeof z) t1) then z else raise (TypeInstrError ("Lambda output type mismatch.", AbsMichelson.show_instr AbsMichelson.EXEC, (Print.ty_to_str (typeof z), Print.ty_to_str t1)))
      | _ -> raise (Illegal_Instruction ("Lambda output should be exactly one value", AbsMichelson.show_instr AbsMichelson.EXEC, Print.val_stack_of_value_list st))
    else raise (TypeInstrError ("Lambda input type mismatch.", AbsMichelson.show_instr AbsMichelson.EXEC, (Print.ty_to_str (typeof x), Print.ty_to_str t0)))
  in
  match y with
  | ILambda(tys, instrs, vs) -> f instrs tys vs data
  | _ -> raise (StackTypeError ("Instr & stack value type mismatch.", AbsMichelson.show_instr (AbsMichelson.EXEC), Print.ty_stack_of_value_list [x; y]))

(* DIP_n instr *)
and dip_n (instrs : AbsMichelson.instr list) (n : int) (st : value list) (data : contract_var) : value list =
  if (List.length st > n) then raise (Illegal_Instruction ("'n' greater then Stack size", AbsMichelson.show_instr (AbsMichelson.DIP_N (n, instrs)), Print.val_stack_of_value_list st))
  else
    let (fst, snd) = List.split_n st n in
    fst @ (evalList instrs snd data) (* fst=[] for n=0 *)
