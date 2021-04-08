type storage = (int, address) map

let%entry entrypointA
      (param : int list)
      storage =

      (* Retrieve address of assertion from storage *)
      let case_addr = match Map.find 1 storage with
        | None -> failwith ("id is not in the map", 1)
        | Some a -> a
      in
      (* Retrieve address of parent from storage *)
      let parent_addr = match Map.find 0 storage with
        | None -> failwith ("id is not in the map", 0)
        | Some a -> a
      in
      (* Calculate t assuming c = 1/e and thus t_total = n *)
      let (t, _) = match (List.length parameter) / 32 with
        | Some qr -> qr
        | None -> failwith "division by 0 should never happen"
      in
      (* Add operation t+1 first, so that it is last in the execution queue *)
      let op_tplus1 = Contract.call
            ~dest:parent_addr
            ~entry:default
            ~amount:0tz
            ~parameter
      in
      let (_, internal_ops) =
        Loop.loop (fun (x, ops) ->
	  (* call assertion contract *)
          let op = Contract.call
            ~dest:case_addr
            ~entry:default
            ~amount:0tz
            ~parameter in
          ( x > t, (x+1, op :: ops))
        ) (1, [op_tplus1])
      in
      (internal_ops, storage)
