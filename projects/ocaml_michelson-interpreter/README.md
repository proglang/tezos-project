# Implemention State

#### Small todos:
- seperate configuration/environment data into own module
- merge michelson.ml into main.ml, rename interpreter.ml to eval.ml and let a new interpreter.ml be the main module/interface to the interpreter. Update /lib/dune with "name michelson_interpreter" and public_name


### TODO / yet to be implemented:

#### PRIORITIES:
1. Tests
2. Configuration Input from file
3. Interpreter output
4. Byte handling
5. Views 
6. ...

#### interpreter
- input of chain-data (environment, including contracts for the wrapper) -> Einlesen einer JSON/YML Konfigurationsdatei (suche OPAM package)
-> CLI as wrapper of the interpreter.
- Interpreter also as its own module/api
- interpreter output -> print.ml using buffer & returning values in Michelson syntax
- cryptographic functions, hashing,
- checking of data values given as string for their validity (address, signature, key, keyhash, chain_id) depending on string length and other details (KT1, tzx for addresses)
- everything regarding eliptic curves
- everything regarding Saplings 
- everything regarding Chests / Timelock
- Bytes in general and PACK/UNPACK
- Exceptions do not show the values -> missing show functions?

#### parser & interpreter
- Entrypoints, Views
- a few Macros

#### testing via test-contracts!



#### others / maybes
- Wrapper / Environment that includes not only the current contract but more contracts
that my be needed by the current contract or for handling the operation list after succesful contract execution.
Is connected to/needed for VOTING_POWER, SET_DELEGATE, TRANSFER_TOCKENS, CREATE_CONTRACT, CONTRACT, address generation
- Tezos API like interface:
  - same exceptions
  - same outputs
  - same input

#### not to be implemented:
- Annotations: currently they are discarded in the interpreter, just as the CAST/RENAME instructions which work on annotations.


#### performance:
- use pointers for environment/configuration (immutable) arguments? Does the compiler optimize this by itself?