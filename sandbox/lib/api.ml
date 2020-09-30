open Client_keys
open Tezos_client_006_PsCARTHA.Client_proto_context
open Tezos_client_006_PsCARTHA.Protocol_client_context
open Tezos_client_006_PsCARTHA.Injection
open Tezos_client_006_PsCARTHA.Client_proto_contracts
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_raw_protocol_006_PsCARTHA
open Tezos_protocol_environment_006_PsCARTHA
open Apply_results
open Api_context
open Format
open Base
open Str
open Int64

(* How to hide this?! *)
type puk = Signature.public_key
type pukh = Signature.public_key_hash
type contract = Contract.t
type oph = Operation_hash.t
type blockh = Block_hash.t

module Tez_t : sig
  type t = Tez.t
  val tez : float -> t
end = struct
  type t = Tez.t
  let tez f =
    let mutez = Int64.of_float( f *. 1000000.0 ) in
    assert (mutez >= Int64.one);
    match Tez.( *? ) Tez.one_mutez mutez with
    | Ok tz -> tz
    | _ -> failwith "Illegal Tez value"
end

type failure_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Unknown_failure of string
type answer = Pending of oph
            | Fail of failure_message

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
            | Reason of failure_message

type error_message = RPC_error of {uri: string}
                   | Unexpected_result
                   | Unknown_error of string

type status = Still_pending
            | Accepted of op_result
            | Rejected of reason
            | Unprocessed
            | Missing
            | Error of error_message

type config = {
    port : int ref;
    basedir : string ref
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
    basedir = ref "/home/tezos/.tezos-client"
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
     fail (Exn (Failure msg))
  | exn ->
     Lwt.return @@ error_exn exn )

let errors_of_strings =
  Base.Map.of_alist_exn (module String)
    [
      ("The proposed fee .* are higher than the configured fee cap", Reached_feecap);
      ("The proposed fee .* are lower than the fee that baker expect", Insufficient_fee);
      ("The operation will burn .* which is higher than the configured burn cap", Reached_burncap);
    ]

let err_to_str = asprintf "%a" Error_monad.pp
let env_err_to_str = asprintf "%a" Environment.Error_monad.pp

let get_puk_from_alias name =
  Public_key_hash.find !ctxt name
  >>= function
  | Ok pkh -> (
     Client_keys.get_key !ctxt pkh
     >>= function
     | Ok (_, src_pk, _) -> Lwt.return_some src_pk
     | _ -> Lwt.return_none )
  | _ -> Lwt.return_none

let get_puk_from_hash pk_hash =
  Public_key_hash.of_source pk_hash
  >>= function
  | Ok pkh -> (
    Client_keys.get_key !ctxt pkh
    >>= function
    | Ok (_, src_pk, _) -> Lwt.return_some src_pk
    | _ -> Lwt.return_none )
  | _ -> Lwt.return_none

let get_pukh_from_alias name =
  Public_key_hash.find !ctxt name
  >>= function
  | Ok pkh -> Lwt.return_some pkh
  | _ -> Lwt.return_none

let get_contract s =
  ContractAlias.get_contract !ctxt s
  >>= function
  | Ok (_,v) -> Lwt.return_some v
  | Error _ -> (
    match Contract.of_b58check s with
    | Ok v -> Lwt.return_some v
    | Error _ -> Lwt.return_none )

let set_port p =
  (current_config.port) := p;
  ctxt := make_context ()

let set_basedir path =
  (current_config.basedir) := path;
  ctxt := make_context ()

let setup_remote_signer =
  Client_keys.register_signer (module Tezos_signer_backends.Unencrypted)

