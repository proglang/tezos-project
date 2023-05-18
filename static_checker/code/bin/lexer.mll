{
open Parser
open Lexing
open Core

exception SyntaxError of string
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+
let string = [''']['a'-'z' 'A'-'Z' '0'-'9' '_' '-' ' ' '\t']*[''']
let newline = '\r' | '\n' | "\r\n"
let boolean = "true" | "false"
let instruction = ['A'-'Z' '_']+
let id = ['a'-'z' '_']*

rule read =
   parse 
   | white { read lexbuf }
   | newline { new_line lexbuf; read lexbuf }
   | "%" { PERCENT }
   | "(" { LPAREN }
   | ")" { RPAREN }
   | "[" { LEFT_BRACK }
   | "]" { RIGHT_BRACK }
   | "{" { LEFT_BRACE }
   | "}" { RIGHT_BRACE }
   | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
   | boolean       { BOOL (bool_of_string (Lexing.lexeme lexbuf)) }
   | ":"           { COLON }
   | ","           { COMMA }
   | ";"           { SEMICOLON }
   | ":="          { ASSIGN }
   | "var"         { VAR }
   | "int"         { TINT }
   | "bool"        { TBOOL }
   | "bytes"       { TBYTES }
   | "string"      { TSTRING }
   | "mutez"       { TMUTEZ }
   | "nat"         { TNAT }
   | "address"     { TADDRESS }
   | "chain_id"    { TCHAIN_ID }
   | "key"         { TKEY }
   | "key_hash"    { TKEY_HASH }
   | "operation"   { TOPERATION }
   | "signature"   { TSIGNATURE }
   | "timestamp"   { TTIMESTAMP }
   | "unit"        { TUNIT }
   | "list"        { TLIST }
   | "set"         { TSET }
   | "option"      { TOPTION }
   | "or"          { TOR }
   | "pair"        { TPAIR }
   | "lambda"      { TLAMBDA }
   | "map"         { TMAP }
   | "contract"    { TCONTRACT }
   | "big_map"     { TBIG_MAP }
   | "never"       { TNEVER }
   | "chest"       { TCHEST}
   | "chest_key"   { TCHEST_KEY}
   | "ttx_rollup_12_address" { TTX_ROLLUP_12_ADDRESS }
   | "bls12_381_g1"          { TBLS12_381_G1 }
   | "bls12_381_g1"          { TBLS12_381_G2 }
   | "bls12_381_fr"          { TBLS12_381_FR }
   | "ticket"                { TTICKET}
   | "sailing_transaction"   { TSALING_TRANSACTION }
   | "sailing_state"         { TSALING_STATE }
   | "Entrypoint"            { ENTRYPOINT }
   | "Code"                  { CODE}
   | "Storage"               { STORAGE }
   | "Parameter"             { PARAMETER }
   | "Pre-condition"         { PRECONDITION }
   | "Post-condition"        { POSTCONDITION }
   | "Requirement"           { REQUIREMENT }
   | "Input-stack"           { INPUTSTACK }
   | "Output-stack"          { OUTPUTSTACK }
   | "MContract"             {MYCONTRACT}
   | "With"                  {WITH}
   | "Left"        { LEFT }
   | "Right"       { RIGHT }
   | "Some"        { SOME }
   | "None"        { NONE }
   | "Unit"        { UNIT }
   | "Pair"        { PAIR }
   | "Contract"    { CONTRACT }
   | "Never"       { NEVER }
   | "Elt"         { ELT }
   | "Amount"      {AMOUNT}
   | "Balance"     {BALANCE}
   | "Chain_id"    {CHAIN_ID}
   | "Now"         {NOW}
   | "Sender"      {SENDER}
   | "Self"        {SELF}
   | "Self_address" {SELF_ADDRESS}
   | "Total_voting" {TOTAL_VOTING}
   | "Instr"       { INSTR }
   | "forall"      { FORALL }
   | "exists"      { EXISTS }
   | "abs"         { ABS }
   | "not"         { NOT }
   | "+"           { ADD }
   | "-"           { SUB }
   | "*"           { MUL }
   | "/"           { DIV }
   | "%"           { MOD }
   | "rem"         { REM }
   | "&&"          { AND }
   | "and"         { ASSERTAND }
   | "||"          { OR }
   | "|"           { CONCATASSERT }
   | "xor"         { XOR }
   | "=>"          { IMPLY }
   | "->"          { LEAD }
   | "="           { EQ }
   | "!="          { NEQ }
   | "<"           { LT }
   | ">"           { GT }
   | "<="          { LE }
   | ">="          { GE }
   | "size"        { LENGTH }
   | "len"         { LEN }
   | "sub_str"     { SUBSTRING }
   | "contain"     { CONTAIN }
   | "at"          { AT }
   | "is_nat"      { ISNAT }
   | "is_int"      { ISINT }
   | "select"      { SELECT }
   | "store"       { STORE }
   | "insert"      { INSERT }
   | "head"        { HEAD }
   | "tail"        { TAIL }
   | "first"       { FIRST }
   | "second"      { SECOND }
   | "contain"     { CONTAIN }
   | "to_int"      { TOINT }
   | "from_int"    { FROMINT }
   | "^"           { CONCAT }
   | "APPLY"                 { IAPPLY}
   | "EXEC"                  { IEXEC }
   | "FAILWITH"              { IFAILWITH }
   | "IF"                    { IIF }
   | "IF_CONS"               { IIF_CONS }
   | "IF_LEFT"               { IIF_LEFT }
   | "IF_NONE"               { IIF_NONE }
   | "ITER"                  { IITER }
   | "LAMBDA"                { ILAMBDA }
   | "LAMBDA_REC"            { ILAMBDA_REC }
   | "LOOP"                  { ILOOP }
   | "LOOP_LEFT"             { ILOOP_LEFT }
   | "INSTR"                 { IINSTR }
   | "EMPTY_INSTR"           { IEMPTY_INSTR }
   | "DIG"                   { IDIG }
   | "DIP"                   { IDIP }
   | "DROP"                  { IDROP }
   | "DUG"                   { IDUG }
   | "DUP"                   { IDUP }
   | "PUSH"                  { IPUSH }
   | "SWAP"                  { ISWAP }
   | "ABS"                   { IABS }
   | "ADD"                   { IADD }
   | "COMPARE"               { ICOMPARE }
   | "EDIV"                  { IEDIV }
   | "EQ"                    { IEQ }
   | "NEQ"                   { INEQ }
   | "GE"                    { IGE }
   | "GT"                    { IGT }
   | "INT"                   { IINT }
   | "LE"                    { ILE }
   | "LSL"                   { ILSL }
   | "LSR"                   { ILSR }
   | "LT"                    { ILT }
   | "MUL"                   { IMUL }
   | "NEG"                   { INEG }
   | "SUB"                   { ISUB }
   | "AND"                   { IAND }
   | "NOT"                   { INOT }
   | "OR"                    { IOR }
   | "XOR"                   { IXOR }
   | "BLAKE2B"               { IBLAKE2B }
   | "CHECK_SIGNATURE"       { ICHECK_SIGNATURE }
   | "HASH_KEY"              { IHASH_KEY }
   | "KECCAK"                { IKECCAK }
   | "PAIRING_CHECK"         { IPAIRING_CHECK }
   | "SHA256"                { ISHA256 }
   | "SHA3"                  { ISHA3 }
   | "SHA512"                { ISHA512 }
   | "ADDRESS"               { IADDRESS }
   | "AMOUNT"                { IAMOUNT }
   | "BALANCE"               { IBALANCE }
   | "CHAIN_ID"              { ICHAIN_ID }
   | "CONTRACT"              { ICONTRACT }
   | "IMPLICIT_ACCOUNT"      { IIMPLICIT_ACCOUNT }
   | "LEVEL"                 { ILEVEL }
   | "NOW"                   { INOW }
   | "SELF"                  { ISELF }
   | "SELF_ADDRESS"          { ISELF_ADDRESS }
   | "SENDER"                { ISENDER }
   | "SET_DELEGATE"          { ISET_DELEGATE }
   | "SOURCE"                { ISOURCE }
   | "TOTAL_VOTING_POWER"    { ITOTAL_VOTING_POWER }
   | "TRANSFER_TOKENS"       { ITRANSFER_TOKENS }
   | "VOTING_POWER"          { IVOTING_POWER }
   | "CAR"                   { ICAR }
   | "CDR"                   { ICDR }
   | "CONCAT"                { ICONCAT }
   | "CONS"                  { ICONS }
   | "EMPTY_BIG_MAP"         { IEMPTY_BIG_MAP }
   | "EMPTY_MAP"             { IEMPTY_MAP }
   | "EMPTY_SET"             { IEMPTY_SET }
   | "GET"                   { IGET }
   | "GET_AND_UPDATE"        { IGET_AND_UPDATE }
   | "LEFT"                  { ILEFT }
   | "MAP"                   { IMAP }
   | "MEM"                   { IMEM }
   | "NEVER"                 { INEVER }
   | "NIL"                   { INIL }
   | "NONE"                  { INONE } 
   | "PACK" { IPACK }
   | "PAIR" { IPAIR }
   | "RIGHT" { IRIGHT } 
   | "SIZE" { ISIZE }
   | "SLICE" { ISLICE }
   | "SOME" { ISOME }
   | "UNIT" { IUNIT }
   | "UNPACK" { IUNPACK } 
   | "UNPAIR" { IUNPAIR }
   | "UPDATE" { IUPDATE }
   | "JOINT_TICKETS" { IJOINT_TICKETS }
   | "READ_TICKETS" { IREAD_TICKETS }
   | "SPLIT_TICKET" { ISPLIT_TICKET }
   | "TICKET" { ITICKET }
   | id            {IDEN (Lexing.lexeme lexbuf)}
   | string        { STRING (Lexing.lexeme lexbuf)}
   | eof { EOF }
   | _             { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

