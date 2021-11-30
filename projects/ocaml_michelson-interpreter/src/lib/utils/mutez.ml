type t = Z.t [@printer Z.pp_print][@@deriving show]

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
    raise (NegativeMutez ("Mutez.sub: Resulting Mutez is can not be negative", Z.to_string(x), Z.to_string(y)))
  else value

let mul (x : t) (y : t) : t =
  let value = Z.mul x y (*(Mutez.of_Zt x) (Mutez.of_Zt y)*) in
  if (Z.gt value max_t) then
    raise (Overflow ("Mutez.mul: Overflow", Z.to_string(x), Z.to_string(y)))
  else value

let ediv (x : t) (y : t) : (t * t) option =
  if (Z.equal y Z.zero) then
    None
  else
    let (fst, snd) = Z.ediv_rem x y (*(Mutez.of_Zt y)*) in (* Z.ediv_rem raises Divison_by_zero if y = 0*)
    Some (fst, snd)

let compare (x : t) (y : t) : int = Z.compare (to_Zt x) (to_Zt y)
let equal x y = Z.equal x y
