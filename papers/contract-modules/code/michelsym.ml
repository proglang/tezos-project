module Store = struct
  (* type ('a, 's) store = 's -> 'a * 's *)
  let map f m = fun s -> let (a, s') = m s in (f a, s')

  let bind m f = fun s -> let (a, s') = m s in f a s'
  let return x = fun s -> (x, s)
  let lift f = f
end
module ReaderStore = struct
  (* type ('a, 'r, 's) reader_store = 'r -> 's -> 'a * 's *)
  let bind m f = fun r s -> let (a, s') = m r s in f a r s'
  let return x = fun _r s -> (x, s)
  let get () = fun r s -> (r, s)
  let lift f = fun _r -> f
  let rec fold f xs st =
    match xs with
    | [] -> return st
    | x :: xs ->
      bind (f x st) (fold f xs)
end

let (let*) = ReaderStore.bind
let return = ReaderStore.return
let lift = ReaderStore.lift

(* TODOs *)
(* map datatype: MAP instr *)
(* lambda datatype: LAMBDA ty1 ty2 instr (started), APPLY, EXEC (started) *)
(* instructions: 
 ** SELF (to get the type, we need to store the parameter type in the environment!)
 ** CHECK_SIGNATURE, KECCAK, etc: concrete versions needed
 ** CREATE_CONTRACT (quite involved)
 **)

let rec listunion xs ys =
  match xs with
  | [] -> ys
  | x :: xs ->
    if List.mem x ys then listunion xs ys else x :: listunion xs ys

(* types and symbolic values *)
type ty =
  | TBool
  | TInt
  | TNat
  | TList of ty
  | TOption of ty
  | TSet of ty
  | TMap of ty * ty
  | TOr of ty * ty
  | TPair of ty * ty
  | TLambda of ty * ty
  | TString
  | TUnit
  | TAddress
  | TMutez
  | TTimestamp
  | TContract of ty
  | TOperation
  | TKey
  | TKey_Hash
  | TSignature
  | TBytes
  | TNever

type step =
  | SLeft | SRight | SFirst | SSecond | SCar | SCdr | SSome | SInset | SInlist | SInmap
  | WSome                       (* wrapped in option Some *)

type lr =
  | L | R

type sval =
  | VBool of bool
  | VInt of Z.t
  | VNat of Z.t                 (* >= 0 *)
  | VOr of lr * sval * ty
  | VPair of sval * sval
  | VLambda of ty * ty * instr list
  | VString of string
  | VSet of sval list * ty         (* no repetitions *)
  | VUnit
  | VNil of ty
  | VCons of sval * sval
  | VNone of ty
  | VSome of sval
  | VMap of (sval * sval) list * ty * ty
  | VAddress of string
  | VKey of string
  | VKey_Hash of string
  | VSignature of string
  | VBytes of string
  | VMutez of Z.t
  | VTimestamp of Z.t
  | VContract of string * ty
  | VSymbolic of desc * ty
and desc =
  | Step of step * desc
  | Parameter
  | Storage
  | Op of string * sval list
  | Set of sval list
and instr =
  | I of string
  | COND of string * instr list * instr list
  | LOOP of string * instr list
  | PUSH of sval
  | T of string * ty
  | T2 of string * ty * ty
  | DIP of int * instr list
  | II of string * int
  | CREATE_CONTRACT of ty * ty * instr list
  | LAMBDA of ty * ty * instr list


let nstep (spec : step * desc) =
  match spec with
  | SSome, Step (WSome, d) -> d (* shortcut *)
  | stp, d -> Step (stp, d)
      
let rec typeof (s : sval) =
  match s with
  | VBool (_) -> TBool
  | VInt (_) -> TInt
  | VNat (_) -> TNat
  | VOr (L, s, t) -> TOr (typeof s, t)
  | VOr (R, s, t) -> TOr (t, typeof s)
  | VPair (s1, s2) -> TPair (typeof s1, typeof s2)
  | VLambda (t1, t2, _) -> TLambda (t1, t2)
  | VString (_) -> TString
  | VSet (_, t) -> TSet t
  | VUnit -> TUnit
  | VNil t -> TList t
  | VCons (s1, _) -> TList (typeof s1)
  | VNone t -> TOption t
  | VSome s -> TOption (typeof s)
  | VMap (_, t1, t2) -> TMap (t1, t2)
  | VAddress (_) -> TAddress
  | VKey (_) -> TKey
  | VKey_Hash (_) -> TKey_Hash
  | VSignature (_) -> TSignature
  | VBytes (_) -> TBytes
  | VMutez (_) -> TMutez
  | VTimestamp (_) -> TTimestamp
  | VContract (_, t) -> TContract t
  | VSymbolic (_d, t) -> t

let concrete (s : sval) =
  match s with
  | VSymbolic (_, _) -> false
  | _ -> true

let isPair (t : ty) =
  match t with
  | TPair (_, _) -> true
  | _ -> false

exception Symbolic of string * sval * sval
exception StackType of string * sval list

let symEQ x y =
  if x = y then VBool true else
  match (x, y) with
  | (VAddress (a), VAddress (b)) -> VBool (a = b)
  | (VInt (a), VInt (b)) -> VBool (a = b)
  | VNat a, VNat b -> VBool (a = b)
  | _ when typeof x = typeof y -> VSymbolic (Op ("EQ", [x; y]), TBool)
  | _ -> 
    raise (Symbolic ("possible type clash in symEQ", x, y))

(* merging stacks and values *)
(* TODO: maps *)
let rec merge_sval x y =
  if x = y then x else
  match (x, y) with
  | (VAddress a, VAddress b) when a = b -> VAddress a
  | (VBool a, VBool b) when a = b -> VBool a
  | (VInt a, VInt b) when a = b -> VInt a
  | VNat a, VNat b when a = b -> VNat a
  | (VMutez a, VMutez b) when a = b -> VMutez a
  | (VTimestamp a, VTimestamp b) when a = b -> VTimestamp a
  | (VKey a, VKey b) when a = b -> VKey a
  | (VKey_Hash a, VKey_Hash b) when a = b -> VKey_Hash a
  | (VString a, VString b) when a = b -> VString a
  | (VUnit, VUnit) -> VUnit
  | (VNil t1, VNil t2) when t1 = t2 -> VNil t1
  | (VCons (x1, x2), VCons (y1, y2)) when typeof x = typeof y -> VCons (merge_sval x1 y1, merge_sval x2 y2)
  | (VNone t1, VNone t2) when t1 = t2 -> VNone t1
  | (VSome x, VSome y) when typeof x = typeof y -> VSome (merge_sval x y)
  | (VSet (x1, t1), VSet (x2, t2)) when t1 = t2 && x1 = x2 -> VSet (x1, t1) (* set equality *)
  | (VPair (x1, x2), VPair (y1, y2)) when typeof x = typeof y -> VPair (merge_sval x1 y1, merge_sval x2 y2)
  | (VOr (tag1, s1,t1), VOr (tag2, s2, t2)) when tag1 = tag2 && t1 = t2 -> VOr (tag1, merge_sval s1 s2, t1)
  | _ when typeof x = typeof y -> VSymbolic (Set [x; y], typeof x)
  | _ when typeof x <> typeof y -> raise (Symbolic ("possible type clash in merge_sval", x, y))
  | _ -> raise (Symbolic ("unhandled case", x, y))

let merge_stack = List.map2 merge_sval

(* the constraint store *)

type constraints = {
  true_values: sval list;       (* symbolic values that must be true to reach this *)
  false_values: sval list;      (* symbolic values that must be false to reach this *)
  failure_values: (sval list * sval list * sval) list; (* path condition and value of a failure *)
  maybe_reachable: bool
}

let initial_constraints = {
  true_values = [];
  false_values = [];
  failure_values = [];
  maybe_reachable = true
}

let register_true arg =
  lift (fun r -> (), {r with true_values = arg :: r.true_values})

let register_false arg =
  lift (fun r -> (), {r with false_values = arg :: r.false_values})

let register_failure arg =
  lift (fun {true_values; false_values; failure_values; _} ->
  let failure_values =
    (true_values, false_values, arg) ::
    failure_values in
  (), {true_values;
       false_values;
       failure_values;
       maybe_reachable = false})

module Env = struct
  type t = (string, sval) Hashtbl.t
  let init_lst = List.map2
      (fun instr t -> (instr, VSymbolic (Op (instr, []), t))) 
      ["SENDER"; "SOURCE"; "SELF_ADDRESS"; "AMOUNT"; "BALANCE"; "NOW"]
      [TAddress; TAddress; TAddress; TMutez; TMutez; TTimestamp]
  let table = Hashtbl.create 10
  let () = List.iter (fun (k, v) -> Hashtbl.add table k v) init_lst
  let add_typed instr t =
    Hashtbl.add table instr (VSymbolic (Op (instr, []), t))
end

let getenv (n : string) =
  let* e = ReaderStore.get () in
  match Hashtbl.find_opt e n with
  | Some s -> return s
  | None -> return (VSymbolic (Op (n, []), TNever))

(* instructions *)

let rec comparable_type t =
  match t with
  | TAddress
  | TBool
  | TInt
  | TNat
  | TMutez
  | TTimestamp
  | TString
  | TKey
  | TKey_Hash
  | TBytes
  | TUnit -> true
  | TOr (t1, t2)
  | TPair (t1, t2) -> comparable_type t1 && comparable_type t2
  | TOption (t) -> comparable_type t
  | _ -> false

let rec packable_type t =
  match t with
  | TAddress
  | TBool
  | TInt
  | TNat
  | TMutez
  | TTimestamp
  | TString
  | TKey
  | TKey_Hash
  | TBytes
  | TUnit -> true
  | TOr (t1, t2)
  | TPair (t1, t2)
  | TMap (t1, t2) -> packable_type t1 && packable_type t2
  | TOption (t)
  | TSet (t)
  | TList (t) -> packable_type t
  | TContract (_) -> true
  | _ -> false

let contract_compatible tc ta =
  match tc with
  | TContract targ -> targ = ta
  | _ -> false

let contract_type t =
  match t with
  | TContract _ -> true
  | _ -> false

let set_type t =
  match t with
  | TSet _ -> true
  | _ -> false

let map_type t =
  match t with
  | TMap (_,_) -> true
  | _ -> false

let list_type t =
  match t with
  | TList (_) -> true
  | _ -> false

let applicable_function tf ta =
  match tf with
  | TLambda (t1, _t2) -> ta = t1
  | _ -> false

let return_type_exn tf =
  match tf with
  | TLambda (_t1, t2) -> t2
  | _ -> raise (StackType ("return_type_exn: lambda expected", []))

let map_key_type t =
  match t with
  | TMap (tk, _tv) -> Some tk
  | _ -> None

let map_val_type t =
  match t with
  | TMap (_tk, tv) -> Some tv
  | _ -> None

let option_val_type t =
  match t with
  | TOption (ot) -> Some ot
  | _ -> None

let option_to_sval msv t =
  match msv with
  | Some sv -> VSome sv
  | None -> VNone t

let compare_bool a b =
  match (a, b) with
  | false, false
  | true, true -> 0
  | false, true -> -1
  | true, false -> 1

let multype t1 t2 =
  match (t1, t2) with
  | TInt, TInt | TNat, TInt | TInt, TNat -> Some TInt
  | TNat, TNat -> Some TNat
  | TNat, TMutez
  | TMutez, TNat -> Some TMutez
  | _ -> None

let divtype t1 t2 =
  match (t1, t2) with
  | TInt, TInt | TNat, TInt | TInt, TNat -> Some (TPair (TInt, TNat))
  | TNat, TNat -> Some (TPair (TNat, TNat))
  | TMutez, TNat -> Some (TPair (TMutez, TMutez))
  | TMutez, TMutez -> Some (TPair (TNat, TMutez))
  | _ -> None

let not_type t =
  match t with
  | TBool | TNat | TInt -> true
  | _ -> false

let andtype t1 t2 =
  match (t1, t2) with
  | TBool, TBool -> Some TBool
  | TNat, TNat
  | TInt, TNat -> Some TNat
  | _ -> None

let addtype t1 t2 =
  match (t1, t2) with
  | TInt, TInt | TNat, TInt | TInt, TNat -> Some TInt
  | TNat, TNat -> Some TNat
  | TMutez, TMutez -> Some TMutez
  | TTimestamp, TInt | TInt, TTimestamp -> Some TTimestamp
  | _ -> None
  
let subtype t1 t2 =
  match (t1, t2) with
  | TInt, TInt | TNat, TInt | TInt, TNat | TNat, TNat -> Some TInt
  | TMutez, TMutez -> Some TMutez
  | TTimestamp, TInt -> Some TTimestamp
  | TTimestamp, TTimestamp -> Some TInt
  | _ -> None
  
let interpretI ins (stack : sval list) =
  match (ins, stack) with
  | "RENAME", st ->
    (* designated no-op to manipulate annotations *)
    return st
  | "UNIT", st ->
    return (VUnit :: st)
  | ("ADD", (VInt (x) :: VInt (y) :: st))
  | ("ADD", (VNat (x) :: VInt (y) :: st))
  | ("ADD", (VInt (x) :: VNat (y) :: st)) ->
    return (VInt (Z.add x y) :: st)
  | ("ADD", (VNat (x) :: VNat (y) :: st)) ->
    return (VNat (Z.add x y) :: st)
  | ("ADD", (VMutez (x) :: VMutez (y) :: st)) ->
    return (VMutez (Z.add x y) :: st)
  | ("ADD", (VTimestamp (x) :: VInt (y) :: st))
  | ("ADD", (VInt (x) :: VTimestamp (y) :: st))->
    return (VTimestamp (Z.add x y) :: st)
  | ("ADD", (x :: y :: st)) ->
    (match addtype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("ADD", [x; y]), t) :: st)
     | None ->
       raise (Symbolic ("ADD: illegal argument types", x, y)))
  | ("SUB", (VInt x :: VInt y :: st))
  | ("SUB", (VNat x :: VInt y :: st))
  | ("SUB", (VInt x :: VNat y :: st))
  | ("SUB", (VNat x :: VNat y :: st)) ->
    return (VInt (Z.sub x y) :: st)
  | ("SUB", (VMutez x :: VMutez y :: st)) ->
    return (VMutez (Z.sub x y) :: st)
  | ("SUB", (VTimestamp x :: VInt y :: st)) ->
    return (VTimestamp (Z.sub x y) :: st)
  | ("SUB", (VTimestamp x :: VTimestamp y :: st)) ->
    return (VInt (Z.sub x y) :: st)
  | ("SUB", (x :: y :: st)) ->
    (match subtype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("SUB", [x; y]), t) :: st)
     | None ->
       raise (Symbolic ("SUB: illegal argument types", x, y)))
  | ("MUL", (VInt x :: VInt y :: st))
  | ("MUL", (VNat x :: VInt y :: st))
  | ("MUL", (VInt x :: VNat y :: st)) ->
    return (VInt (Z.mul x y) :: st)
  | ("MUL", (VNat x :: VNat y :: st)) ->
    return (VNat (Z.mul x y) :: st)
  | ("MUL", (VMutez x :: VNat y :: st))
  | ("MUL", (VNat x :: VMutez y :: st)) ->
    return (VMutez (Z.mul x y) :: st)
  | ("MUL", (x :: y :: st)) ->
    (match multype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("MUL", [x; y]), t) :: st)
     | None ->
       raise (Symbolic ("MUL: illegal argument types", x, y))
    )
  | "EDIV", (VInt x :: VNat y :: st)
  | "EDIV", (VNat x :: VInt y :: st)
  | "EDIV", (VInt x :: VInt y :: st) ->
    (if y = Z.zero then
      return (VNone (TPair (TInt, TNat)) :: st)
    else
      let (q, r) = Z.div_rem x y in
      return (VSome (VPair (VInt q, VNat r)) :: st))
  | "EDIV", (VNat x :: VNat y :: st) ->
    (if y = Z.zero then
      return (VNone (TPair (TNat, TNat)) :: st)
    else
      let (q, r) = Z.div_rem x y in
      return (VSome (VPair (VNat q, VNat r)) :: st))
  | "EDIV", (VMutez x :: VNat y :: st) ->
    (if y = Z.zero then
      return (VNone (TPair (TMutez, TMutez)) :: st)
    else
      let (q, r) = Z.div_rem x y in
      return (VSome (VPair (VMutez q, VMutez r)) :: st))
  | "EDIV", (VMutez x :: VMutez y :: st) ->
    (if y = Z.zero then
      return (VNone (TPair (TNat, TMutez)) :: st)
    else
      let (q, r) = Z.div_rem x y in
      return (VSome (VPair (VNat q, VMutez r)) :: st))
  | ("EDIV", (x :: y :: st)) ->
    (match divtype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("DIV", [x; y]), TOption t) :: st)
     | None ->
       raise (Symbolic ("DIV: illegal argument types", x, y))
    )
  | ("CAR", (VPair (s1, _s2) :: st)) ->
    return (s1 :: st)
  | ("CAR", (VSymbolic (_d, TPair (t1, _t2)) as x :: st)) ->
    return (VSymbolic (Op ("CAR", [x]), t1) :: st)
  | ("CDR", (VPair (_s1, s2) :: st)) ->
    return (s2 :: st)
  | ("CDR", (VSymbolic (_d, TPair (_t1, t2)) as x :: st)) ->
    return (VSymbolic (Op ("CDR", [x]), t2) :: st)
  | ("UNPAIR", (VPair (s1, s2) :: st)) ->
    return (s1 :: s2 :: st)
  | ("UNPAIR", (VSymbolic (_d, TPair (t1, t2)) as x :: st)) ->
    return (VSymbolic (Op ("CAR", [x]), t1) :: VSymbolic (Op ("CDR", [x]), t2) :: st)
  | ("PAIR", s1 :: s2 :: st) ->
    return (VPair (s1, s2) :: st)
  | ("CONS", s1 :: s2 :: st) ->
    return (VCons (s1, s2) :: st) (* check types? *)
  | ("SOME", s :: st) ->
    return (VSome s :: st)
  | ("DUP", (x :: st)) ->
    return (x :: x :: st)
  | ("SWAP", (x :: y :: st)) ->
    return (y :: x :: st)
  | ("DROP", (_ :: st)) ->
    return (st)
  | ("ISNAT", VInt a :: st) ->
    return ((if a >= Z.zero then VSome (VNat a) else VNone TNat) :: st)
  | ("ISNAT", x :: st)
    when typeof x = TInt ->
    return (VSymbolic (Op ("ISNAT", [x]), TOption TNat) :: st)
  | "COMPARE", VTimestamp a :: VTimestamp b :: st
  | "COMPARE", VMutez a :: VMutez b :: st
  | "COMPARE", VInt a :: VInt b :: st
  | "COMPARE", VNat a :: VNat b :: st ->
    return (VInt (Z.sub a b) :: st)
  | "COMPARE", VBool a :: VBool b :: st ->
    return (VInt (Z.of_int (compare_bool a b)) :: st)
  | "COMPARE", x :: y :: st
    when typeof x = TUnit && typeof y = TUnit ->
    return (VInt Z.zero :: st)
  | "COMPARE", x :: y :: st
    when typeof x = typeof y && comparable_type (typeof x) ->
    return (VSymbolic (Op ("COMPARE", [x; y]), TInt) :: st)
  | "LE", VInt a :: st ->
    return (VBool (a <= Z.zero) :: st)
  | "LE", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("LE", [x]), TBool) :: st)
  | "LT", VInt a :: st ->
    return (VBool (a < Z.zero) :: st)
  | "LT", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("LT", [x]), TBool) :: st)
  | "GE", VInt a :: st ->
    return (VBool (a >= Z.zero) :: st)
  | "GE", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("GE", [x]), TBool) :: st)
  | "GT", VInt a :: st ->
    return (VBool (a > Z.zero) :: st)
  | "GT", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("GT", [x]), TBool) :: st)
  | "EQ", VInt a :: st ->
    return (VBool (a = Z.zero) :: st)
  | "EQ", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("EQ", [x]), TBool) :: st)
  | "NEQ", VInt a :: st ->
    return (VBool (a <> Z.zero) :: st)
  | "NEQ", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("NEQ", [x]), TBool) :: st)
  | "NOT", VBool a :: st ->
    return (VBool (not a) :: st)
  | "NOT", VInt a :: st ->
    return (VInt (Z.lognot a) :: st)
  (* VNat ? lxor breaks the invariant *)
  | "NOT", x :: st
    when not_type (typeof x) ->
    return (VSymbolic (Op ("NOT", [x]), typeof x) :: st)
  | "XOR", VBool a :: VBool b :: st ->
    return (VBool (a <> b) :: st)
  | "XOR", VNat a :: VNat b :: st ->
    return (VNat (Z.logxor a b) :: st)
  | "XOR", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TBool ->
    return (VSymbolic (Op ("XOR", [x; y]), TBool) :: st)
  | "XOR", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TNat ->
    return (VSymbolic (Op ("XOR", [x; y]), TNat) :: st)
  | "AND", VBool a :: VBool b :: st ->
    return (VBool (a && b) :: st)
  | "AND", VNat a :: VNat b :: st
  | "AND", VInt a :: VNat b :: st ->
    return (VNat (Z.logand a b) :: st)
  | "AND", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TBool ->
    return (VSymbolic (Op ("AND", [x; y]), TBool) :: st)
  | "AND", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TNat ->
    return  (VSymbolic (Op ("AND", [x; y]), TNat) :: st)
  | "ABS", VInt a :: st ->
    return (VNat (Z.abs a) :: st)
  | "ABS", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("ABS", [x]), TNat) :: st)
  | "CONCAT", VBytes a :: VBytes b :: st ->
    return (VBytes (a ^ b) :: st)
  | "CONCAT", x :: y :: st
    when typeof x = TBytes && typeof y = TBytes ->
    return (VSymbolic (Op ("CONCAT", [x;y]), TBytes) :: st)
  | "CONCAT", x :: st
    when typeof x = TList TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("CONCAT", [x]), TBytes) :: st)
  | "ADDRESS", VContract (a, _t) :: st ->
    return (VAddress a :: st)
  | "ADDRESS", x :: st
    when contract_type (typeof x) ->
    return (VSymbolic (Op ("ADDRESS", [x]), TAddress) :: st)
  | "MEM", x :: VSet (zs, t) :: st
    when typeof x = t && concrete x && List.for_all concrete zs ->
    return (VBool (List.mem x zs) :: st)
  | "MEM", x :: y :: st
    when typeof y = TSet (typeof x) ->
    return (VSymbolic (Op ("MEM", [x; y]), TBool) :: st)
  | "MEM", x :: VMap (alist, kt, _vt) :: st
    when typeof x = kt && concrete x && List.for_all concrete (List.map fst alist) ->
    return (VBool (List.mem x (List.map fst alist)) :: st)
  | "MEM", x :: y :: st
    when map_key_type (typeof y) = Some (typeof x) ->
    return (VSymbolic (Op ("MEM", [x; y]), TBool) :: st)
  (* concrete instances of MEM would be quite complex *)
  (* TODO: concrete instance of SIZE for list *)
  | "SIZE", VSet (xs, _t) :: st ->
    return (VNat (Z.of_int (List.length xs)) :: st)
  | "SIZE", VMap (xs, _kt, _vt) :: st ->
    return (VNat (Z.of_int (List.length xs)) :: st)
  | "SIZE", VString str :: st ->
    return (VNat (Z.of_int (String.length str)) :: st)
  | "SIZE", VBytes str :: st ->
    return (VNat (Z.of_int (String.length str)) :: st)
  | "SIZE", x :: st
    when set_type (typeof x) || map_type (typeof x) || list_type (typeof x) || typeof x = TString || typeof x = TBytes ->
    return (VSymbolic (Op ("SIZE", [x]), TNat) :: st)
  | "GET_AND_UPDATE", x :: VSome y :: VMap (alist, kt, vt) :: st
    when typeof x = kt && concrete x && typeof y = vt && List.for_all concrete (List.map fst alist) ->
    return (option_to_sval (List.assoc_opt x alist) vt :: VMap ((x, y) :: List.filter (fun m -> fst m <> x) alist, kt, vt) :: st)
  | "GET_AND_UPDATE", x :: VNone vt1 :: VMap (alist, kt, vt) :: st
    when typeof x = kt && concrete x && vt = vt1 && List.for_all concrete (List.map fst alist) ->
    return (option_to_sval (List.assoc_opt x alist) vt :: VMap (List.filter (fun m -> fst m <> x) alist, kt, vt) :: st)
  | "GET_AND_UPDATE", x :: y :: z :: st
    when map_key_type (typeof z) = Some (typeof x) && map_val_type (typeof z) = option_val_type (typeof y) ->
    return (VSymbolic (Op ("GET", [x;z]), typeof y) :: VSymbolic (Op ("UPDATE", [x;y;z]), typeof z) :: st)
  | "UPDATE", x :: VSome y :: VMap (alist, kt, vt) :: st
    when typeof x = kt && concrete x && typeof y = vt && List.for_all concrete (List.map fst alist) ->
    return (VMap ((x, y) :: List.filter (fun m -> fst m <> x) alist, kt, vt) :: st)
  | "UPDATE", x :: VNone vt1 :: VMap (alist, kt, vt) :: st
    when typeof x = kt && concrete x && vt = vt1 && List.for_all concrete (List.map fst alist) ->
    return (VMap (List.filter (fun m -> fst m <> x) alist, kt, vt) :: st)
  | "UPDATE", x :: y :: z :: st
    when map_key_type (typeof z) = Some (typeof x) && map_val_type (typeof z) = option_val_type (typeof y) ->
    return (VSymbolic (Op ("UPDATE", [x;y;z]), typeof z) :: st)
  | "UPDATE", x :: VBool true :: VSet (zs, t) :: st
    when typeof x = t && concrete x && List.for_all concrete zs ->
    if List.mem x zs then 
      return (VSet (zs, t) :: st)
    else
      return (VSet (x :: zs, t) :: st)
  | "UPDATE", x :: VBool false :: VSet (zs, t) :: st
    when typeof x = t && concrete x && List.for_all concrete zs ->
    if List.mem x zs then 
      return (VSet (List.filter (fun z -> z <> x) zs, t) :: st)
    else
      return (VSet (zs, t) :: st)
  | "UPDATE", x :: y :: z :: st
    when typeof z = TSet (typeof x) && typeof y = TBool ->
    return (VSymbolic (Op ("UPDATE", [x;y;z]), typeof z) :: st)
  | "GET", (ky :: VMap (alist, kt, vt) :: st)
    when typeof ky = kt ->
    (match List.assoc_opt ky alist with
     | None ->
       (* not ok because if ky is a symbolic value: may match conditionally *)
       return (VNone vt :: st)
     | Some vl ->
       (* is this a definitive answer? *)
       return (VSome vl :: st))
  | "GET", ky :: mp :: st
    when Some (typeof ky) = map_key_type (typeof mp) ->
    (match map_val_type (typeof mp) with
     | Some vt -> 
       return (VSymbolic (Op ("GET", [ky; mp]), TOption vt) :: st)
     | None ->                  (* never happens *)
       raise (Symbolic ("impossible type clash", ky, mp)))
  | "PACK", x :: st
    when packable_type (typeof x) ->
    return (VSymbolic (Op ("PACK", [x]), TBytes) :: st)
  | "EXEC", a :: f :: st
    when applicable_function (typeof f) (typeof a) ->
    return (VSymbolic (Op ("EXEC", [a;f]), return_type_exn (typeof f)) :: st)
  | ("SELF_ADDRESS", st) ->
    let* s = getenv "SELF_ADDRESS" in
    return (s :: st)
  | ("SELF", st) ->
    let* s = getenv "SELF" in
    return (s :: st)
  | ("SENDER", st) ->
    let* s = getenv "SENDER" in
    return (s :: st)
  | ("SOURCE", st) ->
    let* s = getenv "SOURCE" in
    return (s :: st)
  | ("AMOUNT", st) ->
    let* s = getenv "AMOUNT" in
    return (s :: st)
  | ("BALANCE", st) ->
    let* s = getenv "BALANCE" in
    return (s :: st)
  | "NOW", st ->
    let* s = getenv "NOW" in
    return (s :: st)
  | ("HASH_KEY", k :: st)
    when typeof k = TKey ->
    (* TODO: concrete version computes the Base58Check of a public key *)
    return (VSymbolic (Op ("HASH_KEY", [k]), TKey_Hash) :: st)
  | ("TRANSFER_TOKENS", arg :: amt :: contract :: st)
    when typeof amt = TMutez (* && contract_compatible (typeof contract) (typeof arg) *) ->
    return (VSymbolic (Op ("TRANSFER_TOKENS", [arg; amt; contract]), TOperation) :: st)
  | ("SET_DELEGATE", okh :: st)
    when typeof okh = TOption TKey_Hash ->
    return (VSymbolic (Op ("SET_DELEGATE", [okh]), TOperation) :: st)
  | ("IMPLICIT_ACCOUNT", kh :: st)
    when typeof kh = TKey_Hash ->
    return (VSymbolic (Op ("IMPLICIT_ACCOUNT", [kh]), TContract TUnit) :: st)
  | ("VOTING_POWER", kh :: st)
    when typeof kh = TKey_Hash ->
    return (VSymbolic (Op ("VOTING_POWER", [kh]), TNat) :: st)
  | ("CHECK_SIGNATURE", key :: sg :: bys :: st)
    when typeof key = TKey && typeof sg = TSignature && typeof bys = TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("CHECK_SIGNATURE", [key; sg; bys]), TBool) :: st)
  | ("KECCAK", bys :: st)
    when typeof bys = TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("KECCAK", [bys]), TBytes) :: st)
  | ("SHA256", bys :: st)
    when typeof bys = TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("SHA256", [bys]), TBytes) :: st)
  | ("SHA3", bys :: st)
    when typeof bys = TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("SHA3", [bys]), TBytes) :: st)
  | ("SHA512", bys :: st)
    when typeof bys = TBytes ->
    (* TODO: concrete version *)
    return (VSymbolic (Op ("SHA512", [bys]), TBytes) :: st)
  | "FAILWITH", x :: st ->
    let* () = register_failure x in
    return st   (* but need to remember x *)
  | n, _ ->
    raise (StackType ("unprocessed op " ^ n, stack))

