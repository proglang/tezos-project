(* eval_utils.ml contains all evaluation functions that are not
 recursively dependend on the main evaluation functions in interpreter.ml *)

open Base
open Value

exception Illegal_Instruction of string * AbsMichelson.instr
exception StackTypeError of string * AbsMichelson.instr * typ list

(* VALUE/DATA EVALUATION FUNCTIONS *)
let evalStr (AbsMichelson.Str (_,s)) : string = String.chop_prefix_exn ~prefix:"\"" s |> String.chop_suffix_exn ~suffix:"\"" (* quotation marks need to be removed *)
let evalBytes (AbsMichelson.Bt (_,b)) : bytes = Bytes.of_string b  (*TODO; do bytes really always start with 0x? / remove it? *)
let evalNeg (AbsMichelson.Neg (_,n)) : Z.t = Z.of_string n
let evalNat nat : Z.t = Z.of_int nat

(* invariants of addresses and other on-chain data *)
let evalAddress str : string =
(* TODO: addresses should be checked for their syntactical validity (length, prefix)
 Might also need to be represented in bytes instead of strings ( Base58Check )?
 Might also only be allowed if they are known in the given enironment data (of the wrapper).

 This implementation currently only validates the prefix of the address *)
  match (String.prefix str 3) with
  | "tz1" | "tz2"| "tz3" | "KT1" when String.length str - 3 >= 4 (*TODO correct length*) -> str
  | _ -> failwith "Interpreter.evalValue: Given string is not an Address"

let evalStrLength str (l : int) : string = (* eval other strings depending on their length invariant l *)
  (* TODO: strings should be checked for their syntactical validity (length, ?) depending on what they symbolize (i.e. cryptographic values)*)
  if ((String.length str) >= (*TODO: should be =*) l) then str else failwith "Interpreter.evalValue: given string does not match its supposed type"


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
  else if (n > List.length lst) then raise (Illegal_Instruction ("'n' greater then Stack size", AbsMichelson.PAIR_N (n)))
  else
    let (fst, snd) = List.split_n lst n in
    (f fst) :: snd

let rec unpair_n (n : int) (x : value (*IPair*)) : value list =
    (* not tail recursive *)
    if (n <= 1) then raise (Illegal_Instruction ("'n' needs to be higher then 1", AbsMichelson.UNPAIR_N (n)))
    else
      match x with
      | IPair(y, z) -> y :: (unpair_n (n-1) z)
      | x when n = 1 -> [x]
      | _ -> raise (Illegal_Instruction ("'n' not equal to size of right comb", AbsMichelson.UNPAIR_N (n)))

