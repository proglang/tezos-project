(* Z.t Documentation https://antoinemine.github.io/Zarith/doc/latest/Z.html*)

module Mutez = struct
  type t = { value : Z.t }

  exception Overflow of string * Z.t * Z.t

  let min_t = { value = Z.of_string "-9223372036854775808"};;
  let max_t = { value = Z.of_string "9223372036854775807"};;

  let of_int (x : int) = { value = Z.of_int x }
  let of_string (x : string) = { value = Z.of_string x }

  let add (x : t) (y : t) : t =
    let value = Z.add x.value y.value in
    if (value < min_int || value > max_int) then
      raise (Overflow ("Overflow when adding values", x.value, y.value))
    else
      { value }

  let sub (x : t) (y : t) : t =
    let value = Z.sub x.value y.value in
    if (value < min_int || value > max_int) then
      raise (Overflow ("Overflow when substracting values", x.value, y.value))
    else
      { value }

  let mul (x : t) (y : t) : t =
    let value = Z.mul x.value y.value in
    if (value < min_int || value > max_int) then
      raise (Overflow ("Overflow when multiplying values", x.value, y.value))
    else
      { value }

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

