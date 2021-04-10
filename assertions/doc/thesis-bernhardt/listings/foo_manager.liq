type storage = (int, address) map

let%entry default
      (a : int)
      storage =
  let parent_addr = match Map.find 0 storage with
    | None -> failwith ("id is not in the map", 0)
    | Some a -> a
  in
  let case_addr = match Map.find 1 storage with
    | None -> failwith ("id is not in the map", 1)
    | Some a -> a
  in
  let t = match a / 32 with
        | Some (q,r) -> if q = 0 then (if r <> 0p then 1 else 0)
                                  else (if r <> 0p then q + 1 else q)
        | None -> failwith "division by 0 should never happen"
  in
  let op_tplus1 = Contract.call
      ~dest:parent_addr
      ~entry:default
      ~amount:0tz
      ~parameter:a
  in
  let (_, emitted) = Loop.loop (fun (x, ops) ->
      let op = Contract.call
          ~dest:case_addr
          ~entry:default
          ~amount:0tz
          ~parameter:a in
      ( x < t, (x+1, op :: ops))
        ) (1, [op_tplus1])
  in
  (emitted, storage)
