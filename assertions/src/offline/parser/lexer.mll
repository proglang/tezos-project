{
open Lexing
open Parser
open Core

exception SyntaxError of string

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let int = ['0'-'9'] ['0'-'9']*

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
                                        
let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
let wildcard = '_'
let colon = ':'
let percent = '%'

rule read =
  parse
  | white         { read lexbuf }
  | newline       { next_line lexbuf; read lexbuf }
  | int           { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | "true"        { TRUE }
  | "false"       { FALSE }
  | '"'           { read_string (Buffer.create 17) lexbuf }
  | '('           { LPAREN }
  | ')'           { RPAREN }
  | '['           { LBRACKET }
  | ']'           { RBRACKET }
  | wildcard      { WILDCARD }
  | colon         { COLON }
  | percent       { PERCENT }
  | "int"         { INT_T }
  | "bool"        { BOOL_T }
  | "bytes"       { BYTES_T }
  | "string"      { STRING_T }
  | "fmu"         { FMU_T }
  | "nat"         { NAT_T }
  | "address"     { ADDRESS_T }
  | "chain_id"    { CHAINID_T }
  | "key"         { KEY_T }
  | "key_hash"    { KEYHASH_T }
  | "operation"   { OP_T }
  | "signature"   { SIG_T }
  | "timestamp"   { TIMESTAMP_T }
  | "unit"        { UNIT_T }
  | "list"        { LIST_T }
  | "set"         { SET_T }
  | "option"      { OPTION_T }
  | "or"          { OR }
  | "pair"        { PAIR_T }
  | "lambda"      { LAMBDA_T }
  | "map"         { MAP_T }
  | "contract"    { CONTRACT_T }
  | "big_map"     { BIGMAP_T }
  | "cons"        { CONS }
  | "nil"         { NIL }
  | "some"        { SOME }
  | "none"        { NONE }
  | "left"        { LEFT }
  | "right"       { RIGHT }
  | "entrypoint"  { ENTRYPOINT }
  | "forall"      { FORALL }
  | "exists"      { EXISTS }
  | "if"          { IF }
  | "assert"      { ASSERT }
  | "size"        { SIZE }
  | "abs"         { ABS }
  | "neg"         { NEG }
  | "not"         { NOT }
  | "nth"         { NTH }
  | "add"         { ADD }
  | "sub"         { SUB }
  | "mul"         { MUL }
  | "div"         { DIV }
  | "mod"         { MOD }
  | "and"         { AND }
  | "xor"         { XOR }
  | "lsl"         { LSL }
  | "lsr"         { LSR }
  | "eq"          { EQ }
  | "neq"         { NEQ }
  | "lt"          { LT }
  | "gt"          { GT }
  | "le"          { LE }
  | "ge"          { GE }
  | "slice"       { SLICE }
  | id            { IDENT (Lexing.lexeme lexbuf)}
  | _             { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof           { EOF }

and read_string buf =
  parse
  | '"'       { STRING (Buffer.contents buf) }
  | '\\' '/'  { Buffer.add_char buf '/'; read_string buf lexbuf }
  | '\\' '\\' { Buffer.add_char buf '\\'; read_string buf lexbuf }
  | '\\' 'b'  { Buffer.add_char buf '\b'; read_string buf lexbuf }
  | '\\' 'f'  { Buffer.add_char buf '\012'; read_string buf lexbuf }
  | '\\' 'n'  { Buffer.add_char buf '\n'; read_string buf lexbuf }
  | '\\' 'r'  { Buffer.add_char buf '\r'; read_string buf lexbuf }
  | '\\' 't'  { Buffer.add_char buf '\t'; read_string buf lexbuf }
  | [^ '"' '\\']+
    { Buffer.add_string buf (Lexing.lexeme lexbuf);
      read_string buf lexbuf
    }
  | _ { raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof { raise (SyntaxError ("String is not terminated")) }
