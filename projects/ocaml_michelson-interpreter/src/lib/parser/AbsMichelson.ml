(* File generated by the BNF Converter (bnfc 2.9.3). *)

type str = Str of ((int * int) * string)
and bt = Bt of ((int * int) * string)
and neg = Neg of ((int * int) * string)
and typeAnnotation = TypeAnnotation of ((int * int) * string)
and variableAnnotation = VariableAnnotation of ((int * int) * string)
and fieldAnnotation = FieldAnnotation of ((int * int) * string)
and prog =
   Contract of typ * typ * instr list
 | Argument of data

and data =
   DNeg of neg
 | DNat of int
 | DStr of str
 | DBytes of bt
 | DUnit
 | DTrue
 | DFalse
 | DPair of data * pairSeq list
 | DLeft of data
 | DRight of data
 | DSome of data
 | DNone
 | DBlock of data list
 | DMap of mapSeq list
 | DInstruction of instr

and pairSeq =
   DPairSeq of data

and mapSeq =
   DMapSeq of data * data

and instr =
   ANNOT of instr * annotation
 | BLOCK of instr list
 | DROP
 | DROP_N of int
 | DUP
 | DUP_N of int
 | SWAP
 | DIG_N of int
 | DUG_N of int
 | PUSH of typ * data
 | SOME
 | NONE of typ
 | UNIT
 | NEVER
 | IF_NONE of instr list * instr list
 | PAIR
 | PAIR_N of int
 | CAR
 | CDR
 | UNPAIR
 | UNPAIR_N of int
 | LEFT of typ
 | RIGHT of typ
 | IF_LEFT of instr list * instr list
 | NIL of typ
 | CONS
 | IF_CONS of instr list * instr list
 | SIZE
 | EMPTY_SET of cTyp
 | EMPTY_MAP of cTyp * typ
 | EMPTY_BIG_MAP of cTyp * typ
 | MAP of instr list
 | ITER of instr list
 | MEM
 | GET
 | GET_N of int
 | UPDATE
 | UPDATE_N of int
 | GET_AND_UPDATE
 | IF of instr list * instr list
 | LOOP of instr list
 | LOOP_LEFT of instr list
 | LAMBDA of typ * typ * instr list
 | EXEC
 | APPLY
 | DIP of instr list
 | DIP_N of int * instr list
 | FAILWITH
 | CAST
 | RENAME
 | CONCAT
 | SLICE
 | PACK
 | UNPACK of typ
 | ADD
 | SUB
 | MUL
 | EDIV
 | ABS
 | SNAT
 | INT
 | NEG
 | LSL
 | LSR
 | OR
 | AND
 | XOR
 | NOT
 | COMPARE
 | EQ
 | NEQ
 | LT
 | GT
 | LE
 | GE
 | SELF
 | SELF_ADDRESS
 | CONTRACT of typ
 | TRANSFER_TOKENS
 | SET_DELEGATE
 | CREATE_CONTRACT of typ * typ * instr list
 | IMPLICIT_ACCOUNT
 | VOTING_POWER
 | NOW
 | LEVEL
 | AMOUNT
 | BALANCE
 | CHECK_SIGNATURE
 | BLAKE2B
 | KECCAK
 | SHA3
 | SHA256
 | SHA512
 | HASH_KEY
 | SOURCE
 | SENDER
 | ADDRESS
 | CHAIN_ID
 | TOTAL_VOTING_POWER
 | PAIRING_CHECK
 | SAPLING_EMPTY_STATE of int
 | SAPLING_VERIFY_UPDATE
 | TICKET
 | READ_TICKET
 | SPLIT_TICKET
 | JOIN_TICKETS
 | OPEN_CHEST
 [@@deriving eq, show { with_path = false }]
and annotation =
   ATypeA of typeAnnotation
 | AVariableA of variableAnnotation
 | AFieldA of fieldAnnotation

and typ =
   TCtype of cTyp
 | TAnnot1 of typ * annotation
 | TAnnot2 of annotation * typ
 | TOperation
 | TContract of typ
 | TOption of typ
 | TList of typ
 | TSet of cTyp
 | TTicket of cTyp
 | TPair of typ * typeSeq list
 | TOr of typ * typ
 | TLambda of typ * typ
 | TMap of cTyp * typ
 | TBig_map of cTyp * typ
 | TBls_381_g1
 | TBls_381_g2
 | TBls_381_fr
 | TSapling_transaction of int
 | TSapling_state of int
 | TChest
 | TChest_key

