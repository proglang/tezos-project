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

let test_match type_s =
  let code = Printf.sprintf ("(entrypoint (x: %s) (assert true))") type_s in
  generate_contract type_s;
  typecheck
    code
    file_path ()
  >|= (fun () -> Alcotest.(check pass) type_s () ())

let type_match_test_cases =
  let open Alcotest_lwt in
  List.map
    ~f:(fun type_s ->
      test_case ("Type match: " ^ type_s) `Quick (fun _ () -> test_match type_s))
    [
     "int"; "bool"; "string"; "mutez"; "bytes"; "nat"; "address"; "chain_id";
     "key"; "key_hash"; "operation"; "timestamp"; "unit"; "(list int)";
     "(set nat)"; "(option bool)"; "(or mutez string)"; "(pair address bytes)";
     "(lambda (option chain_id) unit)"; "(map operation timestamp)";
     "(contract unit)"; "(big_map key key_hash)"
    ]

let () =
  let open Alcotest_lwt in
  Lwt_main.run
  @@ run "Typechecker"
       [
         ("Type matches", type_match_test_cases)
       ]
