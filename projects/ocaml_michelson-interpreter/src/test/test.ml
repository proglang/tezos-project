(* TODO:
- Testfiles for each OPCode
- Run all testfiles with example input and compare expected output
 *)


open Core

let run_file filename parameter storage conf : string =
  In_channel.with_file filename ~f:(fun file ->
  let source = String.concat ~sep:"\n" (In_channel.input_lines file)
  in
  Michelson.run source parameter storage conf
  )


let%expect_test "op_codes" =
  let generic_conf = Michelson.Config.parse_file "./test_files/contracts_alpha/opcodes/generic_config.json" in
  (*let generic_conf = Michelson.Config.parse_string "{
                                              \"source\": \"a\",
                                              \"sender\": \"b\",
                                              \"self_address\": \"c\",
                                              \"balance\": \"1\",
                                              \"amount\": \"2\",
                                              \"timestamp\": \"12323\",
                                              \"chain_id\": \"d\",
                                              \"level\": \"3\",
                                              \"tot_voting_power\": \"4\"
                                             }"
  in *)


  printf "abs.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/abs.tz"
    "5" "Unit" generic_conf);
  [%expect {| abs.tz: (Pair {} Unit) |}];

  printf "add.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| add.tz: (Pair {} Unit) |}];

(*  printf "add_bls12_381_fr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add_bls12_381_fr.tz"
    "(Pair 0x123 0x321)" "None" generic_conf);
  [%expect {| add_bls12_381_fr.tz: (Pair {} (Some 0x123)) |}];

  printf "add_bls12_381_g1.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add_bls12_381_g1.tz"
    "(Pair 0x123 0x321)" "None" generic_conf);
  [%expect {| add_bls12_381_g1.tz: (Pair {} (Some 0x123)) |}];

  printf "add_bls12_381_g2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add_bls12_381_g2.tz"
    "(Pair 0x123 0x321)" "None" generic_conf);
  [%expect {| add_bls12_381_g2.tz: (Pair {} (Some 0x123)) |}];
*)
   printf "add_timestamp_delta.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add_timestamp_delta.tz"
    "(Pair \"1970-01-15T06:56:08Z\" 5)" "None" generic_conf);
  [%expect {| add_timestamp_delta.tz: (Pair {} (Some "1970-01-15T06:56:13Z")) |}];

  printf "add_delta_timestamp.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/add_delta_timestamp.tz"
    "(Pair 5 1234567)" "None" generic_conf);
  [%expect {| add_delta_timestamp.tz: (Pair {} (Some "1970-01-15T06:56:12Z")) |}];

  printf "address.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/address.tz"
    "\"tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN\"" "None" generic_conf);
  [%expect {| address.tz: (Pair {} (Some "tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN")) |}];

  printf "and.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/and.tz"
    "(Pair True False)" "Some True" generic_conf);
  [%expect {| and.tz: (Pair {} (Some False)) |}];

  printf "and_binary.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/and_binary.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| and_binary.tz: (Pair {} Unit) |}];

  printf "and_logical_1.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/and_logical_1.tz"
    "(Pair True False)" "False" generic_conf);
 [%expect {| and_logical_1.tz: (Pair {} False) |}];

  printf "balance.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/balance.tz"
    "Unit" "1" generic_conf);
  [%expect {| balance.tz: (Pair {} 321) |}];

  printf "big_map_mem_nat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/big_map_mem_nat.tz"
    "5" "(Pair { Elt 5 1;  Elt 6 2 ; Elt 7 3; Elt 8 4 ;} None)" generic_conf);
  [%expect {| big_map_mem_nat.tz: (Pair {} (Pair { Elt 5 1 ; Elt 6 2 ; Elt 7 3 ; Elt 8 4 } (Some True))) |}];

  printf "big_map_mem_string.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/big_map_mem_string.tz"
    "\"5\"" "(Pair { Elt \"5\" 1;  Elt \"6\" 2 ; Elt \"7\" 3; Elt \"8\" 4 ;} None)" generic_conf);
  [%expect {| big_map_mem_string.tz: (Pair {} (Pair { Elt "5" 1 ; Elt "6" 2 ; Elt "7" 3 ; Elt "8" 4 } (Some True))) |}];

