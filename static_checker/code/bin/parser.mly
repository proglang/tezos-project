%token <int> INT
%token <string> STRING
%token <string> IDEN
%token <bool> BOOL
%token VAR
%token LEFT
%token RIGHT
%token PAIR
%token NONE
%token SOME
%token UNIT
%token INSTR
%token CONTRACT
%token NEVER
%token ELT
%token AMOUNT
%token BALANCE
%token CHAIN_ID
%token NOW
%token SENDER
%token SELF
%token SELF_ADDRESS
%token TOTAL_VOTING
%token TINT
%token TNAT
%token TUNIT
%token TNEVER
%token TBOOL
%token TSTRING
%token TCHAIN_ID
%token TBYTES
%token TMUTEZ
%token TKEY_HASH
%token TKEY
%token TSIGNATURE
%token TTIMESTAMP
%token TADDRESS
%token TTX_ROLLUP_12_ADDRESS
%token TOPTION
%token TOR
%token TPAIR
%token TLIST
%token TSET
%token TOPERATION
%token TCONTRACT
%token TMAP
%token TBIG_MAP
%token TLAMBDA
%token TTICKET
%token TBLS12_381_G1
%token TBLS12_381_G2
%token TBLS12_381_FR
%token TSALING_TRANSACTION
%token TSALING_STATE
%token TCHEST
%token TCHEST_KEY
%token IAPPLY
%token IEXEC
%token IFAILWITH
%token IIF
%token IIF_CONS
%token IIF_LEFT
%token IIF_NONE
%token IITER
%token ILAMBDA
%token ILAMBDA_REC
%token ILOOP
%token ILOOP_LEFT
%token IINSTR
%token IEMPTY_INSTR
%token IDIG
%token IDIP
%token IDROP
%token IDUG
%token IDUP
%token IPUSH
%token ISWAP
%token IABS
%token IADD
%token ICOMPARE
%token IEDIV
%token IEQ
%token INEQ
%token IGE
%token IGT
%token IINT
%token ILE
%token ILSL
%token ILSR
%token ILT
%token IMUL
%token INEG
%token ISUB
%token IAND
%token INOT
%token IOR
%token IXOR
%token IBLAKE2B
%token ICHECK_SIGNATURE
%token IHASH_KEY
%token IKECCAK
%token IPAIRING_CHECK
%token ISHA256
%token ISHA3
%token ISHA512
%token IADDRESS
%token IAMOUNT
%token IBALANCE
%token ICHAIN_ID
%token ICONTRACT
%token IIMPLICIT_ACCOUNT
%token ILEVEL
%token INOW
%token ISELF
%token ISELF_ADDRESS
%token ISENDER
%token ISET_DELEGATE
%token ISOURCE
%token ITOTAL_VOTING_POWER
%token ITRANSFER_TOKENS
%token IVOTING_POWER
%token ICAR
%token ICDR
%token ICONCAT
%token ICONS
%token IEMPTY_BIG_MAP
%token IEMPTY_MAP 
%token IEMPTY_SET 
%token IGET
%token IGET_AND_UPDATE
%token ILEFT
%token IMAP
%token IMEM
%token INEVER
%token INIL
%token INONE 
%token IPACK
%token IPAIR
%token IRIGHT 
%token ISIZE
%token ISLICE
%token ISOME
%token IUNIT
%token IUNPACK 
%token IUNPAIR
%token IUPDATE
%token IJOINT_TICKETS
%token IREAD_TICKETS
%token ISPLIT_TICKET
%token ITICKET
%token AND
%token OR
%token XOR
%token IMPLY
%token LEAD
%token NOT
%token NEQ
%token GT
%token GE
%token EQ
%token LE
%token LT
%token ADD
%token SUB
%token MUL
%token DIV
%token MOD
%token REM
%token LENGTH
%token ABS
%token ISNAT
%token ISINT
%token SELECT
%token STORE
%token INSERT
%token HEAD
%token TAIL
%token FIRST
%token SECOND
%token CONTAIN
%token CONCAT
%token LEN
%token AT
%token SUBSTRING
%token TOINT
%token FROMINT
%token FORALL
%token EXISTS
%token PRECONDITION
%token POSTCONDITION
%token ASSIGN
%token REQUIREMENT
%token OUTPUTSTACK
%token INPUTSTACK
%token STORAGE
%token PARAMETER
%token CODE
%token ENTRYPOINT
%token WITH
%token MYCONTRACT
%token LPAREN
%token RPAREN
%token PERCENT
%token COLON
%token COMMA
%token ASSERTAND
%token CONCATASSERT
%token SEMICOLON
%token LEFT_BRACK
%token RIGHT_BRACK
%token LEFT_BRACE
%token RIGHT_BRACE
%token EOF

