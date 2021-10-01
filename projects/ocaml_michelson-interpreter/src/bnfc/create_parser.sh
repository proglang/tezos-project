bnfc --ocaml-menhir -m -o ../lib/parser michelson.cf
make -C ../lib/parser
#./test_test-contract.sh