(* SLICE instr *)
let slice_str (offset : Z.t) (len : Z.t) (s : string) : value =
  (* String.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IOption (TString, Some(IString(String.sub s ~pos:(Z.to_int offset) ~len:(Z.to_int len))))
  with
  	| _ -> IOption(TString, None)
let slice_bytes (offset : Z.t) (len : Z.t) (b : bytes) : value =
  (* Bytes.sub implements the same rules regarding offset & len bounds but throws errors instead of returning an string option *)
  try
  	IOption (TBytes, Some(IBytes(Bytes.sub b ~pos:(Z.to_int offset) ~len:(Z.to_int len))))
  with
  	| _ -> IOption(TBytes, None)

(* MEM instr *)
let mem_set (v : value) (lst : value list) : value =
  let bool = List.mem lst v ~equal:equal_value in
  IBool(bool)
let mem_map (v : value) (lst : (value * value) list) : value =
  let bool = List.Assoc.mem lst ~equal:equal_value v in
  IBool(bool)
let mem_big_map (v : value) (lst : (value * value) list) : value = mem_map v lst

(* GET instr *)
let get_map (v : value) (lst : (value * value) list) : value =
  match List.Assoc.find lst ~equal:equal_value v with
  | None -> IOption(TUnit, None)
  | Some x -> IOption(typeof x, Some x)
let get_big_map (v : value) (lst : (value * value) list) : value = get_map v lst

let rec get_n (n : int) (p : value (*right comb*)) : value =
  match (n, p) with
  | (0, x) -> x
  | (1, IPair (x, _)) -> x
  | (x (*x>1*), IPair (_, p)) -> get_n (n-2) p
  | _ -> raise (Illegal_Instruction ("'n' greater then right comb.", AbsMichelson.GET_N (n)))


(* UPDATE instr *)
let update_set t lst (key : value) (b : bool) : value (*ISet*) =
  match b with
  | true -> ISet (t, List.dedup_and_sort (key :: lst) ~compare:Value.compare)
  | false -> ISet (t, List.filter lst ~f:(fun el -> not (equal_value key el)))
let update_map t lst (key : value) (o : value option) : value (*IMap*) =
  match o with
  | Some v  -> IMap (t, List.Assoc.add lst ~equal:equal_value key v)
(*| Some v  -> IMap (t, List.dedup_and_sort ((key, v) :: lst) ~compare:(fun (k, v) -> Value.compare key k) *)
  | None    -> IMap (t, List.Assoc.remove lst ~equal:equal_value key)
let update_big_map t lst (key : value) (o : value option) : value (*IBig_map*) =
  match o with
  | Some v  -> IBig_map (t, List.Assoc.add lst ~equal:equal_value key v)
  | None    -> IBig_map (t, List.Assoc.remove lst ~equal:equal_value key)

let rec update_n (n : int) (v : value) (p : value (*right comb*)) : value =
  (* not tail recursive! *)
  match (n, v, p) with
  | (0, v, _) -> v
  | (1, v, IPair (_, u)) -> IPair (v, u)
  | (n (*n>1*), v, IPair (u, p)) -> IPair (u, update_n (n-2) v p)
  | _ -> raise (Illegal_Instruction ("'n' greater then right comb.", AbsMichelson.UPDATE_N (n)))

let get_update_map (t0, t1) lst (key : value) (o : value option) : value list (*IMap*) =
  match o with
  | Some v  -> [
    IOption(t1, List.Assoc.find lst ~equal:equal_value key);
    IMap ((t0, t1), List.Assoc.add lst ~equal:equal_value key v)
    ]
  | None    -> [
    IOption(t1, List.Assoc.find lst ~equal:equal_value key);
    IMap ((t0, t1), List.Assoc.remove lst ~equal:equal_value key)
    ]
let get_update_big_map (t0, t1) lst (key : value) (o : value option) : value list (*IBig_map*) =
  match o with
  | Some v  -> [
    IOption(t1, List.Assoc.find lst ~equal:equal_value key);
    IBig_map ((t0, t1), List.Assoc.add lst ~equal:equal_value key v)
    ]
  | None    -> [
    IOption(t1, List.Assoc.find lst ~equal:equal_value key);
    IBig_map ((t0, t1), List.Assoc.remove lst ~equal:equal_value key)
    ]

(* CONCAT instrs *)
let concat_s_lst (lst : value list) : value (*ISTRING*) =
  let f = (fun v ->
    match v with
    | IString y -> y
    | _ -> failwith "Interpreter.concat_s_lst: This case should be impossible"
    )
  in
  IString(String.concat (List.map lst ~f:(f))) (* String.concat = '' if lst=[] *)
let concat_b_lst (lst : value list) : value (*IBytes*) =  (*TODO real bytes implementation *)
  let f = (fun v ->
    match v with
    | IBytes y -> y
    | _ -> failwith "Interpreter.concat_b_lst: This case should be impossible"
    )
  in
  match lst with
  | [] -> IBytes(Bytes.of_string "0x")
  | _ -> IBytes(Stdlib.Bytes.concat Stdlib.Bytes.empty (List.map lst ~f:(f)))

(* PACK / UNPACK instrs *)
let pack (v : value) : value (*Bytes*) =
  IBytes(Stdlib.Bytes.empty) (*TODO: serialization of values, also serialize the value, not Value.value *)
let unpack (ty : typ) (b : bytes) : value (*IOption*) =
  let deser = INat (Z.zero) (*TODO: deserialize bytes *)
  in
  (*FIXME: in general it should not be the type value that is serialized but its values*)
  if (equal_typ (typeof deser) ty) then IOption (ty, Some deser)
  else IOption (ty, None)

(* EDIV instr *)
let ediv_natnat x y : value =
  if (Z.equal y Z.zero) then  (* Z.ediv_rem raises Divison_by_zero if y = 0*)
    IOption(TPair (TNat, TNat), None)
  else
    let (fst, snd) = Z.ediv_rem x y in
    IOption(TPair (TNat, TNat), Some (IPair (INat fst, INat snd)))
let ediv_with_int x y : value =
  if (Z.equal y Z.zero) then
    IOption(TPair (TInt, TNat), None)
  else
    let (fst, snd) = Z.ediv_rem x y in
    IOption(TPair (TInt, TNat), Some (IPair (IInt fst, INat snd)))
let ediv_muteznat x y : value =
  match (Mutez.ediv x (Mutez.of_Zt y)) with
  | None -> IOption(TPair (TMutez, TMutez), None)
  | Some (fst, snd) -> IOption(TPair (TMutez, TMutez), Some (IPair (IMutez fst, IMutez snd)))
let ediv_mutezmutez x y : value =
  match (Mutez.ediv x y) with
  | None -> IOption(TPair (TNat, TMutez), None)
  | Some (fst, snd) -> IOption(TPair (TNat, TMutez), Some (IPair (INat (Mutez.to_Zt fst), IMutez snd)))

let contract ty s : value (*IOption*) =
  (* TODO for Environment-Wrapper: check if address exists, its type is KT1 or not and the parameter types match *)
  if (String.equal (String.prefix s 3) "KT1") then
    if passable ty then IOption(TContract ty, Some (IContract (ty, s)))
    else IOption(TContract ty, None)
  else (*if (String.equal (String.prefix s 2) "tz") then*)
    if equal_typ TUnit ty then IOption(TContract ty, Some (IContract (ty, s)))
    else IOption(TContract ty, None)

let create_address : string = "KT1aaaaaaaaaaaaaaa"(* TODO: use given contract data to generate an address *)
let create_implicit s : string = "tz1aaaaaaaaaaaaa" (* TODO: use key_hash to generate an address. Any funds deposited in this contract can immediately be spent by the holder of the private key*)

let rec solve_partial_apply vs x : value list =
  (* prepare initial stack of lambda for execution while appling previously partially applied values (APPLY instr) *)
  (* vs is in reversed order of the application of the "PUSH value, PAIR" instructions. I.e. the first value has to be applied first *)
  match vs with
  | [] -> [x]
  | v :: tl -> solve_partial_apply tl (IPair (v, x))
