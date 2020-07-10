val get_puk_from_alias: string -> Signature.public_key option tzresult Lwt.t

val get_puk: string -> int tzresult Lwt.t
  
val get_puk_from_hash: Signature.public_key_hash -> Signature.public_key option tzresult Lwt.t
                                                                                          
