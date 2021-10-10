open Core

(* REPL *)
(*let run_repl =
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
  done*)

(* CLI File Input *)
let run_file filename parameter storage =
  In_channel.with_file filename ~f:(fun file ->
  let source = String.concat ~sep:"\n" (In_channel.input_lines file) (* max size 16384 bytes *)
  (* OPT: is the additional argument 'In_channel.input lines ~fix_win_eol:true' needed on windows? *)
  in
(*  printf "Source: '%s'\n%!" source;*)
  Michelson.run source parameter storage)
  (* TODO: better error propagation: raise exceptions/failwith and try/with clauses *)
(*  if Error.had_error then failwith "had error";
  if Error.had_runtime_error then failwith "had runtime error"*)


(* test if given Arg_type is string of michelson Data type *)
(*let data_type =
  Command.Arg_type.create (fun string ->
      let token = parse string ...
      match token with
      | Interpreter.DataType. ....*)


let contract_data =
  Command.Arg_type.create (fun data ->
    match data with
    | ((balance, source, sender, self, self_address, amount, timestamp) :
        string * string * string * string * string * string * string) -> data
    | _ -> failwith "Give contract execution parameters 'tx-data' as a pair of strings: (balance, source, sender, self, self_address, amount, timestamp)"
  )

let command =
  Command.basic
    ~summary:"Interpret given Michelson code"
    ~readme:(fun () -> "More detailed information") (*TODO*)
(*    Command.Param.(
         map (anon (maybe ("filename" %: Filename.arg_type)))
           ~f:(fun filename -> (fun () -> match filename with
              | None -> run_repl
              | Some file -> run_file file)))*)
      Command.Let_syntax.(
      let%map_open
        filename = anon (("filename" %: Filename.arg_type))
        and parameter = anon (("parameter" %: string (*data_type*)))
        and storage   = anon (("storage" %: string (*data_type*)))
        and data = anon (("tx-data" % contract_data )) (* contract specific information *)
        in
        fun () -> run_file filename parameter storage data
(*        fun () ->
          match filename with
            | None -> run_repl
            | Some file -> run_file file parameter storage*)
      )

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
