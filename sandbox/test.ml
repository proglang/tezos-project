open Tezos_api
   
let run =
  Internal_event_unix.init ()
  >>= fun () ->
  Api.get_puk "tamara"
  >>= fun result ->
  match result with
  | Ok i -> print_endline @@ string_of_int i; Lwt.return 1
  | _ -> print_endline "Error"; Lwt.return 0
  >>= fun retcode ->
  Internal_event_unix.close () >>= fun () -> Lwt.return retcode 

let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run run

  
