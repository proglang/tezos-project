let file_path = "test.tz"

let generate_contract parameter =
  let fp = open_out file_path in
  Printf.fprintf fp "parameter %s; storage unit; code {UNIT ; NIL operation ; PAIR }\n" parameter;
  close_out fp
