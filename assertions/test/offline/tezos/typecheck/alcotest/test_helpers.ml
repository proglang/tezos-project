open Lwt.Infix

let generate_contract parameter =
  Printf.sprintf "parameter %s; storage unit; code {UNIT ; NIL operation ; PAIR }\n" parameter

let error_mismatch_default = {|Entrypoint type mismatch: default|}
let error_mismatch_ep ep = Printf.sprintf "Entrypoint type mismatch: %s" ep
let error_dup_ep_default = {|Duplicate entrypoint: default|}
let error_dup_ep ep = Printf.sprintf "Duplicate entrypoint: %s" ep

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
