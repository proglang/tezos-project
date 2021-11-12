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
  let env = "1;2;3;4;5;6;7;8;9" in
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
