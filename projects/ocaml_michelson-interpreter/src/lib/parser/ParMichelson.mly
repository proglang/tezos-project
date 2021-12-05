/* File generated by the BNF Converter (bnfc 2.9.3). */

/* Parser definition for use with ocamlyacc */
%{
open AbsMichelson
open Lexing

%}

%token KW_parameter KW_storage KW_code KW_Unit KW_True KW_False KW_Pair KW_Left KW_Right KW_Some KW_None KW_Elt KW_DROP KW_DUP KW_SWAP KW_DIG KW_DUG KW_PUSH KW_SOME KW_NONE KW_UNIT KW_NEVER KW_IF_NONE KW_PAIR KW_CAR KW_CDR KW_UNPAIR KW_LEFT KW_RIGHT KW_IF_LEFT KW_NIL KW_CONS KW_IF_CONS KW_SIZE KW_EMPTY_SET KW_EMPTY_MAP KW_EMPTY_BIG_MAP KW_MAP KW_ITER KW_MEM KW_GET KW_UPDATE KW_GET_AND_UPDATE KW_IF KW_LOOP KW_LOOP_LEFT KW_LAMBDA KW_EXEC KW_APPLY KW_DIP KW_FAILWITH KW_CAST KW_RENAME KW_CONCAT KW_SLICE KW_PACK KW_UNPACK KW_ADD KW_SUB KW_MUL KW_EDIV KW_ABS KW_ISNAT KW_INT KW_NEG KW_LSL KW_LSR KW_OR KW_AND KW_XOR KW_NOT KW_COMPARE KW_EQ KW_NEQ KW_LT KW_GT KW_LE KW_GE KW_SELF KW_SELF_ADDRESS KW_CONTRACT KW_TRANSFER_TOKENS KW_SET_DELEGATE KW_CREATE_CONTRACT KW_IMPLICIT_ACCOUNT KW_VOTING_POWER KW_NOW KW_LEVEL KW_AMOUNT KW_BALANCE KW_CHECK_SIGNATURE KW_BLAKE2B KW_KECCAK KW_SHA3 KW_SHA256 KW_SHA512 KW_HASH_KEY KW_SOURCE KW_SENDER KW_ADDRESS KW_CHAIN_ID KW_TOTAL_VOTING_POWER KW_PAIRING_CHECK KW_SAPLING_EMPTY_STATE KW_SAPLING_VERIFY_UPDATE KW_TICKET KW_READ_TICKET KW_SPLIT_TICKET KW_JOIN_TICKETS KW_OPEN_CHEST KW_FAIL KW_CMPEQ KW_CMPNEQ KW_CMPLT KW_CMPGT KW_CMPLE KW_CMPGE KW_IFEQ KW_IFNEQ KW_IFLT KW_IFGT KW_IFLE KW_IFGE KW_IFCMPEQ KW_IFCMPNEQ KW_IFCMPLT KW_IFCMPGT KW_IFCMPLE KW_IFCMPGE KW_ASSERT KW_ASSERT_EQ KW_ASSERT_NEQ KW_ASSERT_LT KW_ASSERT_GT KW_ASSERT_LE KW_ASSERT_GE KW_ASSERT_CMPEQ KW_ASSERT_CMPNEQ KW_ASSERT_CMPLT KW_ASSERT_CMPGT KW_ASSERT_CMPLE KW_ASSERT_CMPGE KW_ASSERT_NONE KW_ASSERT_SOME KW_ASSERT_LEFT KW_ASSERT_RIGHT KW_IF_SOME KW_IF_RIGHT KW_operation KW_contract KW_option KW_list KW_set KW_ticket KW_pair KW_or KW_lambda KW_map KW_big_map KW_bls12_381_g1 KW_bls12_381_g2 KW_bls12_381_fr KW_sapling_transaction KW_sapling_state KW_chest KW_chest_key KW_unit KW_never KW_bool KW_int KW_nat KW_string KW_chain_id KW_bytes KW_mutez KW_key_hash KW_key KW_signature KW_timestamp KW_address

%token SYMB1 /* ; */
%token SYMB2 /* { */
%token SYMB3 /* } */
%token SYMB4 /* ( */
%token SYMB5 /* ) */

