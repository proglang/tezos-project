open Tezos_micheline
open Tezos_client_007_PsDELPH1
open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
open Tezos_error_monad.Error_monad
open Format
open List
open SyncAPIV1
open Tezos_ast
open Dao_script
open Dao_type
open Micheline_annotations

let get_entrypoints (progr : Michelson_v1_parser.parsed) =
  Api.list_entrypoints progr
  >>= function
  | Ok eps -> return eps
  | Error err -> failwith "%a" Api_error.pp_error err

let get_error_str errs =
  let f = (fun s err -> s ^ (asprintf "%a" pp err)) in
  List.fold_left f "" errs

(*  Renaming after adding completion -> eq, not cmp*)
let rec compare_type (ty1: (int, prim) Micheline.node) (ty2: Ast.ty) =
  match ty1 with
  | Prim (_, prim, nodes, _) ->
     begin
       match prim, ty2 with
       | T_address, `Address_t -> return_true
       | T_bool, `Bool_t -> return_true
       | T_bytes, `Bytes_t -> return_true
       | T_chain_id, `ChainID_t -> return_true
       | T_int, `Int_t -> return_true
       | T_key, `Key_t -> return_true
       | T_key_hash, `KeyHash_t  -> return_true
       | T_mutez, `Mutez_t -> return_true
       | T_nat, `Nat_t -> return_true
       | T_operation, `Operation_t -> return_true
       | T_signature, `Signature_t -> return_true
       | T_string, `String_t -> return_true
       | T_timestamp, `Timestamp_t -> return_true
       | T_unit, `Unit_t -> return_true
       | T_contract, `Contract_t t
         | T_list, `List_t t
         | T_option, `Option_t t
         | T_set, `Set_t t ->
          begin
            match nodes with
            | op_ty :: [] -> compare_type op_ty t
            | _ -> return_false (*failwith "Unexpected number of operands in Michelson AST"*)
          end
       | T_big_map, `BigMap_t (t1, t2)
         | T_lambda, `Lambda_t (t1, t2)
         | T_map, `Map_t (t1, t2)
         | T_or, `Or_t (t1, t2)
         | T_pair, `Pair_t (t1, t2) ->
          begin
            match nodes with
            | op1_ty :: op2_ty :: [] ->
               begin
                 compare_type op1_ty t1
                 >>=? fun eq_op1 ->
                 compare_type op2_ty t2
                 >>=? fun eq_op2 ->
                 return (eq_op1 && eq_op2)
               end
            | _ -> return_false (*failwith "Unexpected number of operands in Michelson AST"*)
          end
       | _ -> return_false (*failwith "Type mismatch"*)
     end
  | _ -> return_false (*failwith "Unexpected Micheline AST node"*)

let eq_type_pattern ep_pattern expr =
  let rec eq_type_pattern_rec ep_pattern (expr : (int, prim) Micheline.node)  =
    match expr with
    | Prim (_, prim, nodes, _) ->
       begin
         match prim, ep_pattern, nodes with
         | T_or, `Left p, op1_ty :: _ :: [] ->
            (* TODO: return completed type tree *)
            eq_type_pattern_rec p op1_ty
         | T_or, `Right p, _ :: op2_ty :: [] ->
            (* TODO: return completed type tree *)
            eq_type_pattern_rec p op2_ty
         | T_option, `None, _ :: [] ->
            (* TODO: return completed type tree *)
            return_true
         | T_option, `Some p, op_ty :: [] ->
            (* TODO: return completed type tree *)
            eq_type_pattern_rec p op_ty
         | T_pair, `Pair (p1, p2), op1_ty :: op2_ty :: [] ->
            begin
              eq_type_pattern_rec p1 op1_ty
              >>=? fun eq_op1 ->
              eq_type_pattern_rec p2 op2_ty
              >>=? fun eq_op2 ->
              (* TODO: return completed type tree *)
              return (eq_op1 && eq_op2)
            end
         | T_list, `Nil, _ ->
            (* TODO: return completed type tree *) return_true
         | T_list, `Cons (p1, p2), op_ty :: [] ->
            begin
              eq_type_pattern_rec p1 op_ty
              >>=? fun eq_op1 ->
              eq_type_pattern_rec p2 expr
              >>=? fun eq_op2 ->
              (* TODO: return completed type tree *)
              return (eq_op1 && eq_op2)
            end
         | _, `Ident (_, ty), _ ->
         (* TODO: return completed type tree *)
            compare_type expr ty
         | _, `Wildcard, _  ->
            (* TODO: complete type *)
            return_true
         | _  -> return_false
       end
    | _ -> failwith "Unexpected Tezos internal AST type"
  in
  let root = Micheline.root expr in
  eq_type_pattern_rec ep_pattern root

(* Checks whether the assertion type matches an entrypoint type of the contract
 * and returns the matching entrypoint if the assignment is unambiguous
 *)
let rec match_single entrypoints (ep_name, ep_pattern) matches =
  (* If >1 entrypoints match the assertion type, check if it can be matched
   * unambiguosly through the tags
   *)
  let rec get_unambiguous_ep ep_name = function
      (* No identical tags found; assertion cannot be unambigusouly assigned to an entrypoint *)
    | [] -> failwith "Ambiguous entry point: %s" ep_name
    | ((tag, _) as ep) :: eps ->
       if tag = ep_name then return_some ep
       else get_unambiguous_ep ep_name eps
  in
  match entrypoints with
  | (tag, expr) :: rest ->
     eq_type_pattern ep_pattern expr
     >>=? fun eq ->
     (* Collect all matching entrypoints in a list *)
     if eq then match_single rest (ep_name, ep_pattern) ((tag, expr) :: matches)
     else match_single rest (ep_name, ep_pattern) matches
  | [] ->
     begin
       match matches with
       (* No match was found *)
       | [] -> return_none
       (* Single and thus unambiguous match *)
       | m :: [] -> return_some m
       (* Several entrypoints match; check if tags resolve ambiguity *)
       | ms -> get_unambiguous_ep ep_name ms
     end

