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
open Entrypoint_mapping

module Entrypoint_mapping = Entrypoint_mapping

(* Wraps a user defined pretty printer in the standard error message *)
let err_fmt : ('a -> 'b -> 'c, formatter, unit, 'd tzresult Lwt.t) format4 =
  "Entrypoint type checking failed.@.---@.%a@."
(* Wraps a specific message and a user defined pretty printer in the standard error message *)
let err_fmt_2 : ('a -> 'b -> 'c, formatter, unit, 'd tzresult Lwt.t) format4 =
  "Entrypoint type checking failed.@.---@.%s@.%a@."
(* Appends a specific message to the standard error message *)
let err_msg : ('a, formatter, unit, 'b tzresult Lwt.t) format4  =
  "Entrypoint type checking failed.@.---@.%s@."

(* Calls API to get entrypoints of a program and wraps result to tzresult monad *)
let get_entrypoints (progr : Michelson_v1_parser.parsed) =
  Api.list_entrypoints progr
  >>= function
  | Ok eps -> return eps
  | Error err -> failwith err_fmt Api_error.pp_error err

(* Build an error string from an error trace *)
let get_error_str errs =
  let f = (fun s err -> s ^ (asprintf "%a" pp err)) in
  List.fold_left f "" errs

(* Checks if the given type annotations are equivalent *)
let rec eq_type (ty1: (int, prim) Micheline.node) (ty2: Ast.ty) =
  match ty1 with
  | Prim (_, prim, operands, _) ->
     begin
       match prim, ty2 with
       | T_address, `Address_t -> return_true
       | T_bool, `Bool_t -> return_true
       | T_bytes, `Bytes_t -> return_true
       | T_chain_id, `ChainID_t -> return_true
       | T_int, `Int_t -> return_true
       | T_key, `Key_t -> return_true
       | T_key_hash, `KeyHash_t  -> return_true
       | T_mutez, `Fmu_t -> return_true
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
            match operands with
            | op_ty :: [] -> eq_type op_ty t
            | _ ->
               (* Should never happen, as these types expect exactly one subtype *)
               (* failwith "Unexpected number of operands in Michelson AST"*)
               return_false
          end
       | T_big_map, `BigMap_t (t1, t2)
         | T_lambda, `Lambda_t (t1, t2)
         | T_map, `Map_t (t1, t2)
         | T_or, `Or_t (t1, t2)
         | T_pair, `Pair_t (t1, t2) ->
          begin
            match operands with
            | op1_ty :: op2_ty :: [] ->
               begin
                 eq_type op1_ty t1
                 >>=? fun eq_op1 ->
                 eq_type op2_ty t2
                 >>=? fun eq_op2 ->
                 return (eq_op1 && eq_op2)
               end
            | _ ->
               (* Should never happen, as these types expect exactly two subtype *)
               (*failwith "Unexpected number of operands in Michelson AST"*)
               return_false
          end
       (* Type notations do not match *)
       | _ -> return_false
     end
  (* Should never happen, as parameter node should only contain nodes of primitives *)
  (*failwith "Unexpected Micheline AST node"*)
  | _ -> return_false

(* Checks if the given pattern is equivalent to the Michelson type *)
let eq_type_pattern ep_pattern expr =
  let rec eq_type_pattern_rec ep_pattern (expr : (int, prim) Micheline.node)  =
    match expr with
    | Prim (_, prim, operands, _) ->
       begin
         match prim, ep_pattern, operands with
         | T_or, `Left p, op1_ty :: _ :: [] ->
            eq_type_pattern_rec p op1_ty
         | T_or, `Right p, _ :: op2_ty :: [] ->
            eq_type_pattern_rec p op2_ty
         | T_option, `None, _ :: [] ->
            return_true
         | T_option, `Some p, op_ty :: [] ->
            eq_type_pattern_rec p op_ty
         | T_pair, `Pair (p1, p2), op1_ty :: op2_ty :: [] ->
            begin
              eq_type_pattern_rec p1 op1_ty
              >>=? fun eq_op1 ->
              eq_type_pattern_rec p2 op2_ty
              >>=? fun eq_op2 ->
              return (eq_op1 && eq_op2)
            end
         | T_list, `Nil, _ -> return_true
         | T_list, `Cons (p1, p2), op_ty :: [] ->
            begin
              eq_type_pattern_rec p1 op_ty
              >>=? fun eq_op1 ->
              eq_type_pattern_rec p2 expr
              >>=? fun eq_op2 ->
              return (eq_op1 && eq_op2)
            end
         | _, `Var (_, ty), _ ->
            eq_type expr ty
         | _, `IdentPat _, _ -> return_true
         | _, `Wildcard, _  -> return_true
         | _  -> return_false
       end
    | _ ->
       (* Parameter nodes only contain primitives; this should never happen *)
       failwith err_msg "Unexpected Tezos internal AST type"
  in
  (* Get node in canonical form (which makes it traversable) *)
  let root = Micheline.root expr in
  eq_type_pattern_rec ep_pattern root

(* Checks whether the assertion type matches an entrypoint type of the contract
 * and returns the matching contract entrypoint if the assignment is unambiguous
   a_tag denotes the name tag of an assertion entrypoint
   ep_tag denotes the name tag of a contract entrypoint
*)
let rec match_single entrypoints (a_tag, a_pattern) matches =
  (* If >1 contract entrypoints match the assertion type, check if it can be matched
   * unambiguosly by identical tags *)
  let rec get_unambiguous_ep = function
      (* No identical tags found; assertion cannot be unambigusouly assigned to an entrypoint *)
    | [] -> failwith err_fmt_2 "Ambiguous entry point:" Pp_ast.pp_ast_entrypoint (a_tag, a_pattern)
    | (ep_tag, _) :: eps ->
       if ep_tag = a_tag then return_some ep_tag
       else get_unambiguous_ep eps
  in
  (* Extract the contract default entrypoint from the list of its entrypoints *)
  let rec get_default_ep = function
    | (ep_tag, _) as ep :: eps -> if ep_tag = "default" then return ep else get_default_ep eps
    (* Should never happen, as there always is a default entrypoint *)
    | [] -> failwith err_msg "Unexpected error: default entrypoint not found"
  in
  (* Assertion eps without an explicit tag are only matched against the contract default entrypoint *)
  if a_tag = "default"
  then
    get_default_ep entrypoints
    >>=? fun (ep_tag, expr) ->
    eq_type_pattern a_pattern expr
    >>=? fun eq ->
    if eq then return_some ep_tag else return_none
  else
    (* Match against all contract entrypoints *)
    begin
      match entrypoints with
      | (ep_tag, expr) :: rest ->
         eq_type_pattern a_pattern expr
         >>=? fun eq ->
         (* Collect all entrypoint with matching type in a list *)
         if eq then match_single rest (a_tag, a_pattern) ((ep_tag, expr) :: matches)
         else match_single rest (a_tag, a_pattern) matches
      | [] ->
         (* Check if assertion can be assigned unambiguously to a match *)
         begin
           match matches with
           (* No match was found *)
           | [] -> return_none
           (* Single and thus unambiguous match *)
           | (ep_tag, _) :: [] -> return_some ep_tag
           (* Several entrypoints match; check if tags resolve ambiguity *)
           | eps -> get_unambiguous_ep eps
         end
    end

(* Maps contract entrypoints to their respective path within unions
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
  (* Use unique id numbers from 1..n as generated ep tags; maybe use something more random in the future
     to avoid collisions with original tags *)
  let n = ref 0 in
  let paths = ref EntrypointPaths.empty in
  (* Adds a generated field tag to the annotation list *)
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
  (* Search the toplevel parameter node in the Tezos AST and modify its nodes by adding entrypoint tags *)
  let rec find_and_edit_parameters (root : (int, prim) Micheline.node) : (int, prim) Micheline.node =
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

(* Tries to find an unambiguous mapping between all assertion entrypoints and the contract entrypoints
   by doing type checks and comparing tags *)
let do_typecheck asts paths entrypoints =
  (* Checks if path has been visited before; updates list of unvisited by removing path, all its descendants
     and ancestors to prohibit overlapping assertions entrypoints *)
  let visit_path (tag, pat) path unvisited =
    if List.mem path unvisited then
      (* Path not yet visited *)
      let wo_prefixes = Union_path.remove_prefixes unvisited path in
      return @@ Union_path.remove_with_prefix wo_prefixes path
    else
      (* Path has been visited before; assertion entrypoint is a duplicate or overlaps with another one *)
      failwith err_fmt_2 "Duplicate or overlapping entrypoint:" Pp_ast.pp_ast_entrypoint (tag, pat)
  in
  (* Matches the assertion entrypoint against all contract entrypoints and checks, whether it can find an
     unambiguous match; If a match has been found, update the mapping and update the list of visited paths *)
  let do_typecheck_single (unvisited, ep_mapping) (({entrypoint = (a_tag, pattern); _}: Ast.ast) as ast) =
    match_single entrypoints (a_tag, pattern) []
    >>=? function
    (* Unambiguous match found *)
    | Some ep_tag ->
       begin
         (* Assertion matches default entrypoint; derive the path of the specific entrypoint from the type pattern *)
         if a_tag = "default" then
           begin
             (* Tech debt: this causes problems when the default entrypoint is not the root of the parameter type *)
             let path = Union_path.from_assertion_pattern pattern in
             (* Check if path has already been covered by another assertion and update list of unvisited paths if not *)
             visit_path (a_tag, pattern) path unvisited
             >>=? fun new_unvisited ->
             return (new_unvisited, EntrypointAssertionMapping.add path ast ep_mapping)
           end
         else
           (* Here we already have the paths of all specific entrypoints stored and just have to look them up *)
           begin
             match EntrypointPaths.find_opt ep_tag paths with
             (* Update the list of unvisited paths *)
             | Some path ->
                (* Check if path has already been covered by another assertion and update list of unvisited paths if not *)
                visit_path (a_tag, pattern) path unvisited
                >>=? fun new_unvisited ->
                return (new_unvisited, EntrypointAssertionMapping.add path ast ep_mapping)
             (* Should never happen, as we built the path for all eps *)
             | None -> failwith err_msg (Fmt.str "Unexpected error: no union path for entrypoint %s found" ep_tag)
           end
       end
    (* No match *)
    | None -> failwith err_fmt_2 "Entrypoint type mismatch:" Pp_ast.pp_ast_entrypoint (a_tag, pattern)
  in
  (* Contains all entrypoint paths *)
  let unvisited = List.map (fun (_, path) -> path)
                    @@ EntrypointPaths.bindings paths
  in
  (* Execute type check for all assertion entrypoints while updating the list of unvisited paths and the mapping *)
  fold_left_s do_typecheck_single (unvisited, EntrypointAssertionMapping.empty) asts

let type_check dao (asts : Ast.ast list) =
  begin
    (* Retrieves the contract code to match against *)
    get_script dao
    >>=? fun script ->
    (* Adds tags to all possible entrypoints and remembers their paths within the (nested) unions *)
    add_tags_and_build_paths script
    >>=? fun (script, paths) ->
    (* Get the list of all contract entrypoints with their tags *)
    get_entrypoints script
    >>=? fun entrypoints ->
    (* Check if every assertion entrypoint can be matched unambiguously to a contract entrypoint *)
    do_typecheck asts paths entrypoints
    >>=? fun (_, mapping) -> return mapping
  end
  >>= function
  | Ok res -> Lwt.return res
  | Error errs -> Lwt.fail_with @@ get_error_str errs
