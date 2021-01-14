open Transformation
open Parsing.Lex_and_parse
open Parsing
open Parsing.Pp_ast

(*
open Yojson
open Yojson.Basic.Util
*)
(* Checks if given list is sorted *)
let example_contract = {| 
(entrypoint (pair (l: (list int)) _)
  (forall (n : int) 
    (forall (m: int)
      (if (and (lt n (size l)) (lt m (size l)))
        (if (gt n m)
          (assert (gt (nth l n) (nth l m))))))))|}

let transform_and_print ast =
  let () = List.iter (pp_ast Fmt.stdout) ast in
  transform ast
  |> print_transformation

(* The example contract is first parsed and then transformed by the backend
 * Both the original parser AST & the backend AST after the transformation
 * are printed for comparison
 *)
let () =
  parse_contract example_contract 
  |> transform_and_print
  |> print_newline

let () =
  parse_contract example_contract
  |> List.map Assertion_j.string_of_assertion_ast
  |> List.iter print_string
  |> print_newline


