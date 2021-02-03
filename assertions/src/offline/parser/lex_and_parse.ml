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

(*
let rec rec_parse_and_print lexbuf =
  match parse_with_error lexbuf with
  | Some x ->
    Pp_ast.pp_ast Fmt.stdout x;
    rec_parse_and_print lexbuf
  | None -> ()

let parse_and_print input_str =
  let lexbuf = Lexing.from_string input_str in
  rec_parse_and_print lexbuf
*)

let maybe_pprint_ast a ~verbose =
  if verbose then (Pp_ast.pp_ast Fmt.stdout a; ())
  else ()

let parse_contract input_str ~verbose =
  let lexbuf = Lexing.from_string input_str in
  let rec rec_parse_contract lxbf = 
  match parse_with_error lxbf with
  | Some x ->
     maybe_pprint_ast x ~verbose;
     (x :: (rec_parse_contract lxbf))
  | None -> []
  in
  rec_parse_contract lexbuf
