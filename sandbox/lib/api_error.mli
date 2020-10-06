(** Provides information about why a transaction was rejected *)
type rejection_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Empty_transaction
                     | Empty_implicit_contract
                     | Michelson_parser_error
                     | Michelson_runtime_error

type error = Rejection of rejection_message (** Injection failed due to {!type:rejection_message} *)
           | RPC_error of {uri: string} (** Error occured during RPC call *)
           | Node_connection_failed (** Connecting to the node fail *)
           | Unexpected_result (** The {!type:oph} did not refer to a transaction operation *)
           | Unknown_secret_key (** The secret key of the given account was not found *)
           | Unknown_public_key (** The public key of the given account was not found *)
           | Keys_not_found (** Unknown alias or no keys found for the given contract *)
           | Wrong_contract_notation of string (** A malformed contract notation was given *)
           | Invalid_public_key_hash (** A malformed public key hash was given *)
           | Not_callable (** The given contract is not originated *)
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
