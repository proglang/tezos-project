type storage = (int, address) map

let%entry entrypointA
      (parameter : int list)
      storage =

      (* Retrieve address of assertion from storage *)
      let case_addr = match Map.find 1 storage with
        | None -> failwith ("id is not in the map", 1)
        | Some a -> a
      in
      let parent_addr = match Map.find 0 storage with
        | None -> failwith ("id is not in the map", 0)
        | Some a -> a
      in
      (* Calculate n *)
      let (n, _) = match (List.length parameter) / 32 with
        | Some qr -> qr
        | None -> failwith "division by 0 should never happen"
      in
      let op_nplus1 = Contract.call
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
          ( x > n, (x+1, op :: ops))
        ) (1, [op_nplus1])
      (internal_ops, storage )
