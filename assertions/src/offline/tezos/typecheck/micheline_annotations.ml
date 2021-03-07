open Format
(* According to the Tezos docs; unfortunately there is no defined constant
 * in the Tezos code. *)
let field_annot_identifier = '%'

let rec get_field_annot annots =
  match annots with
  | a :: annots ->
     if String.length a < 2 then get_field_annot annots
     else (
       if a.[0] = field_annot_identifier
       then Some (String.sub a 1 ((String.length a) - 1))
       else get_field_annot annots)
  | [] -> None

let field_annot_of_string s =
  if s = "" then failwith "Error - cannot create empty field annotation"
  else asprintf "%c%s" field_annot_identifier s
