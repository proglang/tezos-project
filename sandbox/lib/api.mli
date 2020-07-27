open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context
open Tezos_client_006_PsCARTHA

type puk = Signature.public_key tzresult Lwt.t
type pukh = Signature.public_key_hash tzresult Lwt.t
type tez = int

val get_puk_from_alias: string -> puk

val get_puk_from_hash: string -> puk

val get_pukh_from_alias: string -> pukh

val set_port: int -> unit

val set_basedir: string -> unit

val transfer: tez -> Signature.public_key_hash -> Signature.public_key_hash -> tez -> (Kind.transaction Kind.manager Injection.result * Contract.t list) tzresult Lwt.t
