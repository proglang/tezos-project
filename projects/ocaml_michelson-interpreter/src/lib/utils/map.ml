



(*include Map
open Value

(* First try of a function that returns comparators/the modules for comparable types (needed for Sets and Maps) *)
let rec comparator_map (t : typ) =
  else match v with
  | TOption ty -> comparator ty
  | TOr (ty0, ty)
  | TPair (ty0, ty) -> (compartor ty0, comparator ty)
  | TUnit
  | TNever
  | TBool
  | TInt -> Map.comparator_s (Map.empty (module Z.t))
  | TNat -> Map.comparator_s (Map.empty (module Z.t))
  | TString -> Map.comparator_s (Map.empty (module String))
  | TChain_id
  | TBytes -> Map.comparator_s (Map.empty (module Bytes))
  | TMutez -> Map.comparator_s (Map.empty (module Z.t))
  | TKey_hash
  | TKey
  | TSignature
  | TTimestamp
  | TAddress
  | _ -> failwith "comparator casted for not comparable type"*)

