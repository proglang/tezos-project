open Tezos_api
   
let run =
  Internal_event_unix.init ()
  >>= fun () ->
  Api.get_puk "tamara"
  >>= fun _ ->
  Internal_event_unix.close () >>= fun () -> Lwt.return 1 
let () =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run run

  
