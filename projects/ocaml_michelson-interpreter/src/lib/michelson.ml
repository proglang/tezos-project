open Core
(*open Lexing*)

(*
module Token = Token
module Lexer = Lexer

let rec print_tokens tokens = function
    | [] -> printf ""
    | hd :: tl -> printf "%s\n" (Token.tag_to_string hd); print_tokens tl*)

(*let parse (c : in_channel) : AbsMichelson.prog =
    ParMichelson.pProg LexMichelson.token (Lexing.from_channel c)
;;*)

let run source =
(*    Lexer.newLexer source
    |> Lexer.generateTokens

    let tokens = Lexer.generateTokens source in
(*    for i=0 to (List.length tokens - 1) do
        printf "%" tokens.
    done*)
    print_tokens tokens*)

    printf "'%s'\n%!" source
;;



