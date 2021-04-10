type storage = (int, address) map

let%entry default
      (a : int list)
      storage =
  let parent_addr = match Map.find 0 storage with
    | None -> failwith ("id is not in the map", 0)
    | Some a -> a
  in
  let case_addr = match Map.find 1 storage with
    | None -> failwith ("id is not in the map", 1)
    | Some a -> a
  in
  let t = match (List.length a) / 32p with
        | Some (q,r) -> if q = 0p then (if r <> 0p then 1p else 0p)
                                  else (if r <> 0p then q + 1p else q)
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
      ( x < t, (x+1p, op :: ops))
        ) (1p, [op_tplus1])
  in
  (emitted, storage)
