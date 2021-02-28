
let check_and_compile dao_t t_asts ~verbose =
  Tezos_ast.cast t_asts ~verbose
  |> Type_checker.type_check dao_t
  >>= fun _ -> return_unit
