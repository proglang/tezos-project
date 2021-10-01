topdir="../test/test_files/"
find "$topdir" -type f \( -name '*.tz' \) -exec echo "Contract: {}" \; -exec ../lib/parser/TestMichelson {} \;

#topdir="../test/test_files/contracts_alpha/opcodes"
#for entry in "$topdir"/*
#do
#  echo "$entry"
#  ../lib/parser/TestMichelson $entry
#  echo
#done