%token TOK_EOF
%token <string> TOK_Ident
%token <char> TOK_Char
%token <float> TOK_Double
%token <int> TOK_Integer
%token <string> TOK_String
%token <(int * int) * string> TOK_Str
%token <(int * int) * string> TOK_Bt
%token <(int * int) * string> TOK_Neg
%token <(int * int) * string> TOK_TypeAnnotation
%token <(int * int) * string> TOK_VariableAnnotation
%token <(int * int) * string> TOK_FieldAnnotation

%start pProg
%type <AbsMichelson.prog> pProg


%%
pProg : prog TOK_EOF { $1 }
  | error { raise (BNFC_Util.Parse_error ($symbolstartpos, $endpos)) };


prog : prog SYMB1 {  $1 }
  | SYMB2 prog SYMB3 {  $2 }
  | KW_parameter typ SYMB1 KW_storage typ SYMB1 KW_code SYMB2 instr_list SYMB3 { Contract ($2, $5, $9) }
  | KW_storage typ SYMB1 KW_parameter typ SYMB1 KW_code SYMB2 instr_list SYMB3 { contract2 ($2, $5, $9) }
  | data { Argument $1 }
;

data_list : /* empty */ { []  }
  | data { (fun x -> [x]) $1 }
  | data SYMB1 data_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

data : SYMB4 data SYMB5 {  $2 }
  | neg { DNeg $1 }
  | int { DNat $1 }
  | str { DStr $1 }
  | bt { DBytes $1 }
  | KW_Unit { DUnit  }
  | KW_True { DTrue  }
  | KW_False { DFalse  }
  | KW_Pair data pairSeq_list { DPair ($2, $3) }
  | KW_Left data { DLeft $2 }
  | KW_Right data { DRight $2 }
  | KW_Some data { DSome $2 }
  | KW_None { DNone  }
  | SYMB2 data_list SYMB3 { DBlock $2 }
  | SYMB2 mapSeq_list SYMB3 { DMap $2 }
  | instr { DInstruction $1 }
;

pairSeq_list : pairSeq { (fun x -> [x]) $1 }
  | pairSeq pairSeq_list { (fun (x,xs) -> x::xs) ($1, $2) }
;

pairSeq : data { DPairSeq $1 }
;

mapSeq_list : /* empty */ { []  }
  | mapSeq { (fun x -> [x]) $1 }
  | mapSeq SYMB1 mapSeq_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

mapSeq : KW_Elt data data { DMapSeq ($2, $3) }
;

instr_list : /* empty */ { []  }
  | instr { (fun x -> [x]) $1 }
  | instr SYMB1 instr_list { (fun (x,xs) -> x::xs) ($1, $3) }
;

instr : instr annotation { ANNOT ($1, $2) }
  | SYMB2 instr SYMB3 {  $2 }
  | SYMB2 instr SYMB1 SYMB3 {  $2 }
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
  | KW_GET_AND_UPDATE { GET_AND_UPDATE  }
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
  | KW_EDIV { EDIV  }
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
  | KW_CREATE_CONTRACT SYMB2 KW_parameter typ SYMB1 KW_storage typ SYMB1 KW_code SYMB2 instr_list SYMB3 SYMB3 { CREATE_CONTRACT ($4, $7, $11) }
  | KW_CREATE_CONTRACT SYMB2 KW_storage typ SYMB1 KW_parameter typ SYMB1 KW_code SYMB2 instr_list SYMB3 SYMB3 { cREATE_CONTRACT2 ($4, $7, $11) }
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
  | KW_FAIL { d_FAIL  }
  | KW_CMPEQ { d_CMPEQ  }
  | KW_CMPNEQ { d_CMPNEQ  }
  | KW_CMPLT { d_CMPLT  }
  | KW_CMPGT { d_CMPGT  }
  | KW_CMPLE { d_CMPLE  }
  | KW_CMPGE { d_CMPGE  }
  | KW_IFEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFEQ ($3, $6) }
  | KW_IFNEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFNEQ ($3, $6) }
  | KW_IFLT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFLT ($3, $6) }
  | KW_IFGT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFGT ($3, $6) }
  | KW_IFLE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFLE ($3, $6) }
  | KW_IFGE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFGE ($3, $6) }
  | KW_IFCMPEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPEQ ($3, $6) }
  | KW_IFCMPNEQ SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPNEQ ($3, $6) }
  | KW_IFCMPLT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPLT ($3, $6) }
  | KW_IFCMPGT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPGT ($3, $6) }
  | KW_IFCMPLE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPLE ($3, $6) }
  | KW_IFCMPGE SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IFCMPGE ($3, $6) }
  | KW_ASSERT { d_ASSERT  }
  | KW_ASSERT_EQ { d_ASSERT_EQ  }
  | KW_ASSERT_NEQ { d_ASSERT_NEQ  }
  | KW_ASSERT_LT { d_ASSERT_LT  }
  | KW_ASSERT_GT { d_ASSERT_GT  }
  | KW_ASSERT_LE { d_ASSERT_LE  }
  | KW_ASSERT_GE { d_ASSERT_GE  }
  | KW_ASSERT_CMPEQ { d_ASSERT_CMPEQ  }
  | KW_ASSERT_CMPNEQ { d_ASSERT_CMPNEQ  }
  | KW_ASSERT_CMPLT { d_ASSERT_CMPLT  }
  | KW_ASSERT_CMPGT { d_ASSERT_CMPGT  }
  | KW_ASSERT_CMPLE { d_ASSERT_CMPLE  }
  | KW_ASSERT_CMPGE { d_ASSERT_CMPGE  }
  | KW_ASSERT_NONE { d_ASSERT_NONE  }
  | KW_ASSERT_SOME { d_ASSERT_SOME  }
  | KW_ASSERT_LEFT { d_ASSERT_LEFT  }
  | KW_ASSERT_RIGHT { d_ASSERT_RIGHT  }
  | KW_IF_SOME SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IF_SOME ($3, $6) }
  | KW_IF_RIGHT SYMB2 instr_list SYMB3 SYMB2 instr_list SYMB3 { d_IF_RIGHT ($3, $6) }
