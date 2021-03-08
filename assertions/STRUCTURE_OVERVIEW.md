# Project structure
This project is structured as follows:
```
root
│   README.md
│   STRUCTURE_OVERVIEW.md
|   dune-project
└───src
│   └───offline
|   |   generate_assertion_contract.ml(i) <-- Execution entrypoint
|   |   main.ml
|   |   └─── cli                       <-- Command line arguments (frontend)
|   |   └─── dao                       <-- Defines types of DAOs for contract code (frontend)
│   |   └─── parser                    <-- Parser for assertion contracts (frontend)
|   |   └─── transformation            <-- Transformer of assertion formula (frontend)
|   |   check_and_compile.mli          <-- Virtual library (interface) of backend
|   |   └─── tezos                     <-- Tezos backend
|   |        └─── ast                  <-- Tezos specific AST
|   |        └─── type_checker         <-- Type checks assertion entrypoints
|   |        └─── compiler             <-- Compiler code
|   |        └─── tezos_api            <-- Tezos API
|   |        └─── dao                  <-- Implementations DAOs
|   |        check_and_compile.ml      <-- Implementation of backend interface
|   |   └───ethereum
|   └───tezos                          <-- this is where protocol code could go
└───test                               <-- all tests; mirrors the structure of src/
|   └───offline
│       └─── ...                         
└───doc
|   └───thesis-tamara                  <-- the thesis source code
|   └───grammar                        <-- grammar specifications
...
```

## Frontend
The frontend includes the folders `src/offline/cli`, `src/offline/parser`, `src/offline/transformation`,
`src/offline/dao` and the entrypoint for execution `generate_assertion_contract.ml`. This executes the lexing/parsing,
the transformation and calls the backend, which will eventually compile the code to
the target language.

- `cli/` defines a wrapper type for the command line arguments and some sanity checks
on them.
- `parser/` contains the code for lexing and parsing assertions using OCamllex and Menhir. `lex_and_parse.mli` serves as the main interface for this directory. The type of the output is in `assertion.mli`.
- `transformation/` contains the code that performs the transformation. The type of the output is in `assertion.mli`.
- `dao/` defines types of data access objects for contract code - abstracts away how the backend will retrieve the
contract code and how the code is represented. The backends will provide the concrete DAOs for each type.

## Backend (Tezos)
The Tezos backend can be found in `src/offline/tezos/`.  
- `ast` contains the type of the Tezos specific AST and the `cast` function
- `tezos_api` softlink to or copy of the Tezos API
- `typecheck` contains the code to typecheck and assign the assertions. The output
is a mapping between entrypoints (represented as paths) and assertions.
- `dao` implements contract data access objects for each DAO type defined in the frontend.
- `compiler` *this is where the compiler code belongs*

## Testing
All unit test can be found within the `test/` directory. The structure of the subdirectoy
follows the same structure as the `src/` directory.

`dune runtest` runs the entire test suite (when executed in the root directoy).

## Alcotest
Some tests for the Parser and the type checker are written using Alcotest (with Qcheck).
These can be found under `test/offline/.../alcotest`. Files containing unit tests beginn with `test_`.

## Expect tests
The expect tests use Jane Street's PPX_Expect library and can be found under `test/offline/.../expect`.
