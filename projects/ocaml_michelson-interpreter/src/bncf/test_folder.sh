search_dir="../test/test_files/tezos-master-tests_python-contracts_alpha/tests_python/contracts_alpha/opcodes"
for entry in "$search_dir"/*
do
  echo "$entry"
  ./ocaml_backend/TestMichelson $entry
  echo
done