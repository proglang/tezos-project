### Bachelor Project: (Concept of an) Off-Chain Michelson-Interpreter (Joshua)

Content:
- Parser for the Michelson Grammar
- Execution of a Contract for given Argument and Storage.
- Returning result in Michelson Syntax.

Result:
- Lexing & Parsing of Michelson Contract files is done with ocamllex/menhir.
  Autogenerated with the BNF Converter from a [Michelson-Grammar specification](/projects/ocaml_michelson-interpreter/src/bnfc/michelson.cf)
  (generated Files are in `src/lib/parser`)
- Interpreting via
  - main.ml accepts contract files, argument & storage and a json file containing contract-/chainrelated data. It returns the result of interpreting the contract.
  - michelson.ml: Interpreter module
  - interpreter.ml, parse.ml, value.ml, config.ml, /src/utils/*ml: contain the implementation of the interpreter
  - print.ml: printer for Michelson values 
- Tests: `src/test/test.ml` tests (part of the) contracts from `src/test/test_files/contracts_alpha/opcodes/*.tz`


Finished as of commit [c9a4629][1]

[1]: https://github.com/proglang/tezos-project/commit/c9a4629e574ce5142bdc07881bcc7468a263b840