(* File generated by the BNF Converter (bnfc 2.9.3). *)

(* show functions *)

(* use string buffers for efficient string concatenations *)
type showable = Buffer.t -> unit

let show (s : showable) : string =
    let init_size = 16 in (* you may want to adjust this *)
    let b = Buffer.create init_size in
    s b;
    Buffer.contents b

let emptyS : showable = fun buf -> ()

let c2s (c:char) : showable = fun buf -> Buffer.add_char buf c
let s2s (s:string) : showable = fun buf -> Buffer.add_string buf s

let ( >> ) (s1 : showable) (s2 : showable) : showable = fun buf -> s1 buf; s2 buf

let showChar (c:char) : showable = fun buf ->
    Buffer.add_string buf ("'" ^ Char.escaped c ^ "'")

let showString (s:string) : showable = fun buf ->
    Buffer.add_string buf ("\"" ^ String.escaped s ^ "\"")

let showList (showFun : 'a -> showable) (xs : 'a list) : showable = fun buf ->
    let rec f ys = match ys with
        [] -> ()
      | [y] -> showFun y buf
      | y::ys -> showFun y buf; Buffer.add_string buf "; "; f ys
    in
        Buffer.add_char buf '[';
        f xs;
        Buffer.add_char buf ']'


let showInt (i:int) : showable = s2s (string_of_int i)
let showFloat (f:float) : showable = s2s (string_of_float f)

let rec showStr (AbsMichelson.Str i) : showable = s2s "Str " >> showString i
let rec showHex (AbsMichelson.Hex i) : showable = s2s "Hex " >> showString i
let rec showNeg (AbsMichelson.Neg i) : showable = s2s "Neg " >> showString i

let rec showProg (e : AbsMichelson.prog) : showable = match e with
       AbsMichelson.Contract (typ0, typ, instrs) -> s2s "Contract" >> c2s ' ' >> c2s '(' >> showTyp typ0  >> s2s ", " >>  showTyp typ  >> s2s ", " >>  showList showInstr instrs >> c2s ')'


and showData (e : AbsMichelson.data) : showable = match e with
       AbsMichelson.DNeg neg -> s2s "DNeg" >> c2s ' ' >> c2s '(' >> showNeg neg >> c2s ')'
  |    AbsMichelson.DNat integer -> s2s "DNat" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.DStr str -> s2s "DStr" >> c2s ' ' >> c2s '(' >> showStr str >> c2s ')'
  |    AbsMichelson.DBytes hex -> s2s "DBytes" >> c2s ' ' >> c2s '(' >> showHex hex >> c2s ')'
  |    AbsMichelson.DUnit  -> s2s "DUnit"
  |    AbsMichelson.DTrue  -> s2s "DTrue"
  |    AbsMichelson.DFalse  -> s2s "DFalse"
  |    AbsMichelson.DPair (data, pairseqs) -> s2s "DPair" >> c2s ' ' >> c2s '(' >> showData data  >> s2s ", " >>  showList showPairSeq pairseqs >> c2s ')'
  |    AbsMichelson.DLeft data -> s2s "DLeft" >> c2s ' ' >> c2s '(' >> showData data >> c2s ')'
  |    AbsMichelson.DRight data -> s2s "DRight" >> c2s ' ' >> c2s '(' >> showData data >> c2s ')'
  |    AbsMichelson.DSome data -> s2s "DSome" >> c2s ' ' >> c2s '(' >> showData data >> c2s ')'
  |    AbsMichelson.DNone  -> s2s "DNone"
  |    AbsMichelson.DBlock datas -> s2s "DBlock" >> c2s ' ' >> c2s '(' >> showList showData datas >> c2s ')'
  |    AbsMichelson.DMap mapseqs -> s2s "DMap" >> c2s ' ' >> c2s '(' >> showList showMapSeq mapseqs >> c2s ')'
  |    AbsMichelson.DInstruction instr -> s2s "DInstruction" >> c2s ' ' >> c2s '(' >> showInstr instr >> c2s ')'


and showPairSeq (e : AbsMichelson.pairSeq) : showable = match e with
       AbsMichelson.DPairSeq data -> s2s "DPairSeq" >> c2s ' ' >> c2s '(' >> showData data >> c2s ')'


