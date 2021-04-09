type storage = (int, address) map

let%entry entrypointB
  (parameter : int list)
  storage =

  (* Retrieve address of parent from storage *)
  let parent_addr = match Map.find 0 storage with
    | None -> failwith ("id is not in the map", 0)
    | Some a -> a
  in
  let op = Contract.call
        ~dest:parent_addr
        ~entry:default
        ~amount:0tz
        ~parameter
  in
  ([op], storage)

