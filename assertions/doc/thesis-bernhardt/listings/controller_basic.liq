type storage = (int, address) map

let%entry A (i : int) storage =
  let t = (* ... *) in
  let addr_p = Map.find 0 storage in  (* Addr of parent *)
  let addr_a = Map.find 1 storage in  (* Addr of assertion *)
  (* Operation invoking the parent *)
  let op_tplus1 = Contract.call
      ~dest:addr_p
      ~entry:default
      ~amount:Current.amount ()
      ~parameter:i
  in
  (* Operations invoking the assertion *)
  let (_, internal_ops) =
        Loop.loop (fun (x, ops) ->
          let op = Contract.call
            ~dest:addr_a
            ~amount:0tz
            ~parameter:i in
          ( x < t, (x + 1p, op :: ops))
        ) (0p, [op_tplus1])
  in
  (internal_ops, storage)
