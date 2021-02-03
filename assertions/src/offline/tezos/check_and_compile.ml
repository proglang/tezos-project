type dao_type = DAO_File of string | DAO_Chain of string

let rec maybe_pprint_tezos_ast (asts : Tezos_ast.tezos_ast list) ~verbose =
  if verbose then
    begin
      match asts with
      | a :: rest -> Pp_tezos_ast.pp_ast Fmt.stdout a; (maybe_pprint_tezos_ast rest ~verbose)
      | [] -> asts
    end
  else asts

let check_and_compile t_asts ~verbose =
  Tezos_ast.cast t_asts
  |> maybe_pprint_tezos_ast ~verbose
  |> (fun _ -> ())
