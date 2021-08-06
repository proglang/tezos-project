(set-option :produce-unsat-cores true)

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
;; (assert (forall ((s1 String) (s2 String))
;; 		(=> (= (mk-address s1) (mk-address s2))
;; 		    (= s1 s2))))

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


;; instructions
;; SOURCE
(declare-const SOURCE Address)
(declare-fun approved-address (Address) Bool)

(declare-fun CONTRACT (STyp Address) (Option Contract))
(assert (forall ((t STyp) (a Address))
		(or (= (CONTRACT t a)
		       (mk-some (mk-contract a)))
		    (= (CONTRACT t a)
		       mk-none))))
(assert (= (CONTRACT TUnit SOURCE)
	   (mk-some (mk-contract SOURCE))))
(assert (forall ((a Address))
		(=> (not (approved-address a))
		    (= (CONTRACT TUnit a) mk-none))))

;; SENDER
(declare-const SENDER Address)
;; BALANCE
(declare-const BALANCE Mutez)
(assert (mutez-valid BALANCE))
;; AMOUNT
(declare-const AMOUNT Mutez)
(assert (mutez-valid AMOUNT))
(assert (mutez-le AMOUNT BALANCE))
;; CONTRACT ty
(declare-fun CONTRACT-ADDRESS (STyp Address) Bool)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; contract specific description
(declare-const parameter (Or String (Or String String)))

(declare-const storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))

(define-fun mk-none-stored () (Option (Pair Bool (Pair Address (Pair Address Mutez))))
  (as mk-none (Option (Pair Bool (Pair Address (Pair Address Mutez))))))


;; (assert (forall ((s String) (v (Pair Bool (Pair Address (Pair Address Mutez)))))
;; 		(=> (= (select storage s) (mk-some v))
;; 		    (mutez-le (second (second (second v))) BALANCE))))

(declare-const initial-stack-top
	       (Pair
		(Or String (Or String String))
		(Array String (Option (Pair Bool (Pair Address (Pair Address Mutez)))))))

(declare-const final-stack-top
	       (Pair
		(List (Operation Unit))
		(Array String (Option (Pair Bool (Pair Address (Pair Address Mutez)))))))

(define-fun
  get-parameter
  ((stack (Pair
	   (Or String (Or String String))
	   (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))))
  (Or String (Or String String))
  (first stack))
(define-fun
  get-storage
  ((stack  (Pair
	    (Or String (Or String String))
	    (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))))
  (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez)))))
  (second stack))


(define-fun
  get-open
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Bool
  (first (as-some (select storage auction-name))))
(define-fun
  get-owner
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Address
  (first (second (as-some (select storage auction-name)))))
(define-fun
  get-bidder
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Address
  (first (second (second (as-some (select storage auction-name))))))
(define-fun
  get-bid
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Mutez
  (second (second (second (as-some (select storage auction-name))))))

(declare-const auction-name String)
(declare-const auction-open Bool)
(declare-const auction-owner Address)
(declare-const auction-bidder Address)
(declare-const auction-hibid Mutez)

(define-fun
  entrypoint-create ((auction-name String)) Bool
  (= parameter ((as mk-left (Or String (Or String String))) auction-name)))
(define-fun
  entrypoint-bid ((auction-name String)) Bool
  (= parameter ((as mk-right (Or String (Or String String)))
		((as mk-left (Or String String)) auction-name))))
(define-fun
  entrypoint-close ((auction-name String)) Bool
  (= parameter (mk-right (mk-right auction-name))))

(define-fun
  auction-not-present
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Bool
  (= (select storage auction-name) mk-none-stored))

(define-fun auction-present
  ((storage (Array String (Option (Pair Bool (Pair Address (Pair Address Mutez))))))
   (auction-name String))
  Bool
  (= (select storage auction-name)
     (mk-some (mk-pair auction-open
		       (mk-pair auction-owner
				(mk-pair auction-bidder auction-hibid))))))

(declare-fun failwith (String) Bool)

;; approved-addresses
;; which addresses are implicit accounts?
;; for create:
(define-fun only-source-implicit () Bool
  (forall ((a Address))
		(= (= a SOURCE)
		   (approved-address a))))
;; for other entrypoints we need to say
(define-fun source-bidder-owner-implicit () Bool
  (forall ((a Address))
	  (or (= a SOURCE)
	      (= a (get-bidder storage auction-name))
	      (= a (get-owner storage auction-name)))))

(assert (=> (entrypoint-create (as-left parameter))
	    only-source-implicit))
(assert (=> (not (entrypoint-create (as-left parameter)))
	    source-bidder-owner-implicit))

;; failures
(assert (=> (entrypoint-create (as-left parameter))
	    (not (= mk-none-stored (select storage (as-left parameter))))
	    (failwith "auction exists")))

(assert (=> (entrypoint-bid (as-left (as-right parameter)))
	    (= mk-none-stored (select storage (as-left parameter)))
	    (failwith "auction does not exist")))