let interpretT ins t stack =
  match (ins, stack) with
  | ("CONTRACT", x :: st) ->
    return (VSymbolic (Op ("CONTRACT", [x]), TOption (TContract t)) :: st)
  (* returns an option
   * - requires new kind of symbolic value introduced with WSome
   * - it's a VContract (a, t) if it returns Some value -> this is hidden in a singleton set
   * - it can also be None
  *)
  | "NIL", st ->
    return (VNil t :: st)
  | "NONE", st ->
    return (VNone t :: st)
  | "EMPTY_SET", st ->
    return (VSet ([], t) :: st)
  | "UNPACK", VSymbolic (Op ("PACK", [x]), TBytes) :: st ->
    if typeof x = t then
      return (VSome x :: st)
    else
      return (VNone t :: st)
  | "UNPACK", x :: st
    when typeof x = TBytes ->
    return (VSymbolic (Op ("UNPACK", [x]), TOption t) :: st)
  | _ ->
    raise (StackType ("unprocessed TOperation " ^ ins, stack))

let interpretT2 ins t1 t2 stack =
  match (ins, stack) with
  | "EMPTY_MAP", st ->
    return (VMap ([], t1, t2) :: st)
  | "EMPTY_BIG_MAP", st ->
    return (VMap ([], t1, t2) :: st)
  | _ ->
    raise (StackType ("unprocessed T2Operation " ^ ins, stack))
  
