open Transformation
open Parsing.Lex_and_parse
   
let example_contract = {| 
(entrypoint (pair (l1: (list int)) (l2: (list int))) 
  (forall (n : int) 
    (forall (m: int)
      (if (and (lt n (size l1)) (lt m (size l2)))
        (if (gt n m)
          (assert (gt (nth l1 n) (nth l2 m))))))))|}

let () =
  match parse_contract example_contract with
  | parsed :: _ ->
     Parsing.Pp_ast.pp_ast Fmt.stdout parsed;
     let transformed = transform parsed in
     pp_ast Fmt.stdout transformed; ()
  | [] -> ()
  
