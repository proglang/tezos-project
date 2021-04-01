type storage = unit

let%entry nth ((idx: int), (l: int list)) _ =
  let (_, _) = Loop.loop (fun (i, l) ->
    match l with
    | [] -> failwith "Index out of bounds"
    | x :: xs ->
    if i = idx then () (* do something with x *);
    (i <= idx, (i + 1, xs))
  ) (0, l)
in
  ([], ())