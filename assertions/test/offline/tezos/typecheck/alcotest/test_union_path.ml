open Test_helpers
open Dao_script
open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives

let union_path_testable_eq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> Union_path.eq up1 up2)

let union_path_testable_uneq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> not (Union_path.eq up1 up2))

let test_up_eq (up1, up2) =
  Alcotest.(check union_path_testable_eq) "equal" up1 up2

let test_up_uneq (up1, up2) =
  Alcotest.(check union_path_testable_uneq) "unequal" up1 up2

let union_path_mapping_testable =
  let rec eq_mapping m1 m2 =
    match m1, m2 with
    | [], [] -> true
    | (t1, p1) :: r1, (t2, p2) :: r2 ->
       if t1 = t2 && (Union_path.eq p1 p2)
       then eq_mapping r1 r2
       else false
    | _ -> false
  in
  let pp_mapping ppf mapping =
    let rec rec_pp_mapping ppf = function
      | [] -> ()
      | (t, p) :: [] -> (
         Fmt.pf ppf "(%s, " t;
         Union_path.pp ppf p;
         Fmt.pf ppf ")"; )
      | (t, p) :: rest -> (
        Fmt.pf ppf "(%s, " t;
        Union_path.pp ppf p;
        Fmt.pf ppf ");";
        rec_pp_mapping ppf rest)
    in
    Fmt.pf ppf "[" ;
    rec_pp_mapping ppf mapping;
    Fmt.pf ppf "]" ;
  in
  Alcotest.testable pp_mapping (fun map1 map2 -> eq_mapping map1 map2)

let test_mapping (param, target_mapping) =
  let rec get_parameters (nodes : (int, prim) Micheline.node list) =
    match nodes with
    | Prim (_, K_parameter, node :: [], _) :: _ ->
       node
    | Seq (_, ns) :: _ -> get_parameters ns
    | _ :: nodes -> get_parameters nodes
    | [] -> Alcotest.fail "No parameters found in Micheline AST"
  in
   let contract = generate_contract param in
   let script = Lwt_main.run @@ Dao_string.get_script contract in
   match script with
   | Ok {expanded = exp; _} ->
      begin
        let root = Micheline.root exp in
        let parameter_node = get_parameters [root] in
        let path_bindings = Union_path.from_micheline parameter_node in
        Alcotest.(check union_path_mapping_testable)
          "same mapping"
          target_mapping
          path_bindings
      end
   | Error err ->
      let open Tezos_error_monad in
      let print_error = (fun s err -> s ^ (Format.asprintf "%a\n" Error_monad.pp err)) in
      Alcotest.fail @@ List.fold_left print_error "" err

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
      );
      ("Add",
       [
         test_case "T + T" `Quick (fun () -> test_up_eq (T, add T T));
         test_case "L + T" `Quick (fun () -> test_up_eq (Left T, add T (Left T)));
         test_case "T + L" `Quick (fun () -> test_up_eq (Left T, add (Left T) T));
         test_case "R + T" `Quick (fun () -> test_up_eq (Right T, add T (Right T)));
         test_case "T + R" `Quick (fun () -> test_up_eq (Right T, add (Right T) T));
         test_case "L + R" `Quick (fun () -> test_up_eq (Left (Right T), add (Right T) (Left T)));
         test_case "R + L" `Quick (fun () -> test_up_eq (Right (Left T), add (Left T) (Right T)));
      ]);
       ("Build paths from Micheline",
        [
          test_case "No union w/o tag" `Quick (fun () -> test_mapping ("int", [("%default", T)]));
          test_case "No union w/ tag" `Quick (fun () -> test_mapping ("(int %A)", [("%A", T)]));
          test_case "1 union w/ tags" `Quick (fun () -> test_mapping ("(or (int %A) (int %B))",[("%default", T); ("%B", Right T); ("%A", Left T)]));
          test_case "2 unions w/ tags" `Quick (fun () -> test_mapping ("(or (or %AB (int %A) (int %B)) (int %C))",
                                                                       [("%default", T); ("%C", Right T); ("%AB", Left T);
                                                                       ("%B", Left (Right T)); ("%A", Left (Left T))]));
          test_case "complex unions" `Quick (fun () -> test_mapping ("(or (or %AB (int %A) (int %B)) (or %CDE (or %CD (int %C) (int %D)) (int %E)))",
                                                                     [("%default", T); ("%CDE", Right T); ("%E", (Right (Right T)));
                                                                      ("%CD", Right (Left T)); ("%D", Right (Left (Right T))); ("%C", Right (Left (Left T)));
                                                                      ("%AB", Left T); ("%B", Left (Right T)); ("%A", Left (Left T))]));
        ]
       )
    ]
