open Transformation
open Parsing.Lex_and_parse

(* Checks if given list is sorted *)
let example_contract = {| 
(entrypoint (pair (l: (list int)) _)
  (forall (n : int) 
    (forall (m: int)
      (if (and (lt n (size l)) (lt m (size l)))
        (if (gt n m)
          (assert (gt (nth l n) (nth l m))))))))|}

let transform_and_print a =
  Parsing.Pp_ast.pp_ast Fmt.stdout a; (* calls the pretty printer of the frontend*)
  let transformed = transform a in
  pp_ast Fmt.stdout transformed  (* calls the pretty printer of the backend*)

let rec transform_and_print_all = function
  (* An assertion contract may contain several assertions, hence the parser returns a list of ASTs *)
  | a :: rest -> transform_and_print a; transform_and_print_all rest
  | [] -> ()

(* The example contract is first parsed and then transformed by the backend
 * Both the original parser AST & the backend AST after the transformation
 * are printed for comparison
 *)
let () = parse_contract example_contract
         |> transform_and_print_all
