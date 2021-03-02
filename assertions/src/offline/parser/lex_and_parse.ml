open Core
open Lexing

let print_position lexbuf =
  let pos = lexbuf.lex_curr_p in
  Fmt.str "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)

let parse_with_error lexbuf =
  try Parser.main Lexer.read lexbuf with
  | Lexer.SyntaxError msg ->
     let error_msg = Fmt.str "Lexing the assertion failed. @.--- @.%s: %s@." (print_position lexbuf) msg in
     failwith error_msg
  | Parser.Error ->
     let error_msg = Fmt.str "Parsing the assertion failed. @.--- @.%s: syntax error\n" (print_position lexbuf) in
     failwith error_msg

let parse_contract input_str =
  let lexbuf = Lexing.from_string input_str in
  let rec rec_parse_contract lxbf = 
  match parse_with_error lxbf with
  | Some x -> (x :: (rec_parse_contract lxbf))
  | None -> []
  in
  rec_parse_contract lexbuf
