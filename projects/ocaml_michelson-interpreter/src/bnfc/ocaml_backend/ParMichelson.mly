/* File generated by the BNF Converter (bnfc 2.9.3). */

/* Parser definition for use with ocamlyacc */
%{
open AbsMichelson
open Lexing

%}

%token KW_parameter KW_storage KW_code KW_Unit KW_True KW_False KW_Pair KW_Left KW_Right KW_Some KW_None KW_Elt KW_DROP KW_DUP KW_SWAP KW_DIG KW_DUG KW_PUSH KW_SOME KW_NONE KW_UNIT KW_NEVER KW_IF_NONE KW_PAIR KW_CAR KW_CDR KW_UNPAIR KW_LEFT KW_RIGHT KW_IF_LEFT KW_NIL KW_CONS KW_IF_CONS KW_SIZE KW_EMPTY_SET KW_EMPTY_MAP KW_EMPTY_BIG_MAP KW_MAP KW_ITER KW_MEM KW_GET KW_UPDATE KW_IF KW_LOOP KW_LOOP_LEFT KW_LAMBDA KW_EXEC KW_APPLY KW_DIP KW_FAILWITH KW_CAST KW_RENAME KW_CONCAT KW_SLICE KW_PACK KW_UNPACK KW_ADD KW_SUB KW_MUL KW_EDIV KW_ABS KW_ISNAT KW_INT KW_NEG KW_LSL KW_LSR KW_OR KW_AND KW_XOR KW_NOT KW_COMPARE KW_EQ KW_NEQ KW_LT KW_GT KW_LE KW_GE KW_SELF KW_SELF_ADDRESS KW_CONTRACT KW_TRANSFER_TOKENS KW_SET_DELEGATE KW_CREATE_CONTRACT KW_IMPLICIT_ACCOUNT KW_VOTING_POWER KW_NOW KW_LEVEL KW_AMOUNT KW_BALANCE KW_CHECK_SIGNATURE KW_BLAKE2B KW_KECCAK KW_SHA3 KW_SHA256 KW_SHA512 KW_HASH_KEY KW_SOURCE KW_SENDER KW_ADDRESS KW_CHAIN_ID KW_TOTAL_VOTING_POWER KW_PAIRING_CHECK KW_SAPLING_EMPTY_STATE KW_SAPLING_VERIFY_UPDATE KW_TICKET KW_READ_TICKET KW_SPLIT_TICKET KW_JOIN_TICKETS KW_OPEN_CHEST KW_IFCMPEQ KW_IFCMPNEQ KW_IFCMPLT KW_IFCMPGT KW_IFCMPLE KW_IFCMPGE KW_IF_SOME KW_operation KW_contract KW_option KW_list KW_set KW_ticket KW_pair KW_or KW_lambda KW_map KW_big_map KW_bls12_381_g1 KW_bls12_381_g2 KW_bls12_381_fr KW_sapling_transaction KW_sapling_state KW_chest KW_chest_key KW_unit KW_never KW_bool KW_int KW_nat KW_string KW_chain_id KW_bytes KW_mutez KW_key_hash KW_key KW_signature KW_timestamp KW_address

%token SYMB1 /* ; */
%token SYMB2 /* { */
%token SYMB3 /* } */
%token SYMB4 /* - */
%token SYMB5 /* ( */
%token SYMB6 /* ) */

%token TOK_EOF
%token <string> TOK_Ident
%token <char> TOK_Char
%token <float> TOK_Double
%token <int> TOK_Integer
%token <string> TOK_String
%token <string> TOK_Str
%token <string> TOK_Hex

%start pProg
%type <AbsMichelson.prog> pProg


%%
pProg : prog TOK_EOF { $1 }
  | error { raise (BNFC_Util.Parse_error ($symbolstartpos, $endpos)) };


prog : prog SYMB1 {  $1 }
  | KW_parameter typ SYMB1 KW_storage typ SYMB1 KW_code SYMB2 instr_list SYMB3 { Contract ($2, $5, $9) }
  | instr_list { Code $1 }
;

data_list : /* empty */ { []  }
  | data SYMB1 data_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

data : inte { DInt $1 }
  | str { DStr $1 }
  | hex { DByte $1 }
  | KW_Unit { DUnit  }
  | KW_True { DTrue  }
  | KW_False { DFalse  }
  | KW_Pair pair { DPair $2 }
  | KW_Left data { DLeft $2 }
  | KW_Right data { DRight $2 }
  | KW_Some data { DSome $2 }
  | KW_None { DNone  }
  | SYMB2 data_list SYMB3 { DBlock $2 }
  | SYMB2 map_list SYMB3 { DMap $2 }
  | instr { DInstruction $1 }
