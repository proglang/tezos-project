open Core

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
    | e -> raise e (* propagate other errors (that should not occur  *)