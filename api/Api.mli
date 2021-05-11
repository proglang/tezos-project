(** This API provides functions to interact with a Tezos node *)
open Tezos_protocol_007_PsDELPH1.Protocol.Alpha_context
open Tezos_client_007_PsDELPH1
open Api_error

(** A public key of an account (implicit or originated)*)
type puk

(** A public key hash of an account (implicit or originated) *)
type pukh

 (** Contract representation (implicit or originated) *)
type contract

 (** Operation hash *)
type oph

(** Block hash *)
type blockh

type parsed_michelson = Michelson_v1_parser.parsed
type expression_michelson = Script.expr
type tag = string

(** Representation of Tezos tokens (tez) *)
module Tez_t : sig
  type t

  (** [tez f] convert amount to the internal Tez representation
      throws an exception if value is below 1 micro tez (0.000001)
   *)
  val tez : float -> t

  (** [zero] represents the value of 0 tez *)
  val zero : t

  (** [to_float t] returns amount of tez in float represention *)
  val to_float : t -> float
end

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
            | Reason of rejection_message  (** The transaction failed due to {!type: failure_message} *)
            | Unknown_reason of string (** None of the above match - reason list should be extended if this occurs *)

(** Status of an injected transaction *)
type status = Still_pending (** Transaction hasn't been included yet (prevalidated, delayed or unprocessed) *)
            | Accepted of op_result (** Transaction was included with {!type:result} *)
            | Rejected of reason (** Transaction was rejected due to {!type:reason} *)
            | Unprocessed (** Transaction not yet prevalidated *)
            | Missing (** Transaction couldn't be found (tbd should this be timeout?) *)

(** [get_puk_from_alias s] expects an alias of an implicit account and returns
    the associated public key of the account.
    @param s alias of implicit account
    @return {!type:puk} the associated public key
*)
val get_puk_from_alias: string -> puk Answer.t

(** [get_puk_from_hash s] expects a public key hash as string and returns the associated
    public key of the account.
    @param s public key hash
    @return {!type:puk} the associated public key
 *)
val get_puk_from_hash: string -> puk Answer.t

(** [get_pukh_from_alias s] expects an alias of an implicit account and returns
    the associated public key hash.
    @param s alias of implicit account
    @return {!type:pukh} the associated public key hash
*)
val get_pukh_from_alias: string -> pukh Answer.t

(** [get_pukh_from_hash s] expects a public key hash as string and returns
    the associated public key hash.
    @param s public key hash of implicit account
    @return {!type:pukh} the associated public key hash
*)
val get_pukh_from_hash: string -> pukh Answer.t

(** [string_of_pukh pkh] expects a public key hash and returns it's string representation..
    @param pkh public key hash of implicit account
    @return its string representation
*)
val string_of_pukh: pukh -> string

(** [get_contract s] expects an alias, public key hash or contract hash as string
    and returns the associated contract representation.
    @param s alias, public key hash or contract hash
    @return {!type:contract} the associated contract representation
*)
val get_contract: string -> contract Answer.t

(** [set_port p] specifies under which port the RPC interface of the node is
    reachable if the default (8732) does not apply.
    @param p the RPC port of the node
*)
val set_port: int -> unit

(** [set_debugmode f] enable/disable the debug mode - in debug mode, the whole Tezos error trace is printed *)
val set_debugmode : bool -> unit

(** [set_basedir d] specifies the path of the tezos-client base directory
    (normally /home/<username>/.tezos-client/)
    @param d path of the tezos-client base directory
*)
val set_basedir: string -> unit

(** [set_fee_parameters min_fee min_ntz_byte min_ntz_gas force_low fee_cap burn_cap]
 sets the fee parameters for transactions and calls. Unspecified parameters are reset to their default values.
    @param min_fee exclude operations with fees lower than this threshold
    @param min_ntz_byte exclude operations with fees per byte lower than this threshold (in nanotez)
    @param min_ntz_gas exclude operations with fees per gas lower than this threshold (in nanotez)
    @param force_low Don't check that the fee is lower than the estimated default value
    @param fee_cap
    @param burn_cap
*)
val set_fee_parameters: ?min_fee:Tez_t.t
                        -> ?min_ntz_byte:int
                        -> ?min_ntz_gas:int
                        -> ?force_low:bool
                        -> ?fee_cap:Tez_t.t
                        -> ?burn_cap:Tez_t.t
                        -> unit
                        -> unit

(** [transfer a src dst fee] injects a transfer transaction.
    @param a the amount of tez to transfer
    @param src the public key hash of the sender
    @param dst the contract representation of the receiver
    @param fee the amount of fees to pay to the baker
    @return {!type:oph} the operation hash of the injected transaction
*)
val transfer: Tez_t.t -> pukh -> contract -> Tez_t.t -> oph Answer.t

(** [query op] retrieves the current status of an injected transaction
    @param op the operation hash of the injected transaction
    @return {!type:status} the status of the transaction
*)
val query : oph -> status Answer.t

(** [get_balance c] returns the balance of a contract (implicit or originated)
    @param f the contract representation of the target
    @return {!type:Tez_t.t} the balance of the target contract
*)
val get_balance : contract -> Tez_t.t Answer.t

(** [call_contract a src dst ?ep ?arg fee] calls a contract.
    @param a amount of tez to transfer
    @param src the public key hash of the caller
    @param dst the contract representation of the callee
    @param ?ep specifies the entrypoint - if not set, the default entrypoint will be called
    @param ?arg argument passed to the contract's script (if needed)
    @param fee the amount of fees to pay to the baker
 *)
val call_contract : Tez_t.t -> pukh -> contract -> ?entrypoint:string -> ?arg:string -> Tez_t.t -> oph Answer.t

(** [get_contract_code dst] retrieves the code of a smart contract.
    @param dst contract representation
    @return the parsed contract code
 *)
val get_contract_code : contract -> parsed_michelson Answer.t

(** [parse_script code] parses a Michelson script
    @param code Michelson script
    @return the result of parsing and expanding a Michelson script
 *)
val parse_script : string -> parsed_michelson Answer.t

(** [parse_expression expr] parses a Michelson expression/data
    @param code Michelson expression
    @return the result of parsing and expanding a Michelson expression/data
 *)
val parse_expression : string -> parsed_michelson Answer.t

(** [list_entrypoints parsed] returns the list of entrypoints of the given Michelson script
    @param a parsed Michelson script
    @return the entrypoints with tag and script
 *)
val list_entrypoints : parsed_michelson -> (tag * expression_michelson) list Answer.t
