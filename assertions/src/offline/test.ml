open Transformation
open Parsing.Lex_and_parse
   
let example_contract = {| 
(entrypoint (pair (l1: (list int)) (l2: (list int))) 
  (forall (n : int) 
    (forall (m: int)
      (if (and (lt n (size l1)) (lt m (size l2)))
        (if (gt n m)
          (assert (gt (nth l1 n) (nth l2 m))))))))|}

let transform_and_print a =
  Parsing.Pp_ast.pp_ast Fmt.stdout a;
  let transformed = transform a in
  pp_ast Fmt.stdout transformed

let rec transform_and_print_all = function
  | a :: rest -> transform_and_print a; transform_and_print_all rest
  | [] -> ()

let () = parse_contract example_contract
         |> transform_and_print_all
