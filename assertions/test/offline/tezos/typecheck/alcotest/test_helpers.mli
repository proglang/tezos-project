val generate_contract: string -> string
val error_mismatch_default : string
val error_mismatch_ep : string -> string
val error_dup_ep_default : string
val error_dup_ep : string -> string
val lwt_check_raises : string option -> (unit -> unit Lwt.t) -> unit Lwt.t
