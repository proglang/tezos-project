bnfc --ocaml-menhir -m -o ../lib/parser michelson.cf
make -C ../lib/parser
echo "DO NOT FORGET TO ADD [@@deriving eq] to AbsMichelson.ml -> type instr"
#./test_test-contract.sh