(*  printf "big_map_to_self.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/big_map_to_self.tz"
    "(Left (Pair { Elt \"2\" 1;  Elt \"3\" 4} Unit))" "{ Elt \"1\" 0;  Elt \"2\" 3}" generic_conf);
  [%expect {| big_map_to_self.tz: (Pair {} ) |}];
*) (*TODO: try-michelson aktzeptiert Eingabe nicht. Zwei unterschiedliche Eingaben wären evtl gut*)
(*  printf "bls12_381_fr_push_bytes_not_padded.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_push_bytes_not_padded.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_push_bytes_not_padded.tz: (Pair {} ) |}];

  printf "bls12_381_fr_push_nat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_push_nat.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_push_nat.tz: (Pair {} ) |}];

  printf "bls12_381_fr_to_int.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_to_int.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_to_int.tz: (Pair {} ) |}];

  printf "bls12_381_fr_to_mutez.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_to_mutez.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_to_mutez.tz: (Pair {} ) |}];

  printf "bls12_381_fr_z_int.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_z_int.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_z_int.tz: (Pair {} ) |}];

  printf "bls12_381_fr_z_nat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_fr_z_nat.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_fr_z_nat.tz: (Pair {} ) |}];

  printf "bls12_381_z_fr_int.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_z_fr_int.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_z_fr_int.tz: (Pair {} ) |}];

  printf "bls12_381_z_fr_nat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bls12_381_z_fr_nat.tz"
    "" "" generic_conf);
  [%expect {| bls12_381_z_fr_nat.tz: (Pair {} ) |}];
 *)
  printf "bytes.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/bytes.tz"
    "0xABCDEF42" "Unit" generic_conf);
  [%expect {| bytes.tz: (Pair {} Unit) |}];

  printf "car.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/car.tz"
    "(Pair 1 2)" "0" generic_conf);
  [%expect {| car.tz: (Pair {} 1) |}];

  printf "cdr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/cdr.tz"
    "(Pair 1 2)" "0" generic_conf);
  [%expect {| cdr.tz: (Pair {} 2) |}];

  printf "chain_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/chain_id.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| chain_id.tz: (Pair {} Unit) |}];

 (*TODO result should change when serialization is properbly implemented *)
  printf "chain_id_store.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/chain_id_store.tz"
    "Unit" "(Some 0x00000000)" generic_conf);
  [%expect {| chain_id_store.tz: (Pair {} (Some NetXynUjJNZm7wi)) |}];

(*  printf "check_signature.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/check_signature.tz"
    "" "" generic_conf);
  [%expect {| check_signature.tz: (Pair {} ) |}];
*)
  printf "comb-get.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comb-get.tz"
    "(Pair 1 4 2 Unit)" "Unit" generic_conf);
  [%expect {| comb-get.tz: (Pair {} Unit) |}];

  printf "comb-literals.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comb-literals.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| comb-literals.tz: (Pair {} Unit) |}];

  printf "comb-set-2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comb-set-2.tz"
    "(Pair 100 200 300 Unit)" "None" generic_conf);
  [%expect {| comb-set-2.tz: (Pair {} (Some (Pair 2 (Pair 200 (Pair "toto" 0x01))))) |}];

  printf "comb-set.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comb-set.tz"
    "Unit" "(Pair 100 200 300 Unit)" generic_conf);
  [%expect {| comb-set.tz: (Pair {} (Pair 2 (Pair 12 (Pair 8 Unit)))) |}];

  printf "comb.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comb.tz"
    "Unit" "(Pair 4 5 6)" generic_conf);
  [%expect {| comb.tz: (Pair {} (Pair 1 (Pair 2 3))) |}];

  printf "compare.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/compare.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| compare.tz: (Pair {} Unit) |}];

  printf "compare_big_type.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/compare_big_type.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| compare_big_type.tz: (Pair {} Unit) |}];

  printf "compare_big_type2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/compare_big_type2.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| compare_big_type2.tz: (Pair {} Unit) |}];

  printf "comparisons.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/comparisons.tz"
    "{-1 ; 0 ; 1}" "{}" generic_conf);
  [%expect {| comparisons.tz: (Pair {} { { False ; False ; True } ; { False ; True ; True } ; { True ; False ; False } ; { True ; True ; False } ; { True ; False ; True } ; { False ; True ; False } }) |}];

  printf "concat_hello.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/concat_hello.tz"
    "{ \"Name1\" ; \"Name2\" }" "{}" generic_conf);
  [%expect {| concat_hello.tz: (Pair {} { "Hello Name1" ; "Hello Name2" }) |}];

