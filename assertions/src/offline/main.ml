open Parsing.Lex_and_parse
open Transform_and_compile

(* Checks if given list is sorted *)
let example_contract = {| 
(entrypoint (pair (l: (list int)) _)
  (forall (n : int) 
    (forall (m: int)
      (if (and (lt n (size l)) (lt m (size l)))
        (if (gt n m)
          (assert (gt (nth l n) (nth l m))))))))|}

(* The example contract is first parsed and then transformed by the backend *)
let () = parse_contract example_contract
         |> transform_and_compile