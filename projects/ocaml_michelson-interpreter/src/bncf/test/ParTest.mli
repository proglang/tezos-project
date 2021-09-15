
(* The type of tokens. *)

type token = 
  | TOK_String of (string)
  | TOK_Nat of (string)
  | TOK_Integer of (int)
  | TOK_Int of (string)
  | TOK_Ident of (string)
  | TOK_EOF
  | TOK_Double of (float)
  | TOK_Char of (char)
  | SYMB1
  | KW_int
  | KW_PUSH
  | KW_DROP

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val pProg: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (AbsTest.prog)