%left ADD
%left SUB
%left MUL
%left DIV
%left MOD
%left REM
%left NOT
%left AND
%left OR
%left XOR
%left IMPLY
%left NEQ
%left GT
%left GE
%left EQ
%left LE
%left LT

%start <Ast.contract> prog

%%

prog:
  | e = contract; EOF { e }
  ;

ty:
  | LPAREN; t = ty ; RPAREN { t }
  | TUNIT { `Unit }
  | TNEVER { `Never }
  | TBOOL { `Bool }
  | TINT { `Int }
  | TNAT { `Nat }
  | TSTRING { `String } 
  | TCHAIN_ID { `Chain_id }
  | TBYTES { `Bytes }
  | TMUTEZ { `Mutez }
  | TKEY_HASH { `Key_hash }
  | TKEY { `Key }
  | TSIGNATURE { `Signature }
  | TTIMESTAMP { `Timestamp }
  | TADDRESS { `Address }
  | TTX_ROLLUP_12_ADDRESS { `Tx_rollup_12_address }
  | TOPTION; t = ty { `Option t }
  | TOR; t1 = ty ; t2 = ty { `Or (t1, t2) } 
  | TPAIR; t1 = ty ; t2 = ty { `Pair (t1, t2) } 
  | TLIST; t = ty { `List t }
  | TSET; t = ty { `Set t }
  | TOPERATION { `Operation }
  | TCONTRACT; t = ty { `Contract t }
  | TMAP; t1 = ty ; t2 = ty { `Map (t1, t2) }
  | TBIG_MAP; t1 = ty ; t2 = ty { `Big_map (t1, t2) }
  | TLAMBDA; t1 = ty ; t2 = ty { `Lambda (t1, t2) }
  | TTICKET; t = ty { `Ticket t }
  | TBLS12_381_G1 { `Bls12_381_g1 }
  | TBLS12_381_G2 { `Bls12_381_g2 }
  | TBLS12_381_FR { `Bls12_381_fr }
  | TSALING_TRANSACTION; i = INT { `Sapling_transaction i }
  | TSALING_STATE; i = INT { `Sapling_state i }
  | TCHEST { `Chest }
  | TCHEST_KEY { `Chest_key }
  ;
instr:
  | LPAREN; m = instr; RPAREN { m }
  | IAPPLY { `APPLY }
  | IEXEC { `EXEC }
  | IPUSH; TSTRING; s = STRING; SEMICOLON; IFAILWITH { `FAILWITH s}
  | IFAILWITH { `FAILWITH ""}
  | IIF; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE; LEFT_BRACE; l2 = list_instr; RIGHT_BRACE { `IF (l1, l2) }
  | IIF_CONS; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE; LEFT_BRACE; l2 = list_instr; RIGHT_BRACE { `IF_CONS (l1, l2) }
  | IIF_LEFT; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE; LEFT_BRACE; l2 = list_instr; RIGHT_BRACE { `IF_LEFT (l1, l2) }
  | IIF_NONE; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE; LEFT_BRACE; l2 = list_instr; RIGHT_BRACE { `IF_NONE (l1, l2) }
  | IITER; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `ITER l1 }
  | ILAMBDA; t1 = ty; t2 = ty; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `LAMBDA (t1, t2, l1) }
  | ILAMBDA_REC ; t1 = ty; t2 = ty ; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `LAMBDA_REC (t1, t2, l1) }
  | ILOOP; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `LOOP l1 }
  | ILOOP_LEFT; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `LOOP_LEFT l1 }
  | IDIG; i = INT { `DIG i }
  | IDIP; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `DIP l1 }
  | IDIP; i = INT; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `DIP_N (i, l1) }
  | IDROP { `DROP }
  | IDROP; i = INT { `DROP_N i }
  | IDUG; i = INT { `DUG i }
  | IDUP { `DUP }
  | IDUP; i = INT { `DUP_N i }
  | IPUSH; t1 = ty; m1 = mterm { `PUSH (t1, m1) }
  | ISWAP { `SWAP }
  | IABS { `ABS }
  | IADD { `ADD }
  | ICOMPARE { `COMPARE }
  | IEDIV { `EDIV }
  | IEQ { `EQ }
  | INEQ { `NEQ }
  | IGE { `GE }
  | IGT { `GT }
  | IINT { `INT }
  | ILE { `LE }
  | ILSL { `LSL }
  | ILSR { `LSR }
  | ILT { `LT }
  | IMUL { `MUL }
  | INEG { `NEG }
  | ISUB { `SUB }
  | IAND { `AND } 
  | INOT { `NOT }
  | IOR { `OR }
  | IXOR { `XOR }
  | IBLAKE2B { `BLAKE2B }
  | ICHECK_SIGNATURE { `CHECK_SIGNATURE }
  | IHASH_KEY { `HASH_KEY }
  | IKECCAK { `KECCAK }
  | IPAIRING_CHECK { `PAIRING_CHECK }
  | ISHA256 { `SHA256 }
  | ISHA3 { `SHA3 }
  | ISHA512 { `SHA512 }
  | IADDRESS { `ADDRESS }
  | IAMOUNT { `AMOUNT }
  | IBALANCE { `BALANCE }
  | ICHAIN_ID { `CHAIN_ID }
  | ICONTRACT; t1 = ty { `CONTRACT t1 }
  | IIMPLICIT_ACCOUNT { `IMPLICIT_ACCOUNT }
  | ILEVEL { `LEVEL }
  | INOW { `NOW }
  | ISELF { `SELF }
  | ISELF_ADDRESS { `SELF_ADDRESS }
  | ISENDER { `SENDER }
  | ISET_DELEGATE { `SET_DELEGATE }
  | ISOURCE { `SOURCE }
  | ITOTAL_VOTING_POWER { `TOTAL_VOTING_POWER }
  | ITRANSFER_TOKENS { `TRANSFER_TOKENS }
  | IVOTING_POWER { `VOTING_POWER }
  | ICAR { `CAR }
  | ICDR { `CDR }
  | ICONCAT { `CONCAT }
  | ICONS { `CONS }
  | IEMPTY_BIG_MAP; t1 = ty; t2 = ty { `EMPTY_BIG_MAP (t1, t2) }
  | IEMPTY_MAP; t1 = ty; t2 = ty { `EMPTY_MAP (t1, t2) }
  | IEMPTY_SET; t1 = ty  { `EMPTY_SET t1 }
  | IGET { `GET }
  | IGET; i = INT { `GET_N i }
  | IGET_AND_UPDATE { `GET_AND_UPDATE }
  | ILEFT; t1 = ty { `LEFT t1 }
  | IMAP; LEFT_BRACE; l1 = list_instr; RIGHT_BRACE { `MAP l1 }
  | IMEM { `MEM }
  | INEVER { `NEVER }
  | INIL; t1 = ty { `NIL t1 }
  | INONE; t1 = ty { `NONE t1 }
  | IPACK { `PACK }
  | IPAIR { `PAIR }
  | IPAIR; i = INT { `PAIR_N i }
  | IRIGHT; t1 = ty { `RIGHT t1 }
  | ISIZE { `SIZE }
  | ISLICE { `SLICE }
  | ISOME { `SOME }
  | IUNIT { `UNIT }
  | IUNPACK; t1 = ty { `UNPACK t1 }
  | IUNPAIR { `UNPAIR }
  | IUNPAIR; i = INT { `UNPAIR_N i }
  | IUPDATE { `UPDATE }
  | IUPDATE; i = INT { `UPDATE_N i }
  | IJOINT_TICKETS { `JOINT_TICKETS } 
  | IREAD_TICKETS { `READ_TICKETS }
  | ISPLIT_TICKET { `SPLIT_TICKET }
  | ITICKET { `TICKET }
  ;
list_instr:
    l = separated_list(SEMICOLON, instr)         { l } 
  ;
list_mterms:
    l = separated_list(SEMICOLON, mterm)         { l } 
  ;
list_entrypoint:
    l = separated_list(SEMICOLON, entrypoint)    { l } 
  ;
list_pentrypoint:
    l = separated_list(SEMICOLON, pentrypoint)    { l } 
  ;
mterm:
  | LPAREN; m = mterm; RPAREN { m }
  | i = INT { `Int i }
  | s = STRING { `String s }
  | b = BOOL { `Bool b}
  | i = INT; COLON; TINT { `Int i }
  | VAR; x = STRING; COLON; ty = ty { `Var (x, ty) }
  | x = IDEN; COLON; ty = ty { `Var (x, ty) }
  | x = IDEN { `NVar x }
  | n = INT; COLON; TNAT { `Nat n }
  | i = INT; COLON; TINT { `Int i }
  | b = BOOL; COLON; TBOOL { `Bool b }
  | n = INT; COLON; TMUTEZ { `Mutez n }
  | n = INT; COLON; TTIMESTAMP { `Timestamp n }
  | s = STRING; COLON; TSTRING { `String s }
  | s = STRING; COLON; TKEY { `Key s }
  | s = STRING; COLON; TKEY_HASH {  `Key_hash s }
  | s = STRING; COLON; TADDRESS {  `Address s }
  | s = STRING; COLON; TSIGNATURE {  `Signature s }
  | s = STRING; COLON; TCHAIN_ID {  `Chain_id s }
  | by = STRING; COLON; TBYTES {  `Bytes by }
  | UNIT { `Unit }
  | UNIT; COLON; TUNIT { `Unit }
  | NEVER { `Never }
  | NEVER; COLON; TNEVER { `Never }
  | AMOUNT { `Amount }
  | BALANCE { `Balance }
  | CHAIN_ID { `CChain_id }
  | NOW { `Now }
  | SENDER { `Sender }
  | SELF; ty1 = ty { `Self ty1 }
  | SELF_ADDRESS { `Self_address }
  | TOTAL_VOTING { `Total_voting }
  | NONE; COLON; TOPTION; ty = ty {  `None ty }
  | SOME; t = mterm; COLON; TOPTION; ty = ty { `Some (t, ty) }
  | ELT; m1 = mterm; m2 = mterm { `Elt (m1, m2) }
  | LEFT_BRACK; l = list_mterms; RIGHT_BRACK; COLON; TLIST; ty = ty { `List (l, ty) }
  | LEFT_BRACE; l = list_mterms; RIGHT_BRACE; COLON; TSET; ty = ty { `Set (l, ty) }
  | LEFT_BRACE; l = list_mterms; RIGHT_BRACE; COLON; TMAP; ty1 = ty; ty2 = ty { `Map (l, ty1, ty2) }
  | LEFT_BRACE; l = list_mterms; RIGHT_BRACE; COLON; TBIG_MAP; ty1 = ty; ty2 = ty { `BMap (l, ty1, ty2) }
  | INSTR; LEFT_BRACE; l = list_instr; RIGHT_BRACE { `Instr l }
  | LEFT; t = mterm; ty = ty { `Left (t, ty) }
  | RIGHT; t = mterm; ty = ty { `Right (t, ty) }
  | PAIR; t1 = mterm; t2 = mterm { `Pair (t1, t2) }
  | CONTRACT; ty = ty; s = STRING { `Contract (ty, s) }
  | m1 = mterm; ADD; m2 = mterm { `Add (m1, m2) }
  | m1 = mterm; SUB; m2 = mterm { `Sub (m1, m2) }
  | m1 = mterm; MUL; m2 = mterm { `Mul (m1, m2) }
  | m1 = mterm; DIV; m2 = mterm { `Div (m1, m2) }
  | m1 = mterm; MOD; m2 = mterm { `Mod (m1, m2) }
  | m1 = mterm; REM; m2 = mterm { `Rem (m1, m2) }
  | m1 = mterm; AND; m2 = mterm { `And (m1, m2) }
  | m1 = mterm; OR; m2 = mterm { `Or (m1, m2) }
  | m1 = mterm; XOR; m2 = mterm { `Xor (m1, m2) }
  | m1 = mterm; IMPLY; m2 = mterm { `Imply (m1, m2) }
  | m1 = mterm; EQ; m2 = mterm { `Eq (m1, m2) }
  | m1 = mterm; NEQ; m2 = mterm { `Neq (m1, m2) }
  | m1 = mterm; GT; m2 = mterm { `Gt (m1, m2) }
  | m1 = mterm; GE; m2 = mterm { `Ge (m1, m2) }
  | m1 = mterm; LT; m2 = mterm { `Lt (m1, m2) }
  | m1 = mterm; LE; m2 = mterm { `Le (m1, m2) }
  | m1 = mterm; CONCAT; m2 = mterm { `Concat (m1, m2) }
  | CONTAIN; m1 = mterm; m2 = mterm { `Contain (m1, m2) }
  | AT; m1 = mterm; m2 = mterm { `At (m1, m2) }
  | SUBSTRING; m1 = mterm; m2 = mterm; m3 = mterm { `Substring (m1, m2, m3) }
  | SELECT; m1 = mterm; m2 = mterm { `Select (m1, m2) }
  | STORE; m1 = mterm; m2 = mterm { `Store (m1, m2) }
  | INSERT; m1 = mterm;  m2 = mterm { `Insert (m1, m2) }
  | NOT; m1 = mterm { `Not m1 }
  | LEN; m1 = mterm { `Len m1 }
  | TOINT; m1 = mterm { `To_int m1 }
  | FROMINT; m1 = mterm { `From_int m1 }
  | LENGTH; m1 = mterm { `Length m1 }
  | ABS; m1 = mterm { `Abs m1 }
  | HEAD; m1 = mterm { `Head m1 }
  | TAIL; m1 = mterm { `Tail m1 }
  | FIRST; m1 = mterm { `First m1 }
  | SECOND; m1 = mterm { `Second m1 }
  ;
assertion:
  | LPAREN; ass = assertion; RPAREN { ass }
  | m = mterm { `Assertion m }
  | FORALL; m = mterm; ass = assertion { `Forall (m, ass) }
  | EXISTS; m = mterm; ass = assertion { `Exists (m, ass) }
  | ass1 = assertion; CONCATASSERT; ass2 = assertion { `Cons (ass1, ass2) }
  ;
entrypoint_assertion:
  | LPAREN; ass = entrypoint_assertion; RPAREN { ass }
  | PERCENT; entry1 = IDEN; LEAD; PERCENT; entry2 = IDEN { `Lead_no (entry1, entry2) }
  | entry_ass = entrypoint_assertion;  ASSERTAND; ass = mterm { `Lead_co (entry_ass, ass) }
  | NOT; LPAREN; PERCENT; entry1 = IDEN; LEAD; PERCENT; entry2 = IDEN;  RPAREN { `NLead_no (entry1, entry2) }
  | NOT; LPAREN; entry_ass = entrypoint_assertion; ASSERTAND;  ass = mterm; RPAREN { `NLead_co (entry_ass, ass) }
  | ass1 = entrypoint_assertion; CONCATASSERT; ass2 = entrypoint_assertion { `Cons (ass1, ass2) }
  ;
