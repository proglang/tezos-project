open Core
open Lwt.Infix
open Helpers
open Random

let types = [
     "int"; "bool"; "string"; "bytes"; "nat"; "address"; "chain_id";
     "key"; "key_hash"; "timestamp"; "unit"; "(list int)";
     "(set nat)"; "(option bool)"; "(or nat string)"; "(pair address bytes)";
     "(lambda (option chain_id) unit)"; "(map address timestamp)";
     "(contract unit)"; "(big_map key_hash key)"
  ]

let test_type_mismatch_fmu ty =
  let code ="(entrypoint (x: fmu) (assert true))" in
  let script = generate_contract ty in
  lwt_check_raises (Some error_mismatch_default) @@
  typecheck
    code
    script
  
let test_type_match type_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type_s in
  let script = generate_contract type_s in
  typecheck
    code
    script ()
  >|= (fun () -> Alcotest.(check pass) type_s () ())

let test_pattern_match type_s pattern_s =
  let code = Printf.sprintf ("(entrypoint %s (assert true))") pattern_s in
  let script = generate_contract type_s in
  typecheck
    code
    script ()
  >|= (fun () -> Alcotest.(check pass) pattern_s () ())

let test_type_mismatch type1_s type2_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type1_s in
  let script = generate_contract type2_s in
  lwt_check_raises (Some error_mismatch_default) @@
  typecheck
    code
    script

let test_pattern_mismatch type_s pat_s=
  let code = Printf.sprintf ("(entrypoint %s (assert true))") pat_s in
  let script = generate_contract type_s in
  lwt_check_raises (Some error_mismatch_default) @@
  typecheck
    code
    script
  
let pattern_match_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern match: " ^ pattern_s) `Quick (fun _ () -> test_pattern_match type_s pattern_s))
    [
      ("(list int)", "nil");
      ("(list int)", "_");
      ("(list int)", "(cons _ _)");
      ("(list int)", "(cons (x : int) (xs : (list int)))");
      ("(list int)", "(cons (x : int) nil)");
      ("(list int)", "(cons (x : int) _ )");
      ("(list int)", "(cons _ (xs : (list int)))");
      ("(list int)", "(cons a as)");
      ("(list int)", "(cons a _)");
      ("(list int)", "(cons a nil)");
      ("(option bool)", "none");
      ("(option bool)", "_");
      ("(option bool)", "(some _)");
      ("(option bool)", "(some x)");
      ("(option bool)", "(some (x : bool))");
      ("(or nat string)", "_");
      ("(or nat string)", "(left _)");
      ("(or nat string)", "(left x)");
      ("(or nat string)", "(left (x : nat))");
      ("(or nat string)", "(right _)");
      ("(or nat string)", "(right x)");
      ("(or nat string)", "(right (x : string))");
      ("(pair address bytes)", "_");
      ("(pair address bytes)", "(pair _ _)");
      ("(pair address bytes)", "(pair (x : address) _)");
      ("(pair address bytes)", "(pair _ (x : bytes))");
      ("(pair address bytes)", "(pair (x : address) (y : bytes))");
      ("(pair address bytes)", "(pair a b)");
      ("(pair address bytes)", "(pair a _)");
      ("(pair address bytes)", "(pair _ b)");
      ("(pair address bytes)", "(pair a (b: bytes))");
    ]

let type_match_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun type_s ->
      test_case ("Type match: " ^ type_s) `Quick (fun _ () -> test_type_match type_s))
    types

let rec generate_type l n =
  if n = 0 then l else
    begin
      let size = Nativeint.of_int @@ List.length types in
      let i1 = Nativeint.to_int_exn @@ nativeint size in
      let i2 = Nativeint.to_int_exn @@ nativeint size in
      let t1 = List.nth_exn types i1 in
      let t2 = List.nth_exn types i2 in
      if String.equal t1 t2 then generate_type l n else generate_type ((t1, t2) :: l) (n-1)
    end

(* Generate random tests (quickCheck like) *)
let type_mismatch_test_cases n =
  let l = generate_type [] n in
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type1_s, type2_s) ->
      let tag = Printf.sprintf "Type mismatch: %s - %s" type1_s type2_s in
      test_case tag `Quick (fun _ () -> test_type_mismatch type1_s type2_s))
    l

(* Generate random tests (quickCheck like) *)
let type_mismatch_fmu_test_cases n =
  let l = generate_type [] n in
  let open Alcotest_lwt in
  List.map
    ~f:(fun (ty, _) ->
      let tag = Printf.sprintf "Type mismatch: fmu - %s" ty in
      test_case tag `Quick (fun _ () -> test_type_mismatch_fmu ty))
    l

let nil_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "nil")) (List.filter ~f:(fun e -> not @@ String.equal e "(list int)") types))

let cons_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "(cons (x : nat) (xs : (list nat)))")) types)

let some_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "(some (x : nat))")) types)

let none_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "none")) (List.filter ~f:(fun e -> not @@ String.equal e "(option bool)") types))

let left_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "(left (x : bytes))")) types)

let right_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "(right (x : bytes))")) types)

let pair_mismatch_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun (type_s, pattern_s) ->
      test_case ("Pattern mismatch: " ^ pattern_s) `Quick (fun _ () -> test_pattern_mismatch type_s pattern_s))
    (List.map ~f:(fun t -> (t, "(pair (x : nat) (y : string))")) types)

let fmu_match_testcase =
  let open Alcotest_lwt in
  test_case "fmu type match"
    `Quick ( fun _ () ->
             let code = "(entrypoint (x: fmu) (assert true))" in
             let script = generate_contract "mutez" in
             typecheck
               code
               script ()
             >|= (fun () -> Alcotest.(check pass) "fmu" () ()))
  
let () =
  let open Alcotest_lwt in
  self_init ();
  Lwt_main.run
  @@ run "Typechecker"
       [
         ("Type matches", fmu_match_testcase :: type_match_test_cases);
         ("Pattern matches", pattern_match_test_cases);
         ("Type mismatches", type_mismatch_test_cases 30);
         ("Type mismatches fmu", type_mismatch_fmu_test_cases 5);
         ("Pattern mismatches - nil", nil_mismatch_test_cases);
         ("Pattern mismatches - cons", cons_mismatch_test_cases);
         ("Pattern mismatches - some ", some_mismatch_test_cases);
         ("Pattern mismatches - none", none_mismatch_test_cases);
         ("Pattern mismatches - left", right_mismatch_test_cases);
         ("Pattern mismatches - pair", pair_mismatch_test_cases);
       ]