(assert (=> (entrypoint-bid (as-left (as-right parameter)))
	    (not (get-open storage (as-left (as-right parameter))))
	    (failwith "auction closed")))

(assert (=> (entrypoint-bid (as-left (as-right parameter)))
	    (get-open storage (as-left (as-right parameter)))
	    (mutez-le AMOUNT (get-bid storage (as-left (as-right parameter))))
	    (failwith "bid too low")))

(assert (=> (entrypoint-bid (as-left (as-right parameter)))
	    (= (as mk-none (Option Contract))
	       (CONTRACT TUnit (first (second (second (as-some (select storage (as-left (as-right parameter)))))))))
	    (failwith "No entrypoint default with parameter type unit")))

;; (assert (forall ((s String))
;; 		(=> (not (get-open storage s))
;; 		    (= (get-bid storage s) (mk-mutez 0)))))

; initial state
(assert (= initial-stack-top (mk-pair parameter storage)))

;; invariants (from pre/postconditions)

(define-fun invariant-create () Bool
  (=> (entrypoint-create auction-name)
      (auction-not-present (second initial-stack-top) auction-name)
      (and (auction-present (second final-stack-top) auction-name)
	   (= SOURCE (get-owner (second final-stack-top) auction-name))
	   (= SOURCE (get-bidder (second final-stack-top) auction-name))
	   (= auction-hibid (get-bid (second final-stack-top) auction-name))
	   (mutez-le (get-bid (second final-stack-top) auction-name) BALANCE)
	   (get-open (second final-stack-top) auction-name)
	   ((_ is (mk-some (Contract) (Option Contract))) (CONTRACT TUnit (get-bidder (second final-stack-top) auction-name))))))

(define-fun invariant-create-1 () Bool
  (=> (entrypoint-create auction-name)
      (auction-present (second initial-stack-top) auction-name)
      (failwith "auction exists")))

(define-fun invariant-constant-owner () Bool
  (=> (not (entrypoint-bid auction-name))
      (= (get-owner (second initial-stack-top) auction-name)
	 (get-owner (second final-stack-top) auction-name))))
(define-fun invariant-open-bidding () Bool
  (=> (entrypoint-bid auction-name)
      (=> (get-open (second initial-stack-top) auction-name)
	  (get-open (second final-stack-top) auction-name))))
(define-fun invariant-close-bidding () Bool
  (=> (entrypoint-close auction-name)
      (=> (get-open (second initial-stack-top) auction-name)
	  (not (get-open (second final-stack-top) auction-name)))))
(define-fun invariant-no-reopen () Bool
  (=> (not (get-open (second initial-stack-top) auction-name))
      (not (get-open (second final-stack-top) auction-name))))
(define-fun invariant-high-bidder () Bool
  (or (= (get-bidder (second initial-stack-top) auction-name)
	 (get-bidder (second final-stack-top) auction-name))
      (= SOURCE
	 (get-bidder (second final-stack-top) auction-name))))

(push)
(echo "entrypoint create")
(assert (entrypoint-create auction-name))
;; from final constraints
(assert (= mk-none-stored (select storage (as-left parameter))))
;; from final stack
(assert (= final-stack-top
	   (mk-pair nil
		    (store storage
			   (as-left parameter)
			   (mk-some (mk-pair true (mk-pair SOURCE (mk-pair SOURCE AMOUNT))))))))
(assert (= auction-bidder auction-owner))
(assert (= AMOUNT auction-hibid))
(check-sat)
;;(get-model)

(assert (not invariant-create))
(assert (not invariant-create-1))

(check-sat)
;; (get-unsat-core)
(pop)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(echo "entrypoint bid")
(assert (entrypoint-bid auction-name))

(assert (mutez-le (get-bid (second initial-stack-top) auction-name) (mutez-subtract BALANCE AMOUNT)))

;; from final constraints (false values)
(assert (not (= (as mk-none (Option Contract))
		(CONTRACT TUnit (first (second (second (as-some (select storage (as-left (as-right parameter)))))))))))
(assert (not (mutez-le AMOUNT (second (second (second (as-some (select storage (as-left (as-right parameter))))))))))
(assert (not (not (first (as-some (select storage (as-left (as-right parameter))))))))
(assert (not (= mk-none-stored (select storage (as-left (as-right parameter))))))

;; from final stack
(assert (= final-stack-top
	   (mk-pair (insert (TRANSFER_TOKENS unit (second (second (second (as-some (select storage (as-left (as-right parameter))))))) (as-some (CONTRACT TUnit (first (second (second (as-some (select storage (as-left (as-right parameter)))))))))) nil)
		    (store storage (as-left (as-right parameter)) (mk-some (mk-pair true (mk-pair (first (second (as-some (select storage (as-left (as-right parameter)))))) (mk-pair SENDER AMOUNT))))))))
(check-sat)
(get-model)

