(declare-datatypes
 (T1 T2)
 ((Pair (mk-pair (first T1) (second T2)))))

(declare-datatypes
 (T1 T2)
 ((Or (mk-left (as-left T1))
      (mk-right (as-right T2)))))

(declare-datatypes
 (T1)
 ((Option mk-none
	  (mk-some (as-some T1)))))

(declare-datatypes
 ()
 ((Mutez (mk-mutez (as-int Int)))))

(declare-datatypes
 ()
 ((STyp TAddress
	TBool
	TInt
	TNat
	(TList (tlist-elem STyp))
	(TOption (topt-elem STyp))
	TMutez
	(TOr (tor-left STyp) (tor-right STyp))
	(TPair (tpair-left STyp) (tpair-right STyp))
	TString
	TUnit
	(TContract (tcontract-type STyp))
	TAny)))

(declare-sort Address)

(declare-datatypes
 ()
 ((SVal (sv-address (as-address Address))
	(sv-bool (as-bool Bool))
	(sv-int  (as-int  Int))
	(sv-mutez (as-mutez Int))
	(sv-or-left (as-or-left SVal))
	(sv-or-right (as-or-right SVal))
	(sv-pair (as-first SVal) (as-second SVal))
	(sv-string (as-string String))
	sv-unit
	sv-nil
	(sv-cons (as-head SVal) (as-tail SVal))
	sv-non
	(sv-some (as-some SVal))
	(sv-contract (scontract-addr Address) (scontract-ty STyp))
	(sv-op0 (op0-name String))
	(sv-op3 (op3-name String) 
		(op3-1 SVal)
		(op3-2 SVal)
		(op3-3 SVal))
	)))

; instructions
; SENDER
(declare-const sender Address)
; BALANCE
(declare-const balance Mutez)
; CONTRACT ty
(declare-fun contract-address (STyp Address) Bool)

; general contract description
(declare-const initial-stack (List SVal))
(declare-const parameter SVal)
(declare-const storage SVal)

(assert (= initial-stack
	   (insert (sv-pair parameter storage) nil)))

; specific contract description
; initial state
(declare-const auction-closed Bool)
(declare-const auction-owner  Address)
(declare-const auction-bidder Address)
(assert (= storage
	   (sv-pair (sv-bool auction-closed)
		    (sv-pair (sv-address auction-owner)
			     (sv-address auction-bidder)))))

(assert (or (= parameter
	       (sv-or-left sv-unit))
	    (= parameter
	       (sv-or-right sv-unit))))

; final state
(declare-const stack-after-close (List SVal))
(assert (= stack-after-close
	   (insert
	   (sv-pair (sv-cons (sv-op3 "TRANSFER-TOKENS"
				     sv-unit
				     (sv-op0 "BALANCE")
				     (as-first (as-second storage)))
			     sv-nil)
		    (sv-pair (sv-bool false)
			     (sv-pair (as-first (as-second storage))
				      (as-second (as-second
						  storage))))) 
	   nil)))
; true values
(assert (as-bool (as-first storage)))
(assert (= sender (as-address (as-second (as-second storage)))))
; false values (presently there is not enough information in the
; output of michelsym)
(assert (contract-address TUnit (as-address (as-first (as-second storage)))))

(check-sat)
(get-model)


