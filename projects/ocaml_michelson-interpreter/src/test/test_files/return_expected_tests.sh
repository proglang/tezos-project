# Execution for current folder (not recursive):
topdir="./"
for entry in "$topdir"/*
do
  filename=$(basename -- "$entry")
  #extension="${filename##*.}"
  #filename="${filename%.*}"
  echo "printf \"$filename: %s\n\" \(run_file \"./test_files/contracts_alpha/opcodes/$filename\" \"\" \"\" generic_conf\);"
  echo "[%expect {| $filename: \(Pair {} \) |}]"
done