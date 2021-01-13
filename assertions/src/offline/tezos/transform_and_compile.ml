
let transform_and_compile t_asts =
  Transformation.transform t_asts
  |> Transformation.print_transformation