;

pair_list : /* empty */ { []  }
  | pair pair_list { (fun (x,xs) -> x::xs) ($1, $2) }
;

pair : data data { DPairSeq1 ($1, $2) }
  | data data_list { DPairSeq2 ($1, $2) }
;

map_list : /* empty */ { []  }
  | map { (fun x -> [x]) $1 }
  | map SYMB1 map_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

map : KW_Elt data data SYMB1 { DMapSeq ($2, $3) }
;

inte : int { DIntPos $1 }
  | SYMB4 int { DIntNeg $2 }
;

instr_list : /* empty */ { []  }
  | instr { (fun x -> [x]) $1 }
  | instr SYMB1 instr_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

instr : instr SYMB1 {  $1 }
  | SYMB2 instr_list SYMB3 { BLOCK $2 }
  | KW_DROP { DROP  }
  | KW_DROP int { DROP_N $2 }
  | KW_DUP { DUP  }
  | KW_DUP int { DUP_N $2 }
  | KW_SWAP { SWAP  }
  | KW_DIG int { DIG_N $2 }
  | KW_DUG int { DUG_N $2 }
  | KW_PUSH typ data { PUSH ($2, $3) }
  | KW_SOME { SOME  }
  | KW_NONE typ { NONE $2 }
  | KW_UNIT { UNIT  }
  | KW_NEVER { NEVER  }
  | KW_IF_NONE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { IF_NONE ($3, $6) }
  | KW_PAIR { PAIR  }
  | KW_PAIR int { PAIR_N $2 }
  | KW_CAR { CAR  }
  | KW_CDR { CDR  }
  | KW_UNPAIR { UNPAIR  }
  | KW_UNPAIR int { UNPAIR_N $2 }
  | KW_LEFT typ { LEFT $2 }
  | KW_RIGHT typ { RIGHT $2 }
  | KW_IF_LEFT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { IF_LEFT ($3, $6) }
  | KW_NIL typ { NIL $2 }
  | KW_CONS { CONS  }
  | KW_IF_CONS SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { IF_CONS ($3, $6) }
  | KW_SIZE { SIZE  }
  | KW_EMPTY_SET cTyp { EMPTY_SET $2 }
  | KW_EMPTY_MAP cTyp typ { EMPTY_MAP ($2, $3) }
  | KW_EMPTY_BIG_MAP cTyp typ { EMPTY_BIG_MAP ($2, $3) }
  | KW_MAP SYMB2 instr_list SYMB3 { MAP $3 }
  | KW_ITER SYMB2 instr_list SYMB3 { ITER $3 }
  | KW_MEM { MEM  }
  | KW_GET { GET  }
  | KW_GET int { GET_N $2 }
  | KW_UPDATE { UPDATE  }
  | KW_UPDATE int { UPDATE_N $2 }
  | KW_IF SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { IF ($3, $6) }
  | KW_LOOP SYMB2 instr_list SYMB3 { LOOP $3 }
  | KW_LOOP_LEFT SYMB2 instr_list SYMB3 { LOOP_LEFT $3 }
  | KW_LAMBDA typ typ SYMB2 instr_list SYMB3 { LAMBDA ($2, $3, $5) }
  | KW_EXEC { EXEC  }
  | KW_APPLY { APPLY  }
  | KW_DIP SYMB2 instr_list SYMB3 { DIP $3 }
  | KW_DIP int SYMB2 instr_list SYMB3 { DIP_N ($2, $4) }
  | KW_FAILWITH { FAILWITH  }
  | KW_CAST { CAST  }
  | KW_RENAME { RENAME  }
  | KW_CONCAT { CONCAT  }
  | KW_SLICE { SLICE  }
  | KW_PACK { PACK  }
  | KW_UNPACK typ { UNPACK $2 }
  | KW_ADD { ADD  }
  | KW_SUB { SUB  }
  | KW_MUL { MUL  }
  | KW_EDIV { EDIC  }
  | KW_ABS { ABS  }
  | KW_ISNAT { SNAT  }
  | KW_INT { INT  }
  | KW_NEG { NEG  }
  | KW_LSL { LSL  }
  | KW_LSR { LSR  }
  | KW_OR { OR  }
  | KW_AND { AND  }
  | KW_XOR { XOR  }
  | KW_NOT { NOT  }
  | KW_COMPARE { COMPARE  }
  | KW_EQ { EQ  }
  | KW_NEQ { NEQ  }
  | KW_LT { LT  }
  | KW_GT { GT  }
  | KW_LE { LE  }
  | KW_GE { GE  }
  | KW_SELF { SELF  }
  | KW_SELF_ADDRESS { SELF_ADDRESS  }
  | KW_CONTRACT typ { CONTRACT $2 }
  | KW_TRANSFER_TOKENS { TRANSFER_TOKENS  }
  | KW_SET_DELEGATE { SET_DELEGATE  }
  | KW_CREATE_CONTRACT SYMB2 instr_list SYMB3 { CREATE_CONTRACT $3 }
  | KW_IMPLICIT_ACCOUNT { IMPLICIT_ACCOUNT  }
  | KW_VOTING_POWER { VOTING_POWER  }
  | KW_NOW { NOW  }
  | KW_LEVEL { LEVEL  }
  | KW_AMOUNT { AMOUNT  }
  | KW_BALANCE { BALANCE  }
  | KW_CHECK_SIGNATURE { CHECK_SIGNATURE  }
  | KW_BLAKE2B { BLAKE2B  }
  | KW_KECCAK { KECCAK  }
  | KW_SHA3 { SHA3  }
  | KW_SHA256 { SHA256  }
  | KW_SHA512 { SHA512  }
  | KW_HASH_KEY { HASH_KEY  }
  | KW_SOURCE { SOURCE  }
  | KW_SENDER { SENDER  }
  | KW_ADDRESS { ADDRESS  }
  | KW_CHAIN_ID { CHAIN_ID  }
  | KW_TOTAL_VOTING_POWER { TOTAL_VOTING_POWER  }
  | KW_PAIRING_CHECK { PAIRING_CHECK  }
  | KW_SAPLING_EMPTY_STATE int { SAPLING_EMPTY_STATE $2 }
  | KW_SAPLING_VERIFY_UPDATE { SAPLING_VERIFY_UPDATE  }
  | KW_TICKET { TICKET  }
  | KW_READ_TICKET { READ_TICKET  }
  | KW_SPLIT_TICKET { SPLIT_TICKET  }
  | KW_JOIN_TICKETS { JOIN_TICKETS  }
  | KW_OPEN_CHEST { OPEN_CHEST  }
  | KW_IFCMPEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPEQ ($3, $6) }
  | KW_IFCMPNEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPNEQ ($3, $6) }
  | KW_IFCMPLT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPLT ($3, $6) }
  | KW_IFCMPGT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPGT ($3, $6) }
  | KW_IFCMPLE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPLE ($3, $6) }
  | KW_IFCMPGE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IFCMPGE ($3, $6) }
  | KW_IF_SOME SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { m_IF_SOME ($3, $6) }
