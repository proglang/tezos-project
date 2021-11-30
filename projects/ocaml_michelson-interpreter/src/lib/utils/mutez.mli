(*
Z.t Documentation https://antoinemine.github.io/Zarith/doc/latest/Z.html

Mutez (micro-Tez) are internally represented by 64-bit signed integers.
These are restricted to prevent creating a negative amount of mutez.
Instructions are limited to prevent overflow and mixing them with other numerical types by mistake.
They are also mandatorily checked for overflows.
https://tezos.gitlab.io/alpha/michelson.html#operations-on-mutez
*)

type t
exception Overflow of string * string * string
exception NegativeMutez of string * string * string

val min_t : t
val max_t : t

val of_int : int -> t
val of_int64 : int64 -> t
val of_Zt : Z.t -> t
val of_string : string -> t

val to_int : t -> int
val to_int64 : t -> int64
val to_Zt : t -> Z.t
val to_string : t -> string

val add : t -> t -> t
val sub : t -> t -> t
val mul : t -> t -> t (*'a -> 'a -> t*)
val ediv : t -> t -> (t * t) option (*t -> 'a -> (t * t) option*)

val compare : t -> t -> int
val equal : t -> t -> bool

val pp : Format.formatter -> t -> unit
