open Core
open Tezos_micheline
open Micheline
(* open Tezos_error_monad *)

let nl () =
  Out_channel.newline stdout

let (let*) (a, errs) f =
  let (b, more_errs) = f a in
  (b, more_errs @ errs)

let return x = (x, [])

let rec print_node n =
  match n with
  | Micheline.Int (_loc, i)->
    print_string "int "; print_string (Z.to_string i^" ")
  | Micheline.Bytes (_loc, b) ->
    print_string "bytes "; print_string (Bytes.to_string b)
  | Micheline.String (_loc, s) ->
    print_string ("string \""^s^"\"")
  | Micheline.Prim (_loc, s, ns, ann) ->
    (print_string ("prim \""^s^"\" ") ; List.iter ann ~f:(fun s -> print_string (s^" ")) ; 
     print_string " ("; List.iter ns ~f:print_node ;
     print_string (") "); nl ())
  | Micheline.Seq (_loc, ns) ->
    (print_string ("seq (") ; List.iter ns ~f:print_node ; print_string (") "))

let run_file use_smt filename =
  let _ignore = In_channel.with_file filename ~f:(fun file ->
      let source = String.concat ~sep:"\n" (In_channel.input_lines file) in
      let () = printf "'%s'\n%!" source in
      let* tokens = Micheline_parser.tokenize source in
      let* nodes = Micheline_parser.parse_toplevel tokens in
      let printable_nodes =
        List.map nodes ~f:(map_node (fun _ -> {Micheline_printer.comment=None}) (fun x -> x)) in
      (* let () = List.iter printable_nodes ~f:(Micheline_printer.print_expr Format.std_formatter) in *)
      let () = nl () in
      let () = List.iter printable_nodes ~f:print_node in
      let adapted = Michel_adapt.conv_toplevel printable_nodes in
      match adapted with
      | Parameter ty_p :: Storage ty_s :: Code ct_code :: _ ->
        print_string ("parameter: " ^ Michelsym_printer.string_of_ty ty_p); nl ();
        print_string ("storage:   " ^ Michelsym_printer.string_of_ty ty_s); nl ();
        let () = Michelsym.Env.add_typed "SELF" (Michelsym.TContract ty_p) in
        let env = Michelsym.Env.table in
        let ct_entrypoints = Michelsym.entrypoints ty_p in
        (* for each entrypoint... *)
        if not use_smt then
        List.iter
          ct_entrypoints
          ~f:(fun ep ->
              let ep_stack = Michelsym.initial_stack_from_entrypoint ep ty_s in
              let ep_analysis = Michelsym.interpret ct_code ep_stack env in
              let (ep_final_stack, ep_final_constraints) = ep_analysis Michelsym.initial_constraints in
              Out_channel.print_string "\n********************************************************************************\n\n";
              print_string ("--- entrypoint: "^Michelsym_printer.string_of_sval ep) ; nl ();
              print_string ("initial-stack-top:\n"^
                            Michelsym_printer.string_of_svals ep_stack^
                           "\n");
              print_string ("final-stack-top:\n"^
                            Michelsym_printer.string_of_svals ep_final_stack^
                           "\n");
              print_string ("final constraints:\n"^Michelsym_printer.string_of_constraints ep_final_constraints); nl ();
            )
        else
        List.iter
          ct_entrypoints
          ~f:(fun ep ->
              let ep_stack = Michelsym.initial_stack_from_entrypoint ep ty_s in
              let ep_analysis = Michelsym.interpret ct_code ep_stack env in
              let (ep_final_stack, ep_final_constraints) = ep_analysis Michelsym.initial_constraints in
              Out_channel.print_string "\n********************************************************************************\n\n";
              print_string ("\n\n;;; *** entrypoint *** "^
                            Michelsym_smt.smt_of_sval ep) ; nl ();
              print_string ("(assert (= initial-stack-top\n"^
                            Michelsym_smt.smt_of_svals ep_stack^
                           "))\n\n");
              print_string ("(assert (= final-stack-top\n"^
                            Michelsym_smt.smt_of_svals ep_final_stack^
                           "))\n\n");
              print_string (";;; final constraints:\n"^
                            Michelsym_smt.smt_of_constraints ep_final_constraints);
              nl ();
            ) ;
        return ()
      | _ ->
        print_string "unexpected node sequence";
        nl ();
        return ())
  in ()

let command =
  Command.basic
    ~summary:"Run Michelsym"
    ~readme:(fun () -> "More detailed information")
    Command.Let_syntax.(
      let%map_open
        use_smt = flag "--smt" no_arg ~doc:"generate SMT2 output"
      and file = anon ("filename" %: Filename.arg_type)
      in
      fun () -> run_file use_smt file
    )

let build_info =
  match Build_info.V1.version () with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v

let () =
  Command.run ~version:"0.1" ~build_info:build_info command