let transfer amount src destination fees =
  setup_remote_signer;
  Client_keys.get_key !ctxt src
  >>= function
  | Error _ -> Lwt.return @@ Fail Invalid_receiver
  | Ok (_, src_pk, src_sk) ->
     begin
       let ctxt_proto = new wrap_full !ctxt in
       Lwt.catch
         (fun () ->
           transfer
             ctxt_proto
             ~chain:!ctxt#chain
             ~block:!ctxt#block
             ?confirmations:!ctxt#confirmations
             ~dry_run:false
             ~verbose_signing:false
             ~source:src
             ~fee:fees
             ~src_pk
             ~src_sk
             ~destination
             ~amount
             ~fee_parameter: !fee_parameter
             ())
         exception_handler
       >>= fun res ->
       let open Tezos_protocol_006_PsCARTHA.Protocol.Contract_storage in
       match res with
       | Ok ((oph,_,_),_) -> Lwt.return @@ Pending oph
       | Error ((Environment.Ecoproto_error Contract.Balance_too_low _) :: _)
         -> Lwt.return @@ Fail Insufficient_balance
       | Error ((Environment.Ecoproto_error Counter_in_the_past _) :: _)
         -> Lwt.return @@ Fail Counter_mismatch
       | Error ((Environment.Ecoproto_error Counter_in_the_future _):: _)
         -> Lwt.return @@ Fail Counter_mismatch
       | Error errs ->
          let last_err = List.hd errs in
          match last_err with
          | None -> Lwt.return @@ Fail (Unknown_failure "Empty trace")
          | Some err ->
             begin
               let err_str = err_to_str err in
               let rec match_error l str = match l with
                 | [] -> Fail (Unknown_failure err_str)
                 | x::xs -> (
                   let r = Str.regexp x in
                   if string_match r err_str 0 then Fail (Base.Map.find_exn errors_of_strings x)
                   else match_error xs str
                 )
               in
               let keys = Base.Map.keys errors_of_strings in
               Lwt.return @@ match_error keys err_str
             end
     end

let catch_rpc_error errs =
  match errs with
  | (RPC_context.Not_found {uri; _}) ::_
    | (RPC_context.Gone {uri;_}) ::_
    | (RPC_context.Generic_error {uri;_}) ::_ ->
     Lwt.return (Error (RPC_error {uri = Uri.to_string uri }))
  | err :: _ -> Lwt.return (Error (Unknown_error (err_to_str err)))
  | _ ->  Lwt.return (Error (Unknown_error "Empty trace"))

let get_result ((op, res) : 'kind contents_list * 'kind contents_result_list) (b,i,j) =
  let rec cr : type kind. kind contents_and_result_list -> status =
    function
    | Single_and_result (Manager_operation {operation; _},
                         Manager_operation_result {operation_result;_}) ->
       begin
         let open Tezos_protocol_006_PsCARTHA.Protocol.Contract_storage in
         match operation with
         | Transaction _ -> (
           match operation_result with
           | Failed (_, errs) -> (
              match errs with
              | (Non_existing_contract _) ::_ -> Rejected (Reason Invalid_receiver)
              | err :: _ -> Rejected (Reason (Unknown_failure (env_err_to_str err)))
              | _ -> Rejected (Reason (Unknown_failure "Empty trace")))
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
                Accepted res
              end
           | Backtracked ((Transaction_result _), _) -> Rejected Backtracked
           | Skipped _ -> Rejected Skipped)
         | _ -> Error Unexpected_result
       end
    | Cons_and_result ((Manager_operation {operation;_} as op), (Manager_operation_result _ as res), rest) ->
       begin
         match operation with
         | Transaction _ -> cr @@ Single_and_result (op, res)
         | _ -> cr rest
       end
    | _ -> (Error Unexpected_result)
  in
  let contents_result_l = Apply_results.pack_contents_list op res
  in
  Lwt.return @@ cr contents_result_l

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
                   :: (refused_ops, Rejected (Reason (Unknown_failure "Unknown")))
                   :: (branch_refused_ops, Still_pending)
                   :: (branch_delayed_ops, Still_pending)
                   :: (unproc_ops, Unprocessed)
                   :: [] in
       Lwt.return @@ find_op pools
     end
  | Error errs -> match errs with
                  | err :: _ -> Lwt.return (Error (Unknown_error (err_to_str err)))
                  | _ -> Lwt.return (Error (Unknown_error ("Empty trace")))

let query oph =
  let ctxt_proto = new wrap_full !ctxt in
  Client_confirmations.lookup_operation_in_previous_blocks
    ctxt_proto
    ~chain:ctxt_proto#chain
    ~predecessors:10
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
              | None -> Lwt.return (Error Unexpected_result)
            end
         | _ ->  Lwt.return (Error Unexpected_result)
      )
      | Error err -> catch_rpc_error err
     end
  | Error err -> catch_rpc_error err
