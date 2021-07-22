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
(* move TInt and TNat to Zarith *)
(* support division *)
(* map datatype: MAP instr *)
(* instructions: 
 ** SELF (to get the type, we need to store the parameter type in the environment!)
 ** CHECK_SIGNATURE needs types signature and bytes 
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
  | TAny

type step =
  | SLeft | SRight | SFirst | SSecond | SCar | SCdr | SSome | SInset | SInlist
  | WSome                       (* wrapped in option Some *)

type lr =
  | L | R

type sval =
  | VBool of bool
  | VInt of int
  | VNat of int                 (* >= 0 *)
  | VOr of lr * sval * ty
  | VPair of sval * sval
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
  | VMutez of int
  | VTimestamp of int
  | VContract of string * ty
  | VSymbolic of desc * ty
and desc =
  | Step of step * desc
  | Parameter
  | Storage
  | Op of string * sval list
  | Set of sval list

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
  let _ = List.iter (fun (k, v) -> Hashtbl.add table k v) init_lst
  let add_typed instr t =
    Hashtbl.add table instr (VSymbolic (Op (instr, []), t))
end

let getenv (n : string) =
  let* e = ReaderStore.get () in
  match Hashtbl.find_opt e n with
  | Some s -> return s
  | None -> return (VSymbolic (Op (n, []), TAny))

(* instructions *)

let rec comparable_type t =
  match t with
  | TAddress
  | TBool
  | TInt
  | TNat
  | TMutez
  | TString
  | TUnit -> true
  | TOr (t1, t2)
  | TPair (t1, t2) -> comparable_type t1 && comparable_type t2
  | TOption (t) -> comparable_type t
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
  

type instr =
  | I of string
  | COND of string * instr list * instr list
  | LOOP of string * instr list
  | PUSH of sval
  | T of string * ty
  | T2 of string * ty * ty
  | DIP of int * instr list

let interpretI ins (stack : sval list) =
  match (ins, stack) with
  | ("ADD", (VInt (x) :: VInt (y) :: st))
  | ("ADD", (VNat (x) :: VInt (y) :: st))
  | ("ADD", (VInt (x) :: VNat (y) :: st)) ->
    return (VInt (x+y) :: st)
  | ("ADD", (VNat (x) :: VNat (y) :: st)) ->
    return (VNat (x+y) :: st)
  | ("ADD", (VMutez (x) :: VMutez (y) :: st)) ->
    return (VMutez (x+y) :: st)
  | ("ADD", (VTimestamp (x) :: VInt (y) :: st))
  | ("ADD", (VInt (x) :: VTimestamp (y) :: st))->
    return (VTimestamp (x+y) :: st)
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
    return (VInt (x-y) :: st)
  | ("SUB", (VMutez x :: VMutez y :: st)) ->
    return (VMutez (x-y) :: st)
  | ("SUB", (VTimestamp x :: VInt y :: st)) ->
    return (VTimestamp (x-y) :: st)
  | ("SUB", (VTimestamp x :: VTimestamp y :: st)) ->
    return (VInt (x-y) :: st)
  | ("SUB", (x :: y :: st)) ->
    (match subtype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("SUB", [x; y]), t) :: st)
     | None ->
       raise (Symbolic ("SUB: illegal argument types", x, y)))
  | ("MUL", (VInt x :: VInt y :: st))
  | ("MUL", (VNat x :: VInt y :: st))
  | ("MUL", (VInt x :: VNat y :: st)) ->
    return (VInt (x*y) :: st)
  | ("MUL", (VNat x :: VNat y :: st)) ->
    return (VNat (x*y) :: st)
  | ("MUL", (VMutez x :: VNat y :: st))
  | ("MUL", (VNat x :: VMutez y :: st)) ->
    return (VMutez (x*y) :: st)
  | ("MUL", (x :: y :: st)) ->
    (match multype (typeof x) (typeof y) with
     | Some t ->
       return (VSymbolic (Op ("MUL", [x; y]), t) :: st)
     | None ->
       raise (Symbolic ("MUL: illegal argument types", x, y))
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
    return ((if a >= 0 then VSome (VNat a) else VNone TNat) :: st)
  | ("ISNAT", x :: st)
    when typeof x = TInt ->
    return (VSymbolic (Op ("ISNAT", [x]), TOption TNat) :: st)
  | "COMPARE", VMutez a :: VMutez b :: st
  | "COMPARE", VInt a :: VInt b :: st
  | "COMPARE", VNat a :: VNat b :: st ->
    return (VInt (a-b) :: st)
  | "COMPARE", VBool a :: VBool b :: st ->
    return (VInt (compare_bool a b) :: st)
  | "COMPARE", x :: y :: st
    when typeof x = TUnit && typeof y = TUnit ->
    return (VInt 0 :: st)
  | "COMPARE", x :: y :: st
    when typeof x = typeof y && comparable_type (typeof x) ->
    return (VSymbolic (Op ("COMPARE", [x; y]), TInt) :: st)
  | "LE", VInt a :: st ->
    return (VBool (a <= 0) :: st)
  | "LE", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("LE", [x]), TBool) :: st)
  | "LT", VInt a :: st ->
    return (VBool (a < 0) :: st)
  | "LT", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("LT", [x]), TBool) :: st)
  | "GE", VInt a :: st ->
    return (VBool (a >= 0) :: st)
  | "GE", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("GE", [x]), TBool) :: st)
  | "GT", VInt a :: st ->
    return (VBool (a > 0) :: st)
  | "GT", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("GT", [x]), TBool) :: st)
  | "EQ", VInt a :: st ->
    return (VBool (a = 0) :: st)
  | "EQ", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("EQ", [x]), TBool) :: st)
  | "NEQ", VInt a :: st ->
    return (VBool (a <> 0) :: st)
  | "NEQ", x :: st
    when typeof x = TInt ->
    return (VSymbolic (Op ("NEQ", [x]), TBool) :: st)
  | "NOT", VBool a :: st ->
    return (VBool (not a) :: st)
  | "NOT", VInt a :: st ->
    return (VInt (a lxor -1) :: st)
  (* VNat ? lxor breaks the invariant *)
  | "NOT", x :: st
    when not_type (typeof x) ->
    return (VSymbolic (Op ("NOT", [x]), typeof x) :: st)
  | "XOR", VBool a :: VBool b :: st ->
    return (VBool (a <> b) :: st)
  | "XOR", VNat a :: VNat b :: st ->
    return (VNat (a lxor b) :: st)
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
    return (VNat (a land b) :: st)
  | "AND", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TBool ->
    return (VSymbolic (Op ("AND", [x; y]), TBool) :: st)
  | "AND", x :: y :: st
    when andtype (typeof x) (typeof y) = Some TNat ->
    return  (VSymbolic (Op ("AND", [x; y]), TNat) :: st)
  | "ABS", VInt a :: st ->
    return (VNat (abs a) :: st)
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
  | "SIZE", VSet (xs, _t) :: st ->
    return (VNat (List.length xs) :: st)
  | "SIZE", x :: st
    when set_type (typeof x) ->
    return (VSymbolic (Op ("SIZE", [x]), TNat) :: st)
  | "SIZE", VMap (xs, _kt, _vt) :: st ->
    return (VNat (List.length xs) :: st)
  | "SIZE", x :: st
    when map_type (typeof x) ->
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
  | ("CONTRACT", (VAddress _a as x) :: st) ->
    return (VSymbolic (Step (WSome, Set[x]), TOption (TContract t)) :: st)
  (* returns an option
   * - requires new kind of symbolic value introduced with WSome
   * - it's a VContract (a, t) if it returns Some value -> this is hidden in a singleton set
   * - it can also be None
  *)
  | ("CONTRACT", (VSymbolic (d, TAddress)) :: st) ->
    return (VSymbolic (Step (WSome, d), TOption (TContract t)) :: st)
  | "NIL", st ->
    return (VNil t :: st)
  | "NONE", st ->
    return (VNone t :: st)
  | "EMPTY_SET", st ->
    return (VSet ([], t) :: st)
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

and interpretL (ins, ins_body) stack =
  match (ins, stack) with
  | "ITER", VSet (ss, _t) :: st ->
    ReaderStore.fold (fun s st -> interpret ins_body (s :: st)) ss st
  | "ITER", VNil _t :: st ->
    return st
  | "ITER", VCons (sx, sl) :: st ->
    let* st = interpret ins_body (sx :: st) in
    interpretL ("ITER", ins_body) (sl :: st)
  | "ITER", VSymbolic (d, TSet t) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInset, d), t) :: st) in
    let* () = set_reachable in  (* in case of empty set *)
    return (merge_stack st st_after)
  | "ITER", VSymbolic (d, TList t) :: st ->
    let* st_after = interpret ins_body (VSymbolic (Step (SInlist, d), t) :: st) in
    let* () = set_reachable in  (* in case of empty list *)
    return (merge_stack st st_after)
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

