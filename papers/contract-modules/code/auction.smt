; general
(declare-datatypes
 (T1 T2)
 ((Stack (push (top T1) (pop T2)))))

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
 ((Unit unit)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tezos/Michelson specific
(declare-sort Address)
(declare-fun mk-address (String) Address)
(assert (forall ((s1 String) (s2 String))
		(=> (= (mk-address s1) (mk-address s2))
		    (= s1 s2))))

(declare-datatypes
 ()
 ((Mutez (mk-mutez (as-int Int)))))

(define-fun mutez-int-mul ((x Int) (y Mutez)) Mutez
  (mk-mutez (* x (as-int y))))
(define-fun mutez-add ((x Mutez) (y Mutez)) Mutez
  (mk-mutez (+ (as-int x) (as-int y))))
(define-fun mutez-subtract ((x Mutez) (y Mutez)) Mutez
  (mk-mutez (- (as-int x) (as-int y))))
(define-fun mutez-valid ((x Mutez)) Bool
  (>= (as-int x) 0))
(define-fun mutez-le ((x Mutez) (y Mutez)) Bool
  (<= (as-int x) (as-int y)))

(declare-datatypes
 ()
 ((Contract (mk-contract (contract-address Address)))))

(declare-datatypes
 (T)
 ((Operation (TRANSFER_TOKENS (transfer-arg T)
			      (transfer-amount Mutez)
			      (transfer-contract Contract)))))

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


; instructions
; SENDER
(declare-const SENDER Address)
; BALANCE
(declare-const BALANCE Mutez)
(assert (mutez-valid BALANCE))
; AMOUNT
(declare-const AMOUNT Mutez)
(assert (mutez-valid AMOUNT))
(assert (mutez-le AMOUNT BALANCE))
; CONTRACT ty
(declare-fun CONTRACT-ADDRESS (STyp Address) Bool)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; contract specific description
(declare-const parameter (Or Unit Unit))
(declare-const storage (Pair Bool (Pair Address Address)))

(declare-const initial-stack-top (Pair (Or Unit Unit)
				       (Pair Bool (Pair Address
							Address))))

(define-fun
  get-parameter ((stack (Pair (Or Unit Unit)
			      (Pair Bool (Pair Address
					       Address)))))
  (Or Unit Unit)
  (first stack))
(define-fun
  get-storage ((stack (Pair (Or Unit Unit)
			    (Pair Bool (Pair Address
					       Address)))))
  (Pair Bool (Pair Address Address))
  (second stack))


(declare-const auction-open Bool)
(declare-const auction-owner Address)
(declare-const auction-bidder Address)

(define-fun
  get-open ((storage (Pair Bool (Pair Address Address)))) Bool
  (first storage))
(define-fun
  get-owner ((storage (Pair Bool (Pair Address Address)))) Address
  (first (second storage)))
(define-fun
  get-bidder ((storage (Pair Bool (Pair Address Address)))) Address
  (second (second storage)))

(define-fun
  entrypoint-close ((parameter (Or Unit Unit))) Bool
  (= parameter (mk-left unit)))
(define-fun
  entrypoint-bid ((parameter (Or Unit Unit))) Bool
  (= parameter (mk-right unit)))


(assert (= storage
	   (mk-pair auction-open
		    (mk-pair auction-owner
			     auction-bidder))))
; initial state
(assert (= initial-stack-top (mk-pair parameter storage)))

; final state after close
(declare-const final-stack-top (Pair (List (Operation Unit))
				     (Pair Bool (Pair Address
						      Address))))
; invariants (from pre/postconditions)

(define-fun invariant-constant-owner () Bool
  (= (get-owner (second initial-stack-top))
     (get-owner (second final-stack-top))))
(define-fun invariant-open-bidding () Bool
  (=> (entrypoint-bid (get-parameter initial-stack-top))
      (=> (get-open (second initial-stack-top))
	  (get-open (second final-stack-top)))))
(define-fun invariant-close-bidding () Bool
  (=> (entrypoint-close (get-parameter initial-stack-top))
      (=> (get-open (second initial-stack-top))
	  (not (get-open (second final-stack-top))))))
(define-fun invariant-no-reopen () Bool
  (=> (not (get-open (second initial-stack-top)))
      (not (get-open (second final-stack-top)))))
(define-fun invariant-high-bidder () Bool
  (or (= (get-bidder (second initial-stack-top))
	 (get-bidder (second final-stack-top)))
      (= SENDER
	 (get-bidder (second final-stack-top)))))

(push)
(echo "entrypoint close")
(assert (entrypoint-close (get-parameter initial-stack-top)))
(assert 
 (= final-stack-top
    (mk-pair
     (insert (TRANSFER_TOKENS unit BALANCE (mk-contract (first (second storage)))) nil)
     (mk-pair false
	      (mk-pair (first (second storage))
		       (second (second storage)))))))

; true values
(assert (first storage))
(assert (= SENDER (second (second storage))))
(assert (CONTRACT-ADDRESS TUnit (first (second storage))))

(echo "check first failure")
(push)
(assert (not (CONTRACT-ADDRESS TUnit (first (second storage)))))
(assert (first storage))
(assert (= SENDER (second (second storage))))
(check-sat)
(pop)
(echo "check second failure")
(push)
(assert (= SENDER (second (second storage))))
(assert (not (first storage)))
(check-sat)
(pop)
(echo "check-sat third failure")
(push)
(assert (not (= SENDER (second (second storage)))))
(check-sat)
(pop)
(echo "check general feasibility")
(check-sat)
(get-model)
(echo "check invariants - must be unsat")
(push) (assert (not invariant-constant-owner)) (check-sat) (pop)
(push) (assert (not invariant-open-bidding)) (check-sat) (pop)
(push) (assert (not invariant-close-bidding)) (check-sat) (pop)
(push) (assert (not invariant-no-reopen)) (check-sat) (pop)
(push) (assert (not invariant-high-bidder)) (check-sat) (pop)
(pop)

(push)
(echo "entrypoint bid")
(assert (entrypoint-bid (get-parameter initial-stack-top)))
(assert (mutez-valid (mutez-subtract BALANCE AMOUNT)))
(assert
 (= final-stack-top
    (mk-pair
     (insert (TRANSFER_TOKENS unit
			      (mutez-subtract BALANCE AMOUNT)
			      (mk-contract (second (second storage))))
	     nil)
     (mk-pair true
	      (mk-pair (first (second storage))
		       SENDER)))))
; true values
(assert (first storage))
; false value
(assert (CONTRACT-ADDRESS TUnit (second (second storage))))
(assert (mutez-valid (mutez-int-mul 2 AMOUNT)))
(assert (not (mutez-le (mutez-int-mul 2 AMOUNT) BALANCE)))
(check-sat)
(get-model)
(echo "check invariants - must be unsat")
(push) (assert (not invariant-constant-owner)) (check-sat) (pop)
(push) (assert (not invariant-open-bidding)) (check-sat) (pop)
(push) (assert (not invariant-close-bidding)) (check-sat) (pop)
(push) (assert (not invariant-no-reopen)) (check-sat) (pop)
(push) (assert (not invariant-high-bidder)) (check-sat) (pop)
(pop)