let rec segment i stack =
  if i <= 0 then ([], stack) else
    match stack with
    | s :: ss ->
      let seg, rest = segment (i-1) ss in
      (s :: seg, rest)
    | [] ->
      [], []

let symbolic_if mtrue mfalse rd cstore =
  let (st_tru, cstore_tru) = mtrue rd cstore in
  let (st_fls, cstore_fls) = mfalse rd cstore in
  let (new_stack, new_cstore) =
    if cstore_tru.maybe_reachable
    then if cstore_fls.maybe_reachable
      then (merge_stack st_tru st_fls,
            {cstore with maybe_reachable = true})
      else (st_tru, cstore_tru)
    else (st_fls, cstore_fls) in
  (new_stack,
   {new_cstore with
    failure_values =
      listunion cstore_tru.failure_values cstore_fls.failure_values;
   })

let set_reachable _rd cstore =
  (), {cstore with maybe_reachable = true}

let interpretCC _ty_param ty_storage _cins stack =
  match stack with
  | a :: b :: c :: st
    when typeof a = TOption TKey_Hash && typeof b = TMutez && typeof c = ty_storage ->
    let op_cc =  Op ("CREATE_CONTRACT", [a; b; c]) in 
    return (VSymbolic (Step (SFirst, op_cc), TOperation) ::
            VSymbolic (Step (SSecond, op_cc), TAddress) ::
            st)
  | _ ->
    raise (StackType ("Bad CREATE_CONTRACT instruction on ", stack))

