bnfc --ocaml-menhir -m -o test test.cf
make -C test
#./test_parser.sh