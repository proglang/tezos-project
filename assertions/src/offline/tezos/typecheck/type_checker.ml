open Tezos_micheline
open Tezos_client_007_PsDELPH1
open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
open Tezos_error_monad.Error_monad
open Format
open List
open SyncAPIV0_context
open Tezos_ast
open Dao_script
open Dao_type

let ctxt =
  let rpc_config : RPC_client_unix.config = {
      RPC_client_unix.default_config with
      host = "127.0.0.1";
      port = 8732;
      tls = false;
    }
  in
  new Protocol_client_context.wrap_full (
      new unix_full_silent
        ~chain:Client_config.default_chain
        ~block:Client_config.default_block
        ~confirmations:None
        ~password_filename:None
        ~base_dir:"/home/bernhard/.tezos-client"
        ~rpc_config:rpc_config)


let get_entrypoints (progr : Michelson_v1_parser.parsed) =
  Michelson_v1_entrypoints.list_entrypoints
    ctxt
    ~chain:Client_config.default_chain
    ~block:Client_config.default_block
    progr.expanded

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

let rec type_check_single entrypoints (ep_name, ep_pattern) matches =
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
     if res then type_check_single rest (ep_name, ep_pattern) ((tag, expr) :: matches)
     else type_check_single rest (ep_name, ep_pattern) matches
  | [] ->
     begin
       match matches with
       | [] -> return_none
       | m :: [] -> return_some m
       | ms ->
          begin
            match ep_name with
            | Some name -> get_unambiguous_ep name ms
            | None -> get_unambiguous_ep "default" ms
          end
     end

let add_missing_tags
      ({source = src; expanded = exp; unexpanded = unexp; expansion_table = exp_tbl; unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed) =
  let n = ref 1 in
  let rec add_tags (exprs : (int, prim) Micheline.node list) : (int, prim) Micheline.node list =
    match exprs with
    | (Prim (l, T_or, nodes, annot)) :: rest ->
       let new_nodes = add_tags nodes in
       (Prim (l, T_or, new_nodes, annot)) :: (add_tags rest)
    | (Prim (l, prim, nodes, [])) :: rest ->
       let tag = "%" ^ string_of_int !n in
       n := !n + 1;
       (Prim (l, prim, nodes, [tag])) :: (add_tags rest)
    | (_ as node) :: rest -> node :: (add_tags rest)
    | [] -> []
  in
  let rec find_parameters (expr : (int, prim) Micheline.node) : (int, prim) Micheline.node =
    match expr with
    | Prim (l, K_parameter, nodes, annot) ->
       let new_nodes = add_tags nodes in
       Prim (l, K_parameter, new_nodes, annot)
    | Prim (l, prim, nodes, annot) ->
       let new_nodes = List.map (fun node -> find_parameters node) nodes in
       Prim (l, prim, new_nodes, annot)
    | Seq (l, nodes) ->
       let new_nodes = List.map (fun node -> find_parameters node) nodes in
       Seq (l, new_nodes)
    | _ as node -> node
  in
  let root = Micheline.root exp in
  let new_expanded = Micheline.strip_locations @@ find_parameters root in
  return
  ({source = src; expanded = new_expanded; unexpanded = unexp; expansion_table = exp_tbl; unexpansion_table = unexp_tbl} : Michelson_v1_parser.parsed)

let get_script = function
  | DAO_File path -> Dao_file.get_script ~path
  | DAO_Chain _ -> failwith "Not supported"
  | DAO_String s -> Dao_string.get_script s

let type_check dao (asts : Ast.ast list)  =
  let f eps ({entrypoint = (tag, pat); _}: Ast.ast) =
    type_check_single eps (tag, pat) []
    >>=? function
    | Some (ep_tag, _) -> return @@ List.filter (fun (t, _ ) -> if t = "default" then true else if t = ep_tag then false else true) eps
    | None ->
      begin
        match tag with
        | Some t -> failwith "Entrypoint type mismatch: %s" t
        | None -> failwith "Entrypoint type mismatch: default"
      end
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
