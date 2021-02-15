open Tezos_protocol_environment_007_PsDELPH1

(** Provides information about why a transaction was rejected *)
type rejection_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Empty_transaction
                     | Empty_implicit_contract
                     | Michelson_runtime_error of string

type error = Rejection of rejection_message (** Injection failed due to {!type:rejection_message} *)
           | RPC_error of {uri: string} (** Error occured during RPC call *)
           | Node_connection_failed (** Connecting to the node fail *)
           | Unexpected_result (** The {!type:oph} did not refer to a manager operation or the result doesn't match the expected form/type *)
           | Unknown_secret_key (** The secret key of the given account was not found *)
           | Unknown_public_key (** The public key of the given account was not found *)
           | Keys_not_found (** Unknown alias or no keys found for the given contract *)
           | Wrong_contract_notation of string (** Contract unknown or malformed notation *)
           | Invalid_public_key_hash (** A malformed public key hash was given *)
           | Not_callable (** The given contract is not originated *)
           | Michelson_parser_error of string
           | Unknown of string (** Unknown error - error list should be extended if this occurs; used by debug_mode to return the Tezos error trace*)

(** Simple error monad to handle improper input and Tezos errors*)
module Answer : sig
  type 'a t = ('a, error) Result.t Lwt.t
  val return : 'a -> 'a t
  val fail : error -> 'a t
  val ( >>=? ) : 'a t -> ('a -> 'b t) -> 'b t
end

(** Error handling - only handles the top error on the Tezos error trace *)
val catch_last_error : Error_monad.error list -> 'a Answer.t

(** Error handling in debug mode - returns the entire Tezos error trace as string *)
val catch_trace : Error_monad.error list -> 'a Answer.t

(** Error handling - wraps a Tezos Environment error to a normal error and returns the entire Tezos error trace as string *)
val catch_trace_env : 'a Environment.Error_monad.tzresult -> Error_monad.error list -> string -> 'a Answer.t

(** Error handling - wraps a Tezos Environment error to a normal error and handles it *)
val catch_last_env_error : 'a Environment.Error_monad.tzresult -> string -> 'a Answer.t
