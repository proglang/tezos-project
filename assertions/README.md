# Checking assertions for smart contracts

## Project structure
The proposed project structure looks as follows:

```
assertions
│   README.md
|   dune-project
└───src
│   └───offline
│   |   └─── parser
|   |   └─── tezos                     <-- target specific AST, transformation & compiler
│   |        └─── transformation
|   |        └─── compiler
|   |   └───ethereum
|   └───tezos                          <-- protocol specific code; "online"
|   └───ethereum                       <-- protocol specific code; "online"
└───test                               <-- all tests
|   └───offline
│       └─── ...
|   └───...
└───grammar                            <-- grammar specifications
└───doc                                <-- documentation (e.g. exposes), thesis source codes
|   └───thesis-tamara
|   └───thesis-julian
|   └───...
...
```
## Usage Parser & Backend (Transformation & Compiler) (WIP)
The little test program ```assertion/src/offline/main.ml``` demonstrates how the assertion contract parser and a backend transformer for a specific target is used.
The interface of the backend (for now called ```transform_and_compile.mli```) is defined as a virtual library, for which several implementations can be provided.  
The dune file specifies, which implementation should be linked into the executable:

<pre>
(executable
 (name main)
 (modules main)
 (libraries parsing
            <b>tezos_backend</b>))
...
</pre>
In this example, the Tezos backend is linked.

## Tests
Run all tests with
```dune runtest```

So far, all tests are written using [Alcotest](https://github.com/mirage/alcotest) or [Expect-test](https://github.com/janestreet/ppx_expect).
