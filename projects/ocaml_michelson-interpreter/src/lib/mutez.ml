(*
Z.t Documentation https://antoinemine.github.io/Zarith/doc/latest/Z.html

Mutez (micro-Tez) are internally represented by 64-bit signed integers.
These are restricted to prevent creating a negative amount of mutez.
Instructions are limited to prevent overflow and mixing them with other numerical types by mistake.
They are also mandatorily checked for overflows.
*)

module Mutez : sig
    type t = { value : Z.t; }
    exception Overflow of string * string * string
    exception NegativeMutez of string * string * string
    val of_int : int -> t
    val of_int64 : int64 -> t
    val of_string : string -> t
    val to_int : t -> int
    val to_int64 : t -> int64
    val to_string : t -> string
    val add : t -> t -> t
    val sub : t -> t -> t
    val mul : t -> t -> t
    val ediv : t -> t -> (t * t) option
  end = struct
    type t = { value : Z.t; }

    exception Overflow of string * string * string
    exception NegativeMutez of string * string * string

    let min_t = Z.of_int 0
    let max_t = Z.of_string "9223372036854775807"

    let of_int (x : int) = { value = Z.of_int x }
    let of_int64 (x : int64) = { value = Z.of_int64 x }
    let of_string (s : string) =
      let value = Z.of_string s in
      if (value < min_t || value > max_t) then
        raise (Overflow ("Mutez.of_string: Overflow", s, ""))
      else { value }

    let to_int (x : t) = Z.to_int x.value (* may raise Z.Overflow *)
    let to_int64 (x : t) = Z.to_int64 x.value
    let to_string (x : t) = Z.to_string x.value

    let add (x : t) (y : t) : t =
      let value = Z.add x.value y.value in
      if (value > max_t) then
        raise (Overflow ("Mutez.add: Overflow", Z.to_string(x.value), Z.to_string(y.value)))
      else { value }

    let sub (x : t) (y : t) : t =
      let value = Z.sub x.value y.value in
      if (value < min_t) then
        raise (NegativeMutez ("Mutez.sub: Mutez can not be negative", Z.to_string(x.value), Z.to_string(y.value)))
      else { value }

    let mul (x : t) (y : t) : t =
      let value = Z.mul x.value y.value in
      if (value > max_t) then
        raise (Overflow ("Mutez.mul: Overflow", Z.to_string(x.value), Z.to_string(y.value)))
      else { value }

    let ediv (x : t) (y : t) : (t * t) option =
      try
        let (fst, snd) = Z.ediv_rem x.value y.value in (* Z.ediv_rem raises Divison_by_zero if y = 0*)
        Some ({ value = fst }, { value = snd })
      with Division_by_zero -> None

end;;


(*
  let arithmetic (f : (Z.t -> Z.t -> Z.t)) (x : t) (y : t) : option t =
    let value = f x.value y.value in
    if (value < min_int || value > max_int) then
      raise MutezOverflow ("no idea how to include the right arithmetic function in this exception message", x, y)
    else
      { value }
*)

