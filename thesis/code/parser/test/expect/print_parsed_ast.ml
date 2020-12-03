open Parsing
open Core
open Lexing

let print_position outx lexbuf =
  let pos = lexbuf.lex_curr_p in
  fprintf outx "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)

let parse_with_error lexbuf =
  try Parser.main Lexer.read lexbuf with
  | Lexer.SyntaxError msg ->
    fprintf stderr "%a: %s\n" print_position lexbuf msg;
    None
  | Parser.Error ->
    fprintf stderr "%a: syntax error\n" print_position lexbuf;
    None

let rec parse_and_print lexbuf =
  match parse_with_error lexbuf with
  | Some x ->
    Pp_ast.pp_ast Fmt.stdout x;
    parse_and_print lexbuf
  | None -> ()

let print_past input_str =
  let lexbuf = Lexing.from_string input_str in
  parse_and_print lexbuf

(*let () =
  print_past "(entrypoint none) (forall (b:bool)(assert b)))"*)
