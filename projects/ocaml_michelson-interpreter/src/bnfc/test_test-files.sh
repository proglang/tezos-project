topdir="../test/test_files/"
find "$topdir" -type f \( -name '*.tz' \) -exec echo "Contract: {}" \; -exec ./ocaml_backend/TestMichelson {} \;

#topdir="../test/test_files/contracts_alpha/opcodes"
#for entry in "$topdir"/*
#do
#  echo "$entry"
#  ./ocaml_backend/TestMichelson $entry
#  echo
#done
