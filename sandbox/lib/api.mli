(** This API provides functions to interact with a Tezos node *)
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context

(** A public key of an account (implicit or originated)*)
type puk = Signature.public_key

(** A public key hash of an account (implicit or originated) *)
type pukh = Signature.public_key_hash

 (** Contract representation (implicit or originated) *)
type contract = Contract.t

 (** Operation hash *)
type oph = Operation_hash.t

(** Block hash *)
type blockh = Block_hash.t

(** Representation of Tezos tokens (tezzies) *)
module Tez_t : sig
  type t
  val tez : float -> t
end

(** Provides information about why a transaction failed / is invalid *)
type failure_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Unknown_failure of string (** None of the above match - error list should be extended if this occurs *)

(** Result of a transaction injection*)
type answer = Pending of oph (** The operation hash of the successfully injected transaction *)
            | Fail of failure_message (** An error with the respective {!type:failure_message} *)

(** Result of an operation which has been successfully included into a block *)
type op_result = {
    block_hash : blockh; (** Block in which transaction was included *)
    rpc_position : (int * int); (** The indices where the operation can be found within the block *)
    balance_updates : Delegate.balance_updates; (** List of balance updates *)
    consumed_gas : int; (** Amount of gas burned during execution *)
    storage : Script.expr option; (** Contents of storage *)
    originated_contracts : contract list; (** List of originated contracts *)
    storage_size : int; (** Amount of storage used during transaction *)
    paid_storage_size_diff : int ; (** Storage fees paid *)
    big_map_diff : Contract.big_map_diff option; (** Changes in the BigMap *)
    allocated_destination_contract : bool (** Indicates whether the dest account was empty or not *)
  }

(** Possible reasons for a transaction rejection *)
type reason = Timeout (** The transaction timed out and was removed from the Mempool (tbd if this case can be distinguished clearly from others) *)
            | Skipped (** The transaction was skipped due to a previously failed operation *)
            | Backtracked (** The transaction was backtracked due to a subsequently failed operation *)
            | Reason of failure_message  (** The transaction failed due to {!type: failure_message} *)

(** Errors which might occur during retrieval of transaction status (unrelated to the transaction result) *)
type error_message = RPC_error of {uri: string} (** Error occured during RPC call *)
                   | Unexpected_result (** The {!type:oph} did not refer to a transaction operation *)
                   | Unknown_error of string (** Unknown error - error list should be extended if this occurs *)

(** Status of an injected transaction *)
type status = Still_pending (** Transaction hasn't been included yet (prevalidated, delayed or unprocessed) *)
            | Accepted of op_result (** Transaction was included with {!type:result} *)
            | Rejected of reason (** Transaction was rejected due to {!type:reason} *)
            | Unprocessed (** Transaction not yet prevalidated *)
            | Missing (** Transaction couldn't be found (tbd should this be timeout?) *)
            | Error of error_message (** Status couldn't be retrieved due to {!type:error_message} *)

(** [get_puk_from_alias s] expects an alias of an implicit account and returns
    the associated public key of the account.
    @param s alias of implicit account
    @return {!type:puk} the associated public key
*)
val get_puk_from_alias: string -> puk option Lwt.t

(** [get_puk_from_hash s] expects a public key hash as string and returns the associated
    public key of the account.
    @param s public key hash
    @return {!type:puk} the associated public key
 *)
val get_puk_from_hash: string -> puk option Lwt.t

(** [get_pukh_from_alias s] expects an alias of an implicit account and returns 
    the associated public key hash.
    @param s alias of implicit account
    @return {!type:pukh} the associated public key hash
*)
val get_pukh_from_alias: string -> pukh option Lwt.t

(** [get_contract s] expects an alias, public key hash or contract hash as string
    and returns the associated contract representation.
    @param s alias, public key hash or contract hash
    @return {!type:contract} the associated contract representation
*)
val get_contract: string -> contract option Lwt.t

(** [set_port p] specifies under which port the RPC interface of the node is
    reachable if the default (8732) does not apply.
    @param p the RPC port of the node
*)
val set_port: int -> unit

(** [set_basedir d] specifies the path of the tezos-client base directory
    (normally /home/<username>/.tezos-client/)
    @param d path of the tezos-client base directory
*)
val set_basedir: string -> unit

(** [transfer a src dst fee] injects a transfer transaction.
    @param a the amount of tezzies to be transferred
    @param src the public key hash of the sender
    @param dst the contract representation of the receiver
    @param fee the amount of fees to be paid for the baker
    @return {!type:answer} the operation hash of the injected transaction or
    error
*)
val transfer: Tez_t.t -> pukh -> contract -> Tez_t.t -> answer Lwt.t

(** [query op] retrieves the current status of an injected transaction
    @param op the operation hash of the injected transaction
    @return {!type:status} a status or error
*)
val query : oph -> status Lwt.t
