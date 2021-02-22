
let union_path_testable_eq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> Union_path.eq up1 up2)

let union_path_testable_uneq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> not (Union_path.eq up1 up2))

let test_up_eq (up1, up2) =
  Alcotest.(check union_path_testable_eq) "equal" up1 up2

let test_up_uneq (up1, up2) =
  Alcotest.(check union_path_testable_uneq) "unequal" up1 up2

let () =
  let open Alcotest in
  let open Union_path in
  run "UnionPath"
    [ ( "Equal union paths",
        [
          test_case "T" `Quick (fun () -> test_up_eq (T, T));
          test_case "L" `Quick (fun () -> test_up_eq (Left T, Left T));
          test_case "R" `Quick (fun () -> test_up_eq (Right T, Right T));
          test_case "LL" `Quick (fun () -> test_up_eq (Left (Left T), Left (Left T)));
          test_case "RR" `Quick (fun () -> test_up_eq (Right (Right T), Right (Right T)));
          test_case "LR" `Quick (fun () -> test_up_eq (Left (Right T), Left (Right T)));
          test_case "RL" `Quick (fun () -> test_up_eq (Right (Left T), Right (Left T)));
          test_case "LRL" `Quick (fun () -> test_up_eq (Left (Right (Left T)), Left (Right (Left T))));
          test_case "RLR" `Quick (fun () -> test_up_eq (Right (Left (Right T)), Right (Left (Right T))))
        ]
      );
      ("Unequal union paths",
       [
         test_case "TL" `Quick (fun () -> test_up_uneq (T, Left T));
         test_case "LT" `Quick (fun () -> test_up_uneq (Left T, T));
         test_case "TR" `Quick (fun () -> test_up_uneq (T, Right T));
         test_case "RT" `Quick (fun () -> test_up_uneq (Right T, T));
         test_case "RL" `Quick (fun () -> test_up_uneq (Right T, Left T));
         test_case "LR" `Quick (fun () -> test_up_uneq (Left T, Right T));
       ]
      )
    ]
