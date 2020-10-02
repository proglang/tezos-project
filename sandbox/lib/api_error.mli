open Tezos_protocol_environment_006_PsCARTHA

(** Provides information about why a transaction failed / is invalid *)
type rejection_message = Insufficient_balance
                     | Counter_mismatch
                     | Invalid_receiver
                     | Insufficient_fee
                     | Reached_burncap
                     | Reached_feecap
                     | Michelson_parser_error of string
                     | Michelson_runtime_error of string

type error = Rejection of rejection_message
           | RPC_error of {uri: string}
           | Node_connection_failed
           | Unexpected_result
           | Unknown_secret_key
           | Unknown_public_key
           | Keys_not_found
           | Wrong_contract_notation of string
           | Unknown of string

module Answer : sig
  type 'a t = ('a, error) Result.t Lwt.t
  val return : 'a -> 'a t
  val fail : error -> 'a t
  val ( >>=? ) : 'a t -> ('a -> 'b t) -> 'b t
end

val catch_env_error : Environment.Error_monad.error list -> 'a Answer.t
val catch_error : Error_monad.error list -> 'a Answer.t
