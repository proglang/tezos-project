type storage = unit

let%entry default
      (a : int)
      _ =
  if a <> a then failwith "assertion failed"; 
  ([], ())
