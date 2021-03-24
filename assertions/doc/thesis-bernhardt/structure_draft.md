Offline Design Generic & Tezos specific Structure

2. Generic offline Design
* Implementing distributed assertion checking requires offline considerations and infrastructure.
* goal of offline part/infrastructure: from assertion syntax to compiled code in target language; extends the actual
  contract (bzw. how does it extend it).
* implemented as a pipeline from assertion to contract that can be originated
(* protocol design -> make mechanism part of the protocol)
* this chapter: contains generic part of the offline design
  - independent of target chain/contract language
  - entspricht frontend of the Pipeline
  - insert sexy graphic here (greyed backend (,add blockchain?))
2.1 Assertion syntax
2.2 Parsing
2.3 Transformation
2.4 Effectivity

3. Tezos specific Offline Design
* this chapter: tezos specific Design
  - Tezos has some specific characteristics that need to be considered for the
    offline Design
    -> Validators; needs a mechanism/solution to compensate small number of endorsers
    -> Entrypoints; c  -
  - an be called with tag or without -> different types!
    -> muss hier nicht ausgeführt werden
3.1 Necessary extensions to Michelson
3.2 Validators in Michelson (hier??)
3.3 Type checker
3.4 Compiler
  3.4.1 Extension strategies
        * How to extend a smart contract -> monolithic vs. modular
  3.4.2 Ha's proposal ?
  3.4.3 Compilation strategies
        * Direct vs. IR
