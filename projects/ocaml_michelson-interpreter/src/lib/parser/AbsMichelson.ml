(* File generated by the BNF Converter (bnfc 2.9.3). *)

type str = Str of string
and hex = Hex of string
and neg = Neg of string
and prog =
   Contract of typ * typ * instr list
 | Argument of data

and data =
   DNeg of neg
 | DNat of int
 | DStr of str
 | DBytes of hex
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
   BLOCK of instr list
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
[@@deriving eq]

and typ =
   TCtype of cTyp
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
   CUnit
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

let m_FAIL  = BLOCK (UNIT :: FAILWITH :: [])
let m_CMPEQ  = BLOCK (COMPARE :: EQ :: [])
let m_CMPNEQ  = BLOCK (COMPARE :: NEQ :: [])
let m_CMPLT  = BLOCK (COMPARE :: LT :: [])
let m_CMPGT  = BLOCK (COMPARE :: GT :: [])
let m_CMPLE  = BLOCK (COMPARE :: LE :: [])
let m_CMPGE  = BLOCK (COMPARE :: GE :: [])
let m_IFEQ (bt, bf) = BLOCK (EQ :: (IF (bt, bf)) :: [])
let m_IFNEQ (bt, bf) = BLOCK (NEQ :: (IF (bt, bf)) :: [])
let m_IFLT (bt, bf) = BLOCK (LT :: (IF (bt, bf)) :: [])
let m_IFGT (bt, bf) = BLOCK (GT :: (IF (bt, bf)) :: [])
let m_IFLE (bt, bf) = BLOCK (LE :: (IF (bt, bf)) :: [])
let m_IFGE (bt, bf) = BLOCK (GE :: (IF (bt, bf)) :: [])
let m_IFCMPEQ (bt, bf) = BLOCK (m_CMPEQ :: (IF (bt, bf)) :: [])
let m_IFCMPNEQ (bt, bf) = BLOCK (m_CMPNEQ :: (IF (bt, bf)) :: [])
let m_IFCMPLT (bt, bf) = BLOCK (m_CMPLT :: (IF (bt, bf)) :: [])
let m_IFCMPGT (bt, bf) = BLOCK (m_CMPGT :: (IF (bt, bf)) :: [])
let m_IFCMPLE (bt, bf) = BLOCK (m_CMPLE :: (IF (bt, bf)) :: [])
let m_IFCMPGE (bt, bf) = BLOCK (m_CMPGE :: (IF (bt, bf)) :: [])
let m_ASSERT  = IF ([], m_FAIL :: [])
let m_ASSERT_EQ  = m_IFEQ ([], m_FAIL :: [])
let m_ASSERT_NEQ  = m_IFNEQ ([], m_FAIL :: [])
let m_ASSERT_LT  = m_IFLT ([], m_FAIL :: [])
let m_ASSERT_GT  = m_IFGT ([], m_FAIL :: [])
let m_ASSERT_LE  = m_IFLE ([], m_FAIL :: [])
let m_ASSERT_GE  = m_IFGE ([], m_FAIL :: [])
let m_ASSERT_CMPEQ  = m_IFCMPEQ ([], m_FAIL :: [])
let m_ASSERT_CMPNEQ  = m_IFCMPNEQ ([], m_FAIL :: [])
let m_ASSERT_CMPLT  = m_IFCMPLT ([], m_FAIL :: [])
let m_ASSERT_CMPGT  = m_IFCMPGT ([], m_FAIL :: [])
let m_ASSERT_CMPLE  = m_IFCMPLE ([], m_FAIL :: [])
let m_ASSERT_CMPGE  = m_IFCMPGE ([], m_FAIL :: [])
let m_ASSERT_NONE  = IF_NONE ([], m_FAIL :: [])
let m_ASSERT_SOME  = IF_NONE (m_FAIL :: [], RENAME :: [])
let m_ASSERT_LEFT  = IF_LEFT (RENAME :: [], m_FAIL :: [])
let m_ASSERT_RIGHT  = IF_LEFT (m_FAIL :: [], RENAME :: [])
let m_IF_SOME (bt, bf) = IF_NONE (bt, bf)
let m_IF_RIGHT (bt, bf) = IF_LEFT (bf, bt)
