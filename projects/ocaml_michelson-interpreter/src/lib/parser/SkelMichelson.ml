(* File generated by the BNF Converter (bnfc 2.9.3). *)

module SkelMichelson = struct

open AbsMichelson

type result = string

let failure x = failwith "Undefined case." (* x discarded *)

let rec transStr (x : str) : result = match x with
    Str string -> failure x


and transHex (x : hex) : result = match x with
    Hex string -> failure x


and transNeg (x : neg) : result = match x with
    Neg string -> failure x


and transProg (x : prog) : result = match x with
    Contract (typ0, typ, instrs) -> failure x
  | Argument data -> failure x


and transData (x : data) : result = match x with
    DNeg neg -> failure x
  | DNat integer -> failure x
  | DStr str -> failure x
  | DBytes hex -> failure x
  | DUnit  -> failure x
  | DTrue  -> failure x
  | DFalse  -> failure x
  | DPair (data, pairseqs) -> failure x
  | DLeft data -> failure x
  | DRight data -> failure x
  | DSome data -> failure x
  | DNone  -> failure x
  | DBlock datas -> failure x
  | DMap mapseqs -> failure x
  | DInstruction instr -> failure x


and transPairSeq (x : pairSeq) : result = match x with
    DPairSeq data -> failure x


and transMapSeq (x : mapSeq) : result = match x with
    DMapSeq (data0, data) -> failure x


and transInstr (x : instr) : result = match x with
    BLOCK instrs -> failure x
  | DROP  -> failure x
  | DROP_N integer -> failure x
  | DUP  -> failure x
  | DUP_N integer -> failure x
  | SWAP  -> failure x
  | DIG_N integer -> failure x
  | DUG_N integer -> failure x
  | PUSH (typ, data) -> failure x
  | SOME  -> failure x
  | NONE typ -> failure x
  | UNIT  -> failure x
  | NEVER  -> failure x
  | IF_NONE (instrs0, instrs) -> failure x
  | PAIR  -> failure x
  | PAIR_N integer -> failure x
  | CAR  -> failure x
  | CDR  -> failure x
  | UNPAIR  -> failure x
  | UNPAIR_N integer -> failure x
  | LEFT typ -> failure x
  | RIGHT typ -> failure x
  | IF_LEFT (instrs0, instrs) -> failure x
  | NIL typ -> failure x
  | CONS  -> failure x
  | IF_CONS (instrs0, instrs) -> failure x
  | SIZE  -> failure x
  | EMPTY_SET ctyp -> failure x
  | EMPTY_MAP (ctyp, typ) -> failure x
  | EMPTY_BIG_MAP (ctyp, typ) -> failure x
  | MAP instrs -> failure x
  | ITER instrs -> failure x
  | MEM  -> failure x
  | GET  -> failure x
  | GET_N integer -> failure x
  | UPDATE  -> failure x
  | UPDATE_N integer -> failure x
  | IF (instrs0, instrs) -> failure x
  | LOOP instrs -> failure x
  | LOOP_LEFT instrs -> failure x
  | LAMBDA (typ0, typ, instrs) -> failure x
  | EXEC  -> failure x
  | APPLY  -> failure x
  | DIP instrs -> failure x
  | DIP_N (integer, instrs) -> failure x
  | FAILWITH  -> failure x
  | CAST  -> failure x
  | RENAME  -> failure x
  | CONCAT  -> failure x
  | SLICE  -> failure x
  | PACK  -> failure x
  | UNPACK typ -> failure x
  | ADD  -> failure x
  | SUB  -> failure x
  | MUL  -> failure x
  | EDIV  -> failure x
  | ABS  -> failure x
  | SNAT  -> failure x
  | INT  -> failure x
  | NEG  -> failure x
  | LSL  -> failure x
  | LSR  -> failure x
  | OR  -> failure x
  | AND  -> failure x
  | XOR  -> failure x
  | NOT  -> failure x
  | COMPARE  -> failure x
  | EQ  -> failure x
  | NEQ  -> failure x
  | LT  -> failure x
  | GT  -> failure x
  | LE  -> failure x
  | GE  -> failure x
  | SELF  -> failure x
  | SELF_ADDRESS  -> failure x
  | CONTRACT typ -> failure x
  | TRANSFER_TOKENS  -> failure x
  | SET_DELEGATE  -> failure x
  | CREATE_CONTRACT (typ0, typ, instrs) -> failure x
  | IMPLICIT_ACCOUNT  -> failure x
  | VOTING_POWER  -> failure x
  | NOW  -> failure x
  | LEVEL  -> failure x
  | AMOUNT  -> failure x
  | BALANCE  -> failure x
  | CHECK_SIGNATURE  -> failure x
  | BLAKE2B  -> failure x
  | KECCAK  -> failure x
  | SHA3  -> failure x
  | SHA256  -> failure x
  | SHA512  -> failure x
  | HASH_KEY  -> failure x
  | SOURCE  -> failure x
  | SENDER  -> failure x
  | ADDRESS  -> failure x
  | CHAIN_ID  -> failure x
  | TOTAL_VOTING_POWER  -> failure x
  | PAIRING_CHECK  -> failure x
  | SAPLING_EMPTY_STATE integer -> failure x
  | SAPLING_VERIFY_UPDATE  -> failure x
  | TICKET  -> failure x
  | READ_TICKET  -> failure x
  | SPLIT_TICKET  -> failure x
  | JOIN_TICKETS  -> failure x
  | OPEN_CHEST  -> failure x


and transTyp (x : typ) : result = match x with
    TCtype ctyp -> failure x
  | TOperation  -> failure x
  | TContract typ -> failure x
  | TOption typ -> failure x
  | TList typ -> failure x
  | TSet ctyp -> failure x
  | TTicket ctyp -> failure x
  | TPair (typ, typeseqs) -> failure x
  | TOr (typ0, typ) -> failure x
  | TLambda (typ0, typ) -> failure x
  | TMap (ctyp, typ) -> failure x
  | TBig_map (ctyp, typ) -> failure x
  | TBls_381_g1  -> failure x
  | TBls_381_g2  -> failure x
  | TBls_381_fr  -> failure x
  | TSapling_transaction integer -> failure x
  | TSapling_state integer -> failure x
  | TChest  -> failure x
  | TChest_key  -> failure x


and transTypeSeq (x : typeSeq) : result = match x with
    TypeSeq0 typ -> failure x


and transCTyp (x : cTyp) : result = match x with
    CUnit  -> failure x
  | CNever  -> failure x
  | CBool  -> failure x
  | CInt  -> failure x
  | CNat  -> failure x
  | CString  -> failure x
  | CChain_id  -> failure x
  | CBytes  -> failure x
  | CMutez  -> failure x
  | CKey_hash  -> failure x
  | CKey  -> failure x
  | CSignature  -> failure x
  | CTimestamp  -> failure x
  | CAddress  -> failure x
  | COption ctyp -> failure x
  | COr (ctyp0, ctyp) -> failure x
  | CPair (ctyp, ctypeseqs) -> failure x


and transCTypeSeq (x : cTypeSeq) : result = match x with
    CTypeSeq0 ctyp -> failure x



end
