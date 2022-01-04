
(* The type of tokens. *)

type token = 
  | TOK_VariableAnnotation of ((int * int) * string)
  | TOK_TypeAnnotation of ((int * int) * string)
  | TOK_String of (string)
  | TOK_Str of ((int * int) * string)
  | TOK_Neg of ((int * int) * string)
  | TOK_Integer of (int)
  | TOK_Ident of (string)
  | TOK_FieldAnnotation of ((int * int) * string)
  | TOK_EOF
  | TOK_Double of (float)
  | TOK_Char of (char)
  | TOK_Bt of ((int * int) * string)
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
  | KW_MAP_CDR
  | KW_MAP_CAR
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
  | KW_IF_RIGHT
  | KW_IF_NONE
  | KW_IF_LEFT
  | KW_IF_CONS
  | KW_IFNEQ
  | KW_IFLT
  | KW_IFLE
  | KW_IFGT
  | KW_IFGE
  | KW_IFEQ
  | KW_IFCMPNEQ
  | KW_IFCMPLT
  | KW_IFCMPLE
  | KW_IFCMPGT
  | KW_IFCMPGE
  | KW_IFCMPEQ
  | KW_IF
  | KW_HASH_KEY
  | KW_GT
  | KW_GET_AND_UPDATE
  | KW_GET
  | KW_GE
  | KW_False
  | KW_FAILWITH
  | KW_FAIL
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
  | KW_CMPNEQ
  | KW_CMPLT
  | KW_CMPLE
  | KW_CMPGT
  | KW_CMPGE
  | KW_CMPEQ
  | KW_CHECK_SIGNATURE
  | KW_CHAIN_ID
  | KW_CDR
  | KW_CAST
  | KW_CAR
  | KW_BLAKE2B
  | KW_BALANCE
  | KW_ASSERT_SOME
  | KW_ASSERT_RIGHT
  | KW_ASSERT_NONE
  | KW_ASSERT_NEQ
  | KW_ASSERT_LT
  | KW_ASSERT_LEFT
  | KW_ASSERT_LE
  | KW_ASSERT_GT
  | KW_ASSERT_GE
  | KW_ASSERT_EQ
  | KW_ASSERT_CMPNEQ
  | KW_ASSERT_CMPLT
  | KW_ASSERT_CMPLE
  | KW_ASSERT_CMPGT
  | KW_ASSERT_CMPGE
  | KW_ASSERT_CMPEQ
  | KW_ASSERT
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
