open SyncAPIV1.Api
open Tezos_error_monad.Error_monad

val get_script : string -> parsed_michelson tzresult Lwt.t