(*  printf "concat_hello_bytes.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/concat_hello_bytes.tz"
    "" "" generic_conf);
  [%expect {| concat_hello_bytes.tz: (Pair {} ) |}];
*)
  printf "concat_list.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/concat_list.tz"
    "{ \"H\" ; \"a\" ;  \"l\" ;  \"l\" ; \"o\" }" "\"\"" generic_conf);
  [%expect {| concat_list.tz: (Pair {} "Hallo") |}];

   printf "cons.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/cons.tz"
    "{ 1 }" "{ 2 ; 3 }" generic_conf);
  [%expect {| cons.tz: (Pair {} { 1 ; 2 ; 3 }) |}];

(*  printf "contains_all.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/contains_all.tz"
    "(Pair { "1" ; "2" } { "3" ; "4" })" "None" generic_conf);
  [%expect {| contains_all.tz: (Pair {} (Some False)) |}];
 *)
  printf "contract.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/contract.tz"
    "\"tz1faswCTDciRzE4oJ9jn2Vm2dvjeyA9fUzA\"" "Unit" generic_conf);
  [%expect {| contract.tz: (Pair {} Unit) |}];

  printf "create_contract.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/create_contract.tz"
    "Unit" "None" generic_conf);
  [%expect {| create_contract.tz: (Pair { Create_contract (((unit, unit), _),None, 20, Unit, Unit) } (Some "KT1aaaaaaaaaaaaaaa")) |}];

  printf "create_contract_rootname.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/create_contract_rootname.tz"
    "Unit" "None" generic_conf);
  [%expect {| create_contract_rootname.tz: (Pair { Create_contract (((unit, unit), _),None, 20, Unit, Unit) } (Some "KT1aaaaaaaaaaaaaaa")) |}];

  printf "create_contract_rootname_alt.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/create_contract_rootname_alt.tz"
    "Unit" "None" generic_conf);
  [%expect {| create_contract_rootname_alt.tz: (Pair { Create_contract (((unit, unit), _),None, 20, Unit, Unit) } (Some "KT1aaaaaaaaaaaaaaa")) |}];

(*  printf "create_contract_with_view.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/create_contract_with_view.tz"
    "" "" generic_conf);
  [%expect {| create_contract_with_view.tz: (Pair {} ) |}];
*)
  printf "diff_timestamps.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/diff_timestamps.tz"
    "(Pair 123 321)" "0" generic_conf);
  [%expect {| diff_timestamps.tz: (Pair {} -198) |}];

(*  printf "dig_eq.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dig_eq.tz"
    "" "" generic_conf);
  [%expect {| dig_eq.tz: (Pair {} ) |}];
*)
  printf "dign.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dign.tz"
    "(Pair (Pair (Pair (Pair 1 2) 3) 4) 5)" "0" generic_conf);
  [%expect {| dign.tz: (Pair {} 5) |}];

  printf "dip.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dip.tz"
    "(Pair 1 2)" "(Pair 0 0)" generic_conf);
  [%expect {| dip.tz: (Pair {} (Pair 1 3)) |}];

  printf "dipn.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dipn.tz"
    "(Pair (Pair (Pair (Pair 1 2) 3) 4) 5)" "0" generic_conf);
  [%expect {| dipn.tz: (Pair {} 6) |}];

  printf "dropn.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dropn.tz"
    "(Pair (Pair (Pair (Pair 1 2) 3) 4) 5)" "0" generic_conf);
  [%expect {| dropn.tz: (Pair {} 5) |}];

  printf "dugn.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dugn.tz"
    "(Pair (Pair (Pair (Pair 1 2) 3) 4) 5)" "0" generic_conf);
  [%expect {| dugn.tz: (Pair {} 1) |}];

  printf "dup-n.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/dup-n.tz"
    "Unit" "Unit" generic_conf);
  [%expect {| dup-n.tz: (Pair {} Unit) |}];

