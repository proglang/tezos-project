(* types and symbolic values *)
type ty =
  | TAddress
  | TBool
  | TInt
  | TList of ty
  | Map of ty * ty
  | TMutez
  | TOr of ty * ty
  | TPair of ty * ty
  | TString
  | TUnit
  | TContract of ty
  | TOperation

type step =
  | SLeft | SRight | SFirst | SSecond

type lr =
  | L | R

type sval =
  | VAddress of string
  | VBool of bool
  | VInt of int
  | VMutez of int
  | VOr of lr * sval * ty
  | VPair of sval * sval
  | VString of string
  | VUnit
  | VNil of ty
  | VCons of sval * sval
  | VContract of string * ty
  | VSymbolic of desc * ty
and desc =
  | Step of step * desc
  | Parameter
  | Storage
  | Op of string * sval list
  | Set of sval list
      
let rec typeof (s : sval) =
  match s with
  | VAddress (_) -> TAddress
  | VBool (_) -> TBool
  | VInt (_) -> TInt
  | VMutez (_) -> TMutez
  | VOr (L, s, t) -> TOr (typeof s, t)
  | VOr (R, s, t) -> TOr (t, typeof s)
  | VPair (s1, s2) -> TPair (typeof s1, typeof s2)
  | VString (_) -> TString
  | VUnit -> TUnit
  | VNil t -> TList t
  | VCons (s1, s2) -> TList (typeof s1)
  | VContract (_, t) -> TContract t
  | VSymbolic (d, t) -> t

let isPair (t : ty) =
  match t with
  | TPair (_, _) -> true
  | _ -> false

exception Symbolic of string * sval * sval

let symEQ x y =
  match (x, y) with
  | (VAddress (a), VAddress (b)) -> VBool (a = b)
  | (VInt (a), VInt (b)) -> VBool (a = b)
  | _ when typeof x = typeof y -> VSymbolic (Op ("EQ", [x; y]), TBool)
  | _ -> 
    raise (Symbolic ("possible type clash in symEQ", x, y))

(* merging stacks and values *)

let rec merge_sval x y =
  match (x, y) with
  | (VAddress a, VAddress b) when a = b -> VAddress a
  | (VBool a, VBool b) when a = b -> VBool a
  | (VInt a, VInt b) when a = b -> VInt a
  | (VMutez a, VMutez b) when a = b -> VMutez a
  | (VString a, VString b) when a = b -> VString a
  | (VUnit, VUnit) -> VUnit
  | (VNil t1, VNil t2) when t1 = t2 -> VNil t1
  | (VCons (x1, x2), VCons (y1, y2)) when typeof x = typeof y -> VCons (merge_sval x1 y1, merge_sval x2 y2)
  | (VPair (x1, x2), VPair (y1, y2)) when typeof x = typeof y -> VPair (merge_sval x1 y1, merge_sval x2 y2)
  | (VOr (tag1, s1,t1), VOr (tag2, s2, t2)) when tag1 = tag2 && t1 = t2 -> VOr (tag1, merge_sval s1 s2, t1)
  | _ when typeof x = typeof y -> VSymbolic (Set [x; y], typeof x)
  | _ when typeof x <> typeof y -> raise (Symbolic ("possible type clash in merge_sval", x, y))
  | _ -> raise (Symbolic ("unhandled case", x, y))

let merge_stack = List.map2 merge_sval

(* instructions *)

type instr =
  | I of string
  | COND of string * instr list * instr list
  | PUSH of sval
  | T of string * ty
  | DIP of int * instr list

let interpretI ins (stack : sval list) =
  match (ins, stack) with
  | ("ADD", (VInt (x) :: VInt (y) :: st)) -> VInt (x+y) :: st
  | ("ADD", (x :: y :: st)) when typeof x = TInt && typeof y = TInt -> VSymbolic (Op ("ADD", [x; y]), TInt) :: st
  | ("CAR", (VPair (s1, s2) :: st)) -> s1 :: st
  | ("CAR", (VSymbolic (d, TPair (t1, t2)) as x :: st)) -> VSymbolic (Op ("CAR", [x]), t1) :: st
  | ("CDR", (VPair (s1, s2) :: st)) -> s2 :: st
  | ("CDR", (VSymbolic (d, TPair (t1, t2)) as x :: st)) -> VSymbolic (Op ("CDR", [x]), t2) :: st
  | ("UNPAIR", (VPair (s1, s2) :: st)) -> s1 :: s2 :: st
  | ("UNPAIR", (VSymbolic (d, TPair (t1, t2)) as x :: st)) -> VSymbolic (Op ("CAR", [x]), t1) :: VSymbolic (Op ("CDR", [x]), t2) :: st
  | ("PAIR", s1 :: s2 :: st) -> VPair (s1, s2) :: st
  | ("CONS", s1 :: s2 :: st) -> VCons (s1, s2) :: st (* check types *)
  | ("DUP", (x :: st)) -> x :: x :: st
  | ("SWAP", (x :: y :: st)) -> y :: x :: st
  | ("DROP", (x :: st)) -> st
  | "COMPARE", VMutez a :: VMutez b :: st -> VInt (a-b) :: st
  | "COMPARE", VInt a :: VInt b :: st -> VInt (a-b) :: st
  | "COMPARE", x :: y :: st when typeof x = typeof y -> VSymbolic (Op ("COMPARE", [x; y]), TInt) :: st
  | "LE", VInt a :: st -> VBool (a <= 0) :: st
  | "LE", x :: st when typeof x = TInt -> VSymbolic (Op ("LE", [x]), TBool) :: st
  | "EQ", VInt a :: st -> VBool (a = 0) :: st
  | "EQ", x :: st when typeof x = TInt -> VSymbolic (Op ("EQ", [x]), TBool) :: st
  | ("SENDER", st) -> VSymbolic (Op ("SENDER", []), TAddress) :: st
  | ("SOURCE", st) -> VSymbolic (Op ("SOURCE", []), TAddress) :: st
  | ("AMOUNT", st) -> VSymbolic (Op ("AMOUNT", []), TMutez) :: st
  | ("BALANCE", st) -> VSymbolic (Op ("BALANCE", []), TMutez) :: st
  | ("TRANSFER_TOKENS", arg :: amt :: contract :: st) -> VSymbolic (Op ("TRANSFER_TOKENS", [arg; amt; contract]), TOperation) :: st
  | "FAILWITH", x :: st -> st   (* but need to remember x *)
  | n, _ -> raise (Symbolic ("unknown op " ^ n, VUnit, VUnit))

