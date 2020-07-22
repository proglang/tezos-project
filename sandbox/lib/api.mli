val get_puk_from_alias: string -> Signature.public_key option tzresult Lwt.t

val get_puk_from_hash: string -> Signature.public_key tzresult Lwt.t

val set_port: int -> unit

val set_basedir: string -> unit