;

typeSeq : typ typ { TTypSeq1 ($1, $2) }
  | typ typeSeq { TTypSeq2 ($1, $2) }
;

typ : SYMB5 typ SYMB6 {  $2 }
  | cTyp { TCtype $1 }
  | KW_operation { TOperation  }
  | KW_contract typ { TContract $2 }
  | KW_option typ { TOption $2 }
  | KW_list typ { TList $2 }
  | KW_set cTyp { TSet $2 }
  | KW_ticket cTyp { TTicket $2 }
  | KW_pair typeSeq { TPair $2 }
  | KW_or typ typ { TOr ($2, $3) }
  | KW_lambda typ typ { TLambda ($2, $3) }
  | KW_map cTyp typ { TMap ($2, $3) }
  | KW_big_map cTyp typ { TBig_map ($2, $3) }
  | KW_bls12_381_g1 { TBls_g1  }
  | KW_bls12_381_g2 { TBls_g2  }
  | KW_bls12_381_fr { TBls_fr  }
  | KW_sapling_transaction int { TSapling_transaction $2 }
  | KW_sapling_state int { TSapling_state $2 }
  | KW_chest { TChest  }
  | KW_chest_key { TChest_key  }
;

cTypeSeq : cTyp cTyp { CTypSeq1 ($1, $2) }
  | cTyp cTypeSeq { CTypSeq2 ($1, $2) }
;

cTyp : KW_unit { CUnit  }
  | KW_never { CNever  }
  | KW_bool { CBool  }
  | KW_int { CInt  }
  | KW_nat { CNat  }
  | KW_string { CString  }
  | KW_chain_id { CChain_id  }
  | KW_bytes { CBytes  }
  | KW_mutez { CMutez  }
  | KW_key_hash { CKey_hash  }
  | KW_key { CKey  }
  | KW_signature { CSignature  }
  | KW_timestamp { CTimestamp  }
  | KW_address { CAddress  }
  | KW_option cTyp { COption $2 }
  | KW_or cTyp cTyp { COr ($2, $3) }
  | KW_pair cTypeSeq { CPair $2 }
;


int :  TOK_Integer  { $1 };
str : TOK_Str { Str ($1)};
hex : TOK_Hex { Hex ($1)};