let rec interpret (il : instr list) (stack : sval list) =
  match il with
  | [] -> return stack
  | (I n :: inss) ->
    let* st = interpretI n stack in
    interpret inss st
  | (PUSH s :: inss) ->
    interpret inss (s :: stack)
  | (COND (n, ins_tru, ins_fls) :: inss) ->
    let* st = interpretC (n, ins_tru, ins_fls) stack in
    interpret inss st
  | (LOOP (n, ins_body) :: inss) ->
    let* st = interpretL (n, ins_body) stack in
    interpret inss st
  | (T (n, t) :: inss) ->
    let* st = interpretT n t stack in
    interpret inss st
  | (T2 (n, t1, t2) :: inss) ->
    let* st = interpretT2 n t1 t2 stack in
    interpret inss st
  | DIP (i, il) :: inss ->
    let seg, rest = segment i stack in
    let* rest_after = interpret il rest in
    interpret inss (seg @ rest_after)
  | II (ins, i) :: inss ->
    let* st = interpretII ins i stack in
    interpret inss st
  | CREATE_CONTRACT (ty_p, ty_s, cins) :: inss ->
    let* st = interpretCC ty_p ty_s cins stack in
    interpret inss st
  | LAMBDA (ty_arg, ty_ret, ins_body) :: inss ->
    interpret inss (VLambda (ty_arg, ty_ret, ins_body) :: stack)

