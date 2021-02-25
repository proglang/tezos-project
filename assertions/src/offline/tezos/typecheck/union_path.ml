open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
open Micheline_annotations

type union_path = Left of union_path
                | Right of union_path
                | T

(* val from_assertion_type : Ast.pattern -> union_path *)

let rec eq up1 up2 =
  match (up1, up2) with
  | T, T -> true
  | Left l_up1, Left l_up2 -> eq l_up1 l_up2
  | Right r_up1, Right r_up2 -> eq r_up1 r_up2
  | _ -> false

let rec add lvl = function
  | T -> lvl
  | Left l -> Left (add lvl l)
  | Right r -> Right (add lvl r)

(* Traverses the parameter tree and builds a map which stores the path of the entrypoint within possibly nested unions *)
let from_micheline node =
  let rec build_paths (node : (int, prim) Micheline.node) path paths =
    match node with
    (* Union node; build paths recursively for left and right *)
    | (Prim (_, T_or, l :: r :: [], annot)) ->
       begin
         build_paths l (add (Left T) path) paths
         |> build_paths r (add (Right T) path)
         |> (fun new_paths ->
         match get_field_annot annot with
         | Some tag -> (tag, path) :: new_paths
         | None -> (field_annot_of_string "default", path) :: new_paths) (* Toplevel node likely has no annotation *)
       end
    (* Reached a non-union entrypoint; add path and skip operators*)
    | (Prim (_, _, _, annot)) ->
       begin
         match get_field_annot annot with
         | Some tag -> (tag, path) :: paths
         (* Should never happen, as we added tags everywhere before *)
         | None -> (field_annot_of_string "default", path) :: paths
       end
    (* Type signatures should only contain primitives; we don't care about other node types*)
    | _ -> paths
  in
  build_paths node T []

let rec pp ppf = function
  | T -> ()
  | Left l -> Fmt.pf ppf "L"; pp ppf l
  | Right r -> Fmt.pf ppf "R"; pp ppf r
