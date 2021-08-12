open Core
open Parsing.Lex_and_parse
open Parsing


let get_contents = function
  | None | Some "-" ->
    In_channel.input_all In_channel.stdin
  | Some filename ->
    In_channel.read_all filename

(* read contract_module file and print as json *)
let read_and_print filename =
  let contract = get_contents filename in
  let asts = parse_contract contract in
  let jsons = List.map asts ~f:Contract_module_j.string_of_contract_module_ast in
  (List.iter jsons ~f:print_string; Out_channel.newline Out_channel.stdout)

let command =
  Command.basic
    ~summary:"Generate json from contract module file"
    Command.Let_syntax.(
      let%map_open filename =
        anon (maybe ("filename" %: Filename.arg_type))
      in
      fun () -> read_and_print filename)
    
let () =
  Command.run ~version:"0.1" command
