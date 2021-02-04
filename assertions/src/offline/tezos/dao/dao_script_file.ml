open Tezos_client_007_PsDELPH1

let read_toplevel path = let open Core in
                         In_channel.read_all path

let get_script ~path =
  let parsed = Michelson_v1_parser.parse_toplevel @@ read_toplevel path in
  Lwt.return @@ Micheline_parser.no_parsing_error parsed
