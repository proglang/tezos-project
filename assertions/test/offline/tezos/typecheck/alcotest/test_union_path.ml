open Helpers
open Dao_script
open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives

let union_path_testable_eq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> Union_path.eq up1 up2)

let union_path_testable_uneq =
  Alcotest.testable Union_path.pp (fun up1 up2 -> not (Union_path.eq up1 up2))

let union_path_list_testable_eq =
  let rec eq_lists l1 l2 =
    match (l1, l2) with
    | [], [] -> true
    | i :: is, j :: js ->
       if Union_path.eq i j
       then eq_lists is js
       else false
    | _ -> false
  in
  let pp_up_list ppf l =
    Fmt.pf ppf "[";
    List.iter (fun e -> Union_path.pp ppf e; Fmt.pf ppf ", ") l;
    Fmt.pf ppf "]"
  in
  Alcotest.testable pp_up_list (fun upl1 upl2 -> eq_lists upl1 upl2)

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

let test_up_eq (up1, up2) =
  Alcotest.(check union_path_testable_eq) "equal" up1 up2

let test_up_uneq (up1, up2) =
  Alcotest.(check union_path_testable_uneq) "unequal" up1 up2

let test_up_cmp (up1, up2, exp) =
  Alcotest.(check int) "compare" exp (Union_path.compare up1 up2)

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

let test_eq_lists (upl1, upl2) =
  Alcotest.(check union_path_list_testable_eq) "equal lists" upl1 upl2

