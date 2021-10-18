(*
Z.t Documentation https://antoinemine.github.io/Zarith/doc/latest/Z.html

Mutez (micro-Tez) are internally represented by 64-bit signed integers.
These are restricted to prevent creating a negative amount of mutez.
Instructions are limited to prevent overflow and mixing them with other numerical types by mistake.
They are also mandatorily checked for overflows.
https://tezos.gitlab.io/alpha/michelson.html#operations-on-mutez
*)

module Mutez : sig
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
    val mul : 'a -> 'a -> t
    val ediv : t -> 'a -> (t * t) option
    val compare : t -> t -> int
    (*val format : (Format.formatter -> 'a -> unit) -> Format.formatter -> 'b -> 'a -> unit*)
  end = struct
    type t = Z.t

    exception Overflow of string * string * string
    exception NegativeMutez of string * string * string

    let min_t = Z.of_int 0
    let max_t = Z.of_string "9223372036854775807"
    let check_range (value : Z.t) : unit =
      if (Z.lt value min_t || Z.gt value  max_t) then
        raise (Overflow ("Mutez.of_string: Overflow", Z.to_string value, ""))

    let of_int (x : int) = check_range (Z.of_int x); Z.of_int x
    let of_int64 (x : int64) = check_range (Z.of_int64 x); Z.of_int64 x
    let of_Zt (x : Z.t) = check_range x; x
    let of_string (s : string) = check_range (Z.of_string s); Z.of_string s

    let to_int (x : t) : int = Z.to_int x (* may raise Z.Overflow *)
    let to_int64 (x : t) : int64 = Z.to_int64 x
    let to_Zt (x : t) : Z.t = x
    let to_string (x : t) : string = Z.to_string x

    let add (x : t) (y : t) : t =
      let value = Z.add x y in
      if (Z.gt value max_t) then
        raise (Overflow ("Mutez.add: Overflow", Z.to_string(x), Z.to_string(y)))
      else value

    let sub (x : t) (y : t) : t =
      let value = Z.sub x y in
      if (Z.lt value min_t) then
        raise (NegativeMutez ("Mutez.sub: Mutez can not be negative", Z.to_string(x), Z.to_string(y)))
      else value

    let mul x y : t =
      let value = Z.mul (Mutez.of_Zt x) (Mutez.of_Zt y) in
      if (Z.gt value max_t) then
        raise (Overflow ("Mutez.mul: Overflow", Z.to_string(x), Z.to_string(y)))
      else value

    let ediv (x : t) y : (t * t) option =
      try
        let (fst, snd) = Z.ediv_rem x (Mutez.of_Zt y) in (* Z.ediv_rem raises Divison_by_zero if y = 0*)
        Some (fst, snd)
      with Division_by_zero -> None

    let compare (x : t) (y : t) : int = Z.compare (to_Zt x) (to_Zt y)

    (*let format fmt_elt fmt x = (fun x -> Format.fprintf fmt "%a" x)*)

end;;