(** This API provides functions to interact with a Tezos node *)
open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context

(** A public key *)
type puk = Signature.public_key

(** A public key hash *)
type pukh = Signature.public_key_hash

 (** Contract representation (implicit or originated) *)
type contract = Contract.t

type 'a tz_result = 'a tzresult Lwt.t

(** Amount of Tezos tokens (tez) *)
type tez = float

 (** Operation hash *)
type oph = Operation_hash.t

(** Block hash *)
type blockh = Block_hash.t

(** Provides information about why a transaction failed / is invalid *)
type failure_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Operation_quota_exceeded (* Needed? *)
                     | Storage_limit_too_high (* Needed? *)
                     | Cannot_pay_storage_fee (* Handled by Insufficient_fee? *)
                     | Unknown

(** Result of a transaction injection*)
type answer = Pending of oph (** The operation hash of the successfully injected transaction *)
            | Fail of failure_message (** An error with respective {!type:failure_message} *)

(** Result of an included operation *)
type result = unit (* which information is returned??? *)

(** Possible reasons for a transaction rejection *)
type reason = Timeout (** The transaction timed out and was removed from the Mempool *)
            | Skipped (** The transaction was skipped due to a previously failed operation *)
            | Backtracked (** The transaction was backtracked due to a subsequently failed operation *)
            | Reason of failure_message  (** The transaction failed due to any error defined by {!type: failure_message} *)

(** Errors unrelated to a transaction *)
type error_message = RPC_error of {uri: string} (** Error occured during RPC call *)
                   | Unexpected_result (** The {!type:oph} did not refer to a transaction operation*)
                   | Unknown (** Generic error *)

(** Status of an injected transaction *)
type status = Still_pending (** Transaction hasn't been included yet *)
            | Accepted of result (** Transaction was included *)
            | Rejected of reason (** Transaction was rejected due to any {!type:reason} *)
            | Missing (** Transaction couldn't be found *)
            | Error of error_message (** Status couldn't be retrieved due to {!type:error_message} *)

(** [get_puk_from_alias s] expects an alias string of an implicit account and returns
    the associated public key of the account.
    @return {!type:puk} *)
val get_puk_from_alias: string -> puk tz_result

val get_puk_from_hash: string -> puk tz_result

val get_pukh_from_alias: string -> pukh tz_result

val get_contract: string -> contract tz_result

val set_port: int -> unit

val set_basedir: string -> unit

val transfer: tez -> pukh -> contract -> tez -> answer Lwt.t

val exception_handler : exn -> 'a tzresult Lwt.t

(** [query op] retrieves the current status of an injected transaction
    @param oph the operation hash of the injected transaction
    @return {!type:status}
*)
val query : oph -> status Lwt.t