and showMapSeq (e : AbsMichelson.mapSeq) : showable = match e with
       AbsMichelson.DMapSeq (data0, data) -> s2s "DMapSeq" >> c2s ' ' >> c2s '(' >> showData data0  >> s2s ", " >>  showData data >> c2s ')'


and showInstr (e : AbsMichelson.instr) : showable = match e with
       AbsMichelson.BLOCK instrs -> s2s "BLOCK" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.DROP  -> s2s "DROP"
  |    AbsMichelson.DROP_N integer -> s2s "DROP_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.DUP  -> s2s "DUP"
  |    AbsMichelson.DUP_N integer -> s2s "DUP_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.SWAP  -> s2s "SWAP"
  |    AbsMichelson.DIG_N integer -> s2s "DIG_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.DUG_N integer -> s2s "DUG_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.PUSH (typ, data) -> s2s "PUSH" >> c2s ' ' >> c2s '(' >> showTyp typ  >> s2s ", " >>  showData data >> c2s ')'
  |    AbsMichelson.SOME  -> s2s "SOME"
  |    AbsMichelson.NONE typ -> s2s "NONE" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.UNIT  -> s2s "UNIT"
  |    AbsMichelson.NEVER  -> s2s "NEVER"
  |    AbsMichelson.IF_NONE (instrs0, instrs) -> s2s "IF_NONE" >> c2s ' ' >> c2s '(' >> showList showInstr instrs0  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.PAIR  -> s2s "PAIR"
  |    AbsMichelson.PAIR_N integer -> s2s "PAIR_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.CAR  -> s2s "CAR"
  |    AbsMichelson.CDR  -> s2s "CDR"
  |    AbsMichelson.UNPAIR  -> s2s "UNPAIR"
  |    AbsMichelson.UNPAIR_N integer -> s2s "UNPAIR_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.LEFT typ -> s2s "LEFT" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.RIGHT typ -> s2s "RIGHT" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.IF_LEFT (instrs0, instrs) -> s2s "IF_LEFT" >> c2s ' ' >> c2s '(' >> showList showInstr instrs0  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.NIL typ -> s2s "NIL" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.CONS  -> s2s "CONS"
  |    AbsMichelson.IF_CONS (instrs0, instrs) -> s2s "IF_CONS" >> c2s ' ' >> c2s '(' >> showList showInstr instrs0  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.SIZE  -> s2s "SIZE"
  |    AbsMichelson.EMPTY_SET ctyp -> s2s "EMPTY_SET" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'
  |    AbsMichelson.EMPTY_MAP (ctyp, typ) -> s2s "EMPTY_MAP" >> c2s ' ' >> c2s '(' >> showCTyp ctyp  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.EMPTY_BIG_MAP (ctyp, typ) -> s2s "EMPTY_BIG_MAP" >> c2s ' ' >> c2s '(' >> showCTyp ctyp  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.MAP instrs -> s2s "MAP" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.ITER instrs -> s2s "ITER" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.MEM  -> s2s "MEM"
  |    AbsMichelson.GET  -> s2s "GET"
  |    AbsMichelson.GET_N integer -> s2s "GET_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.UPDATE  -> s2s "UPDATE"
  |    AbsMichelson.UPDATE_N integer -> s2s "UPDATE_N" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.IF (instrs0, instrs) -> s2s "IF" >> c2s ' ' >> c2s '(' >> showList showInstr instrs0  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.LOOP instrs -> s2s "LOOP" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.LOOP_LEFT instrs -> s2s "LOOP_LEFT" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.LAMBDA (typ0, typ, instrs) -> s2s "LAMBDA" >> c2s ' ' >> c2s '(' >> showTyp typ0  >> s2s ", " >>  showTyp typ  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.EXEC  -> s2s "EXEC"
  |    AbsMichelson.APPLY  -> s2s "APPLY"
  |    AbsMichelson.DIP instrs -> s2s "DIP" >> c2s ' ' >> c2s '(' >> showList showInstr instrs >> c2s ')'
  |    AbsMichelson.DIP_N (integer, instrs) -> s2s "DIP_N" >> c2s ' ' >> c2s '(' >> showInt integer  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.FAILWITH  -> s2s "FAILWITH"
  |    AbsMichelson.CAST  -> s2s "CAST"
  |    AbsMichelson.RENAME  -> s2s "RENAME"
  |    AbsMichelson.CONCAT  -> s2s "CONCAT"
  |    AbsMichelson.SLICE  -> s2s "SLICE"
  |    AbsMichelson.PACK  -> s2s "PACK"
  |    AbsMichelson.UNPACK typ -> s2s "UNPACK" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.ADD  -> s2s "ADD"
  |    AbsMichelson.SUB  -> s2s "SUB"
  |    AbsMichelson.MUL  -> s2s "MUL"
  |    AbsMichelson.EDIV  -> s2s "EDIV"
  |    AbsMichelson.ABS  -> s2s "ABS"
  |    AbsMichelson.SNAT  -> s2s "SNAT"
  |    AbsMichelson.INT  -> s2s "INT"
  |    AbsMichelson.NEG  -> s2s "NEG"
  |    AbsMichelson.LSL  -> s2s "LSL"
  |    AbsMichelson.LSR  -> s2s "LSR"
  |    AbsMichelson.OR  -> s2s "OR"
  |    AbsMichelson.AND  -> s2s "AND"
  |    AbsMichelson.XOR  -> s2s "XOR"
  |    AbsMichelson.NOT  -> s2s "NOT"
  |    AbsMichelson.COMPARE  -> s2s "COMPARE"
  |    AbsMichelson.EQ  -> s2s "EQ"
  |    AbsMichelson.NEQ  -> s2s "NEQ"
  |    AbsMichelson.LT  -> s2s "LT"
  |    AbsMichelson.GT  -> s2s "GT"
  |    AbsMichelson.LE  -> s2s "LE"
  |    AbsMichelson.GE  -> s2s "GE"
  |    AbsMichelson.SELF  -> s2s "SELF"
  |    AbsMichelson.SELF_ADDRESS  -> s2s "SELF_ADDRESS"
  |    AbsMichelson.CONTRACT typ -> s2s "CONTRACT" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.TRANSFER_TOKENS  -> s2s "TRANSFER_TOKENS"
  |    AbsMichelson.SET_DELEGATE  -> s2s "SET_DELEGATE"
  |    AbsMichelson.CREATE_CONTRACT (typ0, typ, instrs) -> s2s "CREATE_CONTRACT" >> c2s ' ' >> c2s '(' >> showTyp typ0  >> s2s ", " >>  showTyp typ  >> s2s ", " >>  showList showInstr instrs >> c2s ')'
  |    AbsMichelson.IMPLICIT_ACCOUNT  -> s2s "IMPLICIT_ACCOUNT"
  |    AbsMichelson.VOTING_POWER  -> s2s "VOTING_POWER"
  |    AbsMichelson.NOW  -> s2s "NOW"
  |    AbsMichelson.LEVEL  -> s2s "LEVEL"
  |    AbsMichelson.AMOUNT  -> s2s "AMOUNT"
  |    AbsMichelson.BALANCE  -> s2s "BALANCE"
  |    AbsMichelson.CHECK_SIGNATURE  -> s2s "CHECK_SIGNATURE"
  |    AbsMichelson.BLAKE2B  -> s2s "BLAKE2B"
  |    AbsMichelson.KECCAK  -> s2s "KECCAK"
  |    AbsMichelson.SHA3  -> s2s "SHA3"
  |    AbsMichelson.SHA256  -> s2s "SHA256"
  |    AbsMichelson.SHA512  -> s2s "SHA512"
  |    AbsMichelson.HASH_KEY  -> s2s "HASH_KEY"
  |    AbsMichelson.SOURCE  -> s2s "SOURCE"
  |    AbsMichelson.SENDER  -> s2s "SENDER"
  |    AbsMichelson.ADDRESS  -> s2s "ADDRESS"
  |    AbsMichelson.CHAIN_ID  -> s2s "CHAIN_ID"
  |    AbsMichelson.TOTAL_VOTING_POWER  -> s2s "TOTAL_VOTING_POWER"
  |    AbsMichelson.PAIRING_CHECK  -> s2s "PAIRING_CHECK"
  |    AbsMichelson.SAPLING_EMPTY_STATE integer -> s2s "SAPLING_EMPTY_STATE" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.SAPLING_VERIFY_UPDATE  -> s2s "SAPLING_VERIFY_UPDATE"
  |    AbsMichelson.TICKET  -> s2s "TICKET"
  |    AbsMichelson.READ_TICKET  -> s2s "READ_TICKET"
  |    AbsMichelson.SPLIT_TICKET  -> s2s "SPLIT_TICKET"
  |    AbsMichelson.JOIN_TICKETS  -> s2s "JOIN_TICKETS"
  |    AbsMichelson.OPEN_CHEST  -> s2s "OPEN_CHEST"


