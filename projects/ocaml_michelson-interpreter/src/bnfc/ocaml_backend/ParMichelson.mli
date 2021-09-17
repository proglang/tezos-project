
(* The type of tokens. *)

type token = 
  | TOK_String of (string)
  | TOK_Str of (string)
  | TOK_Integer of (int)
  | TOK_Ident of (string)
  | TOK_Hex of (string)
  | TOK_EOF
  | TOK_Double of (float)
  | TOK_Char of (char)
  | SYMB6
  | SYMB5
  | SYMB4
  | SYMB3
  | SYMB2
  | SYMB1
  | KW_unit
  | KW_timestamp
  | KW_ticket
  | KW_string
  | KW_storage
  | KW_signature
  | KW_set
  | KW_sapling_transaction
  | KW_sapling_state
  | KW_parameter
  | KW_pair
  | KW_or
  | KW_option
  | KW_operation
  | KW_never
  | KW_nat
  | KW_mutez
  | KW_map
  | KW_list
  | KW_lambda
  | KW_key_hash
  | KW_key
  | KW_int
  | KW_contract
  | KW_code
  | KW_chest_key
  | KW_chest
  | KW_chain_id
  | KW_bytes
  | KW_bool
  | KW_bls12_381_g2
  | KW_bls12_381_g1
  | KW_bls12_381_fr
  | KW_big_map
  | KW_address
  | KW_XOR
  | KW_VOTING_POWER
  | KW_Unit
  | KW_UPDATE
  | KW_UNPAIR
  | KW_UNPACK
  | KW_UNIT
  | KW_True
  | KW_TRANSFER_TOKENS
  | KW_TOTAL_VOTING_POWER
  | KW_TICKET
  | KW_Some
  | KW_SWAP
  | KW_SUB
  | KW_SPLIT_TICKET
  | KW_SOURCE
  | KW_SOME
  | KW_SLICE
  | KW_SIZE
  | KW_SHA512
  | KW_SHA3
  | KW_SHA256
  | KW_SET_DELEGATE
  | KW_SENDER
  | KW_SELF_ADDRESS
  | KW_SELF
  | KW_SAPLING_VERIFY_UPDATE
  | KW_SAPLING_EMPTY_STATE
  | KW_Right
  | KW_RIGHT
  | KW_RENAME
  | KW_READ_TICKET
  | KW_Pair
  | KW_PUSH
  | KW_PAIRING_CHECK
  | KW_PAIR
  | KW_PACK
  | KW_OR
  | KW_OPEN_CHEST
  | KW_None
  | KW_NOW
  | KW_NOT
  | KW_NONE
  | KW_NIL
  | KW_NEVER
  | KW_NEQ
  | KW_NEG
  | KW_MUL
  | KW_MEM
  | KW_MAP
  | KW_Left
  | KW_LT
  | KW_LSR
  | KW_LSL
  | KW_LOOP_LEFT
  | KW_LOOP
  | KW_LEVEL
  | KW_LEFT
  | KW_LE
  | KW_LAMBDA
  | KW_KECCAK
  | KW_JOIN_TICKETS
  | KW_ITER
  | KW_ISNAT
  | KW_INT
  | KW_IMPLICIT_ACCOUNT
  | KW_IF_SOME
  | KW_IF_NONE
  | KW_IF_LEFT
  | KW_IF_CONS
  | KW_IFCMPNEQ
  | KW_IFCMPLT
  | KW_IFCMPLE
  | KW_IFCMPGT
  | KW_IFCMPGE
  | KW_IFCMPEQ
  | KW_IF
  | KW_HASH_KEY
  | KW_GT
  | KW_GET
  | KW_GE
  | KW_False
  | KW_FAILWITH
  | KW_Elt
  | KW_EXEC
  | KW_EQ
  | KW_EMPTY_SET
  | KW_EMPTY_MAP
  | KW_EMPTY_BIG_MAP
  | KW_EDIV
  | KW_DUP
  | KW_DUG
  | KW_DROP
  | KW_DIP
  | KW_DIG
  | KW_CREATE_CONTRACT
  | KW_CONTRACT
  | KW_CONS
  | KW_CONCAT
  | KW_COMPARE
  | KW_CHECK_SIGNATURE
  | KW_CHAIN_ID
  | KW_CDR
  | KW_CAST
  | KW_CAR
  | KW_BLAKE2B
  | KW_BALANCE
  | KW_APPLY
  | KW_AND
  | KW_AMOUNT
  | KW_ADDRESS
  | KW_ADD
  | KW_ABS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val pProg: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (AbsMichelson.prog)
