open Core
open Lexing

let parse (source : string) : AbsMichelson.prog =
  ParMichelson.pProg LexMichelson.token (Lexing.from_string source)

let run source parameter storage env =
  let () = printf "Source:\n'%s' \nParameter: '%s' \nStorage: '%s' \n%!" source parameter storage in
  let prog = parse source in
  let param = parse parameter in
  let stor = parse storage in
  let new_storage : Value.value  = Interpreter.interpret prog param stor env in
  print_endline (Value.show_value new_storage);

(*    Lexer.newLexer source
    |> Lexer.generateTokens

    let tokens = Lexer.generateTokens source in
(*    for i=0 to (List.length tokens - 1) do
        printf "%" tokens.
    done*)
    print_tokens tokens*)




