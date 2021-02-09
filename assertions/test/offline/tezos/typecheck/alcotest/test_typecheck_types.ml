open Core
open Typecheck_wrapper
open Contract_generator
open Lwt.Infix
open Test_helpers
open Random

let types = [
     "int"; "bool"; "string"; "mutez"; "bytes"; "nat"; "address"; "chain_id";
     "key"; "key_hash"; "timestamp"; "unit"; "(list int)";
     "(set nat)"; "(option bool)"; "(or mutez string)"; "(pair address bytes)";
     "(lambda (option chain_id) unit)"; "(map address timestamp)";
     "(contract unit)"; "(big_map key_hash key)"
    ]

let test_type_match type_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type_s in
  generate_contract type_s;
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) type_s () ())

let test_pattern_match type_s pattern_s =
  let code = Printf.sprintf ("(entrypoint %s (assert true))") pattern_s in
  generate_contract type_s;
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) pattern_s () ())

let test_type_mismatch type1_s type2_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type1_s in
  generate_contract type2_s;
  lwt_check_raises (Some error_mismatch_default) @@
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
    types

let rec generate l n =
  if n = 0 then l else
    begin
      let size = Nativeint.of_int @@ List.length types in
      let i1 = Nativeint.to_int_exn @@ nativeint size in
      let i2 = Nativeint.to_int_exn @@ nativeint size in
      let t1 = List.nth_exn types i1 in
      let t2 = List.nth_exn types i2 in
      if String.equal t1 t2 then generate l n else generate ((t1, t2) :: l) (n-1)
    end

let type_mismatch_test_cases =
  let l = generate [] 50 in
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type1_s, type2_s) ->
      let tag = Printf.sprintf "Type mismatch: %s - %s" type1_s type2_s in
      test_case tag `Quick (fun _ () -> test_type_mismatch type1_s type2_s))
    l

let () =
  let open Alcotest_lwt in
  self_init ();
  Lwt_main.run
  @@ run "Typechecker"
       [
         ("Type matches", type_match_test_cases);
         ("Pattern matches", pattern_match_test_cases);
         ("Type mismatches", type_mismatch_test_cases)
       ]
