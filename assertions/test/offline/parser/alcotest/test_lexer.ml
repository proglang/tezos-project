open Parsing
open Pp_parser_tokens

open Parser

let parser_token_testable =
  Alcotest.testable pprint_tokens (fun token1 token2 -> token1 = token2)

let test_illegal_character () =
  Alcotest.check_raises "Syntax Error" (Lexer.SyntaxError ("Illegal string character: " ^ "\\"))
    (fun () -> ignore (Lexer.read (Lexing.from_string ("\"\\" ^ "\\" ^ "\\\"")) : Parser.token))

let test_unterminated_str () =
  Alcotest.check_raises "Syntax Error" (Lexer.SyntaxError "String is not terminated")
    (fun () -> ignore (Lexer.read (Lexing.from_string ("\"lalala")) : Parser.token))  

let test_unexpected_char () =
    Alcotest.check_raises "Syntax Error" (Lexer.SyntaxError ("Unexpected char: " ^ "?"))
    (fun () -> ignore (Lexer.read (Lexing.from_string ("?")) : Parser.token))  

let test_lex_token (input_str, token) =
  Alcotest.(check parser_token_testable)
    "same token" token
    (Lexer.read (Lexing.from_string input_str))

let lex_token_test_cases =
  let open Core in
  let open Alcotest in
  List.map
    ~f:(fun (input_str, expected_token) ->
      test_case ("Lex token " ^ input_str) `Quick (fun () ->
          test_lex_token (input_str, expected_token)))
    [ ("(", Parser.LPAREN); (")", RPAREN); ("[", LBRACKET); ("]", RBRACKET);
      ("true", TRUE); ("false", FALSE); ("_", WILDCARD); (":", COLON);
      ("%", PERCENT); ("int", INT_T); ("bool", BOOL_T); ("bytes", BYTES_T);
      ("nat", NAT_T); ("address", ADDRESS_T); ("chain_id", CHAINID_T);
      ("key", KEY_T); ("key_hash", KEYHASH_T); ("operation", OP_T);
      ("signature", SIG_T); ("timestamp", TIMESTAMP_T); ("unit", UNIT_T);
      ("list", LIST_T); ("set", SET_T); ("option", OPTION_T);("pair", PAIR_T);
      ("lambda", LAMBDA_T); ("map", MAP_T); ("contract", CONTRACT_T);
      ("big_map", BIGMAP_T); ("cons", CONS); ("nil", NIL); ("some", SOME);
      ("none", NONE); ("left", LEFT); ("right", RIGHT); ("fmu", FMU_T);
      ("entrypoint", ENTRYPOINT); ("forall", FORALL); ("exists", EXISTS);
      ("if", IF); ("assert", ASSERT); ("size", SIZE); ("abs", ABS);
      ("neg", NEG); ("not", NOT); ("nth", NTH); ("add", ADD); ("sub", SUB);
      ("mul", MUL); ("div", DIV); ("mod", MOD); ("or", OR); ("and", AND);
      ("xor", XOR); ("lsl", LSL); ("lsr", LSR); ("eq", EQ); ("neq", NEQ);
      ("lt", LT); ("gt", GT); ("le", LE); ("ge", GE); ("slice", SLICE)]

let test_lex_int =
  QCheck.Test.make ~count:100 ~name:"Lex integers"
    QCheck.(int)
    (fun i -> INT (abs i) = Lexer.read (Lexing.from_string (Int.to_string (abs i))))

let test_lex_string () = test_lex_token ("\"something here\"", STRING "something here")
let test_lex_string_newline () = test_lex_token ("\"\n\"", STRING "\n")
let test_lex_whitespace () = test_lex_token ("\" \"", STRING " ")
let test_lex_eof () = test_lex_token ("", EOF)
let test_lex_newline () = test_lex_token ("\n", EOF)

let () =
  let open Core in
  let qcheck_lex = List.map ~f:QCheck_alcotest.to_alcotest [test_lex_int] in
  let open Alcotest in
  run "Lexer"
    [ ( "Syntax Errors"
      , [test_case "Illegal string character" `Quick test_illegal_character;
         test_case "String is not terminated" `Quick test_unterminated_str;
         test_case "Unexpected char" `Quick test_unexpected_char] )
    ; ( "Accepted Tokens"
      , List.concat
          [ lex_token_test_cases
          ; [ test_case "Lex whitespace" `Quick test_lex_whitespace
            ; test_case "Lex eof" `Quick test_lex_eof
            ; test_case "Lex new line" `Quick test_lex_newline
            ; test_case "Lex string" `Quick test_lex_string
            ; test_case "Lex string newline" `Quick test_lex_string_newline ]
          ; qcheck_lex ] ) ]
