open Core
open Tezos_micheline
open Micheline
(* open Tezos_error_monad *)

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
     print_string (") "); Out_channel.newline stdout)
  | Micheline.Seq (_loc, ns) ->
    (print_string ("seq (") ; List.iter ns ~f:print_node ; print_string (") "))

let run_file filename =
  let _ignore = In_channel.with_file filename ~f:(fun file ->
      let source = String.concat ~sep:"\n" (In_channel.input_lines file) in
      let () = printf "'%s'\n%!" source in
      let* tokens = Micheline_parser.tokenize source in
      let* nodes = Micheline_parser.parse_toplevel tokens in
      let printable_nodes =
        List.map nodes ~f:(map_node (fun _ -> {Micheline_printer.comment=None}) (fun x -> x)) in
      (* let () = List.iter printable_nodes ~f:(Micheline_printer.print_expr Format.std_formatter) in *)
      let () = Out_channel.newline stdout; List.iter printable_nodes ~f:print_node in
      let adapted = Michel_adapt.conv_toplevel printable_nodes in
      match adapted with
      | Parameter ty_p :: Storage ty_s :: Code ct_code :: _ ->
        print_string ("parameter: " ^ Michelsym_printer.string_of_ty ty_p); Out_channel.newline stdout;
        print_string ("storage:   " ^ Michelsym_printer.string_of_ty ty_s); Out_channel.newline stdout;
        let () = Michelsym.Env.add_typed "SELF" (Michelsym.TContract ty_p) in
        let env = Michelsym.Env.table in
        let ct_entrypoints = Michelsym.entrypoints ty_p in
        let ct_stacks =
          List.map ~f:(fun ep -> Michelsym.initial_stack_from_entrypoint ep ty_s) ct_entrypoints in
        let ct_finals =
          List.map ~f:(fun istack -> Michelsym.interpret ct_code istack env) ct_stacks in
        let _ct_analysis =
          List.map ~f:(fun final -> final Michelsym.initial_constraints) ct_finals in
        print_string ("entrypoints: "^ String.concat ~sep:" " (List.map ~f:Michelsym_printer.string_of_sval ct_entrypoints)); Out_channel.newline stdout;
        (* for each entrypoint... *)
        (* TODO: print initial stacks *)
        (* TODO: print final stacks *)
        (* TODO: print analysis *)
        return ()
      | _ ->
        print_string "unexpected node sequence";
        Out_channel.newline stdout;
        return ())
  in ()

let command =
  Command.basic
    ~summary:"Run Michelsym"
    ~readme:(fun () -> "More detailed information")
    Command.Let_syntax.(
      let%map_open
        file = anon (("filename" %: Filename.arg_type))
      in
      fun () -> run_file file
    )

let () = Command.run ~version:"0.1" command