condition:
  | LPAREN; cond = condition; RPAREN { cond }
  | PRECONDITION; ASSIGN; art1 = assertion; POSTCONDITION; ASSIGN; art2 = assertion { `Condition (art1, art2) }
  ;
requirement:
  | LPAREN; req = requirement; RPAREN { req }
  | REQUIREMENT;  ASSIGN; art1 = assertion { `Req art1}
  ;
output_stack:
  | LPAREN; out = output_stack; RPAREN { out }
  | OUTPUTSTACK;  ASSIGN; m = mterm { `Output m}
  ;
parameter:
  | LPAREN; p = parameter; RPAREN { p }
  | PARAMETER;  ASSIGN; m = mterm { `Parameter m}
  ;
storage:
  | LPAREN; st = storage; RPAREN { st }
  | STORAGE;  ASSIGN; m = mterm { `Storage m}
  ;
input_stack:
  | LPAREN; input = input_stack; RPAREN { input }
  | INPUTSTACK; ASSIGN; m = mterm { `Input m}
  ;
check_statement:
  | LPAREN; sta = check_statement; RPAREN { sta }
  |  out = output_stack; { `Check_sta_1 out}
  |  rq = requirement; { `Check_sta_2 rq}
  |  out = output_stack; rq = requirement { `Check_sta_3 (out, rq) }
  |  out = output_stack; cd = condition { `Check_sta_4 (out, cd) }
  |  out = output_stack; rq = requirement;  cd = condition { `Check_sta_5 (out, rq, cd) }
  ;
code:
  | LPAREN; code = code; RPAREN { code }
  | CODE; ASSIGN; LEFT_BRACE; l = list_instr; RIGHT_BRACE { `Code l } 
  ;
body_check:
  | LPAREN; body = body_check; RPAREN { body }
  | cd = code; input = input_stack;  ck = check_statement { `Body (cd, input, ck) }
  ;
entrypoint:
  | LPAREN; emtry = entrypoint; RPAREN { emtry }
  | ENTRYPOINT; PERCENT; s = IDEN;  b =  body_check { `Entrypoint (s, b) }
  ;
pentrypoint:
  | LPAREN; pemtry = pentrypoint; RPAREN { pemtry }
  | ENTRYPOINT; PERCENT; s = IDEN;  p = parameter { `PEntrypoint (s, p) }
  ;
contract_body:
  | empl = list_entrypoint { `Entrypoint_list empl }
  | empl = list_entrypoint;  art1 = assertion { `Entrypoint_list_assert (empl, art1) }
  | cd = code; st = storage; empl = list_pentrypoint;  art1 = entrypoint_assertion { `PEntrypoint_list (cd, st, empl, art1) }
  | b =  body_check { `Body_check b }
  ;
contract:
  | MYCONTRACT; s = STRING; WITH; b = contract_body { `Contract (s, b) }
  ;
 