and interpretII ins i stack =
  match (ins, stack) with
  | "DIG", _ ->
    let seg, rest = segment i stack in
    (match rest with
    | x :: rest_after ->
      return (x :: seg @ rest_after)
    | [] ->
      raise (StackType ("Bad DIG instruction on ", stack)))
  | "DROP", _ ->
    let _seg, rest = segment i stack in
    return rest
  | _, _ ->
    raise (StackType ("Bad II instruction "^ins^" on ", stack))

and interpretL (ins, ins_body) stack =
  match (ins, stack) with
  | "ITER", VSet (ss, _t) :: st ->
    ReaderStore.fold (fun s st -> interpret ins_body (s :: st)) ss st
  | "ITER", VNil _t :: st ->
    return st
  | "ITER", VCons (sx, sl) :: st ->
    let* st = interpret ins_body (sx :: st) in
    interpretL ("ITER", ins_body) (sl :: st)
  | "ITER", VMap (alist, _t1, _t2) :: st ->
    ReaderStore.fold (fun (k,v) st -> interpret ins_body (VPair (k, v) :: st)) alist st
  | "ITER", VSymbolic (d, TSet t) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInset, d), t) :: st) in
    let* () = set_reachable in  (* in case of empty set *)
    return (merge_stack st st_after)
  | "ITER", VSymbolic (d, TList t) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInlist, d), t) :: st) in
    let* () = set_reachable in  (* in case of empty list *)
    return (merge_stack st st_after)
  | "ITER", VSymbolic (d, TMap (t1, t2)) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInmap, d), TPair (t1, t2)) :: st) in
    let* () = set_reachable in  (* in case of empty list *)
    return (merge_stack st st_after)
  | "MAP", VMap (alist, t1, t2) :: st ->
    let* (dry_st) =
      interpret ins_body (VSymbolic (Op ("DRY_MAP",[]), TPair (t1, t2)) :: st) in
    let* (ys, st_out) = ReaderStore.fold
        (fun (k,v) (ys, st) ->
           let* st1 = interpret ins_body (VPair (k, v) :: st) in
           return ((k,List.hd st1) :: ys, List.tl st1))
        alist
        ([], st)
    in
    let* () = set_reachable in  (* in case of empty map *)
    return (VMap (ys, t1, typeof (List.hd dry_st)) :: st_out)
  | "MAP", (VSymbolic (d, TMap (t1, t2)) as a) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInmap, d), TPair (t1, t2)) :: st) in
    let* () = set_reachable in  (* in case of empty list *)
    return (VSymbolic (Op ("MAP", [a]), TMap (t1, typeof (List.hd st_after))) ::
            merge_stack st (List.tl st_after))
  | "MAP", (VSymbolic (d, TList (t1)) as a) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInlist, d), t1) :: st) in
    let* () = set_reachable in  (* in case of empty list *)
    return (VSymbolic (Op ("MAP", [a]), TList (typeof (List.hd st_after))) ::
            merge_stack st (List.tl st_after))
  | n, VSymbolic (_, TMap (_, _)) :: _ ->
    raise (StackType ("unprocessed loop "^n^" on symbolic map", stack))
  | n, VSymbolic (_, TList (_)) :: _ ->
    raise (StackType ("unprocessed loop "^n^" on symbolic list", stack))
  | n, _ -> raise (StackType ("unprocessed loop "^n, stack))

