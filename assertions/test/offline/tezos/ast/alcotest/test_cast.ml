open Format

let cast input () =
  Parsing.Lex_and_parse.parse_contract input
  |> Tezos_ast.cast
  |> (fun _ -> ())

let error_msg ty = asprintf "Casting the AST failed.@.---@.Unsupported type for predicate variable: %s@." (Parsing.Pp_ast.str_of_ty ty)

let test_unsupported_predicate_ty (s, t) =
  let code = asprintf
    {|(entrypoint _
        (forall (x : %s)
          (assert true)))|} s
  in
  Alcotest.check_raises
    "Unsupported predicate variable type"
    (Failure (error_msg t))
    (fun () -> cast code ())

let unsupported_predicate_ty_test_cases =
  let open Core in
  let open Alcotest in
   List.map
    ~f:(fun (s, ty) ->
      test_case ("Predicate type " ^ s) `Quick (fun () ->
          test_unsupported_predicate_ty (s, ty)))
    [ ("bool", `Bool_t); ("bytes", `Bytes_t); ("string", `String_t);
      ("fmu", `Fmu_t); ("address", `Address_t); ("chain_id", `ChainID_t);
      ("key", `Key_t); ("key_hash", `KeyHash_t); ("operation", `Operation_t);
      ("signature", `Signature_t); ("timestamp", `Timestamp_t); ("unit", `Unit_t);
      ("(list int)", `List_t `Int_t);  ("(set int)", `Set_t `Int_t);
      ("(option int)", `Option_t `Int_t); ("(or int int)", `Or_t(`Int_t, `Int_t));
      ("(pair int int)", `Pair_t(`Int_t, `Int_t)); ("(lambda int int)", `Lambda_t(`Int_t, `Int_t));
      ("(map int int)", `Map_t(`Int_t, `Int_t)); ("(big_map int int)", `BigMap_t(`Int_t, `Int_t));
      ("(contract int)", `Contract_t `Int_t);]

let test_supported_predicate_ty_forall s () =
  let code = asprintf
    {|(entrypoint _
        (forall (x : %s)
          (assert true)))|} s
  in
  cast code ()
  |> (fun () -> Alcotest.(check pass) s () ())

let test_supported_predicate_ty_exists s () =
  let code = asprintf
    {|(entrypoint _
        (exists (x : %s)
          (assert true)))|} s
  in
  cast code ()
  |> (fun () -> Alcotest.(check pass) s () ())

let () =
  let open Alcotest in
  run "Tezos cast"
    [ ( "Unsupported predicate variable types", unsupported_predicate_ty_test_cases );
      ("Supported predicate variable types",
       [test_case ("Predicate type int - forall") `Quick (test_supported_predicate_ty_forall "int");
        test_case ("Predicate type nat - forall") `Quick (test_supported_predicate_ty_forall "nat");
        test_case ("Predicate type int - exists") `Quick (test_supported_predicate_ty_exists "int");
        test_case ("Predicate type nat - exists") `Quick (test_supported_predicate_ty_exists "nat")]);
      
    ]