(*TODO PAPAPAIR*)
(*  printf "ediv.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ediv.tz"
    "(Pair -2 3)" "(Pair (Some (Pair -1 0)) (Some (Pair -2 1)) (Some (Pair 3 3)) (Some (Pair 5 3)))" generic_conf);
  [%expect {| ediv.tz: (Pair {} (Pair (Some (Pair -1 1)) (Pair (Some (Pair -1 1)) (Pair (Some (Pair 0 2)) (Some (Pair 0 2)))))) |}];*)

  printf "ediv_mutez.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ediv_mutez.tz"
    "(Pair 21 (Right 4))" "(Left (Some (Pair 0 0)))" generic_conf);
  [%expect {| ediv_mutez.tz: (Pair {} (Right (Some (Pair 5 1)))) |}];

  printf "empty_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/empty_map.tz"
    "Unit" "{ Elt \"test-\" \"ing\" }" generic_conf);
  [%expect {| empty_map.tz: (Pair {} { Elt "hello" "world" }) |}];

  printf "exec_concat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/exec_concat.tz"
    "\"123\"" "\"\"" generic_conf);
  [%expect {| exec_concat.tz: (Pair {} "123_abc") |}];

  printf "first.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/first.tz"
    "{ 1 ; 2 ; 3 }" "2" generic_conf);
  [%expect {| first.tz: (Pair {} 1) |}];

  (* The following 4 contracts need missing macros to be implemented first *)
  (*printf "get_and_update_big_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/get_and_update_big_map.tz"
    "" "" generic_conf);
  [%expect {| get_and_update_big_map.tz: (Pair {} ) |}];

  printf "get_and_update_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/get_and_update_map.tz"
    "" "" generic_conf);
  [%expect {| get_and_update_map.tz: (Pair {} ) |}];

  printf "get_big_map_value.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/get_big_map_value.tz"
    "" "" generic_conf);
  [%expect {| get_big_map_value.tz: (Pair {} ) |}];

  printf "get_map_value.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/get_map_value.tz"
    "" "" generic_conf);
  [%expect {| get_map_value.tz: (Pair {} ) |}];*)

(*  printf "hash_consistency_checker.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/hash_consistency_checker.tz"
    "" "" generic_conf);
  [%expect {| hash_consistency_checker.tz: (Pair {} ) |}];

  printf "hash_key.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/hash_key.tz"
    "" "" generic_conf);
  [%expect {| hash_key.tz: (Pair {} ) |}];

  printf "hash_string.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/hash_string.tz"
    "" "" generic_conf);
  [%expect {| hash_string.tz: (Pair {} ) |}];*)

  printf "if.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/if.tz"
    "True" "None" generic_conf);
  [%expect {| if.tz: (Pair {} (Some True)) |}];

  printf "if_some.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/if_some.tz"
    "(Some \"Hello\")" "\"\"" generic_conf);
  [%expect {| if_some.tz: (Pair {} "Hello") |}];

   printf "int.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/int.tz"
    "123" "None" generic_conf);
  [%expect {| int.tz: (Pair {} (Some 123)) |}];