let () =
  let open Alcotest in
  let open Union_path in
  let some_paths = [T; Left T; Right T; Left (Right T); Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T)); Left (Right (Right T));
                    Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))]
  in
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
      ("Compare union paths",
       [
         test_case "T-T" `Quick (fun () -> test_up_cmp (T, T, 0));
         test_case "T-LT" `Quick (fun () -> test_up_cmp (T, Left T, 1));
         test_case "LT-T" `Quick (fun () -> test_up_cmp (Left T, T, -1));
         test_case "LT-LT" `Quick (fun () -> test_up_cmp (Left T, Left T, 0));
         test_case "T-RT" `Quick (fun () -> test_up_cmp (T, Right T, 1));
         test_case "RT-T" `Quick (fun () -> test_up_cmp (Right T, T, -1));
         test_case "RT-RT" `Quick (fun () -> test_up_cmp (Right T, Right T, 0));
         test_case "LT-RT" `Quick (fun () -> test_up_cmp (Left T, Right T, 1));
         test_case "RT-LT" `Quick (fun () -> test_up_cmp (Right T, Left T, -1));
         test_case "LT-LLT" `Quick (fun () -> test_up_cmp (Left T, Left (Left T), 1));
         test_case "LLT-LT" `Quick (fun () -> test_up_cmp (Left (Left T), Left T, -1));
         test_case "RT-RRT" `Quick (fun () -> test_up_cmp (Right T, Right (Right T), 1));
         test_case "RRT-RT" `Quick (fun () -> test_up_cmp (Right (Right T), Right T, -1));
         test_case "LLT-LRT" `Quick (fun () -> test_up_cmp (Left (Left T), Left (Right T), 1));
         test_case "LRT-LLT" `Quick (fun () -> test_up_cmp (Left (Right T), Left (Left T), -1));
       ]
      );
      ("Add",
       [
         test_case "T + T" `Quick (fun () -> test_up_eq (T, extend T T));
         test_case "L + T" `Quick (fun () -> test_up_eq (Left T, extend T (Left T)));
         test_case "T + L" `Quick (fun () -> test_up_eq (Left T, extend (Left T) T));
         test_case "R + T" `Quick (fun () -> test_up_eq (Right T, extend T (Right T)));
         test_case "T + R" `Quick (fun () -> test_up_eq (Right T, extend (Right T) T));
         test_case "L + R" `Quick (fun () -> test_up_eq (Left (Right T), extend (Right T) (Left T)));
         test_case "R + L" `Quick (fun () -> test_up_eq (Right (Left T), extend (Left T) (Right T)));
      ]);
      ("Build paths from Micheline",
       [
         test_case "No union w/o tag" `Quick (fun () -> test_mapping ("int", [("default", T)]));
         test_case "No union w/ tag" `Quick (fun () -> test_mapping ("(int %A)", [("A", T)]));
         test_case "1 union w/ tags" `Quick (fun () -> test_mapping ("(or (int %A) (int %B))",[("default", T); ("B", Right T); ("A", Left T)]));
         test_case "2 unions w/ tags" `Quick (fun () -> test_mapping ("(or (or %AB (int %A) (int %B)) (int %C))",
                                                                      [("default", T); ("C", Right T); ("AB", Left T);
                                                                       ("B", Left (Right T)); ("A", Left (Left T))]));
         test_case "complex unions" `Quick (fun () -> test_mapping ("(or (or %AB (int %A) (int %B)) (or %CDE (or %CD (int %C) (int %D)) (int %E)))",
                                                                    [("default", T); ("CDE", Right T); ("E", (Right (Right T)));
                                                                     ("CD", Right (Left T)); ("D", Right (Left (Right T))); ("C", Right (Left (Left T)));
                                                                     ("AB", Left T); ("B", Left (Right T)); ("A", Left (Left T))]));
       ]
      );
      ("Build path from assertion type pattern",
       [
         test_case "from wildcard" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern `Wildcard));
         test_case "from var" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern (`Var ("i", `Int_t))));
         test_case "from ident" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern (`IdentPat "i")));
         test_case "from pair" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern (`Pair (`Wildcard, `Wildcard))));
         test_case "from none" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern `None));
         test_case "from some" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern (`Some `Wildcard)));
         test_case "from cons" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern (`Cons (`Wildcard, `Wildcard))));
         test_case "from nil" `Quick (fun () -> test_up_eq (T, Union_path.from_assertion_pattern `Nil));
         test_case "from left" `Quick (fun () -> test_up_eq (Left T, Union_path.from_assertion_pattern (`Left `Wildcard)));
         test_case "from right" `Quick (fun () -> test_up_eq (Right T, Union_path.from_assertion_pattern (`Right `Wildcard)));
         test_case "from LL" `Quick (fun () -> test_up_eq (Left (Left T), Union_path.from_assertion_pattern (`Left (`Left `Wildcard))));
         test_case "from LR" `Quick (fun () -> test_up_eq (Left (Right T), Union_path.from_assertion_pattern (`Left (`Right `Wildcard))));
         test_case "from RL" `Quick (fun () -> test_up_eq (Right (Left T), Union_path.from_assertion_pattern (`Right (`Left `Wildcard))));
         test_case "from RR" `Quick (fun () -> test_up_eq (Right (Right T), Union_path.from_assertion_pattern (`Right (`Right `Wildcard))));
      ]);
      ("Remove prefixes",
       [
         test_case "T" `Quick (fun () -> test_eq_lists ([Left T; Right T; Left (Right T); Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T));
                                                         Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                        Union_path.remove_prefixes some_paths T));
         test_case "LT" `Quick (fun () -> test_eq_lists ([Right T; Left (Right T); Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T));
                                                          Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                         Union_path.remove_prefixes some_paths (Left T)));
         test_case "RT" `Quick (fun () -> test_eq_lists ([Left T; Left (Right T); Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T));
                                                          Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                         Union_path.remove_prefixes some_paths (Right T)));
         test_case "LRT" `Quick (fun () -> test_eq_lists ([Right T; Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T));
                                                           Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                          Union_path.remove_prefixes some_paths (Left (Right T))));
         test_case "RLT" `Quick (fun () -> test_eq_lists ([Left T; Left (Right T); Left (Left T); Right (Right T); Left (Right (Left T)); Left (Right (Right T));
                                                           Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                          Union_path.remove_prefixes some_paths (Right (Left T))));
         test_case "LLT" `Quick (fun () -> test_eq_lists ([Right T; Left (Right T); Right (Left T); Right (Right T); Left (Right (Left T)); Left (Right (Right T));
                                                           Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                          Union_path.remove_prefixes some_paths (Left (Left T))));
         test_case "RRT" `Quick (fun () -> test_eq_lists ([Left T; Left (Right T); Right (Left T); Left (Left T); Left (Right (Left T)); Left (Right (Right T));
                                                           Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                          Union_path.remove_prefixes some_paths (Right (Right T))));
         test_case "LRLT" `Quick (fun () -> test_eq_lists ([Right T; Right (Left T); Left (Left T); Right (Right T); Left (Right (Right T)); Left (Left (Left T));
                                                            Left (Left (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_prefixes some_paths (Left (Right (Left T)))));
         test_case "LRRT" `Quick (fun () -> test_eq_lists ([Right T; Right (Left T); Left (Left T); Right (Right T); Left (Right (Left T)); Left (Left (Left T));
                                                            Left (Left (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_prefixes some_paths (Left (Right (Right T)))));
         test_case "LLLT" `Quick (fun () -> test_eq_lists ([Right T; Left (Right T); Right (Left T); Right (Right T); Left (Right (Left T));
                                                            Left (Right (Right T)); Left (Left (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_prefixes some_paths (Left (Left (Left T)))));
         test_case "RLRT" `Quick (fun () -> test_eq_lists ([Left T; Left (Right T); Left (Left T); Right (Right T); Left (Right (Left T)); Left (Right (Right T));
                                                            Left (Left (Left T)); Left (Left (Right T))],
                                                           Union_path.remove_prefixes some_paths (Right (Left (Right T)))));
         test_case "empty list" `Quick (fun () -> test_eq_lists ([], Union_path.remove_prefixes [] T));
      ]);
       ("Remove paths with prefix",
        [
          test_case "T" `Quick (fun () -> test_eq_lists ([], Union_path.remove_with_prefix some_paths T));
          test_case "LT" `Quick (fun () -> test_eq_lists ([T; Right T; Right (Left T); Right (Right T); Right (Left (Right T))],
                                                          Union_path.remove_with_prefix some_paths (Left T)));
          test_case "RT" `Quick (fun () -> test_eq_lists ([T; Left T; Left (Right T); Left (Left T); Left (Right (Left T)); Left (Right (Right T));
                                                           Left (Left (Left T)); Left (Left (Right T))],
                                                          Union_path.remove_with_prefix some_paths (Right T)));
          test_case "LRT" `Quick (fun () -> test_eq_lists ([T; Left T; Right T; Right (Left T); Left (Left T); Right (Right T); Left (Left (Left T));
                                                            Left (Left (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_with_prefix some_paths (Left (Right T))));
          test_case "LLT" `Quick (fun () -> test_eq_lists ([T; Left T; Right T; Left (Right T); Right (Left T); Right (Right T); Left (Right (Left T));
                                                            Left (Right (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_with_prefix some_paths (Left (Left T))));
          test_case "RLT" `Quick (fun () -> test_eq_lists ([T; Left T; Right T; Left (Right T); Left (Left T); Right (Right T); Left (Right (Left T));
                                                            Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T))],
                                                           Union_path.remove_with_prefix some_paths (Right (Left T))));
          test_case "RRT" `Quick (fun () -> test_eq_lists ([T; Left T; Right T; Left (Right T); Right (Left T); Left (Left T); Left (Right (Left T));
                                                            Left (Right (Right T)); Left (Left (Left T)); Left (Left (Right T)); Right (Left (Right T))],
                                                           Union_path.remove_with_prefix some_paths (Right (Right T))));
          test_case "LRLRT" `Quick (fun () -> test_eq_lists (some_paths, Union_path.remove_with_prefix some_paths (Left (Right (Left (Right T))))));
          test_case "empty list" `Quick (fun () -> test_eq_lists ([], Union_path.remove_with_prefix [] T));
       ])
    ]
