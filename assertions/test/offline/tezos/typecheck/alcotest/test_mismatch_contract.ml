open Core
open Lwt.Infix
open Helpers

let test_tz_w_tags_tza_wo_tags_mismatch _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (right (b: nat)) (assert true))|}
  in
  let script = generate_contract "(or (int %A) (bool %B))" in
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      script

let test_tz_w_tags_tza_wo_tags_dup _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (left (b: int)) (assert true))|}
  in
  let script = generate_contract "(or (int %A) (bool %B))" in
  lwt_check_raises (Some error_dup_ep_default) @@
    typecheck
      code
      script

let test_tz_wo_tags_tza_w_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: nat) (assert true))|}
  in
  let script = generate_contract "(or int bool)" in
  lwt_check_raises (Some (error_mismatch_ep "B")) @@
    typecheck
      code
      script

let test_tz_wo_tags_tza_w_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: int) (assert true))|}
  in
  let script = generate_contract "(or int bool)" in
  lwt_check_raises (Some (error_dup_ep "B")) @@
    typecheck
      code
      script

let test_tz_wo_tags_tza_wo_tags_mismatch _ () =
  let code =
    {|(entrypoint (a: int) (assert true))
      (entrypoint (right (b: nat)) (assert true))|}
  in
  let script = generate_contract "(or int bool)" in
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      script

let test_tz_wo_tags_tza_wo_tags_dup _ () =
  let code =
    {|(entrypoint (left (a: int)) (assert true))
      (entrypoint (left (b: int)) (assert true))|}
  in
  let script = generate_contract "(or int bool)" in
  lwt_check_raises (Some error_dup_ep_default) @@
    typecheck
      code
      script

let test_tz_w_tags_tza_w_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %B (b: nat) (assert true))|}
  in
  let script = generate_contract "(or (int %A) (bool %B))" in
  lwt_check_raises (Some (error_mismatch_ep "B")) @@
    typecheck
      code
      script
  >|= (fun () -> Alcotest.(check pass) "tz_w_tags_tza_w_tags_mismatch" () ())

let test_tz_w_tags_tza_w_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %A (b: int) (assert true))|}
  in
  let script = generate_contract "(or (int %A) (bool %B))" in
  lwt_check_raises (Some (error_dup_ep "A")) @@
    typecheck
      code
      script

let test_mixed_tags_mismatch _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (right (b: nat)) (assert true))|}
  in
  let script = generate_contract "(or (int %A) bool)" in
  lwt_check_raises (Some error_mismatch_default) @@
    typecheck
      code
      script

let test_mixed_tags_dup _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint (left (a: int)) (assert true))|}
  in
  let script = generate_contract "(or (int %A) bool)" in
  lwt_check_raises (Some error_dup_ep_default) @@
    typecheck
      code
      script

let test_ambiguous_w_tags_tza _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %C (c: int) (assert true))|}
  in
  let script = generate_contract "(or (int %A) (int %B))" in
  lwt_check_raises (Some (error_ambiguous_ep "C")) @@
    typecheck
      code
      script

let test_ambiguous_wo_tags_tza _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))|}
  in
  let script = generate_contract "(or int int)" in
  lwt_check_raises (Some (error_ambiguous_ep "A")) @@
    typecheck
      code
      script

let test_ambiguous_wildcard _ () =
  let code =
    {|(entrypoint %C _ (assert true))|}
  in
  let script = generate_contract "(or (int %A) (int %B))" in
  lwt_check_raises (Some (error_ambiguous_ep "C")) @@
    typecheck
      code
      script

let test_ambiguous_typeless_pattern_any _ () =
  let code =
    {|(entrypoint a (assert true))|}
  in
  let script = generate_contract "(or (int %A) (int %B))" in
  lwt_check_raises (Some (error_ambiguous_ep "default")) @@
    typecheck
      code
      script

let test_ambiguous_typeless_composite_pattern _ () =
  let code =
    {|(entrypoint (pair a b) (assert true))|}
  in
  let script = generate_contract "(or (pair %A int int) (pair %B int nat))" in
  lwt_check_raises (Some (error_ambiguous_ep "default")) @@
    typecheck
      code
      script

let test_overlapping_assertions_w_tags _ () =
  let code =
    {|(entrypoint %A (a: int) (assert true))
      (entrypoint %AB _ (assert true))|}
  in
  let script = generate_contract "(or %AB (or (int %A) (int %B)) int)" in
  lwt_check_raises (Some (error_dup_ep "AB")) @@
    typecheck
      code
      script

let test_overlapping_assertions_w_tags_2 _ () =
  let code =
    {|(entrypoint %AB _ (assert true))
      (entrypoint %A (a: int) (assert true))|}
  in
  let script = generate_contract "(or %AB (or (int %A) (int %B)) int)" in
  lwt_check_raises (Some (error_dup_ep "A")) @@
    typecheck
      code
      script

let () =
  let open Alcotest_lwt in
  Lwt_main.run
  @@ run "Typechecker - matching eps to parent contract"
       [ "Mismatching assertion", [
             test_case "tz_w_tags_tza_wo_tags_mismatch" `Quick test_tz_w_tags_tza_wo_tags_mismatch;
             test_case "tz_w_tags_tza_wo_tags_dup" `Quick test_tz_w_tags_tza_wo_tags_dup;
             test_case "tz_wo_tags_tza_w_tags_mismatch" `Quick test_tz_wo_tags_tza_w_tags_mismatch;
             test_case "tz_wo_tags_tza_w_tags_dup" `Quick test_tz_wo_tags_tza_w_tags_dup;
             test_case "tz_wo_tags_tza_wo_tags_mismatch" `Quick test_tz_wo_tags_tza_wo_tags_mismatch;
             test_case "tz_wo_tags_tza_wo_tags_dup" `Quick test_tz_wo_tags_tza_wo_tags_dup;
             test_case "tz_w_tags_tza_w_tags_mismatch" `Quick test_tz_w_tags_tza_w_tags_mismatch;
             test_case "tz_w_tags_tza_w_tags_dup" `Quick test_tz_w_tags_tza_w_tags_dup;
             test_case "mixed_tags_mismatch" `Quick test_mixed_tags_mismatch;
             test_case "mixed_tags_dup" `Quick test_mixed_tags_dup;
             test_case "ambiguous_w_tags" `Quick test_ambiguous_w_tags_tza;
             test_case "ambiguous_wo_tags" `Quick test_ambiguous_wo_tags_tza;
             test_case "ambiguous wildcard" `Quick test_ambiguous_wildcard;
             test_case "overlapping_w_tags" `Quick test_overlapping_assertions_w_tags;
             test_case "overlapping_wo_tags" `Quick test_overlapping_assertions_w_tags_2
       ]]