and interpretC (ins, ins_tru, ins_fls) stack =
  match (ins, stack) with
  | "IF", VBool b :: st ->
    if b then interpret ins_tru st else interpret ins_fls st
  | "IF_LEFT", VOr (L, s, _t) :: st ->
    interpret ins_tru (s :: st)
  | "IF_LEFT", VOr (R, s, _t) :: st ->
    interpret ins_fls (s :: st)
  | "IF_CONS", VCons (h, t) :: st ->
    interpret ins_tru (h :: t :: st)
  | "IF_CONS", VNil _t :: st ->
    interpret ins_fls st
  | "IF_NONE", VNone _t :: st ->
    interpret ins_tru st
  | "IF_NONE", VSome s :: st ->
    interpret ins_fls (s :: st)
  | "IF", (VSymbolic (_d, TBool) as x) :: st ->
    symbolic_if
      (let* _ = register_true x in
       interpret ins_tru st)
      (let* _ = register_false x in
       interpret ins_fls st)
  | "IF_LEFT", (VSymbolic (d, TOr (t1, t2)) as x) :: st ->
    symbolic_if
      (let* _ = register_true x in
       interpret ins_tru (VSymbolic (Step (SLeft, d), t1) :: st))
      (let* _ = register_false x in
       interpret ins_fls (VSymbolic (Step (SRight, d), t2) :: st))
  | "IF_CONS", (VSymbolic (d, TList t) as x) :: st ->
    symbolic_if
      (let* _ = register_true x in
       interpret ins_tru (VSymbolic (Step (SCar, d), t) ::
                          VSymbolic (Step (SCdr, d), TList t) ::
                          st))
      (let* _ = register_false x in
       interpret ins_fls st)
  | "IF_NONE", (VSymbolic (Op ("CONTRACT", [VAddress a]), TOption t) as x) :: st ->
    symbolic_if
      (let* _ = register_true x in
       interpret ins_tru st)
      (let* _ = register_false x in
      interpret ins_fls (VContract (a, t) :: st))
  | "IF_NONE", (VSymbolic (d, TOption t) as x) :: st ->
    symbolic_if
      (let* _ = register_true x in
       interpret ins_tru st)
      (let* _ = register_false x in
      interpret ins_fls (VSymbolic (nstep (SSome, d), t) :: st))
  | n, _ -> raise (StackType ("unprocessed conditional "^n, stack))

let rec symof (d : desc) (t : ty) =
  match t with
  | TPair (t1, t2) -> VPair (symof (Step (SFirst, d)) t1, symof (Step (SSecond, d)) t2)
  | _ -> VSymbolic (d, t)

let initial_stack (parameter : ty) (storage : ty) =
  let sparameter = symof Parameter parameter in
  let sstorage = symof Storage storage in
  [VPair (sparameter, sstorage)]

let initial_stack_from_entrypoint (s : sval) (storage : ty) =
  let sstorage = symof Storage storage in
  match s with
  | VSymbolic (d, t) ->
    let sparameter = symof d t in
    [VPair (sparameter, sstorage)]
  | _ ->
    [VPair (s, sstorage)]

let rec symentries d t =
  match t with
  | TOr (t1, t2) ->
    List.map (fun s -> VOr (L, s, t2)) (symentries (Step (SLeft, d)) t1) @
    List.map (fun s -> VOr (R, s, t1)) (symentries (Step (SRight, d)) t2)
  | _ -> [VSymbolic (d, t)]

let entrypoints (parameter : ty) =
  symentries Parameter parameter

