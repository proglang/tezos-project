open Michelsym

let lauction_parameter = TKey_Hash
let lauction_storage = TPair (TTimestamp, TPair (TMutez, TKey_Hash))

let lauction_submit = [
  I "DUP" ;
  DIP (1, [ I "CDR" ] ) ;
  I "CAR" ;
  DIP (1, [ I "DUP" ] ) ;
  I "SWAP" ;
  I "CAR" ;
  I "NOW" ;
  I "COMPARE" ;
  I "GT" ;
  COND ("IF", [ PUSH (VString "timeout") ; I "FAILWITH" ], [ ]) ;
  I "AMOUNT" ;
  DIP (2, [ I "DUP" ]) ;
  DIG 2 ;
  I "CDR" ; I "CAR" ;
  DIP (1, [ I "DUP" ]) ;
  I "SWAP" ;
  I "COMPARE" ;
  I "LE" ;
  COND ("IF", [ PUSH (VString "too low") ; I "FAILWITH" ], []) ;
  DIP (2, [ I "DUP" ]) ;
  DIG 2 ;
  I "DUP" ;
  I "CAR" ;
  I "SWAP" ;
  I "CDR" ;
  I "CDR" ;
  DIP (2, [ I "DUP" ]) ;
  DIG 2 ;
  I "PAIR" ;
  I "SWAP" ;
  I "PAIR" ;
  I "DUP" ;
  I "CAR" ;
  I "SWAP" ;
  I "CDR" ;
  I "CAR" ;
  DIP (3, [ I "DUP" ]) ;
  DIG 3 ;
  I "SWAP" ;
  I "PAIR" ;
  I "SWAP" ;
  I "PAIR" ;
  T ("NIL", TOperation) ;
  DIP (4, [ I "DUP" ]) ;
  DIG 4 ;
  I "CDR" ; I "CDR" ;
  I "IMPLICIT_ACCOUNT" ;
  DIP (5, [ I "DUP" ]) ;
  DIG 5 ;
  DIP (4, [ I "DROP"; I "DROP"; I "DROP" ]) ;
  I "CDR" ; I "CAR" ;
  I "UNIT" ;
  I "TRANSFER_TOKENS" ;
  I "CONS" ;
  I "PAIR"
]

let lauction_entrypoints = entrypoints lauction_parameter
let lauction_stacks =
  List.map (fun ep -> initial_stack_from_entrypoint ep lauction_storage) lauction_entrypoints
let [stack_submit] = lauction_stacks

let () = Env.add_typed "SELF" (TContract lauction_parameter)
let env = Env.table
let final_submit = interpret lauction_submit stack_submit env

let analysis_submit = final_submit initial_constraints
