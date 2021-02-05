let transform asts =
  Transformation.transform asts ~verbose:true
  |> (fun _ -> ())
