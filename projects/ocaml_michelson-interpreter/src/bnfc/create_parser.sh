bnfc --ocaml-menhir -m -o ocaml_backend michelson.cf
make -C ocaml_backend
#./test_parser.sh