open Format
(* According to the Tezos docs; unfortunately there is no defined constant
 * in the Tezos code.
 *)
let field_annot_identifier = '%'

let rec get_field_annot annots =
  match annots with
  | a :: annots ->
     if a.[0] = field_annot_identifier
     then Some a else get_field_annot annots
  | [] -> None

let field_annot_of_string s = asprintf "%c%s" field_annot_identifier s
