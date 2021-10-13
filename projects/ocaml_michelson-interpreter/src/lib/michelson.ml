open Core
open Lexing

let parse (source : string) : AbsMichelson.prog =
  ParMichelson.pProg LexMichelson.token (Lexing.from_string source)

let run source parameter storage (data : Interpreter.tx_data) =
  let () = printf "Source:\n'%s' \nParameter: '%s' \nStorage: '%s' \n%!" source parameter storage in
  let prog = parse source in
  let param = parse param in
  let stor = parse store in
  Interpreter.interpret prog param stor data;

(*    Lexer.newLexer source
    |> Lexer.generateTokens

    let tokens = Lexer.generateTokens source in
(*    for i=0 to (List.length tokens - 1) do
        printf "%" tokens.
    done*)
    print_tokens tokens*)




