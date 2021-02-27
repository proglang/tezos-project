let test_get_field_annot (exp, annots) =
  Alcotest.(check (option string)) "same annotation" exp (Micheline_annotations.get_field_annot annots)

let test_field_annot_from_string (exp, s) =
  Alcotest.(check string) "same annot" exp (Micheline_annotations.field_annot_of_string s)

let test_field_annot_from_string_exn s =
  Alcotest.check_raises "Empty annotation raises exn" (Failure "Error - cannot create empty field annotation") (fun () -> Micheline_annotations.field_annot_of_string s |> (fun _ -> ()))

let () =
  let open Alcotest in
  run "Micheline_annotations"
    [ ( "Get field annots",
        [
          test_case "empty annots" `Quick (fun () -> test_get_field_annot (None, []));
          test_case "no field annots" `Quick (fun () -> test_get_field_annot (None, [":some_type_annot"; "@some_var_annot"; ""; "some_string"]));
          test_case "return field annot" `Quick (fun () -> test_get_field_annot (Some "A", [":some_type_annot"; "%A"]));
        ]
      );
      ( "String to field annot",
        [
          test_case "Proper tag" `Quick (fun () -> test_field_annot_from_string ("%A", "A"));
          test_case "empty string" `Quick (fun () -> test_field_annot_from_string_exn "");
        ]
      );
    ]
