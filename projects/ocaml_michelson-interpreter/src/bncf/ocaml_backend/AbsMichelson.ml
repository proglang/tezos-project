(* OCaml module generated by the BNF converter *)

type str = Str of string
and hex = Hex of string
and prog =
   Contract of typ * typ * instr list
 | Code of instr list

and inta =
   IntPos of int
 | IntNeg of int

and pairSeq =
   DPairSeq1 of data * data
 | DPairSeq2 of data * pairSeq

and mapSeq =
   DMapSeq1 of data * data
 | DMapSeq2 of data * data * mapSeq

and data =
   DInt of inta
 | DStr of str
 | DByte of hex
 | DUnit
 | DTrue
 | DFalse
 | DPair2 of pairSeq
 | DLeft of data
 | DRight of data
 | DSome of data
 | DNone
 | DBlock of data list
 | DMap of mapSeq
 | DInstr of instr

and instr =
   IBLOCK of instr list
 | IDROP
 | IDROP_N of int
 | IDUP
 | IDUP_N of int
 | ISWAP
 | IDIG_N of int
 | IDUG_N of int
 | IPUSH of typ * data
 | ISOME
 | INONE of typ
 | IUNIT
 | INEVER
 | IIF_NONE of instr list * instr list
 | IPAIR
 | IPAIR_N of int
 | ICAR
 | ICDR
 | IUNPAIR
 | IUNPAIR_N of int
 | ILEFT of typ
 | IRIGHT of typ
 | IIF_LEFT of instr list * instr list
 | INIL of typ
 | ICONS
 | IIF_CONS of instr list * instr list
 | ISIZE
 | IEMPTY_SET of cTyp
 | IEMPTY_MAP of cTyp * typ
 | IEMPTY_BIG_MAP of cTyp * typ
 | IMAP of instr list
 | IITER of instr list
 | IMEM
 | IGET
 | IGET_N of int
 | IUPDATE
 | IUPDATE_N of int
 | IIF of instr list * instr list
 | ILOOP of instr list
 | ILOOP_LEFT of instr list
 | ILAMBDA of typ * typ * instr list
 | IEXEC
 | IAPPLY
 | IDIP of instr list
 | IDIP_N of int * instr list
 | IFAILWITH
 | ICAST
 | IRENAME
 | ICONCAT
 | ISLICE
 | IPACK
 | IUNPACK of typ
 | IADD
 | ISUB
 | IMUL
 | IEDIC
 | IABS
 | ISNAT
 | IINT
 | INEG
 | ILSL
 | ILSR
 | IOR
 | IAND
 | IXOR
 | INOT
 | ICOMPARE
 | IEQ
 | INEQ
 | ILT
 | IGT
 | ILE
 | IGE
 | ISELF
 | ISELF_ADDRESS
 | ICONTRACT of typ
 | ITRANSFER_TOKENS
 | ISET_DELEGATE
 | ICREATE_CONTRACT of instr list
 | IIMPLICIT_ACCOUNT
 | IVOTING_POWER
 | INOW
 | ILEVEL
 | IAMOUNT
 | IBALANCE
 | ICHECK_SIGNATURE
 | IBLAKE2B
 | IKECCAK
 | ISHA3
 | ISHA256
 | ISHA512
 | IHASH_KEY
 | ISOURCE
 | ISENDER
 | IADDRESS
 | ICHAIN_ID
 | ITOTAL_VOTING_POWER
 | IPAIRING_CHECK
 | ISAPLING_EMPTY_STATE of int
 | ISAPLING_VERIFY_UPDATE
 | ITICKET
 | IREAD_TICKET
 | ISPLIT_TICKET
 | IJOIN_TICKETS
 | IOPEN_CHEST

and typeSeq =
   TTypSeq1 of typ * typ
 | TTypSeq2 of typ * typeSeq

and typ =
   TCtype of cTyp
 | TOption of typ
 | TList of typ
 | TSet of cTyp
 | TOperation
 | TContract of typ
 | TTicket of cTyp
 | TPair of typeSeq
 | TOr of typ * typ
 | TLambda of typ * typ
 | TMap of cTyp * typ
 | TBig_map of cTyp * typ
 | TBls_g1
 | TBls_g2
 | TBls_fr
 | TSapling_transaction of int
 | TSapling_state of int
 | TChest
 | TChest_key

and cTypeSeq =
   CTypSeq1 of cTyp * cTyp
 | CTypSeq2 of cTyp * cTypeSeq

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
 | CPair of cTypeSeq

