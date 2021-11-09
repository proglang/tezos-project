# Implemention State

### TODO / yet to be implemented:

#### interpreter

- cryptographic functions, hashing,
- checking of data values given as string for their validity (address, signature, key, keyhash, chain_id) depending on string length and other details (KT1, tzx for addresses)
- address generation
- everything regarding ballistic curves
- everything regarding Saplings 
- everything regarding Chests / Timelock
- Bytes in general and PACK/UNPACK


#### parser & interpreter
- Entrypoints, Views
- a few Macros

#### testing via existing contracts!



#### others / maybes
- decide on the way the computing result is returned (output of the interpreter)
- Wrapper / Environment that includes not only the current contract but more contracts
that my be needed by the current contract or for handling the operation list after succesful contract execution.
Is connected to/needed for VOTING_POWER, SET_DELEGATE, TRANSFER_TOCKENS, CREATE_CONTRACT, CONTRACT
- Tezos API like interface:
  - same exceptions
  - same outputs
  - same input
- Annotations are currently discarded in the interpreter, just as CAST/RENAME instructions
