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

(*  Renaming after adding completion -> eq, not cmp*)
let compare_type_pattern ep_pattern expr =
  let rec cmp_type_pattern_rec ep_pattern (expr : (int, prim) Micheline.node)  =
    match expr with
    | Prim (_, prim, nodes, _) ->
       begin
         match prim, ep_pattern, nodes with
         | T_or, `Left p, op1_ty :: _ :: [] ->
            (* TODO: return completed type tree *)
            cmp_type_pattern_rec p op1_ty
         | T_or, `Right p, _ :: op2_ty :: [] ->
            (* TODO: return completed type tree *)
            cmp_type_pattern_rec p op2_ty
         | T_option, `None, _ :: [] ->
            (* TODO: return completed type tree *)
            return_true
         | T_option, `Some p, op_ty :: [] ->
            (* TODO: return completed type tree *)
            cmp_type_pattern_rec p op_ty
         | T_pair, `Pair (p1, p2), op1_ty :: op2_ty :: [] ->
            begin
              cmp_type_pattern_rec p1 op1_ty
              >>=? fun eq_op1 ->
              cmp_type_pattern_rec p2 op2_ty
              >>=? fun eq_op2 ->
              (* TODO: return completed type tree *)
              return (eq_op1 && eq_op2)
            end
         | T_list, `Nil, _ ->
            (* TODO: return completed type tree *) return_true
         | T_list, `Cons (p1, p2), op_ty :: [] ->
            begin
              cmp_type_pattern_rec p1 op_ty
              >>=? fun eq_op1 ->
              cmp_type_pattern_rec p2 expr
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
  cmp_type_pattern_rec ep_pattern root

let rec match_single entrypoints (ep_name, ep_pattern) matches =
  let rec get_unambiguous_ep ep_name = function
    | [] -> failwith "Ambiguous entry point: %s" ep_name
    | ((tag, _) as ep) :: eps ->
       if tag = ep_name then return_some ep
       else get_unambiguous_ep ep_name eps
  in
  match entrypoints with
  | (tag, expr) :: rest ->
     compare_type_pattern ep_pattern expr
     >>=? fun res ->
     if res then match_single rest (ep_name, ep_pattern) ((tag, expr) :: matches)
     else match_single rest (ep_name, ep_pattern) matches
  | [] ->
     begin
       match matches with
       | [] -> return_none
       | m :: [] -> return_some m
       | ms -> get_unambiguous_ep ep_name ms
     end

let add_missing_tags
      ({source = src; expanded = exp; unexpanded = unexp; expansion_table = exp_tbl; unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed) =
  (* Use id numbers from 1..n as generated ep tags; maybe use something more random in the future to avoid collisions with original tags *)
  let n = ref 1 in
  let rec add_tags (exprs : (int, prim) Micheline.node list) : (int, prim) Micheline.node list =
    match exprs with
    (* Prim (location, primitive, operator nodes, annotations) *)
    | (Prim (l, T_or, nodes, [])) :: rest ->
       if !n = 1 then
         (* Default tag is automatically added by Tezos to the toplevel node; we don't have to add one too*)
         (Prim (l, T_or, nodes, [])) :: (add_tags rest)
       else
         (* Add field annotation with generated entrypoint tag*)
         let tag = "%" ^ string_of_int !n in
         n := !n + 1;
         (* Recursively add tags to all entrypoints within the union *)
         let new_nodes = add_tags nodes in
         (Prim (l, T_or, new_nodes, [tag])) :: (add_tags rest)
    (* Skip Or nodes which already have an annotation *)
    | (Prim (l, T_or, nodes, annot)) :: rest ->
       let new_nodes = add_tags nodes in
       (Prim (l, T_or, new_nodes, annot)) :: (add_tags rest)
    (* Reached a non-union entrypoint - add tag and skip operators*)
    | (Prim (l, prim, nodes, [])) :: rest ->
       let tag = "%" ^ string_of_int !n in
       n := !n + 1;
       (Prim (l, prim, nodes, [tag])) :: (add_tags rest)
    (* Type signatures should only contain primitives; we don't care about other node types*)
    | (_ as node) :: rest -> node :: (add_tags rest)
    | [] -> []
  in
  (* TODO: find more accurate name *)
  let rec find_parameters (root : (int, prim) Micheline.node) : (int, prim) Micheline.node =
    (* Search the toplevel parameter node in the Tezos AST *)
    match root with
    (* The contract parameter type is tagged with the K_parameter primitive *)
    | Prim (l, K_parameter, nodes, annot) ->
       let new_nodes = add_tags nodes in
       Prim (l, K_parameter, new_nodes, annot)
    | Prim (l, prim, nodes, annot) ->
       let new_nodes = List.map (fun node -> find_parameters node) nodes in
       Prim (l, prim, new_nodes, annot)
    (* root = [parameters; storage; code ]; Represented in the Tezos AST with a Sequence node *)
    | Seq (l, nodes) ->
       let new_nodes = List.map (fun node -> find_parameters node) nodes in
       Seq (l, new_nodes)
    | _ as node -> node
  in
  (* Transform the AST from the canonical representation to the editable non-canonical representation *)
  let root = Micheline.root exp in
  (* Add entrypoint tags and transform back to the canonical representation *)
  let new_expanded = Micheline.strip_locations @@ find_parameters root in
  return
    ({source = src;
      expanded = new_expanded;
      unexpanded = unexp;
      expansion_table = exp_tbl;
      unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed)

let get_script = function
  | DAO_File path -> Dao_file.get_script ~path
  | DAO_Chain address -> Dao_chain.get_script ~address
  | DAO_String s -> Dao_string.get_script s

let type_check dao (asts : Ast.ast list)  =
  let f eps ({entrypoint = (tag, pat); _}: Ast.ast) =
    match_single eps (tag, pat) []
    >>=? function
    | Some (ep_tag, _) ->
      return @@ List.filter (fun (t, _ ) -> if t = "default" then true else if t = ep_tag then false else true) eps
    | None -> failwith "Entrypoint type mismatch: %s" tag
  in
  begin
    get_script dao
    >>=? fun script ->
    add_missing_tags script
    >>=? fun script ->
    get_entrypoints script
    >>=? fun entrypoints ->
    fold_left_s f entrypoints asts
    >>=? fun _ -> return_unit
  end
  >>= function
  | Ok () -> Lwt.return_unit
  | Error errs -> Lwt.fail_with @@ get_error_str errs
