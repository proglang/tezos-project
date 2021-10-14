# Runs TestMichelson on all contracts in the ../test/test_files folder
topdir="../test/test_files/"
find "$topdir" -type f \( -name '*.tz' \) -exec echo -e "\nCONTRACT: {}" \; -exec ../lib/parser/TestMichelson {} \;

# Execution for a single folder:
#topdir="../test/test_files/contracts_alpha/opcodes"
#for entry in "$topdir"/*
#do
#  echo "$entry"
#  ../lib/parser/TestMichelson $entry
#  echo
#done