(* Maps entrypoints to their respective path within unions
 * (or (or (unit %A) (unit %B) (unit %C))
 * {%A -> (Left (Left T)); %B -> (Left (Right T)); %C -> (Right T)}
 *)
module EntrypointPaths = Map.Make(String)

(* Traverses the Micheline AST and adds tags for each possible entrypoint and
 * builds a mapping between tags and their respective paths within unions
 *)
let add_tags_and_build_paths
      ({source = src;
        expanded = exp;
        unexpanded = unexp;
        expansion_table = exp_tbl;
        unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed) =
  (* Use id numbers from 1..n as generated ep tags; maybe use something more random in the future to avoid collisions with original tags *)
  let n = ref 0 in
  let paths = ref EntrypointPaths.empty in
  let add_tag_annot annot =
    (* Default tag is automatically added by Tezos to the toplevel node; we don't have to add one too *)
    (* start the id counter *)
    if !n = 0 then (n := 1; annot)
    else
      match get_field_annot annot with
      | Some _ -> annot
      | None ->
         begin
           let tag = field_annot_of_string @@ string_of_int !n in
           n := !n + 1;
           tag :: annot
         end
  in
  (* Add generated tags to tagless entrypoints recursively *)
  let rec rec_add_tags (node : (int, prim) Micheline.node) : ((int, prim) Micheline.node) =
    match node with
    (* Prim (location, primitive, operator nodes, annotations) *)
    | (Prim (l, T_or, nodes, annot)) ->
       let new_annot = add_tag_annot annot in
       let new_nodes = List.map rec_add_tags nodes in
       (Prim (l, T_or, new_nodes, new_annot))
    (* Reached a non-union entrypoint - add tag and skip operators*)
    | (Prim (l, prim, nodes, annot)) ->
       let new_annot = add_tag_annot annot in
       (Prim (l, prim, nodes, new_annot))
    (* Type signatures should only contain primitives; we don't care about other node types *)
    | _ -> node
  in
  let rec find_and_edit_parameters (root : (int, prim) Micheline.node) : (int, prim) Micheline.node =
    (* Search the toplevel parameter node in the Tezos AST *)
    match root with
    (* The contract parameter type is tagged with the K_parameter primitive *)
    | Prim (l, K_parameter, node :: [], annot) ->
       (* Add missing ep tags *)
       let new_node = rec_add_tags node in
       (* Build the union paths for each entrypoint and create a mapping *)
       let path_bindings = Union_path.from_micheline new_node in
       List.iter
         (fun (tag, path) -> paths := EntrypointPaths.add tag path !paths)
         path_bindings;
       Prim (l, K_parameter, [new_node], annot)
    (* root = [parameters; storage; code ]; Represented in the Tezos AST with a Sequence node *)
    | Seq (l, nodes) ->
       let new_nodes = List.map find_and_edit_parameters nodes in
       Seq (l, new_nodes)
    | _ as node -> node
  in
  (* Transform the AST from the canonical representation to the editable non-canonical representation *)
  let root = Micheline.root exp in
  (* Add entrypoint tags and transform back to the canonical representation
   * Builds the union path mapping for each ep as a side-effect to avoid several traversals of the Michelin AST
   *)
  let new_expanded = Micheline.strip_locations @@
                       find_and_edit_parameters root
  in
  let new_parsed = ({source = src;
      expanded = new_expanded;
      unexpanded = unexp;
      expansion_table = exp_tbl;
      unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed) in
  return (new_parsed, !paths)

let get_script = function
  | DAO_File path -> Dao_file.get_script ~path
  | DAO_Chain address -> Dao_chain.get_script ~address
  | DAO_String s -> Dao_string.get_script s

let do_typecheck asts paths entrypoints =
  let update_unvisited tag path unvisited =
    if List.mem path unvisited then
      (* Remove ancestors & decendants *)
      return unvisited
    else
      failwith "Duplicate entrypoint: %s" tag
  in
  let do_typecheck_single unvisited ({entrypoint = (tag, pat); _}: Ast.ast) =
    match_single entrypoints (tag, pat) []
    >>=? function
    | Some (ep_tag, _) ->
       begin
         if ep_tag = "default" then
           begin
             (*
             let path = build_path_from_assertion_type pat in
             return @@ update_unvisited tag path unvisited
              *)
             return unvisited
           end
         else
           begin
             match EntrypointPaths.find_opt ep_tag paths with
             (* Update the list of unvisited paths *)
             | Some path -> update_unvisited tag path unvisited
             (* Should never happen, as we calculated the path for all eps *)
             | None -> failwith "Unexpected error: no union path for entrypoint found"
           end
       end
    | None -> failwith "Entrypoint type mismatch: %s" tag
  in
  let unvisited = List.map (fun (_, path) -> path)
                    @@ EntrypointPaths.bindings paths
  in
  fold_left_s do_typecheck_single unvisited asts

let type_check dao (asts : Ast.ast list) =
  begin
    get_script dao
    >>=? fun script ->
    add_tags_and_build_paths script
    >>=? fun (script, paths) ->
    EntrypointPaths.iter
      (fun tag up -> Printf.printf "%s: %s" tag (asprintf "%a" Union_path.pp up))
      paths;
    get_entrypoints script
    >>=? fun entrypoints ->
    do_typecheck asts paths entrypoints
    >>=? fun _ -> return_unit
  end
  >>= function
  | Ok () -> Lwt.return_unit
  | Error errs -> Lwt.fail_with @@ get_error_str errs
