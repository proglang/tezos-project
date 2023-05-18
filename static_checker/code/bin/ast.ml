type ty = [
  | `Unit
  | `Never
  | `Bool
  | `Int
  | `Nat
  | `String 
  | `Chain_id
  | `Bytes
  | `Mutez
  | `Key_hash
  | `Key
  | `Signature
  | `Timestamp
  | `Address
  | `Tx_rollup_12_address
  | `Option of ty 
  | `Or of ty * ty 
  | `Pair of ty * ty 
  | `List of ty
  | `Set of ty
  | `Operation
  | `Contract of ty
  | `Map of ty * ty
  | `Big_map of ty * ty
  | `Lambda of ty * ty
  | `Ticket of ty
  | `Bls12_381_g1
  | `Bls12_381_g2
  | `Bls12_381_fr
  | `Sapling_transaction of int
  | `Sapling_state of int
  | `Chest
  | `Chest_key
  ]
type mterm = [
  | `NVar of string
  | `Var of string * ty
  | `String of string
  | `Int of int
  | `Nat of int
  | `Bool of bool
  | `Mutez of int
  | `Timestamp of int
  | `Key_hash of string
  | `Key of string
  | `Address of string
  | `Signature of string
  | `Chain_id of string
  | `Bytes of string
  | `Left of mterm * ty
  | `Right of mterm * ty
  | `Pair of mterm * mterm
  | `None of ty
  | `Some of mterm * ty
  | `Unit
  | `Never
  | `Min_block_time
  | `Amount
  | `Balance
  | `CChain_id
  | `Level
  | `Now
  | `Sender
  | `Self of ty
  | `Self_address
  | `Source
  | `Total_voting
  | `Instr of instr list
  | `Lambda of instr list * ty * ty
  | `List of mterm list * ty
  | `Set of mterm list * ty
  | `Elt of mterm * mterm
  | `Map of mterm list * ty * ty
  | `BMap of mterm list * ty * ty
  | `Contract of ty * string
  | `Add of mterm * mterm
  | `Sub of mterm * mterm
  | `Mul of mterm * mterm
  | `Div of mterm * mterm
  | `Mod of mterm * mterm
  | `Rem of mterm * mterm
  | `And of mterm * mterm
  | `Or of mterm * mterm
  | `Xor of mterm * mterm
  | `Imply of mterm * mterm
  | `Eq of mterm * mterm
  | `Neq of mterm * mterm
  | `Gt of mterm * mterm
  | `Ge of mterm * mterm
  | `Lt of mterm * mterm
  | `Le of mterm * mterm
  | `Concat of mterm * mterm
  | `Contain of mterm * mterm
  | `At of mterm * mterm
  | `Substring of mterm * mterm * mterm
  | `Select of mterm * mterm
  | `Store of mterm * mterm
  | `Insert of mterm * mterm
  | `Not of mterm
  | `Len of mterm
  | `To_int of mterm
  | `From_int of mterm
  | `Length of mterm
  | `Abs of mterm
  | `Head of mterm
  | `Tail of mterm
  | `First of mterm
  | `Second of mterm
  ]
and instr = [
  | `APPLY
  | `EXEC
  | `FAILWITH of string
  | `IF of instr list * instr list
  | `IF_CONS of instr list * instr list
  | `IF_LEFT of instr list * instr list
  | `IF_NONE of instr list * instr list
  | `ITER of instr list 
  | `LAMBDA of ty * ty * instr list
  | `LAMBDA_REC of ty * ty * instr list
  | `LOOP of instr list
  | `LOOP_LEFT of instr list
  | `DIG of int
  | `DIP of instr list
  | `DIP_N of int * instr list
  | `DROP
  | `DROP_N of int
  | `DUG of int
  | `DUP
  | `DUP_N of int
  | `PUSH of ty * mterm
  | `SWAP
  | `ABS
  | `ADD
  | `COMPARE
  | `EDIV
  | `EQ
  | `NEQ
  | `GE
  | `GT
  | `INT
  | `LE
  | `LSL
  | `LSR
  | `LT
  | `MUL
  | `NEG
  | `SUB
  | `AND
  | `NOT
  | `OR
  | `XOR
  | `BLAKE2B
  | `CHECK_SIGNATURE
  | `HASH_KEY
  | `KECCAK
  | `PAIRING_CHECK
  | `SHA256
  | `SHA3
  | `SHA512
  | `ADDRESS
  | `AMOUNT
  | `BALANCE
  | `CHAIN_ID
  | `CONTRACT of ty
  | `IMPLICIT_ACCOUNT
  | `LEVEL
  | `NOW
  | `SELF
  | `SELF_ADDRESS
  | `SENDER
  | `SET_DELEGATE
  | `SOURCE
  | `TOTAL_VOTING_POWER
  | `TRANSFER_TOKENS
  | `VOTING_POWER
  | `CAR
  | `CDR
  | `CONCAT
  | `CONS
  | `EMPTY_BIG_MAP of ty * ty
  | `EMPTY_MAP of ty * ty
  | `EMPTY_SET of ty 
  | `GET
  | `GET_N of int
  | `GET_AND_UPDATE
  | `LEFT of ty
  | `MAP of instr list
  | `MEM
  | `NEVER
  | `NIL of ty
  | `NONE of ty
  | `PACK
  | `PAIR
  | `PAIR_N of int
  | `RIGHT of ty
  | `SIZE
  | `SLICE
  | `SOME
  | `UNIT
  | `UNPACK of ty
  | `UNPAIR
  | `UNPAIR_N of int
  | `UPDATE
  | `UPDATE_N of int
  | `JOINT_TICKETS
  | `READ_TICKETS
  | `SPLIT_TICKET
  | `TICKET
  ]
type assertion = [
  | `Assertion of mterm
  | `Forall of mterm * assertion
  | `Exists of  mterm * assertion
  | `Cons of assertion * assertion
  ]
type entrypoint_assertion = [
  | `Lead_no of string * string
  | `Lead_co of entrypoint_assertion * mterm
  | `NLead_no of string * string
  | `NLead_co of entrypoint_assertion * mterm
  | `Cons of entrypoint_assertion * entrypoint_assertion
  ]
type condition = [
  | `Condition of assertion * assertion
  ]
type requirement = [
  | `Req of assertion
  ]
type output_stack = [
  | `Output of mterm
  ]
type parameter = [
  | `Parameter of mterm
  ]
type storage = [
  | `Storage of mterm
  ]
type input_stack = [
  | `Input of mterm
  ]
type check_statement = [
  | `Check_sta_1 of output_stack 
  | `Check_sta_2 of requirement 
  | `Check_sta_3 of output_stack * requirement 
  | `Check_sta_4 of output_stack * condition
  | `Check_sta_5 of output_stack * requirement * condition
  ]
type code = [
  | `Code of instr list
  ]
type body_check = [ 
  | `Body of code * input_stack * check_statement
  ]
type entrypoint = [
  | `Entrypoint of string * body_check
  ]
type pentrypoint = [
  | `PEntrypoint of string * parameter
  ]
type contract_body = [
  | `Body_check of body_check
  | `Entrypoint_list of entrypoint list
  | `Entrypoint_list_assert of entrypoint list * assertion
  | `PEntrypoint_list of code * storage * (pentrypoint list) * entrypoint_assertion
  ]
type contract = [
  | `Contract of string * contract_body
  ]



