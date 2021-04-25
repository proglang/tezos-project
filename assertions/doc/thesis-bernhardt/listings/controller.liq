(* 0 -> parent address; 1 -> assertion A address *)
type storage = (int, address) map

(* Entrypoint with assertion *)
let%entry entrypointA
      (parameter : int)
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
      (* n = parameter *)
      (* Calculate t assuming c = 1/e and thus t_total = n *)
      let t = match parameter / 32 with
        | Some (q,r) -> if q = 0
                        then (if r <> 0p then 1 else 0)
                        else (if r <> 0p then q + 1 else q)
        | None -> failwith "division by 0 should never happen"
      in
      (* Add operation t+1 first, so that it is last in the execution queue *)
      let op_tplus1 = Contract.call
            ~dest:parent_addr
            ~entry:default
            ~amount:(Current.amount ())
            ~parameter
      in
      let (_, internal_ops) =
        (* generate t internal calls to assertion contract *)
        Loop.loop (fun (x, ops) ->
          let op = Contract.call
            ~dest:case_addr
            ~entry:default
            ~amount:0tz
            ~parameter in
          ( x < t, (x + 1, op :: ops))
        ) (0, [op_tplus1])
      in
      (internal_ops, storage)

(* Entrypoint without assertion *)
let%entry entrypointB
  (parameter : string)
  storage =
  (* Retrieve address of parent from storage *)
  let parent_addr = match Map.find 0 storage with
    | None -> failwith ("id is not in the map", 0)
    | Some a -> a
  in
  (* Call the parent contract *)
  let op = Contract.call
        ~dest:parent_addr
        ~entry:default
        ~amount:(Current.amount())
        ~parameter
  in
  ([op], storage)

