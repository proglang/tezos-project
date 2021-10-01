open Core

(* REPL *)
let run_repl () =
  printf "Input michelson source code\n";
  while true do
    printf "> %!";
    match In_channel.(input_line stdin) with
    | None -> assert false
    | Some source ->
      print_endline "Computing...";
      (*printf "'%s'\n%!" source*)
      Michelson.run source;
      (*Error.had_error := false*) (* reset error for next input (though current value could be ignored here *)
  done
;;

(* CLI File Input *)
let run_file filename =
  In_channel.with_file filename ~f:(fun file ->
  let source = String.concat ~sep:"\n" (In_channel.input_lines file) (* max size 16384 bytes *)
  (* OPT: is the additional argument 'In_channel.input lines ~fix_win_eol:true' needed on windows? *)
  in
  (*printf "'%s'\n%!" source*)
  Michelson.run source);
  (* TODO: better error propagation: raise exceptions/failwith and try/with clauses *)
(*  if Error.had_error then failwith "had error";
  if Error.had_runtime_error then failwith "had runtime error"*)
;;

let command =
  Command.basic
    ~summary:"Interpret given Michelson code"
    ~readme:(fun () -> "More detailed information")
    Command.Param.(
         map (anon (maybe ("filename" %: Filename.arg_type)))
           ~f:(fun filename -> (fun () -> match filename with
              | None -> run_repl
              | Some file -> run_file file)))
(*    Command.Let_syntax.(
      let%map_open
        file = anon (maybe ("filename" %: Filename.arg_type))
      in
      fun () ->
        match file with
          | None -> run_repl
          | Some file -> run_file file
	  )  *)

let () = Command.run ~version:"0.1" command

(* BASIC CLI with the Argc Libray *)
(*
let () =
  let argc = Array.length (Sys.get_argv ()) in
  printf "%d\n" argc;
  if argc > 2
    then (
      eprintf "Usage: michelson-interpreter <file>";
      exit 1) (* OPT: find out right exit codes *)
  else if argc = 2
    then (
      let filename = (Sys.get_argv ()).(1) in
      run_file filename)
  else run_repl
;;*)
