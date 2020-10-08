open Client_keys
open Tezos_client_006_PsCARTHA
open Tezos_client_006_PsCARTHA.Protocol_client_context
open Tezos_client_006_PsCARTHA.Injection
open Tezos_client_006_PsCARTHA.Client_proto_contracts
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_raw_protocol_006_PsCARTHA
open Tezos_protocol_environment_006_PsCARTHA
open Apply_results
open SyncAPIV0_error
open SyncAPIV0_context
open Format
open Base
open Int64

type puk = Signature.public_key
type pukh = Signature.public_key_hash
type contract = Contract.t
type oph = Operation_hash.t
type blockh = Block_hash.t

module Tez_t : sig
  type t = Tez.t
  val tez : float -> t
  val zero : t
  val to_float : Tez.t -> float
end = struct
  type t = Tez.t
  let conversion_factor = 1000000.0
  let tez f =
    let mutez = Int64.of_float( f *. conversion_factor ) in
    if (mutez <= Int64.zero) then failwith ("Invalid value - must be at least 1 mutez");
    match Tez.( *? ) Tez.one_mutez mutez with
    | Ok tz -> tz
    | _ -> failwith "Illegal Tez value"
  let zero = Tez.zero
  let to_float tz =
    let mutez_f = Int64.to_float @@ Tez.to_mutez tz in
    (mutez_f /. conversion_factor)
end

type op_result = {
    block_hash : blockh;
    rpc_position : (int * int);
    balance_updates : Delegate.balance_updates;
    consumed_gas : int;
    storage : Script.expr option;
    originated_contracts : contract list;
    storage_size : int;
    paid_storage_size_diff : int ;
    big_map_diff : Contract.big_map_diff option;
    allocated_destination_contract : bool
  }

type reason = Timeout
            | Skipped
            | Backtracked
            | Reason of rejection_message
            | Unknown_reason of string

type status = Still_pending
            | Accepted of op_result
            | Rejected of reason
            | Unprocessed
            | Missing

type config = {
    port : int ref;
    basedir : string ref;
    debug_mode : bool ref
  }

type fee_config = {
    minimal_fees : Tez.t ref;
    minimal_nanotez_per_byte : counter ref;
    minimal_nanotez_per_gas_unit : counter ref;
    force_low_fee : bool ref;
    fee_cap : Tez.t ref;
    burn_cap : Tez.t ref
  }

let current_config = {
    port = ref 8732;
    basedir = ref "/home/tezos/.tezos-client";
    debug_mode = ref false
  }

let current_fee_config = {
    minimal_fees = ref (match Tez.of_mutez 100L with None -> assert false | Some t -> t);
    minimal_nanotez_per_byte = ref @@ Z.of_int 1000;
    minimal_nanotez_per_gas_unit = ref @@ Z.of_int 100;
    force_low_fee = ref false;
    fee_cap = ref (match Tez.of_string "1.0" with None -> assert false | Some t -> t);
    burn_cap = ref (match Tez.of_string "0" with None -> assert false | Some t -> t);
  }

let make_context () =
  let rpc_config : RPC_client_unix.config = {
      RPC_client_unix.default_config with
      host = "127.0.0.1";
      port = !(current_config.port);
      tls = false;
    }
  in
  new unix_full_silent
    ~chain:Client_config.default_chain
    ~block:Client_config.default_block
    ~confirmations:None
    ~password_filename:None
    ~base_dir: !(current_config.basedir)
    ~rpc_config:rpc_config

let ctxt = ref (make_context ())
let catch_error_f err = if !(current_config.debug_mode) then catch_trace err
                        else catch_last_error err

let make_fee_parameter () =
  let fp : fee_parameter = {
    minimal_fees = !(current_fee_config.minimal_fees);
    minimal_nanotez_per_byte = !(current_fee_config.minimal_nanotez_per_byte);
    minimal_nanotez_per_gas_unit = !(current_fee_config.minimal_nanotez_per_gas_unit);
    force_low_fee = !(current_fee_config.force_low_fee);
    fee_cap = !(current_fee_config.fee_cap);
    burn_cap = !(current_fee_config.burn_cap);
    }
  in
  fp

let fee_parameter = ref (make_fee_parameter ())

let exception_handler =
  (function
  | Failure msg ->
     Lwt.return_error [(Exn (Failure msg))]
  | exn ->
     Lwt.return @@ error_exn exn )

