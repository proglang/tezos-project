type storage = (* ... *)

let%entry A (i : int) storage = (* ... *)

let%entry A_a (i : int) storage = (* ... *)

let%entry A_c (i : int) storage =
  let t = (* ... *) in
  let (_, internal_ops) =
        Loop.loop (fun (x, ops) ->
          let op = Contract.call
            ~dest:Current.destination
            ~entry:A_a
            ~amount:0tz
            ~parameter:i in
          ( x < t, (x + 1p, op :: ops))
        ) (0p, [])
  in
  (internal_ops, storage)

let%entry B (i : int) storage = (* ... *)

let%entry B_c (i : int) storage = ([], storage)
