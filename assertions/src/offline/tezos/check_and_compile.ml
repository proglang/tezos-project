let maybe_pprint_ep_mapping ~verbose mapping =
  if verbose then Type_checker.pp_ep_assertion_map Fmt.stdout mapping;
  Lwt.return mapping

let check_and_compile dao_t t_asts ~verbose =
  Tezos_ast.cast t_asts ~verbose
  |> Type_checker.type_check dao_t
  >>= fun mapping ->
  maybe_pprint_ep_mapping ~verbose mapping
  >>= fun _ -> return_unit
