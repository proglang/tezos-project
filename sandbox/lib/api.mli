open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_client_006_PsCARTHA

type puk = Signature.public_key
type pukh = Signature.public_key_hash
type 'a tz_result = 'a tzresult Lwt.t
type tez = int

val get_puk_from_alias: string -> puk tz_result

val get_puk_from_hash: string -> puk tz_result

val get_pukh_from_alias: string -> pukh tz_result

val set_port: int -> unit

val set_basedir: string -> unit

val transfer: tez -> pukh -> string -> tez -> (Kind.transaction Kind.manager Injection.result * Contract.t list) tzresult Lwt.t