(*  printf "keccak.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/keccak.tz"
    "" "" generic_conf);
  [%expect {| keccak.tz: (Pair {} ) |}];*)

  printf "left_right.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/left_right.tz"
    "(Left True)" "(Left \"\")" generic_conf);
  [%expect {| left_right.tz: (Pair {} (Right True)) |}];

  printf "level.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/level.tz"
    "Unit" "0" generic_conf);
  [%expect {| level.tz: (Pair {} 1) |}];

  printf "list_concat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_concat.tz"
    "{ \"N\"; \"a\"; \"m\"; \"e\" }" "\"Hello \"" generic_conf);
  [%expect {| list_concat.tz: (Pair {} "Hello Name") |}];

  printf "list_concat_bytes.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_concat_bytes.tz"
    "{ 0x1; 0x2; 0x3; 0x4}" "0x" generic_conf);
  [%expect {| list_concat_bytes.tz: (Pair {} 0x0x10x20x30x4) |}]; (* TODO: update when implementing bytes *)

  printf "list_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_id.tz"
    "{ \"a\"; \"b\"; \"c\" }" "{}" generic_conf);
  [%expect {| list_id.tz: (Pair {} { "a" ; "b" ; "c" }) |}];

  printf "list_id_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_id_map.tz"
    "{ \"a\"; \"b\"; \"c\" }" "{}" generic_conf);
  [%expect {| list_id_map.tz: (Pair {} { "a" ; "b" ; "c" }) |}];

  printf "list_iter.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_iter.tz"
    "{ 1; 2; 3 }" "0" generic_conf);
  [%expect {| list_iter.tz: (Pair {} 6) |}];

  printf "list_map_block.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_map_block.tz"
    "{ 1 ; 2 ; 3 }" "{}" generic_conf);
  [%expect {| list_map_block.tz: (Pair {} { 1 ; 3 ; 5 }) |}];

  printf "list_size.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/list_size.tz"
    "{ 1; 1; 1; 1; 1; 1; 1 }" "0" generic_conf);
  [%expect {| list_size.tz: (Pair {} 7) |}];

  printf "loop_left.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/loop_left.tz"
    "{ \"a\"; \"b\"; \"c\" }" "{}" generic_conf);
  [%expect {| loop_left.tz: (Pair {} { "c" ; "b" ; "a" }) |}];

  printf "map_car.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_car.tz"
    "True" "(Pair False 1)" generic_conf);
  [%expect {| map_car.tz: (Pair {} (Pair False 1)) |}];

  printf "map_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_id.tz"
    "{ Elt 0 1 }" "{}" generic_conf);
  [%expect {| map_id.tz: (Pair {} { Elt 0 1 }) |}];

  printf "map_iter.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_iter.tz"
    "{ Elt 1 2 ; Elt 3 4 }" "(Pair -1 0)" generic_conf);
  [%expect {| map_iter.tz: (Pair {} (Pair 4 6)) |}];

