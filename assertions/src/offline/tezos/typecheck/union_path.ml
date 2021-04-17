open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
open Micheline_annotations

type union_path = Left of union_path
                | Right of union_path
                | T

(* Defines a total order over paths, s.t. it can be used as a map key
 * Order is defined as T > LT > L...T > RT > R...T
 *)
let rec compare up1 up2 =
  match (up1, up2) with
  | T, T -> 0
  | Left x, Left y
    | Right x, Right y -> compare x y
  | Left _, Right _ -> 1
  | Right _, Left _ -> -1
  | T, _ -> 1
  | _, T -> -1

let eq up1 up2 = if (compare up1 up2) = 0 then true else false

let rec extend ext_path = function
  | T -> ext_path
  | Left l -> Left (extend ext_path l)
  | Right r -> Right (extend ext_path r)

let from_micheline node =
  let rec build_paths (node : (int, prim) Micheline.node) path paths =
    match node with
    (* Union node; build paths recursively for left and right *)
    | (Prim (_, T_or, l :: r :: [], annot)) ->
       begin
         build_paths l (extend (Left T) path) paths
         |> build_paths r (extend (Right T) path)
         |> (fun new_paths ->
         match get_field_annot annot with
         (* Add path of current node *)
         | Some tag -> (tag, path) :: new_paths
         | None -> ("default", path) :: new_paths) (* root node (default ep) likely has no tag *)
       end
    (* Reached a non-union entrypoint; add path and skip operators*)
    | (Prim (_, _, _, annot)) ->
       begin
         match get_field_annot annot with
         | Some tag -> (tag, path) :: paths
         | None -> ("default", path) :: paths
       end
    (* Type signatures should only contain primitives; we don't care about other node types*)
    | _ -> paths
  in
  build_paths node T []

let from_assertion_pattern pattern =
  let rec build_path path = function
    | `Wildcard
      | `Var _
      | `IdentPat _
      | `Pair _
      | `None
      | `Some _
      | `Cons _
      | `Nil -> path
    | `Left l -> build_path (extend (Left T) path) l
    | `Right r -> build_path (extend (Right T) path) r
  in
  build_path T pattern

let remove_prefixes ps p =
  let rec get_prefixes p path prefixes =
    match p with
    | T -> T :: prefixes
    | Left l ->
       let new_path = extend (Left T) path in
       new_path :: (get_prefixes l new_path prefixes)
    | Right r ->
       let new_path = extend (Right T) path in
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
