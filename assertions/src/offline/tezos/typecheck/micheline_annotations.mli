(** This module bundles some utility functions to handle Micheline field annotations.

    Micheline has 3 different types of annotations: :type, @var, %field
    In the Micheline AST, they're not typed and only distinguishable by their special
    characters at the front of the string.
*)

open Tezos_micheline

(** Returns the special character indicating a field annotation *)
val field_annot_identifier : char

(** Extracts the field annotation out of the annotation list (it can contain 0 or 1) *)
val get_field_annot : Micheline.annot -> string option

(** Makes a field annotation out of a tag, e.g. "someTag" -> "%someTag" *)
val field_annot_of_string : string -> string
