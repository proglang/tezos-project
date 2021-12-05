# BNF Grammar

The Parser is build using the [BNF Converter (BNFC)](https://github.com/BNFC/bnfc).
[Resources and Documentation](http://bnfc.digitalgrammars.com/)

## Installing BNFC

Currently the development version is used (or use versions later than 3.9.4 when released).

To install the development version of
bnfc:
```
  git clone https://github.com/BNFC/bnfc.git
  cd bnfc/source
```
and then either
```
  cabal install
```
or
```
  stack install --stack-yaml stack-9.0.1.yaml
```
(replace `8.10.3` with your GHC version, and if you want to build with
your installed GHC then add flag `--system-ghc`).

## Working with BNFC

The grammar is defined in ``michelson.cf``. Modify it according to the [Tutorial / Documentation](https://bnfc.readthedocs.io/en/latest/lbnf.html#introduction).

### Building the parser

The parser is build using the commands
```
bnfc --ocaml-menhir -m -o ../lib/parser michelson.cf
make -C ../lib/parser
```
which can also be done by executing `create_parser.sh`.

The make command could be discarded when using dune and creating the required dune files for building from menhir/ocamllex generator files

The parser is build into the folder `../lib/parser`.

### Manual Modifications done to the parser:
Add `[@@deriving eq, show { with_path = false }]` to all variants in `parser/AbsMichelson.ml`

### Minimal tests
The functionality of the parser can be (visually) tested with three prepared shell scripts:
- `test_test-contract.sh` prints the result of parsing the contract 'test_contract.tz' which can be used for quick testing purposes.
- `test_macros.sh` prints the result of the marco-expansion for all macros as given in `macro_expansion.tz`.
- The test contracts in `../test/test_files/` can all be parsed by executing `test_test-files.sh'. Errors in the execution are a sign of either mistakes or not implemented functions in the Grammar. 
However, some of the contracts are also ill-typed on purpose! Type Errors are only found on runtime of the interpreter, not by the parser. 


**Errors:** The parser returns two errors, a Parser_error and a Lexing_error

### Building a language specification
`latex_language-specification.sh` creates a latex file containing a readable language specification in folder 
`language-specification`, based on `michelson.cf`
