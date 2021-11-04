(* File generated by the BNF Converter (bnfc 2.9.3). *)

(* pretty-printer *)

open Printf

(* We use string buffers for efficient string concatenation.
   A document takes a buffer and an indentation, has side effects on the buffer
   and returns a new indentation. The indentation argument indicates the level
   of indentation to be used if a new line has to be started (because of what is
   already in the buffer) *)
type doc = Buffer.t -> int -> int

let rec printTree (printer : int -> 'a -> doc) (tree : 'a) : string =
    let buffer_init_size = 64 (* you may want to change this *)
    in let buffer = Buffer.create buffer_init_size
    in
        let _ = printer 0 tree buffer 0 in (* discard return value *)
        Buffer.contents buffer

let indent_width = 2

let indent (i: int) : string = "\n" ^ String.make i ' '

(* To avoid dependency on package extlib, which has
   Extlib.ExtChar.Char.is_whitespace, we employ the following awkward
   way to check a character for whitespace.
   Note: String.trim exists in the core libraries since Ocaml 4.00. *)
let isWhiteSpace (c: char) : bool = String.trim (String.make 1 c) = ""

(* this render function is written for C-style languages, you may want to change it *)
let render (s : string) : doc = fun buf i ->
    (* invariant: last char of the buffer is never whitespace *)
    let n = Buffer.length buf in
    let last = if n = 0 then None else Some (Buffer.nth buf (n-1)) in
    let newindent = match s with
        "{" -> i + indent_width
      | "}" -> i - indent_width
      | _ -> i in
    let whitespace = match last with
        None -> ""
      | Some '}' -> (match s with
            ";" -> ""
          | _ -> indent newindent)
      | (Some '{') | (Some ';') -> if s = "}" then indent newindent else indent i
      | (Some '[') | (Some '(') -> ""
      | Some c -> if isWhiteSpace c then "" else (match s with
             ";" | "," | ")" | "]" -> ""
           | "{" -> indent i
           | "}" -> indent newindent
           | _ -> if String.trim s = "" then "" else " ") in
    Buffer.add_string buf whitespace;
    Buffer.add_string buf s;
    newindent

let emptyDoc : doc = fun buf i -> i

let concatD (ds : doc list) : doc = fun buf i ->
    List.fold_left (fun accIndent elemDoc -> elemDoc buf accIndent) (emptyDoc buf i) ds

let parenth (d:doc) : doc = concatD [render "("; d; render ")"]

let prPrec (i:int) (j:int) (d:doc) : doc = if j<i then parenth d else d


let rec prtChar (_:int) (c:char) : doc = render ("'" ^ Char.escaped c ^ "'")



let rec prtInt (_:int) (i:int) : doc = render (string_of_int i)



let rec prtFloat (_:int) (f:float) : doc = render (sprintf "%.15g" f)



let rec prtString (_:int) (s:string) : doc = render ("\"" ^ String.escaped s ^ "\"")




let rec prtStr _ (AbsMichelson.Str i) : doc = render i


let rec prtHex _ (AbsMichelson.Hex i) : doc = render i


let rec prtNeg _ (AbsMichelson.Neg i) : doc = render i



