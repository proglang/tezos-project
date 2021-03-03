(** This is the entrypoint to the Tezos Backend *)

open Cli_args
open SyncAPIV1

let maybe_pprint_ast ~verbose asts =
  let rec print = function
    | a :: rest -> Tezos_ast.Pp_ast.pp_ast Fmt.stdout a; print rest
    | [] -> ()
  in
  if verbose then (print asts; asts) else asts

let maybe_pprint_ep_mapping ~verbose mapping =
  let open Type_checker.Entrypoint_mapping in
  if verbose then pp_mapping Fmt.stdout mapping;
  Lwt.return mapping

(* Configures API according to the CLI args *)
let configure_api port basedir v =
  if Option.is_some port then Api.set_port @@ Option.get port;
  if Option.is_some basedir then Api.set_basedir @@ Option.get basedir;
  Api.set_debugmode v

(* Change return type from unit Lwt.t to unit? *)
let check_and_compile args t_asts =
  configure_api
    args.node_port
    args.node_basedir
    args.tezos_api_verbose;
  let verbose = args.verbose in
  (* Cast the ASTs from the union AST to the Tezos specific AST *)
  Tezos_ast.cast t_asts
  |> maybe_pprint_ast ~verbose
  (* Checks if the entrypoints of the assertions and the contract match and returns
     an unambiguous assignment for the compilation *)
  |> Type_checker.type_check args.dao_contract
  >>= fun mapping ->
  maybe_pprint_ep_mapping ~verbose mapping
  >>= fun _ ->
  (* Call compiler here *)
  return_unit