;

annotation : typeAnnotation { ATypeA $1 }
  | variableAnnotation { AVariableA $1 }
  | fieldAnnotation { AFieldA $1 }
;

typ : SYMB4 typ SYMB5 {  $2 }
  | cTyp { TCtype $1 }
  | typ annotation { TAnnot1 ($1, $2) }
  | annotation typ { TAnnot2 ($1, $2) }
  | KW_operation { TOperation  }
  | KW_contract typ { TContract $2 }
  | KW_option typ { TOption $2 }
  | KW_list typ { TList $2 }
  | KW_set cTyp { TSet $2 }
  | KW_ticket cTyp { TTicket $2 }
  | SYMB4 KW_pair typ typeSeq_list SYMB5 { TPair ($3, $4) }
  | KW_or typ typ { TOr ($2, $3) }
  | KW_lambda typ typ { TLambda ($2, $3) }
  | KW_map cTyp typ { TMap ($2, $3) }
  | KW_big_map cTyp typ { TBig_map ($2, $3) }
  | KW_bls12_381_g1 { TBls_381_g1  }
  | KW_bls12_381_g2 { TBls_381_g2  }
  | KW_bls12_381_fr { TBls_381_fr  }
  | KW_sapling_transaction int { TSapling_transaction $2 }
  | KW_sapling_state int { TSapling_state $2 }
  | KW_chest { TChest  }
  | KW_chest_key { TChest_key  }
;

typeSeq_list : typeSeq { (fun x -> [x]) $1 }
  | typeSeq typeSeq_list { (fun (x,xs) -> x::xs) ($1, $2) }
;

typeSeq : typ { TypeSeq0 $1 }
;

cTyp : SYMB4 cTyp SYMB5 {  $2 }
  | cTyp annotation { CAnnot1 ($1, $2) }
  | annotation cTyp { CAnnot2 ($1, $2) }
  | KW_unit { CUnit  }
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
  | SYMB4 KW_pair cTyp cTypeSeq_list SYMB5 { CPair ($3, $4) }
;

cTypeSeq_list : cTypeSeq { (fun x -> [x]) $1 }
  | cTypeSeq cTypeSeq_list { (fun (x,xs) -> x::xs) ($1, $2) }
;

cTypeSeq : cTyp { CTypeSeq0 $1 }
;


int :  TOK_Integer  { $1 };
str : TOK_Str { Str ($1)};
bt : TOK_Bt { Bt ($1)};
neg : TOK_Neg { Neg ($1)};
typeAnnotation : TOK_TypeAnnotation { TypeAnnotation ($1)};
variableAnnotation : TOK_VariableAnnotation { VariableAnnotation ($1)};
fieldAnnotation : TOK_FieldAnnotation { FieldAnnotation ($1)};


