open Tezos_error_monad.Error_monad
open Tezos_client_007_PsDELPH1

val get_script : string -> Michelson_v1_parser.parsed tzresult Lwt.t
