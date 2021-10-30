(*
  ptime libary: https://github.com/dbuenzli/ptime
  DOCS: https://erratique.ch/software/ptime/doc/Ptime.html
  michelson timestamps are in format RFC 3339 (e.g. "2019-09-26T10:59:51Z")
  or as a number of seconds since Epoch in a natural (e.g. 1571659294)
*)

let of_rfc3339 (time : string) : Z.t =
  (*
  Converts strings in RFC 3339 Format to Z.t in seconds since Epoch.

  TODO: Z.of_float truncates the milliseconds derived from the RFC 3339 format.
  It is not known to me if it is instead rounded in the Michelson implementation.
  In this case the implementation here would cause mismatches when comparing
  two timestamps, where one was deriveded from the RFC 3339 format and the
  other one was given as an integer
  *)
  let p_t = Ptime.of_rfc3339 ~strict:true time in
  match p_t with
  | Ok (rfc,_,_) -> Z.of_float(Ptime.to_float_s rfc)
  | Error _ -> failwith "Tstamp: Timestamp invalid"

(* Conversion of Z.t x to RFC 3339 format: *)
let to_rfc3339 (x : Z.t) : string =
  match Ptime.of_float_s (Z.to_float x) with
  | None -> failwith "Tstamp: Conversion to RFC 3339 failed"
  | Some y -> Ptime.to_rfc3339(y);