let rec prtProg (i:int) (e : AbsMichelson.prog) : doc = match e with
       AbsMichelson.Contract (typ1, typ2, instrs) -> prPrec i 0 (concatD [render "parameter" ; prtTyp 0 typ1 ; render ";" ; render "storage" ; prtTyp 0 typ2 ; render ";" ; render "code" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.Argument data -> prPrec i 0 (concatD [prtData 0 data])


and prtData (i:int) (e : AbsMichelson.data) : doc = match e with
       AbsMichelson.DNeg neg -> prPrec i 0 (concatD [prtNeg 0 neg])
  |    AbsMichelson.DNat integer -> prPrec i 0 (concatD [prtInt 0 integer])
  |    AbsMichelson.DStr str -> prPrec i 0 (concatD [prtStr 0 str])
  |    AbsMichelson.DBytes hex -> prPrec i 0 (concatD [prtHex 0 hex])
  |    AbsMichelson.DUnit  -> prPrec i 0 (concatD [render "Unit"])
  |    AbsMichelson.DTrue  -> prPrec i 0 (concatD [render "True"])
  |    AbsMichelson.DFalse  -> prPrec i 0 (concatD [render "False"])
  |    AbsMichelson.DPair (data, pairseqs) -> prPrec i 0 (concatD [render "(" ; render "Pair" ; prtData 0 data ; prtPairSeqListBNFC 0 pairseqs ; render ")"])
  |    AbsMichelson.DLeft data -> prPrec i 0 (concatD [render "(" ; render "Left" ; prtData 0 data ; render ")"])
  |    AbsMichelson.DRight data -> prPrec i 0 (concatD [render "(" ; render "Right" ; prtData 0 data ; render ")"])
  |    AbsMichelson.DSome data -> prPrec i 0 (concatD [render "Some" ; prtData 0 data])
  |    AbsMichelson.DNone  -> prPrec i 0 (concatD [render "None"])
  |    AbsMichelson.DBlock datas -> prPrec i 0 (concatD [render "{" ; prtDataListBNFC 0 datas ; render "}"])
  |    AbsMichelson.DMap mapseqs -> prPrec i 0 (concatD [render "{" ; prtMapSeqListBNFC 0 mapseqs ; render "}"])
  |    AbsMichelson.DInstruction instr -> prPrec i 0 (concatD [prtInstr 0 instr])

and prtDataListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtData 0 x])
  | (_,x::xs) -> (concatD [prtData 0 x ; render ";" ; prtDataListBNFC 0 xs])
and prtPairSeq (i:int) (e : AbsMichelson.pairSeq) : doc = match e with
       AbsMichelson.DPairSeq data -> prPrec i 0 (concatD [prtData 0 data])

and prtPairSeqListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtPairSeq 0 x])
  | (_,x::xs) -> (concatD [prtPairSeq 0 x ; prtPairSeqListBNFC 0 xs])
and prtMapSeq (i:int) (e : AbsMichelson.mapSeq) : doc = match e with
       AbsMichelson.DMapSeq (data1, data2) -> prPrec i 0 (concatD [render "Elt" ; prtData 0 data1 ; prtData 0 data2])

and prtMapSeqListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtMapSeq 0 x])
  | (_,x::xs) -> (concatD [prtMapSeq 0 x ; render ";" ; prtMapSeqListBNFC 0 xs])
