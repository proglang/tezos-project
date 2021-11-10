(*
(* TODO:
- Testfiles for each OPCode
- Run all testfiles with example input and compare expected output
 *)

open Core
open Base
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

let run_file filename parameter storage env =
  In_channel.with_file filename ~f:(fun file ->
  let source = String.concat ~sep:"\n" (In_channel.input_lines file)
  in
  let prog = parse source "Contract" in
  let param = parse parameter "Parameter" in
  let stor = parse storage "Storage" in
  let new_storage : value = Interpreter.interpret prog param stor env in
  Print.val_to_str new_storage
  )


let%expect_test "op_codes" =
  let env = "1;2;3;4;5;6;7;8;9" in
  print_endline (run_file "./test_files/contracts_alpha/opcodes/and.tz" "Pair True False" "Some True" env);

*)
