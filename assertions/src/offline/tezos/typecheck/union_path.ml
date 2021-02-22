type union_path = Left of union_path
                | Right of union_path
                | T

let rec eq up1 up2 =
  match (up1, up2) with
  | T, T -> true
  | Left l_up1, Left l_up2 -> eq l_up1 l_up2
  | Right r_up1, Right r_up2 -> eq r_up1 r_up2
  | _ -> false

let rec pp ppf = function
  | T -> ()
  | Left l -> Fmt.pf ppf "L"; pp ppf l
  | Right r -> Fmt.pf ppf "R"; pp ppf r
