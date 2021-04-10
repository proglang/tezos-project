type storage = unit

let%entry default
      (a : int list)
      _ =
  if 1 <> 1 then failwith "assertion failed"; 
  ([], ())
