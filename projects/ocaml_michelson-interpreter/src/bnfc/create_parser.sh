bnfc --ocaml-menhir -m -o ../lib/parser michelson.cf #--force
make -C ../lib/parser
echo "DO NOT FORGET TO ADD [@@deriving eq, show { with_path = false }] to AbsMichelson.ml -> type instr"
#./test_test-contract.sh
