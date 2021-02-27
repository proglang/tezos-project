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
         | None -> ("default", path) :: new_paths) (* Toplevel node likely has no annotation *)
       end
    (* Reached a non-union entrypoint; add path and skip operators*)
    | (Prim (_, _, _, annot)) ->
       begin
         match get_field_annot annot with
         | Some tag -> (tag, path) :: paths
         (* Should never happen, as we added tags everywhere before *)
         | None -> ("default", path) :: paths
       end
    (* Type signatures should only contain primitives; we don't care about other node types*)
    | _ -> paths
  in
  build_paths node T []

let from_assertion_pattern pattern =
  let rec build_path path = function
    | `Wildcard
      | `Ident _
      | `Pair _
      | `None
      | `Some _
      | `Cons _
      | `Nil -> path
    | `Left l -> build_path (add (Left T) path) l
    | `Right r -> build_path (add (Right T) path) r
  in
  build_path T pattern

(* Removed all prefixes of the given path from the list of paths
 * Also considers the path itself as a prefix
 *)
let remove_prefixes ps p =
  let rec get_prefixes p path prefixes =
    match p with
    | T -> T :: prefixes
    | Left l ->
       let new_path = add (Left T) path in
       new_path :: (get_prefixes l new_path prefixes)
    | Right r ->
       let new_path = add (Right T) path in
       new_path :: (get_prefixes r new_path prefixes)
  in
  let prefixes = get_prefixes p T [] in
  List.filter (fun e -> if List.mem e prefixes then false else true) ps

let remove_with_prefix ps p =
  let rec is_prefix path prefix =
    match path, prefix with
    | T, T -> true
    | Left _, Right _ -> false
    | Right _ , Left _ -> false
    | Left l1, Left l2 -> is_prefix l1 l2
    | Right r1, Right r2 -> is_prefix r1 r2
    | T, _ -> false
    | _, T -> true
  in
  List.filter (fun e -> if is_prefix e p then false else true) ps

let rec pp ppf = function
  | T -> Fmt.pf ppf "T"
  | Left l -> Fmt.pf ppf "L"; pp ppf l
  | Right r -> Fmt.pf ppf "R"; pp ppf r
