open SyncAPIV1.Api
open Tezos_error_monad.Error_monad

val get_script : string -> script tzresult Lwt.t
