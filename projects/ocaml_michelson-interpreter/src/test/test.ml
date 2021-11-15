(* TODO:
- Testfiles for each OPCode
- Run all testfiles with example input and compare expected output
 *)


open Core
(*
let run_file filename parameter storage env : string =
  In_channel.with_file filename ~f:(fun file ->
  let source = String.concat ~sep:"\n" (In_channel.input_lines file)
  in
  Michelson.run source parameter storage env
  )
*)


let%expect_test "op_codes" =
  print_endline "lol";
  (*
  let conf = Michelson.Config.parse_string "{
                                              "source": "a",
                                              "sender": "b",
                                              "self_address": "c",
                                              "balance": "1",
                                              "amount": "2",
                                              "timestamp": "12323",
                                              "chain_id": "d",
                                              "level": "3",
                                              "tot_voting_power": "4"
                                            }"
  print_endline (run_file "./test_files/contracts_alpha/opcodes/and.tz" "Pair True False" "Some True" env);*)

(*
open Core

let rec fact n = if n = 1 then 1 else n * fact (n - 1)

let%test _ = fact 5 = 120

let%expect_test _ =
  print_endline "Hello, world!";
  [%expect{|
    Hello, world!
  |}]*)
