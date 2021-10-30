(*open Lexing
open AbsMichelson*)
open Base

type typ =
  | TOperation
  | TContract of typ
  | TList of typ
  | TSet of typ
  | TTicket of typ (* typ of comparable value *)
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
[@@deriving eq]
type union = L | R
[@@deriving eq]
type op =
  | Create_contract of string * value * value * value (* contract-code * key_hash * mutez * address *)
  | Transfer_tokens of typ * value * value (* 'p * mutez * contract 'p *)
  | Set_delegate of value (* key_hash *)
[@@deriving eq]
and value =
  | IOperation of op
  | IContract of typ * string (* parameter 'p * address *)
  | IList of typ * value list
  | ISet of typ * value list (* FIXME set with comparator witness for all ctypes?*)
  | ITicket of value * value * value (* comparable value * address  * nat *)
  | ILambda of (typ * typ) * AbsMichelson.instr list
  | IMap of (typ * typ) * (value * value) list (* FIXME use Map? comparator witness for each key ctyp?*)
  | IBig_map of (typ * typ) * (value * value) list
  | IBls_381_g1 of bytes (* FIXME types and operations on this values *)
  | IBls_381_g2 of bytes
  | IBls_381_fr of bytes
  | ISapling_transaction
  | ISapling_state
  | IChest of bytes * string (* TODO bytes * 'parameters to open it' *)
  | IChest_key of string (* TODO Key or Key_hash ? *)
  (* dual (comparable/not comparable) values *)
  | IOption of typ * value option
  | IPair of value * value
  | IOr of typ * union * value (* typ is the type of the other/unused union side *)
  (* comparable values *)
  | IUnit
  | INever
  | IBool of bool
  | IInt of Z.t
  | INat of Z.t
  | IString of string
  | IChain_id of string
  | IBytes of bytes (* FIXME: raw byte, fix byte instructions, de- and serialization? *)
  | IMutez of Mutez.t
  | IKey_hash of string
  | IKey of string
  | ISignature of string
  | ITimestamp of Z.t
  | IAddress of string
[@@deriving eq, show]

let rec typeof (v : value) =
  match v with
  | IOperation (op)           -> TOperation
  | IContract (ty, _)         -> TContract ty
  | IList (ty, _)             -> TList ty
  | ISet (ty, _)              -> TSet ty
  | ITicket (v, _, _)         -> TTicket (typeof(v))
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
  | IOption (ty, _)           -> TOption ty
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

let typ_of_lst (lst: value list) : typ list =
  List.map lst ~f:(fun x -> typeof(x))

(* Type class membership checker functions
   based on table at https://tezos.gitlab.io/michelson-reference/#types *)
(* FIXME: (e.g.) operation is not storable, but NIL operation (list of type operation) is to be stored at the end of the contract
 -> does that mean that some types are 'part' of a class as long as they are wrapped in a pair/list/... ?
 https://tezos.gitlab.io/michelson-reference/#type-operation *)
let rec comparable (t : typ (* comparable typ *)) : bool =
  match t with
  | TOption ty -> comparable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> comparable ty0 && comparable ty
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
let rec duplicable (t : typ) : bool =
  match t with
  (* all types except ticket are duplicable *)
  | TOperation -> true
  | TContract ty
  | TList ty
  | TSet ty -> duplicable ty
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
  | TOption ty -> duplicable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> duplicable ty0 && duplicable ty
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
  | TContract ty
  | TList ty
  | TSet ty -> packable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> packable ty0 && packable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption ty -> packable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> packable ty0 && packable ty
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
  | TList ty
  | TSet ty -> pushable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> pushable ty0 && pushable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption ty -> pushable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> pushable ty0 && pushable ty
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
  | TTicket ty
  | TList ty
  | TSet ty -> storable ty
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
  | TOption ty -> storable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> storable ty0 && storable ty
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
  | TContract ty
  | TList ty
  | TSet ty -> passable ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> passable ty0 && passable ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption ty -> passable ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> passable ty0 && passable ty
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
  | TTicket ty
  | TList ty
  | TSet ty -> big_map_domain ty
  | TLambda (ty0, ty)
  | TMap (ty0, ty) -> big_map_domain ty0 && big_map_domain ty
  | TBls_381_g1
  | TBls_381_g2
  | TBls_381_fr
  | TSapling_transaction
  | TChest
  | TChest_key -> true
  | TOption ty -> big_map_domain ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> big_map_domain ty0 && big_map_domain ty
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
  comparable t0 && comparable t


