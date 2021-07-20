open Michelsym

(* examples *)
let auction_parameter = TOr (TUnit, TUnit)
let auction_storage = TPair (TBool, TPair (TAddress, TAddress))
    
let auction_close = [
  (* unit : parm * store : - *)
  I "DROP";
  (* parm * store : - *)
  I "CDR"; I "DUP"; I "CDR"; I "CAR"; I "SENDER"; I "COMPARE"; I "EQ";
  COND ("IF", [], [PUSH (VString "not owner"); I "FAILWITH"]);
  (* store : - *)
  I "UNPAIR"; COND ("IF", [], [PUSH (VString "closed"); I "FAILWITH"]); PUSH (VBool false); I "PAIR";
  (* store : - *)
  PUSH (VMutez 0); I "BALANCE"; I "COMPARE"; I "GT";
  COND ("IF", [
  I "DUP"; I "CDR"; I "CAR";
  (* owner-address : store : - *)
  T ("CONTRACT", TUnit);
  (* (contract unit) option : store *)
  COND ("IF_NONE", [PUSH (VString "bad owner address"); I "FAILWITH"], []);
  I "BALANCE"; PUSH VUnit;
  (* unit : mutez : contract unit : store : - *)
  I "TRANSFER_TOKENS";
  (* operation : store : - *)
  T ("NIL", TOperation); I "SWAP"; I "CONS"],
        [T ("NIL", TOperation)]);
  (* operation list : store : - *)
  I "PAIR"
  (* operation list * store : - *)
]

let auction_bid = [
  (* unit : parm * store : - *)
  I "DROP"; I "CDR"; I "DUP"; I "CAR";
  (* bidding : store : - *)
  COND ("IF", [], [PUSH (VString "closed"); I "FAILWITH"]);
  (* store : - *)
  I "BALANCE"; I "AMOUNT"; PUSH (VNat 2); I "MUL"; I "COMPARE"; I "LE";
  (* amt <= bal : store : - *)
  COND ("IF", [PUSH (VString "too low"); I "FAILWITH"], []);
  (* store : - *)
  I "CDR"; I "UNPAIR"; I "SWAP";
  (* highbidder : owner : - *)
  T ("CONTRACT", TUnit);
  COND ("IF_NONE", [PUSH (VString "bad high bidder address"); I "FAILWITH"], []);
  (* TODO: should be possible to prove that this failure never happens! *)
  I "AMOUNT"; I "BALANCE"; I "SUB"; PUSH VUnit; I "TRANSFER_TOKENS"; T ("NIL", TOperation); I "SWAP"; I "CONS";
  (* operation list : owner *)
  DIP (1, [I "SENDER"; I "SWAP"; I "PAIR"; PUSH (VBool true); I "PAIR"]);
  (* operation list : store : - *)
  I "PAIR"
]

let auction = [
  I "DUP";
  I "CAR";
  COND ("IF_LEFT", auction_close, auction_bid);
]

(* experiments with the example program *)
let auction_entrypoints = entrypoints auction_parameter
let auction_stacks = List.map (fun ep -> initial_stack_from_entrypoint ep auction_storage) auction_entrypoints
let [stack_close; stack_bid] = auction_stacks
    
let () = Env.add_typed "SELF" (TContract auction_parameter)
let env = Env.table
let final_close = interpret auction stack_close env
let final_bid = interpret auction stack_bid env

(* execute *)
let analysis_close = final_close initial_constraints
let analysis_bid   = final_bid   initial_constraints
