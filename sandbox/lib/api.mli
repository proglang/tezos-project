
type puk = Signature.public_key tzresult Lwt.t

val get_puk_from_alias: string -> puk

val get_puk_from_hash: string -> puk

val set_port: int -> unit

val set_basedir: string -> unit
