
let maybe_pprint_ep_mapping ~verbose mapping =
  let open Type_checker.Entrypoint_mapping in
  if verbose then pp_mapping Fmt.stdout mapping;
  Lwt.return mapping

let check_and_compile dao_t t_asts ~verbose =
  Tezos_ast.cast t_asts ~verbose
  |> Type_checker.type_check dao_t
  >>= fun mapping ->
  maybe_pprint_ep_mapping ~verbose mapping
  >>= fun _ -> return_unit
