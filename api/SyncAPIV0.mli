(* public key *)
type puk

(* type for tender *)
type amount = int

(* operation ids *)
type op_id_t

(* network port number *)
type port_nr = int

type synchAPI

(* set the port for communicating with the local Tezos node 
 * default = 8732
 *)
val set_port : ?p:port_nr -> unit -> synchAPI

val get_port : synchAPI -> port_nr

val get_puk_from_nickname : string -> puk

(*val get_alias_file_contents: unit -> string*)
  
val get_puk_from_hash : string -> puk

type failure_message = Insufficient_balance | Counter_mismatch | Invalid_receiver
type answer = Pending of op_id_t | Fail of failure_message

val transfer : amount -> puk -> puk -> amount -> answer

type result = unit (* which information is returned??? *)
type reason = Timeout (* more reasons? *)

type status = Still_pending | Accepted of result | Rejected of reason

val query : op_id_t -> status
