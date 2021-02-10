open Core
open Typecheck_wrapper
open Contract_generator
open Lwt.Infix
open Test_helpers

let test_tz_w_tags_tza_wo_tags_match _ () =
  let code =
    {|(entrypoint (a: int) (assert true))
      (entrypoint (right (b: bool)) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_wo_tags_match" () ())

let test_tz_w_tags_tza_wo_tags_mismatch _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (right (b: nat)) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_wo_tags_mismatch" () ())

let test_tz_w_tags_tza_wo_tags_dup _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (left (b: int)) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_wo_tags_dup" () ())

let test_tz_wo_tags_tza_w_tags_match _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: bool) (assert true))|}
  in
  generate_contract "(or int bool)";
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_w_tags_match" () ())

let test_tz_wo_tags_tza_w_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: nat) (assert true))|}
  in
  generate_contract "(or int bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_w_tags_mismatch" () ())

let test_tz_wo_tags_tza_w_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: int) (assert true))|}
  in
  generate_contract "(or int bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_w_tags_dup" () ())

let test_tz_wo_tags_tza_wo_tags_match _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (right (b: bool)) (assert true))|}
  in
  generate_contract "(or int bool)";
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_wo_tags_match" () ())

let test_tz_wo_tags_tza_wo_tags_mismatch _ () =
  let code =
    {|(entrypoint (a: int) (assert true))
      (entrypoint (right (b: nat) (assert true))|}
  in
  generate_contract "(or int bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_wo_tags_mismatch" () ())

let test_tz_wo_tags_tza_wo_tags_dup _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (left (b: int)) (assert true))|}
  in
  generate_contract "(or int bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_wo_tags_tza_wo_tags_dup" () ())

let test_tz_w_tags_tza_w_tags_match _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: bool) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_w_tags_match" () ())

let test_tz_w_tags_tza_w_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: nat) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_w_tags_mismatch" () ())

let test_tz_w_tags_tza_w_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %A (b: int) (assert true))|}
  in
  generate_contract "(or (int %A) (bool %B))";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path

let test_mixed_tags_match _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (b: bool) (assert true))|}
  in
  generate_contract "(or (int %A) bool)";
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) "mixed_tags_match" () ())

let test_mixed_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (b: nat) (assert true))|}
  in
  generate_contract "(or (int %A) bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path

let test_mixed_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (a: int) (assert true))|}
  in
  generate_contract "(or (int %A) bool)";
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      file_path

let () =
  let open Alcotest_lwt in
  Lwt_main.run
  @@ run "Typechecker - matching eps to parent contract"
       [ "Matching", [
           test_case "tz_w_tags_tza_wo_tags_match" `Quick test_tz_w_tags_tza_wo_tags_match;
           test_case "tz_wo_tags_tza_w_tags_match" `Quick test_tz_wo_tags_tza_w_tags_match;
           test_case "tz_wo_tags_tza_wo_tags_match" `Quick test_tz_wo_tags_tza_wo_tags_match;
           test_case "tz_w_tags_tza_w_tags_match" `Quick test_tz_w_tags_tza_w_tags_match;
         ]; "Mismatching", [
             test_case "tz_w_tags_tza_wo_tags_mismatch" `Quick test_tz_w_tags_tza_wo_tags_mismatch;
             test_case "tz_w_tags_tza_wo_tags_dup" `Quick test_tz_w_tags_tza_wo_tags_dup;
             test_case "tz_wo_tags_tza_w_tags_mismatch" `Quick test_tz_wo_tags_tza_w_tags_mismatch;
             test_case "tz_wo_tags_tza_w_tags_dup" `Quick test_tz_wo_tags_tza_w_tags_dup;
             test_case "tz_wo_tags_tza_wo_tags_mismatch" `Quick test_tz_wo_tags_tza_wo_tags_mismatch;
             test_case "tz_wo_tags_tza_wo_tags_dup" `Quick test_tz_wo_tags_tza_wo_tags_dup;
             test_case "tz_w_tags_tza_w_tags_mismatch" `Quick test_tz_w_tags_tza_w_tags_mismatch;
             test_case "tz_w_tags_tza_w_tags_dup" `Quick test_tz_w_tags_tza_w_tags_dup
       ]]