and typeSeq =
   TypeSeq0 of typ

and cTyp =
   CAnnot1 of cTyp * annotation
 | CAnnot2 of annotation * cTyp
 | CUnit
 | CNever
 | CBool
 | CInt
 | CNat
 | CString
 | CChain_id
 | CBytes
 | CMutez
 | CKey_hash
 | CKey
 | CSignature
 | CTimestamp
 | CAddress
 | COption of cTyp
 | COr of cTyp * cTyp
 | CPair of cTyp * cTypeSeq list

and cTypeSeq =
   CTypeSeq0 of cTyp

(* defined constructors *)

let contract2 (t0, t1, instrs) = Contract (t1, t0, instrs)
let cREATE_CONTRACT2 (t0, t1, instrs) = CREATE_CONTRACT (t1, t0, instrs)
let d_FAIL  = BLOCK (UNIT :: FAILWITH :: [])
let d_CMPEQ  = BLOCK (COMPARE :: EQ :: [])
let d_CMPNEQ  = BLOCK (COMPARE :: NEQ :: [])
let d_CMPLT  = BLOCK (COMPARE :: LT :: [])
let d_CMPGT  = BLOCK (COMPARE :: GT :: [])
let d_CMPLE  = BLOCK (COMPARE :: LE :: [])
let d_CMPGE  = BLOCK (COMPARE :: GE :: [])
let d_IFEQ (bt, bf) = BLOCK (EQ :: (IF (bt, bf)) :: [])
let d_IFNEQ (bt, bf) = BLOCK (NEQ :: (IF (bt, bf)) :: [])
let d_IFLT (bt, bf) = BLOCK (LT :: (IF (bt, bf)) :: [])
let d_IFGT (bt, bf) = BLOCK (GT :: (IF (bt, bf)) :: [])
let d_IFLE (bt, bf) = BLOCK (LE :: (IF (bt, bf)) :: [])
let d_IFGE (bt, bf) = BLOCK (GE :: (IF (bt, bf)) :: [])
let d_IFCMPEQ (bt, bf) = BLOCK (d_CMPEQ :: (IF (bt, bf)) :: [])
let d_IFCMPNEQ (bt, bf) = BLOCK (d_CMPNEQ :: (IF (bt, bf)) :: [])
let d_IFCMPLT (bt, bf) = BLOCK (d_CMPLT :: (IF (bt, bf)) :: [])
let d_IFCMPGT (bt, bf) = BLOCK (d_CMPGT :: (IF (bt, bf)) :: [])
let d_IFCMPLE (bt, bf) = BLOCK (d_CMPLE :: (IF (bt, bf)) :: [])
let d_IFCMPGE (bt, bf) = BLOCK (d_CMPGE :: (IF (bt, bf)) :: [])
let d_ASSERT  = IF ([], d_FAIL :: [])
let d_ASSERT_EQ  = d_IFEQ ([], d_FAIL :: [])
let d_ASSERT_NEQ  = d_IFNEQ ([], d_FAIL :: [])
let d_ASSERT_LT  = d_IFLT ([], d_FAIL :: [])
let d_ASSERT_GT  = d_IFGT ([], d_FAIL :: [])
let d_ASSERT_LE  = d_IFLE ([], d_FAIL :: [])
let d_ASSERT_GE  = d_IFGE ([], d_FAIL :: [])
let d_ASSERT_CMPEQ  = d_IFCMPEQ ([], d_FAIL :: [])
let d_ASSERT_CMPNEQ  = d_IFCMPNEQ ([], d_FAIL :: [])
let d_ASSERT_CMPLT  = d_IFCMPLT ([], d_FAIL :: [])
let d_ASSERT_CMPGT  = d_IFCMPGT ([], d_FAIL :: [])
let d_ASSERT_CMPLE  = d_IFCMPLE ([], d_FAIL :: [])
let d_ASSERT_CMPGE  = d_IFCMPGE ([], d_FAIL :: [])
let d_ASSERT_NONE  = IF_NONE ([], d_FAIL :: [])
let d_ASSERT_SOME  = IF_NONE (d_FAIL :: [], RENAME :: [])
let d_ASSERT_LEFT  = IF_LEFT (RENAME :: [], d_FAIL :: [])
let d_ASSERT_RIGHT  = IF_LEFT (d_FAIL :: [], RENAME :: [])
let d_IF_SOME (bt, bf) = IF_NONE (bf, bt)
let d_IF_RIGHT (bt, bf) = IF_LEFT (bf, bt)