and showTyp (e : AbsMichelson.typ) : showable = match e with
       AbsMichelson.TCtype ctyp -> s2s "TCtype" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'
  |    AbsMichelson.TOperation  -> s2s "TOperation"
  |    AbsMichelson.TContract typ -> s2s "TContract" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.TOption typ -> s2s "TOption" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.TList typ -> s2s "TList" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'
  |    AbsMichelson.TSet ctyp -> s2s "TSet" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'
  |    AbsMichelson.TTicket ctyp -> s2s "TTicket" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'
  |    AbsMichelson.TPair (typ, typeseqs) -> s2s "TPair" >> c2s ' ' >> c2s '(' >> showTyp typ  >> s2s ", " >>  showList showTypeSeq typeseqs >> c2s ')'
  |    AbsMichelson.TOr (typ0, typ) -> s2s "TOr" >> c2s ' ' >> c2s '(' >> showTyp typ0  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.TLambda (typ0, typ) -> s2s "TLambda" >> c2s ' ' >> c2s '(' >> showTyp typ0  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.TMap (ctyp, typ) -> s2s "TMap" >> c2s ' ' >> c2s '(' >> showCTyp ctyp  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.TBig_map (ctyp, typ) -> s2s "TBig_map" >> c2s ' ' >> c2s '(' >> showCTyp ctyp  >> s2s ", " >>  showTyp typ >> c2s ')'
  |    AbsMichelson.TBls_381_g1  -> s2s "TBls_381_g1"
  |    AbsMichelson.TBls_381_g2  -> s2s "TBls_381_g2"
  |    AbsMichelson.TBls_381_fr  -> s2s "TBls_381_fr"
  |    AbsMichelson.TSapling_transaction integer -> s2s "TSapling_transaction" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.TSapling_state integer -> s2s "TSapling_state" >> c2s ' ' >> c2s '(' >> showInt integer >> c2s ')'
  |    AbsMichelson.TChest  -> s2s "TChest"
  |    AbsMichelson.TChest_key  -> s2s "TChest_key"