let interpretT ins t stack =
  match (ins, stack) with
  | ("CONTRACT", VAddress a :: stack) -> VContract (a, t) :: stack
  | ("CONTRACT", VSymbolic (d, TAddress) :: stack) -> VSymbolic (d, TContract t) :: stack
  | "NIL", stack -> VNil t :: stack
  | _ -> raise (Symbolic ("unknown TOperation " ^ ins, VUnit, VUnit))
  
let rec segment i stack =
  if i <= 0 then ([], stack) else
    match stack with
    | s :: ss ->
      let seg, rest = segment (i-1) ss in
      (s :: seg, rest)
    | [] ->
      [], []

let rec interpret (il : instr list) (stack : sval list) =
  match il with
  | [] -> stack
  | (I n :: inss) -> interpret inss (interpretI n stack)
  | (PUSH s :: inss) -> interpret inss (s :: stack)
  | (COND (n, ins_tru, ins_fls) :: inss) ->
    interpretC (n, ins_tru, ins_fls) stack
  | (T (n, t) :: inss) -> interpret inss (interpretT n t stack)
  | DIP (i, il) :: inss ->
    let seg, rest = segment i stack in
    let rest_after = interpret il rest in
    interpret inss (seg @ rest_after)

and interpretC (ins, ins_tru, ins_fls) stack =
  match (ins, stack) with
  | "IF", VBool b :: stack ->
    if b then interpret ins_tru stack else interpret ins_fls stack
  | "IF_LEFT", VOr (L, s, t) :: stack ->
    interpret ins_tru (s :: stack)
  | "IF_LEFT", VOr (R, s, t) :: stack ->
    interpret ins_fls (s :: stack)
  | "IF", VSymbolic (d, TBool) :: stack ->
    let st_tru = interpret ins_tru stack in
    let st_fls = interpret ins_fls stack in
    merge_stack st_tru st_fls
  | "IF_LEFT", VSymbolic (d, TOr (t1, t2)) :: stack ->
    let st_tru = interpret ins_tru (VSymbolic (Step (SLeft, d), t1) :: stack) in
    let st_fls = interpret ins_fls (VSymbolic (Step (SRight, d), t2) :: stack) in
    merge_stack st_tru st_fls
  | n, _ -> raise (Symbolic ("unknown conditional "^n, VUnit, VUnit))

let rec symof (d : desc) (t : ty) =
  match t with
  | TPair (t1, t2) -> VPair (symof (Step (SFirst, d)) t1, symof (Step (SSecond, d)) t2)
  | _ -> VSymbolic (d, t)

let initial_stack (parameter : ty) (storage : ty) =
  let sparameter = symof Parameter parameter in
  let sstorage = symof Storage storage in
  [VPair (sparameter, sstorage)]

(* examples *)
let auction_close = [
  (* unit : parm * store : - *)
  I "DROP"; I "CDR"; I "DUP"; I "CAR"; I "SENDER"; I "COMPARE"; I "EQ";
  COND ("IF", [], [PUSH (VString "not owner"); I "FAILWITH"]);
  (* store : - *)
  I "UNPAIR"; COND ("IF", [], [PUSH (VString "closed"); I "FAILWITH"]); PUSH (VBool false); I "PAIR";
  (* store : - *)
  I "DUP"; I "CDR"; I "CAR";
  (* owner-address : store : - *)
  T ("CONTRACT", TUnit); I "BALANCE"; PUSH VUnit;
  (* unit : mutez : contract unit : store : - *)
  I "TRANSFER_TOKENS";
  (* operation : store : - *)
  T ("NIL", TOperation); I "SWAP"; I "CONS";
  (* operation list : store : - *)
  I "PAIR"
  (* operation list * store : - *)
]

let auction_bid = [
  (* unit : parm * store : - *)
  I "DROP"; I "CDR"; I "DUP"; I "CAR";
  (* bidding : store : - *)
  COND ("IF", [], [PUSH (VString "closed"); I "FAILWITH"]);
  (* store : - *)
  I "AMOUNT"; I "BALANCE"; I "COMPARE"; I "LE";
  (* amt <= bal : store : - *)
  COND ("IF", [PUSH (VString "too low"); I "FAILWITH"], []);
  (* store : - *)
  I "CDR"; I "UNPAIR"; I "SWAP";
  (* highbidder : owner : - *)
  T ("CONTRACT", TUnit); I "BALANCE"; PUSH VUnit; I "TRANSFER_TOKENS"; T ("NIL", TOperation); I "SWAP"; I "CONS";
  (* operation list : owner *)
  DIP (1, [I "SENDER"; I "SWAP"; I "PAIR"; PUSH (VBool true); I "PAIR"]);
  (* operation list : store : - *)
  I "PAIR"
]

let auction = [
  I "DUP";
  I "CAR";
  COND ("IF_LEFT", auction_close, auction_bid);
  
]
