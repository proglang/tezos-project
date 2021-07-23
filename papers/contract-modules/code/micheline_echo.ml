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
  | Micheline.Int (_loc, _i)->
    print_string "int "
  | Micheline.Bytes (_loc, _b) ->
    print_string "bytes "
  | Micheline.String (_loc, s) ->
    print_string ("string \""^s^"\"")
  | Micheline.Prim (_loc, s, ns, _) ->
    (print_string ("prim \""^s^"\"(") ; List.iter ns ~f:print_node ;
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
      let () = List.iter printable_nodes ~f:(Micheline_printer.print_expr Format.std_formatter) in
      let () = Out_channel.newline stdout; List.iter printable_nodes ~f:print_node in
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