and prtInstr (i:int) (e : AbsMichelson.instr) : doc = match e with
       AbsMichelson.BLOCK instrs -> prPrec i 0 (concatD [render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.DROP  -> prPrec i 0 (concatD [render "DROP"])
  |    AbsMichelson.DROP_N integer -> prPrec i 0 (concatD [render "DROP" ; prtInt 0 integer])
  |    AbsMichelson.DUP  -> prPrec i 0 (concatD [render "DUP"])
  |    AbsMichelson.DUP_N integer -> prPrec i 0 (concatD [render "DUP" ; prtInt 0 integer])
  |    AbsMichelson.SWAP  -> prPrec i 0 (concatD [render "SWAP"])
  |    AbsMichelson.DIG_N integer -> prPrec i 0 (concatD [render "DIG" ; prtInt 0 integer])
  |    AbsMichelson.DUG_N integer -> prPrec i 0 (concatD [render "DUG" ; prtInt 0 integer])
  |    AbsMichelson.PUSH (typ, data) -> prPrec i 0 (concatD [render "PUSH" ; prtTyp 0 typ ; prtData 0 data])
  |    AbsMichelson.SOME  -> prPrec i 0 (concatD [render "SOME"])
  |    AbsMichelson.NONE typ -> prPrec i 0 (concatD [render "NONE" ; prtTyp 0 typ])
  |    AbsMichelson.UNIT  -> prPrec i 0 (concatD [render "UNIT"])
  |    AbsMichelson.NEVER  -> prPrec i 0 (concatD [render "NEVER"])
  |    AbsMichelson.IF_NONE (instrs1, instrs2) -> prPrec i 0 (concatD [render "IF_NONE" ; render "{" ; prtInstrListBNFC 0 instrs1 ; render "}" ; render "{" ; prtInstrListBNFC 0 instrs2 ; render "}"])
  |    AbsMichelson.PAIR  -> prPrec i 0 (concatD [render "PAIR"])
  |    AbsMichelson.PAIR_N integer -> prPrec i 0 (concatD [render "PAIR" ; prtInt 0 integer])
  |    AbsMichelson.CAR  -> prPrec i 0 (concatD [render "CAR"])
  |    AbsMichelson.CDR  -> prPrec i 0 (concatD [render "CDR"])
  |    AbsMichelson.UNPAIR  -> prPrec i 0 (concatD [render "UNPAIR"])
  |    AbsMichelson.UNPAIR_N integer -> prPrec i 0 (concatD [render "UNPAIR" ; prtInt 0 integer])
  |    AbsMichelson.LEFT typ -> prPrec i 0 (concatD [render "LEFT" ; prtTyp 0 typ])
  |    AbsMichelson.RIGHT typ -> prPrec i 0 (concatD [render "RIGHT" ; prtTyp 0 typ])
  |    AbsMichelson.IF_LEFT (instrs1, instrs2) -> prPrec i 0 (concatD [render "IF_LEFT" ; render "{" ; prtInstrListBNFC 0 instrs1 ; render "}" ; render "{" ; prtInstrListBNFC 0 instrs2 ; render "}"])
  |    AbsMichelson.NIL typ -> prPrec i 0 (concatD [render "NIL" ; prtTyp 0 typ])
  |    AbsMichelson.CONS  -> prPrec i 0 (concatD [render "CONS"])
  |    AbsMichelson.IF_CONS (instrs1, instrs2) -> prPrec i 0 (concatD [render "IF_CONS" ; render "{" ; prtInstrListBNFC 0 instrs1 ; render "}" ; render "{" ; prtInstrListBNFC 0 instrs2 ; render "}"])
  |    AbsMichelson.SIZE  -> prPrec i 0 (concatD [render "SIZE"])
  |    AbsMichelson.EMPTY_SET ctyp -> prPrec i 0 (concatD [render "EMPTY_SET" ; prtCTyp 0 ctyp])
  |    AbsMichelson.EMPTY_MAP (ctyp, typ) -> prPrec i 0 (concatD [render "EMPTY_MAP" ; prtCTyp 0 ctyp ; prtTyp 0 typ])
  |    AbsMichelson.EMPTY_BIG_MAP (ctyp, typ) -> prPrec i 0 (concatD [render "EMPTY_BIG_MAP" ; prtCTyp 0 ctyp ; prtTyp 0 typ])
  |    AbsMichelson.MAP instrs -> prPrec i 0 (concatD [render "MAP" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.ITER instrs -> prPrec i 0 (concatD [render "ITER" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.MEM  -> prPrec i 0 (concatD [render "MEM"])
  |    AbsMichelson.GET  -> prPrec i 0 (concatD [render "GET"])
  |    AbsMichelson.GET_N integer -> prPrec i 0 (concatD [render "GET" ; prtInt 0 integer])
  |    AbsMichelson.UPDATE  -> prPrec i 0 (concatD [render "UPDATE"])
  |    AbsMichelson.UPDATE_N integer -> prPrec i 0 (concatD [render "UPDATE" ; prtInt 0 integer])
  |    AbsMichelson.GET_AND_UPDATE  -> prPrec i 0 (concatD [render "GET_AND_UPDATE"])
  |    AbsMichelson.IF (instrs1, instrs2) -> prPrec i 0 (concatD [render "IF" ; render "{" ; prtInstrListBNFC 0 instrs1 ; render "}" ; render "{" ; prtInstrListBNFC 0 instrs2 ; render "}"])
  |    AbsMichelson.LOOP instrs -> prPrec i 0 (concatD [render "LOOP" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.LOOP_LEFT instrs -> prPrec i 0 (concatD [render "LOOP_LEFT" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.LAMBDA (typ1, typ2, instrs) -> prPrec i 0 (concatD [render "LAMBDA" ; prtTyp 0 typ1 ; prtTyp 0 typ2 ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.EXEC  -> prPrec i 0 (concatD [render "EXEC"])
  |    AbsMichelson.APPLY  -> prPrec i 0 (concatD [render "APPLY"])
  |    AbsMichelson.DIP instrs -> prPrec i 0 (concatD [render "DIP" ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.DIP_N (integer, instrs) -> prPrec i 0 (concatD [render "DIP" ; prtInt 0 integer ; render "{" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.FAILWITH  -> prPrec i 0 (concatD [render "FAILWITH"])
  |    AbsMichelson.CAST  -> prPrec i 0 (concatD [render "CAST"])
  |    AbsMichelson.RENAME  -> prPrec i 0 (concatD [render "RENAME"])
  |    AbsMichelson.CONCAT  -> prPrec i 0 (concatD [render "CONCAT"])
  |    AbsMichelson.SLICE  -> prPrec i 0 (concatD [render "SLICE"])
  |    AbsMichelson.PACK  -> prPrec i 0 (concatD [render "PACK"])
  |    AbsMichelson.UNPACK typ -> prPrec i 0 (concatD [render "UNPACK" ; prtTyp 0 typ])
  |    AbsMichelson.ADD  -> prPrec i 0 (concatD [render "ADD"])
  |    AbsMichelson.SUB  -> prPrec i 0 (concatD [render "SUB"])
  |    AbsMichelson.MUL  -> prPrec i 0 (concatD [render "MUL"])
  |    AbsMichelson.EDIV  -> prPrec i 0 (concatD [render "EDIV"])
  |    AbsMichelson.ABS  -> prPrec i 0 (concatD [render "ABS"])
  |    AbsMichelson.SNAT  -> prPrec i 0 (concatD [render "ISNAT"])
  |    AbsMichelson.INT  -> prPrec i 0 (concatD [render "INT"])
  |    AbsMichelson.NEG  -> prPrec i 0 (concatD [render "NEG"])
  |    AbsMichelson.LSL  -> prPrec i 0 (concatD [render "LSL"])
  |    AbsMichelson.LSR  -> prPrec i 0 (concatD [render "LSR"])
  |    AbsMichelson.OR  -> prPrec i 0 (concatD [render "OR"])
  |    AbsMichelson.AND  -> prPrec i 0 (concatD [render "AND"])
  |    AbsMichelson.XOR  -> prPrec i 0 (concatD [render "XOR"])
  |    AbsMichelson.NOT  -> prPrec i 0 (concatD [render "NOT"])
  |    AbsMichelson.COMPARE  -> prPrec i 0 (concatD [render "COMPARE"])
  |    AbsMichelson.EQ  -> prPrec i 0 (concatD [render "EQ"])
  |    AbsMichelson.NEQ  -> prPrec i 0 (concatD [render "NEQ"])
  |    AbsMichelson.LT  -> prPrec i 0 (concatD [render "LT"])
  |    AbsMichelson.GT  -> prPrec i 0 (concatD [render "GT"])
  |    AbsMichelson.LE  -> prPrec i 0 (concatD [render "LE"])
  |    AbsMichelson.GE  -> prPrec i 0 (concatD [render "GE"])
  |    AbsMichelson.SELF  -> prPrec i 0 (concatD [render "SELF"])
  |    AbsMichelson.SELF_ADDRESS  -> prPrec i 0 (concatD [render "SELF_ADDRESS"])
  |    AbsMichelson.CONTRACT typ -> prPrec i 0 (concatD [render "CONTRACT" ; prtTyp 0 typ])
  |    AbsMichelson.TRANSFER_TOKENS  -> prPrec i 0 (concatD [render "TRANSFER_TOKENS"])
  |    AbsMichelson.SET_DELEGATE  -> prPrec i 0 (concatD [render "SET_DELEGATE"])
  |    AbsMichelson.CREATE_CONTRACT (typ1, typ2, instrs) -> prPrec i 0 (concatD [render "CREATE_CONTRACT" ; render "{" ; render "parameter" ; prtTyp 0 typ1 ; render ";" ; render "storage" ; prtTyp 0 typ2 ; render ";" ; render "code" ; prtInstrListBNFC 0 instrs ; render "}"])
  |    AbsMichelson.IMPLICIT_ACCOUNT  -> prPrec i 0 (concatD [render "IMPLICIT_ACCOUNT"])
  |    AbsMichelson.VOTING_POWER  -> prPrec i 0 (concatD [render "VOTING_POWER"])
  |    AbsMichelson.NOW  -> prPrec i 0 (concatD [render "NOW"])
  |    AbsMichelson.LEVEL  -> prPrec i 0 (concatD [render "LEVEL"])
  |    AbsMichelson.AMOUNT  -> prPrec i 0 (concatD [render "AMOUNT"])
  |    AbsMichelson.BALANCE  -> prPrec i 0 (concatD [render "BALANCE"])
  |    AbsMichelson.CHECK_SIGNATURE  -> prPrec i 0 (concatD [render "CHECK_SIGNATURE"])
  |    AbsMichelson.BLAKE2B  -> prPrec i 0 (concatD [render "BLAKE2B"])
  |    AbsMichelson.KECCAK  -> prPrec i 0 (concatD [render "KECCAK"])
  |    AbsMichelson.SHA3  -> prPrec i 0 (concatD [render "SHA3"])
  |    AbsMichelson.SHA256  -> prPrec i 0 (concatD [render "SHA256"])
  |    AbsMichelson.SHA512  -> prPrec i 0 (concatD [render "SHA512"])
  |    AbsMichelson.HASH_KEY  -> prPrec i 0 (concatD [render "HASH_KEY"])
  |    AbsMichelson.SOURCE  -> prPrec i 0 (concatD [render "SOURCE"])
  |    AbsMichelson.SENDER  -> prPrec i 0 (concatD [render "SENDER"])
  |    AbsMichelson.ADDRESS  -> prPrec i 0 (concatD [render "ADDRESS"])
  |    AbsMichelson.CHAIN_ID  -> prPrec i 0 (concatD [render "CHAIN_ID"])
  |    AbsMichelson.TOTAL_VOTING_POWER  -> prPrec i 0 (concatD [render "TOTAL_VOTING_POWER"])
  |    AbsMichelson.PAIRING_CHECK  -> prPrec i 0 (concatD [render "PAIRING_CHECK"])
  |    AbsMichelson.SAPLING_EMPTY_STATE integer -> prPrec i 0 (concatD [render "SAPLING_EMPTY_STATE" ; prtInt 0 integer])
  |    AbsMichelson.SAPLING_VERIFY_UPDATE  -> prPrec i 0 (concatD [render "SAPLING_VERIFY_UPDATE"])
  |    AbsMichelson.TICKET  -> prPrec i 0 (concatD [render "TICKET"])
  |    AbsMichelson.READ_TICKET  -> prPrec i 0 (concatD [render "READ_TICKET"])
  |    AbsMichelson.SPLIT_TICKET  -> prPrec i 0 (concatD [render "SPLIT_TICKET"])
  |    AbsMichelson.JOIN_TICKETS  -> prPrec i 0 (concatD [render "JOIN_TICKETS"])
  |    AbsMichelson.OPEN_CHEST  -> prPrec i 0 (concatD [render "OPEN_CHEST"])

and prtInstrListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtInstr 0 x])
  | (_,x::xs) -> (concatD [prtInstr 0 x ; render ";" ; prtInstrListBNFC 0 xs])
and prtTyp (i:int) (e : AbsMichelson.typ) : doc = match e with
       AbsMichelson.TCtype ctyp -> prPrec i 0 (concatD [prtCTyp 0 ctyp])
  |    AbsMichelson.TOperation  -> prPrec i 0 (concatD [render "operation"])
  |    AbsMichelson.TContract typ -> prPrec i 0 (concatD [render "contract" ; prtTyp 0 typ])
  |    AbsMichelson.TOption typ -> prPrec i 0 (concatD [render "option" ; prtTyp 0 typ])
  |    AbsMichelson.TList typ -> prPrec i 0 (concatD [render "list" ; prtTyp 0 typ])
  |    AbsMichelson.TSet ctyp -> prPrec i 0 (concatD [render "set" ; prtCTyp 0 ctyp])
  |    AbsMichelson.TTicket ctyp -> prPrec i 0 (concatD [render "ticket" ; prtCTyp 0 ctyp])
  |    AbsMichelson.TPair (typ, typeseqs) -> prPrec i 0 (concatD [render "(" ; render "pair" ; prtTyp 0 typ ; prtTypeSeqListBNFC 0 typeseqs ; render ")"])
  |    AbsMichelson.TOr (typ1, typ2) -> prPrec i 0 (concatD [render "or" ; prtTyp 0 typ1 ; prtTyp 0 typ2])
  |    AbsMichelson.TLambda (typ1, typ2) -> prPrec i 0 (concatD [render "lambda" ; prtTyp 0 typ1 ; prtTyp 0 typ2])
  |    AbsMichelson.TMap (ctyp, typ) -> prPrec i 0 (concatD [render "map" ; prtCTyp 0 ctyp ; prtTyp 0 typ])
  |    AbsMichelson.TBig_map (ctyp, typ) -> prPrec i 0 (concatD [render "big_map" ; prtCTyp 0 ctyp ; prtTyp 0 typ])
  |    AbsMichelson.TBls_381_g1  -> prPrec i 0 (concatD [render "bls12_381_g1"])
  |    AbsMichelson.TBls_381_g2  -> prPrec i 0 (concatD [render "bls12_381_g2"])
  |    AbsMichelson.TBls_381_fr  -> prPrec i 0 (concatD [render "bls12_381_fr"])
  |    AbsMichelson.TSapling_transaction integer -> prPrec i 0 (concatD [render "sapling_transaction" ; prtInt 0 integer])
  |    AbsMichelson.TSapling_state integer -> prPrec i 0 (concatD [render "sapling_state" ; prtInt 0 integer])
  |    AbsMichelson.TChest  -> prPrec i 0 (concatD [render "chest"])
  |    AbsMichelson.TChest_key  -> prPrec i 0 (concatD [render "chest_key"])


and prtTypeSeq (i:int) (e : AbsMichelson.typeSeq) : doc = match e with
       AbsMichelson.TypeSeq0 typ -> prPrec i 0 (concatD [prtTyp 0 typ])

and prtTypeSeqListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtTypeSeq 0 x])
  | (_,x::xs) -> (concatD [prtTypeSeq 0 x ; prtTypeSeqListBNFC 0 xs])
and prtCTyp (i:int) (e : AbsMichelson.cTyp) : doc = match e with
       AbsMichelson.CUnit  -> prPrec i 0 (concatD [render "unit"])
  |    AbsMichelson.CNever  -> prPrec i 0 (concatD [render "never"])
  |    AbsMichelson.CBool  -> prPrec i 0 (concatD [render "bool"])
  |    AbsMichelson.CInt  -> prPrec i 0 (concatD [render "int"])
  |    AbsMichelson.CNat  -> prPrec i 0 (concatD [render "nat"])
  |    AbsMichelson.CString  -> prPrec i 0 (concatD [render "string"])
  |    AbsMichelson.CChain_id  -> prPrec i 0 (concatD [render "chain_id"])
  |    AbsMichelson.CBytes  -> prPrec i 0 (concatD [render "bytes"])
  |    AbsMichelson.CMutez  -> prPrec i 0 (concatD [render "mutez"])
  |    AbsMichelson.CKey_hash  -> prPrec i 0 (concatD [render "key_hash"])
  |    AbsMichelson.CKey  -> prPrec i 0 (concatD [render "key"])
  |    AbsMichelson.CSignature  -> prPrec i 0 (concatD [render "signature"])
  |    AbsMichelson.CTimestamp  -> prPrec i 0 (concatD [render "timestamp"])
  |    AbsMichelson.CAddress  -> prPrec i 0 (concatD [render "address"])
  |    AbsMichelson.COption ctyp -> prPrec i 0 (concatD [render "option" ; prtCTyp 0 ctyp])
  |    AbsMichelson.COr (ctyp1, ctyp2) -> prPrec i 0 (concatD [render "or" ; prtCTyp 0 ctyp1 ; prtCTyp 0 ctyp2])
  |    AbsMichelson.CPair (ctyp, ctypeseqs) -> prPrec i 0 (concatD [render "(" ; render "pair" ; prtCTyp 0 ctyp ; prtCTypeSeqListBNFC 0 ctypeseqs ; render ")"])


and prtCTypeSeq (i:int) (e : AbsMichelson.cTypeSeq) : doc = match e with
       AbsMichelson.CTypeSeq0 ctyp -> prPrec i 0 (concatD [prtCTyp 0 ctyp])

and prtCTypeSeqListBNFC i es : doc = match (i, es) with
    (_,[]) -> (concatD [])
  | (_,[x]) -> (concatD [prtCTypeSeq 0 x])
  | (_,x::xs) -> (concatD [prtCTypeSeq 0 x ; prtCTypeSeqListBNFC 0 xs])

