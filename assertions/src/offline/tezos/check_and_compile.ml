open Cli_args

let maybe_pprint_ep_mapping ~verbose mapping =
  let open Type_checker.Entrypoint_mapping in
  if verbose then pp_mapping Fmt.stdout mapping;
  Lwt.return mapping

let check_and_compile args t_asts =
  let verbose = args.verbose in
  Tezos_ast.cast t_asts ~verbose
  |> Type_checker.type_check args.dao_contract
  >>= fun mapping ->
  maybe_pprint_ep_mapping ~verbose mapping
  >>= fun _ -> return_unit
