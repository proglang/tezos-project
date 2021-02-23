type union_path = Left of union_path
                | Right of union_path
                | T

val eq : union_path -> union_path -> bool

(* add : level -> path -> path *)
val add : union_path -> union_path -> union_path

val pp : Format.formatter ->  union_path -> unit
