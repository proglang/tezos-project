open Transformation

(* Make sure there is either 1 default entrypoint or 1 or more named entrypoints *)
let sanity_check (asts : ast list) =
  let rec check_no_default : ast list -> unit = function
    | {entrypoint = (None, _); _} :: _ -> failwith "Illegal default entrypoint"
    | {entrypoint = (Some _, _); _} :: rest -> check_no_default rest
    | [] -> ()
  in
  match asts with
  (* Single default entrypoint *)
  | {entrypoint = (None, _); _} :: [] -> ()
  | _ -> check_no_default asts
