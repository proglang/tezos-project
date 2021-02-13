open Tezos_client_007_PsDELPH1

let get_script string =
  let parsed = Michelson_v1_parser.parse_toplevel string in
  Lwt.return @@ Micheline_parser.no_parsing_error parsed
