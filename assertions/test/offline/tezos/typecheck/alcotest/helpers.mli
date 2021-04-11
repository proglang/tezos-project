(** Wraps the calls of the pipeline stages (parser -> transform -> cast -> typecheck)*)
val typecheck : string -> string -> unit -> unit Lwt.t

(** Generates an empty Michelson contract with the given parameter type *)
val generate_contract: string -> string

(** The error message of a type mismatch on the default ep *)
val error_mismatch_default : string

(** The error message of a type mismatch on a given ep *)
val error_mismatch_ep : string -> string

(** The error message of a duplicate assertion error on the default ep *)
val error_dup_ep_default : string

(** The error message of a duplicate assertion error on a given ep *)
val error_dup_ep : string -> string

(** The error message of an ambiguous assertion error on a given ep *)
val error_ambiguous_ep : string -> string

(** Asserts that an exception with the given error message is raised *)
val lwt_check_raises : string option -> (unit -> unit Lwt.t) -> unit Lwt.t