let get_puk_from_alias name =
  Public_key_hash.find !ctxt name
  >>= function
  | Ok pkh -> (
     Client_keys.get_key !ctxt pkh
     >>= function
     | Ok (_, src_pk, _) -> Answer.return src_pk
     | Error err -> catch_error_f err )
  | Error err -> catch_error_f err

let get_puk_from_hash pk_hash =
  Public_key_hash.of_source pk_hash
  >>= function
  | Ok pkh -> (
    Client_keys.get_key !ctxt pkh
    >>= function
    | Ok (_, src_pk, _) -> Answer.return src_pk
    | Error err -> catch_error_f err)
  | Error err -> catch_error_f err

let get_pukh_from_alias name =
  Public_key_hash.find !ctxt name
  >>= function
  | Ok pkh -> Answer.return pkh
  | Error err -> catch_error_f err

let get_pukh_from_hash pk_hash =
  Public_key_hash.of_source pk_hash
  >>= function
  | Ok pkh -> Answer.return pkh
  | Error err -> catch_error_f err

let string_of_pukh pkh =
  asprintf "%a" Signature.Public_key_hash.pp pkh

let get_contract s =
  ContractAlias.get_contract !ctxt s
  >>= function
  | Ok (_,v) -> Answer.return v
  | Error err -> (
    match Contract.of_b58check s with
    | Ok v -> Answer.return v
    | Error _ as err2 -> (
       let wrapped = Environment.wrap_error err2 in
       match wrapped with
       | Error e -> catch_error_f (e @ err)
       | Ok _ -> catch_error_f err))

let set_port p =
  (current_config.port) := p;
  ctxt := make_context ()

let set_basedir path =
  (current_config.basedir) := path;
  ctxt := make_context ()

let set_debugmode flag =
  (current_config.debug_mode) := flag;
  ()

let setup_remote_signer =
  Client_keys.register_signer (module Tezos_signer_backends.Unencrypted)

let transfer amount src destination fee =
  setup_remote_signer;
  Client_keys.get_key !ctxt src
  >>= function
  | Error err -> catch_error_f err
  | Ok (_, src_pk, src_sk) ->
     begin
       let ctxt_proto = new wrap_full !ctxt in
       Lwt.catch
         (fun () ->
           Client_proto_context.transfer
             ctxt_proto
             ~chain:!ctxt#chain
             ~block:!ctxt#block
             ?confirmations:!ctxt#confirmations
             ~dry_run:false
             ~verbose_signing:false
             ~source:src
             ~fee
             ~src_pk
             ~src_sk
             ~destination
             ~amount
             ~fee_parameter: !fee_parameter
             ())
         exception_handler
       >>= fun res ->
       match res with
       | Ok ((oph,_,_),_) -> Answer.return oph
       | Error err -> catch_error_f err
     end

let call_contract amount src destination ?entrypoint ?arg fee =
  let open Answer in
  (match Contract.is_implicit destination with
   | None -> Answer.return ()
   | Some _ -> Answer.fail Not_callable )
  >>=? fun () ->
  Client_keys.get_key !ctxt src
  >>= function
  | Error err -> catch_error_f err
  | Ok (_, src_pk, src_sk) ->
     begin
       let ctxt_proto = new wrap_full !ctxt in
       Lwt.catch
         (fun () ->
           Client_proto_context.transfer
             ctxt_proto
             ~chain:!ctxt#chain
             ~block:!ctxt#block
             ?confirmations:!ctxt#confirmations
             ~dry_run:false
             ~verbose_signing:false
             ~source:src
             ~fee
             ~src_pk
             ~src_sk
             ~destination
             ?entrypoint
             ?arg
             ~amount
             ~fee_parameter: !fee_parameter
             ())
         exception_handler
       >>= fun res ->
       match res with
       | Ok ((oph,_,_),_) -> Answer.return oph
       | Error err -> catch_error_f err
     end

