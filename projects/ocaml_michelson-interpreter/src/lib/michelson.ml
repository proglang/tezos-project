open Core
open Lexing
open Value

let parse (source : string) (err : string) : AbsMichelson.prog =
  try
  	ParMichelson.pProg LexMichelson.token (Lexing.from_string source)
  with
    | BNFC_Util.Parse_error (start_pos, end_pos) ->
      printf "Parse error of %s at %d.%d-%d.%d\n"
          err
          start_pos.pos_lnum (start_pos.pos_cnum - start_pos.pos_bol + 1)
          end_pos.pos_lnum (end_pos.pos_cnum - end_pos.pos_bol + 1);
      exit 1
    | Failure _ -> (* (Failure "lexing: empty token") *)
      printf "Lexing error: unknown sequence in given %s" err;
      exit 1
    | e -> raise e


let run source parameter storage env =
  let () = printf "Contract:\n'\n%s\n' \nParameter: '%s' \nStorage: '%s' \n\n%!" source parameter storage in
  let prog = parse source "Contract" in
  let param = parse parameter "Parameter" in
  let stor = parse storage "Storage" in
  let new_storage : value  = Interpreter.interpret prog param stor env in
  print_endline (Print.val_to_str new_storage);