(*  printf "map_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_map.tz"
    "" "" generic_conf);
  [%expect {| map_map.tz: (Pair {} ) |}];

  printf "map_map_sideeffect.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_map_sideeffect.tz"
    "" "" generic_conf);
  [%expect {| map_map_sideeffect.tz: (Pair {} ) |}];

  printf "map_mem_nat.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_mem_nat.tz"
    "" "" generic_conf);
  [%expect {| map_mem_nat.tz: (Pair {} ) |}];

  printf "map_mem_string.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_mem_string.tz"
    "" "" generic_conf);
  [%expect {| map_mem_string.tz: (Pair {} ) |}];

  printf "map_size.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/map_size.tz"
    "{ Elt \"a\" 1; Elt \"b\" 2; Elt \"c\" 3}" "0" generic_conf);
  [%expect {| map_size.tz: (Pair {} 3) |}];

  printf "merge_comparable_pairs.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/merge_comparable_pairs.tz"
    "" "" generic_conf);
  [%expect {| merge_comparable_pairs.tz: (Pair {} ) |}];

  printf "mul.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mul.tz"
    "" "" generic_conf);
  [%expect {| mul.tz: (Pair {} ) |}];

  printf "mul_bls12_381_fr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mul_bls12_381_fr.tz"
    "" "" generic_conf);
  [%expect {| mul_bls12_381_fr.tz: (Pair {} ) |}];

  printf "mul_bls12_381_g1.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mul_bls12_381_g1.tz"
    "" "" generic_conf);
  [%expect {| mul_bls12_381_g1.tz: (Pair {} ) |}];

  printf "mul_bls12_381_g2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mul_bls12_381_g2.tz"
    "" "" generic_conf);
  [%expect {| mul_bls12_381_g2.tz: (Pair {} ) |}];

  printf "mul_overflow.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mul_overflow.tz"
    "" "" generic_conf);
  [%expect {| mul_overflow.tz: (Pair {} ) |}];

  printf "munch.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/munch.tz"
    "" "" generic_conf);
  [%expect {| munch.tz: (Pair {} ) |}];

  printf "mutez_to_bls12_381_fr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/mutez_to_bls12_381_fr.tz"
    "" "" generic_conf);
  [%expect {| mutez_to_bls12_381_fr.tz: (Pair {} ) |}];

  printf "neg.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/neg.tz"
    "" "" generic_conf);
  [%expect {| neg.tz: (Pair {} ) |}];

  printf "neg_bls12_381_fr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/neg_bls12_381_fr.tz"
    "" "" generic_conf);
  [%expect {| neg_bls12_381_fr.tz: (Pair {} ) |}];

  printf "neg_bls12_381_g1.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/neg_bls12_381_g1.tz"
    "" "" generic_conf);
  [%expect {| neg_bls12_381_g1.tz: (Pair {} ) |}];

  printf "neg_bls12_381_g2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/neg_bls12_381_g2.tz"
    "" "" generic_conf);
  [%expect {| neg_bls12_381_g2.tz: (Pair {} ) |}];

  printf "none.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/none.tz"
    "" "" generic_conf);
  [%expect {| none.tz: (Pair {} ) |}];

  printf "noop.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/noop.tz"
    "" "" generic_conf);
  [%expect {| noop.tz: (Pair {} ) |}];

  printf "not.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/not.tz"
    "" "" generic_conf);
  [%expect {| not.tz: (Pair {} ) |}];

  printf "not_binary.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/not_binary.tz"
    "" "" generic_conf);
  [%expect {| not_binary.tz: (Pair {} ) |}];

  printf "or.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/or.tz"
    "" "" generic_conf);
  [%expect {| or.tz: (Pair {} ) |}];

  printf "or_binary.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/or_binary.tz"
    "" "" generic_conf);
  [%expect {| or_binary.tz: (Pair {} ) |}];

  printf "originate_big_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/originate_big_map.tz"
    "" "" generic_conf);
  [%expect {| originate_big_map.tz: (Pair {} ) |}];

  printf "packunpack.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/packunpack.tz"
    "" "" generic_conf);
  [%expect {| packunpack.tz: (Pair {} ) |}];

  printf "packunpack_rev.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/packunpack_rev.tz"
    "" "" generic_conf);
  [%expect {| packunpack_rev.tz: (Pair {} ) |}];

  printf "packunpack_rev_cty.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/packunpack_rev_cty.tz"
    "" "" generic_conf);
  [%expect {| packunpack_rev_cty.tz: (Pair {} ) |}];

  printf "pair_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/pair_id.tz"
    "" "" generic_conf);
  [%expect {| pair_id.tz: (Pair {} ) |}];

  printf "pairing_check.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/pairing_check.tz"
    "" "" generic_conf);
  [%expect {| pairing_check.tz: (Pair {} ) |}];

  printf "pexec.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/pexec.tz"
    "" "" generic_conf);
  [%expect {| pexec.tz: (Pair {} ) |}];

  printf "pexec_2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/pexec_2.tz"
    "" "" generic_conf);
  [%expect {| pexec_2.tz: (Pair {} ) |}];

  printf "proxy.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/proxy.tz"
    "" "" generic_conf);
  [%expect {| proxy.tz: (Pair {} ) |}];

  printf "ret_int.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ret_int.tz"
    "" "" generic_conf);
  [%expect {| ret_int.tz: (Pair {} ) |}];

  printf "reverse.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/reverse.tz"
    "" "" generic_conf);
  [%expect {| reverse.tz: (Pair {} ) |}];

  printf "reverse_loop.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/reverse_loop.tz"
    "" "" generic_conf);
  [%expect {| reverse_loop.tz: (Pair {} ) |}];

  printf "sapling_empty_state.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/sapling_empty_state.tz"
    "" "" generic_conf);
  [%expect {| sapling_empty_state.tz: (Pair {} ) |}];

  printf "self.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/self.tz"
    "" "" generic_conf);
  [%expect {| self.tz: (Pair {} ) |}];

  printf "self_address.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/self_address.tz"
    "" "" generic_conf);
  [%expect {| self_address.tz: (Pair {} ) |}];

  printf "self_with_default_entrypoint.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/self_with_default_entrypoint.tz"
    "" "" generic_conf);
  [%expect {| self_with_default_entrypoint.tz: (Pair {} ) |}];

  printf "self_with_entrypoint.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/self_with_entrypoint.tz"
    "" "" generic_conf);
  [%expect {| self_with_entrypoint.tz: (Pair {} ) |}];

  printf "sender.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/sender.tz"
    "" "" generic_conf);
  [%expect {| sender.tz: (Pair {} ) |}];

  printf "set_car.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_car.tz"
    "" "" generic_conf);
  [%expect {| set_car.tz: (Pair {} ) |}];

  printf "set_cdr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_cdr.tz"
    "" "" generic_conf);
  [%expect {| set_cdr.tz: (Pair {} ) |}];

  printf "set_delegate.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_delegate.tz"
    "" "" generic_conf);
  [%expect {| set_delegate.tz: (Pair {} ) |}];

  printf "set_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_id.tz"
    "" "" generic_conf);
  [%expect {| set_id.tz: (Pair {} ) |}];

  printf "set_iter.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_iter.tz"
    "" "" generic_conf);
  [%expect {| set_iter.tz: (Pair {} ) |}];

  printf "set_member.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_member.tz"
    "" "" generic_conf);
  [%expect {| set_member.tz: (Pair {} ) |}];

  printf "set_size.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/set_size.tz"
    "" "" generic_conf);
  [%expect {| set_size.tz: (Pair {} ) |}];

  printf "sha3.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/sha3.tz"
    "" "" generic_conf);
  [%expect {| sha3.tz: (Pair {} ) |}];

  printf "shifts.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/shifts.tz"
    "" "" generic_conf);
  [%expect {| shifts.tz: (Pair {} ) |}];

  printf "slice.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/slice.tz"
    "" "" generic_conf);
  [%expect {| slice.tz: (Pair {} ) |}];

  printf "slice_bytes.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/slice_bytes.tz"
    "" "" generic_conf);
  [%expect {| slice_bytes.tz: (Pair {} ) |}];

  printf "slices.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/slices.tz"
    "" "" generic_conf);
  [%expect {| slices.tz: (Pair {} ) |}];

  printf "source.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/source.tz"
    "" "" generic_conf);
  [%expect {| source.tz: (Pair {} ) |}];

  printf "split_bytes.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/split_bytes.tz"
    "" "" generic_conf);
  [%expect {| split_bytes.tz: (Pair {} ) |}];

  printf "split_string.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/split_string.tz"
    "" "" generic_conf);
  [%expect {| split_string.tz: (Pair {} ) |}];

  printf "store_bls12_381_fr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/store_bls12_381_fr.tz"
    "" "" generic_conf);
  [%expect {| store_bls12_381_fr.tz: (Pair {} ) |}];

  printf "store_bls12_381_g1.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/store_bls12_381_g1.tz"
    "" "" generic_conf);
  [%expect {| store_bls12_381_g1.tz: (Pair {} ) |}];

  printf "store_bls12_381_g2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/store_bls12_381_g2.tz"
    "" "" generic_conf);
  [%expect {| store_bls12_381_g2.tz: (Pair {} ) |}];

  printf "store_input.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/store_input.tz"
    "" "" generic_conf);
  [%expect {| store_input.tz: (Pair {} ) |}];

  printf "store_now.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/store_now.tz"
    "" "" generic_conf);
  [%expect {| store_now.tz: (Pair {} ) |}];

  printf "str_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/str_id.tz"
    "" "" generic_conf);
  [%expect {| str_id.tz: (Pair {} ) |}];

  printf "sub_timestamp_delta.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/sub_timestamp_delta.tz"
    "" "" generic_conf);
  [%expect {| sub_timestamp_delta.tz: (Pair {} ) |}];

  printf "subset.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/subset.tz"
    "" "" generic_conf);
  [%expect {| subset.tz: (Pair {} ) |}];

  printf "tez_add_sub.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/tez_add_sub.tz"
    "" "" generic_conf);
  [%expect {| tez_add_sub.tz: (Pair {} ) |}];

  printf "ticket_bad.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_bad.tz"
    "" "" generic_conf);
  [%expect {| ticket_bad.tz: (Pair {} ) |}];

  printf "ticket_big_store.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_big_store.tz"
    "" "" generic_conf);
  [%expect {| ticket_big_store.tz: (Pair {} ) |}];

  printf "ticket_join.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_join.tz"
    "" "" generic_conf);
  [%expect {| ticket_join.tz: (Pair {} ) |}];

  printf "ticket_read.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_read.tz"
    "" "" generic_conf);
  [%expect {| ticket_read.tz: (Pair {} ) |}];

  printf "ticket_split.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_split.tz"
    "" "" generic_conf);
  [%expect {| ticket_split.tz: (Pair {} ) |}];

  printf "ticket_store-2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_store-2.tz"
    "" "" generic_conf);
  [%expect {| ticket_store-2.tz: (Pair {} ) |}];

  printf "ticket_store.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticket_store.tz"
    "" "" generic_conf);
  [%expect {| ticket_store.tz: (Pair {} ) |}];

  printf "ticketer-2.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticketer-2.tz"
    "" "" generic_conf);
  [%expect {| ticketer-2.tz: (Pair {} ) |}];

  printf "ticketer.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/ticketer.tz"
    "" "" generic_conf);
  [%expect {| ticketer.tz: (Pair {} ) |}];

  printf "transfer_amount.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/transfer_amount.tz"
    "" "" generic_conf);
  [%expect {| transfer_amount.tz: (Pair {} ) |}];

  printf "transfer_tokens.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/transfer_tokens.tz"
    "" "" generic_conf);
  [%expect {| transfer_tokens.tz: (Pair {} ) |}];

  printf "uncomb.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/uncomb.tz"
    "" "" generic_conf);
  [%expect {| uncomb.tz: (Pair {} ) |}];

  printf "unpair.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/unpair.tz"
    "" "" generic_conf);
  [%expect {| unpair.tz: (Pair {} ) |}];

  printf "update_big_map.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/update_big_map.tz"
    "" "" generic_conf);
  [%expect {| update_big_map.tz: (Pair {} ) |}];

  printf "utxo_read.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/utxo_read.tz"
    "" "" generic_conf);
  [%expect {| utxo_read.tz: (Pair {} ) |}];

  printf "utxor.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/utxor.tz"
    "" "" generic_conf);
  [%expect {| utxor.tz: (Pair {} ) |}];

  printf "view_fib.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_fib.tz"
    "" "" generic_conf);
  [%expect {| view_fib.tz: (Pair {} ) |}];

  printf "view_mutual_recursion.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_mutual_recursion.tz"
    "" "" generic_conf);
  [%expect {| view_mutual_recursion.tz: (Pair {} ) |}];

  printf "view_op_add.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_add.tz"
    "" "" generic_conf);
  [%expect {| view_op_add.tz: (Pair {} ) |}];

  printf "view_op_constant.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_constant.tz"
    "" "" generic_conf);
  [%expect {| view_op_constant.tz: (Pair {} ) |}];

  printf "view_op_id.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_id.tz"
    "" "" generic_conf);
  [%expect {| view_op_id.tz: (Pair {} ) |}];

  printf "view_op_nonexistent_addr.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_nonexistent_addr.tz"
    "" "" generic_conf);
  [%expect {| view_op_nonexistent_addr.tz: (Pair {} ) |}];

  printf "view_op_nonexistent_func.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_nonexistent_func.tz"
    "" "" generic_conf);
  [%expect {| view_op_nonexistent_func.tz: (Pair {} ) |}];

  printf "view_op_test_step_contants.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_test_step_contants.tz"
    "" "" generic_conf);
  [%expect {| view_op_test_step_contants.tz: (Pair {} ) |}];

  printf "view_op_toplevel_inconsistent_input_type.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_toplevel_inconsistent_input_type.tz"
    "" "" generic_conf);
  [%expect {| view_op_toplevel_inconsistent_input_type.tz: (Pair {} ) |}];

  printf "view_op_toplevel_inconsistent_output_type.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_op_toplevel_inconsistent_output_type.tz"
    "" "" generic_conf);
  [%expect {| view_op_toplevel_inconsistent_output_type.tz: (Pair {} ) |}];

  printf "view_rec.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_rec.tz"
    "" "" generic_conf);
  [%expect {| view_rec.tz: (Pair {} ) |}];

  printf "view_toplevel_lib.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/view_toplevel_lib.tz"
    "" "" generic_conf);
  [%expect {| view_toplevel_lib.tz: (Pair {} ) |}];

  printf "voting_power.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/voting_power.tz"
    "" "" generic_conf);
  [%expect {| voting_power.tz: (Pair {} ) |}];

  printf "xor.tz: %s\n" (run_file "./test_files/contracts_alpha/opcodes/xor.tz"
    "" "" generic_conf);
  [%expect {| xor.tz: (Pair {} ) |}];
*)