let get_result ((op, res) : 'kind contents_list * 'kind contents_result_list) (b,i,j) =
  let rec cr : type kind. kind contents_and_result_list -> status Answer.t =
    function
    | Single_and_result (Manager_operation _,
                         Manager_operation_result {operation_result;_}) ->
       begin
         let open Tezos_protocol_006_PsCARTHA.Protocol.Contract_storage in
         match operation_result with
           | Failed (_, errs) -> (
             match errs with
             | (Non_existing_contract _) ::_ ->
                Answer.return (Rejected (Reason Invalid_receiver))
             | err :: _ ->
                let err_str = asprintf "%a" Environment.Error_monad.pp err in
                Answer.return (Rejected (Unknown_reason err_str))
             | _ -> Answer.return (Rejected (Unknown_reason "Empty trace")))
           | Applied (Transaction_result r) ->
              begin
                let res : op_result = {
                    block_hash = b;
                    rpc_position = (i,j);
                    balance_updates = r.balance_updates;
                    consumed_gas = Z.to_int r.consumed_gas;
                    storage = r.storage;
                    originated_contracts = r.originated_contracts;
                    storage_size = Z.to_int r.storage_size;
                    paid_storage_size_diff = Z.to_int r.paid_storage_size_diff;
                    big_map_diff = r.big_map_diff;
                    allocated_destination_contract = r.allocated_destination_contract
                  } in
                Answer.return (Accepted res)
              end
           | Backtracked ((Transaction_result _), _) -> Answer.return (Rejected Backtracked)
           | Skipped _ -> Answer.return (Rejected Skipped)
           | _ -> Answer.fail Unexpected_result
       end
    | Cons_and_result ((Manager_operation {operation;_} as op), (Manager_operation_result _ as res), rest) ->
       begin
         match operation with
         | Transaction _ -> cr @@ Single_and_result (op, res)
         | _ -> cr rest
       end
    | _ -> Answer.fail Unexpected_result
  in
  let contents_result_l = Apply_results.pack_contents_list op res
  in
  cr contents_result_l

let check_mempool oph =
  Alpha_block_services.Mempool.pending_operations
       !ctxt
       ~chain: !ctxt#chain
       ()
  >>= function
  | Ok {applied; unprocessed; refused; branch_refused; branch_delayed} ->
     begin
       let rec find_op_subpool = function
         | [] -> false
         | (oph_, _)::ops -> if Operation_hash.equal oph_ oph then true else find_op_subpool ops
       in
       let rec find_op = function
         | [] -> Missing
         | (pool, status) :: pools -> if find_op_subpool pool then status else find_op pools
       in
       let f = (fun (a, (b, _)) -> (a,b)) in
       let unproc_ops = Operation_hash.Map.bindings unprocessed in
       let refused_ops = List.map ~f (Operation_hash.Map.bindings refused)
       in
       let branch_refused_ops = List.map ~f (Operation_hash.Map.bindings branch_refused)
       in
       let branch_delayed_ops = List.map ~f (Operation_hash.Map.bindings branch_delayed)
       in
       let pools_pending = applied @ branch_delayed_ops in
       let pools = (pools_pending, Still_pending)
                   :: (refused_ops, Rejected (Unknown_reason "Unknown"))
                   :: (branch_refused_ops, Still_pending)
                   :: (branch_delayed_ops, Still_pending)
                   :: (unproc_ops, Unprocessed)
                   :: [] in
      Answer.return @@ find_op pools
     end
  | Error errs -> catch_error_f errs

let query oph =
  let ctxt_proto = new wrap_full !ctxt in
  Client_confirmations.lookup_operation_in_previous_blocks
    ctxt_proto
    ~chain:ctxt_proto#chain
    ~predecessors:60
    oph
  >>= function
  | Ok None ->
    check_mempool oph
  | Ok (Some (block, i, j)) ->
     begin
      Alpha_block_services.Operations.operation
        ctxt_proto
        ~chain:ctxt_proto#chain
        ~block:(`Hash (block, 0))
        i
        j
      >>= function
      | Ok op -> (
         match (op.receipt, op.protocol_data) with
         | (Apply_results.Operation_metadata omd, Operation_data od) ->
            begin
              match Apply_results.kind_equal_list od.contents omd.contents with
              | Some Apply_results.Eq ->
                 get_result (od.contents, omd.contents) (block, i, j)
              | None -> Answer.fail Unexpected_result
            end
         | _ -> Answer.fail Unexpected_result
      )
      | Error err -> catch_error_f err
     end
  | Error err -> catch_error_f err

let get_balance c =
  let ctxt_proto = new wrap_full !ctxt in
  Client_proto_context.get_balance
    ctxt_proto
    ~chain:ctxt_proto#chain
    ~block:ctxt_proto#block
    c
  >>= function
  | Ok amount -> Answer.return amount
  | Error err -> catch_error_f err