and showTypeSeq (e : AbsMichelson.typeSeq) : showable = match e with
       AbsMichelson.TypeSeq0 typ -> s2s "TypeSeq0" >> c2s ' ' >> c2s '(' >> showTyp typ >> c2s ')'


and showCTyp (e : AbsMichelson.cTyp) : showable = match e with
       AbsMichelson.CUnit  -> s2s "CUnit"
  |    AbsMichelson.CNever  -> s2s "CNever"
  |    AbsMichelson.CBool  -> s2s "CBool"
  |    AbsMichelson.CInt  -> s2s "CInt"
  |    AbsMichelson.CNat  -> s2s "CNat"
  |    AbsMichelson.CString  -> s2s "CString"
  |    AbsMichelson.CChain_id  -> s2s "CChain_id"
  |    AbsMichelson.CBytes  -> s2s "CBytes"
  |    AbsMichelson.CMutez  -> s2s "CMutez"
  |    AbsMichelson.CKey_hash  -> s2s "CKey_hash"
  |    AbsMichelson.CKey  -> s2s "CKey"
  |    AbsMichelson.CSignature  -> s2s "CSignature"
  |    AbsMichelson.CTimestamp  -> s2s "CTimestamp"
  |    AbsMichelson.CAddress  -> s2s "CAddress"
  |    AbsMichelson.COption ctyp -> s2s "COption" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'
  |    AbsMichelson.COr (ctyp0, ctyp) -> s2s "COr" >> c2s ' ' >> c2s '(' >> showCTyp ctyp0  >> s2s ", " >>  showCTyp ctyp >> c2s ')'
  |    AbsMichelson.CPair (ctyp, ctypeseqs) -> s2s "CPair" >> c2s ' ' >> c2s '(' >> showCTyp ctyp  >> s2s ", " >>  showList showCTypeSeq ctypeseqs >> c2s ')'


and showCTypeSeq (e : AbsMichelson.cTypeSeq) : showable = match e with
       AbsMichelson.CTypeSeq0 ctyp -> s2s "CTypeSeq0" >> c2s ' ' >> c2s '(' >> showCTyp ctyp >> c2s ')'



