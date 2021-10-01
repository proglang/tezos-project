(*
open Base
open Core

(*
idea: central error handling here - call and propagate from main or interpreter
Errors defined in other files:
LexMichelson.mll/.ml: failwith
BNFC_Util exception Parse_error
- vgl TestMichelson.ml:
-with BNFC_Util.Parse_error (start_pos, end_pos) ->
-        Printf.printf "Parse error at %d.%d-%d.%d\n"
-            start_pos.pos_lnum (start_pos.pos_cnum - start_pos.pos_bol + 1)
-            end_pos.pos_lnum (end_pos.pos_cnum - end_pos.pos_bol + 1);
-        exit 1
ParMichelson.mli/ml: exception Error  (lexer error)
*)

(* NOTE can't use Scanner here because of cyclic dependencies *)

type parse_error = {
    line : int;
    lexeme : string;
    message : string
    }

type runtime_error = {
    where : int;
    message : string
    }

type type_error = {
    observed_type : Value.eval_type;
    expected_type : Value.eval_type
}

type error =
    | RuntimeError of runtime_error
    | TypeError of type_error

exception Parse_Error of parse_error
exception Runtime_Error of runtime_error
exception Type_Error of type_error


(* Simple Error indicator OPTIMIZE: maybe use exceptions with try/with clause instead  *)
let had_error = ref false
let had_runtime_error = ref false

(* Simple Error message for Michelson REPL *)
let report line where message =
    eprintf "Error %s, line %d, %s\n%!" where line message;
    had_error := true
;;

let error line message = report line "" message;;

let report_parse_error error =
    let { line; lexeme; message } = error in
    if String.equal lexeme "" (* for Eof *)
    then report line "at end" message
    else report line ("at '" ^ lexeme ^ "'") message
;;

let report_runtime_error (error : error) =
    match error with
    | Type_Error e ->
        eprintf
          "Type_Error: observed type %s but expected type %s\n%!"
          (Value.evalTypeToString e.observed_type)
          (Value.evalTypeToString e.expected_type);
        had_runtime_error := true
    | Runtime_Error e ->
        eprintf "Runtime_Error,line %d, %s\n%!" e.where e.message;
        had_runtime_error := true
;;


*)
