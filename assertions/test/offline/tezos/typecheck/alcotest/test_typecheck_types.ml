open Core
open Typecheck_wrapper
open Contract_generator
open Lwt.Infix

(*
let test_match_int _ () =
  generate_contract "int";
  lwt_check_raises (Some "Entrypoint type mismatch: default") @@
  typecheck
    {|(entrypoint (x: int)
        (assert true))|}
    file_path
*)

let lwt_check_raises (exp_s : string option) f =
  Lwt.catch
    (fun () -> f () >|= fun () -> `Ok)
    (function e -> Lwt.return @@ `Error e)
  >|= function
  | `Ok -> Alcotest.fail "No exception was thrown"
  | `Error (Failure s) ->
     begin
       match exp_s with
       | Some exs ->
          if String.equal s exs then Alcotest.(check pass) "Correct exception" () ()
          else Alcotest.fail ("Caught unexpected exception: \n" ^ s)
       | None -> Alcotest.(check pass) "Correct exception" () ()
     end
  | `Error _ -> Alcotest.fail "Incorrect exception was thrown"

let lwt_check_success tc f =
  Lwt.catch
    (fun () -> f () >|= fun () -> `Ok)
    (function e -> Lwt.return @@ `Error e)
  >|= function
  | `Ok -> Alcotest.(check pass) tc () ()
  | `Error (Failure s) -> Alcotest.fail ("Caught exception: \n" ^ s)
  | `Error _ -> Alcotest.fail "Caught unknown exception"

let test_type_match type_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type_s in
  generate_contract type_s;
  lwt_check_success type_s @@
  typecheck
    code
    file_path

let test_pattern_match type_s pattern_s =
  let code = Printf.sprintf ("(entrypoint %s (assert true))") pattern_s in
  generate_contract type_s;
  lwt_check_success pattern_s @@
  typecheck
    code
    file_path

let pattern_match_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern match: " ^ pattern_s) `Quick (fun _ () -> test_pattern_match type_s pattern_s))
    [
      ("(list int)", "nil"); ("(list int)", "_"); ("(list int)", "(cons _ _)");
      ("(list int)", "(cons (x : int) (xs : (list int)))");
      ("(list int)", "(cons (x : int) nil)");
      ("(list int)", "(cons (x : int) _ )");
      ("(list int)", "(cons _ (xs : list int))");
      ("(option bool)", "none"); ("(option bool)", "_");
      ("(option bool)", "(some _)");
      ("(option bool)", "(some (x : bool))");
      ("(or mutez string)", "_");
      ("(or mutez string)", "(left _)");
      ("(or mutez string)", "(left (x : mutez))");
      ("(or mutez string)", "(right _)");
      ("(or mutez string)", "(right (x : string))");
      ("(pair address bytes)", "_"); ("(pair address bytes)", "(pair _ _)");
      ("(pair address bytes)", "(pair (x : address) _)");
      ("(pair address bytes)", "(pair _ (x : bytes))");
      ("(pair address bytes)", "(pair (x : address) (y : bytes))");
    ]

let type_match_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun type_s ->
      test_case ("Type match: " ^ type_s) `Quick (fun _ () -> test_type_match type_s))
    [
     "int"; "bool"; "string"; "mutez"; "bytes"; "nat"; "address"; "chain_id";
     "key"; "key_hash"; "operation"; "timestamp"; "unit"; "(list int)";
     "(set nat)"; "(option bool)"; "(or mutez string)"; "(pair address bytes)";
     "(lambda (option chain_id) unit)"; "(map operation timestamp)";
     "(contract unit)"; "(big_map key_hash key)"
    ]

let () =
  let open Alcotest_lwt in
  Lwt_main.run
  @@ run "Typechecker"
       [
         ("Type matches", type_match_test_cases);
         ("Pattern matches", pattern_match_test_cases)
       ]
