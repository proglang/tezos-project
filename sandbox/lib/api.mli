open Tezos_protocol_006_PsCARTHA.Protocol.Alpha_context

type puk = Signature.public_key
type pukh = Signature.public_key_hash
type contract = Contract.t
type 'a tz_result = 'a tzresult Lwt.t
type tez = float
type oph = Operation_hash.t

val get_puk_from_alias: string -> puk tz_result

val get_puk_from_hash: string -> puk tz_result

val get_pukh_from_alias: string -> pukh tz_result

val get_contract_from_alias: string -> contract tz_result

val set_port: int -> unit

val set_basedir: string -> unit

val transfer: tez -> pukh -> contract -> tez -> oph tzresult Lwt.t

val exception_handler : exn -> 'a tzresult Lwt.t
