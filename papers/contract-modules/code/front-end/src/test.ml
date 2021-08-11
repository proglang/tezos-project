open Parsing.Lex_and_parse
open Parsing
open Parsing.Pp_ast

let example = {|(contract type Auction = sig (paid entrypoint bid (n : int)
raises "closed" | "close action") (entrypoint close (s : string)
raises "not owner") end)|}

let example_1 = {|(contract type Auction = sig (paid entrypoint bid (n : int)
raises "closed" | "close action") (entrypoint close (_)
raises "not owner") end)|}

let x = parse_contract example

(**
val x : Contract_module.contract_module_ast list =
  [{Parsing.Contract_module.contract = "Auction";
    body =
     `Cons
       ({Parsing.Contract_module.entrypoint = ("bid", `Ident ("n", `Int_t));
         error = `Cons ("closed", `Cons ("close action", `Nill))},
        `Cons
          ({Parsing.Contract_module.entrypoint =
             ("close", `Ident ("s", `String_t));
            error = `Cons ("not owner", `Nill)},
           `Nill))}]

**)

let y = parse_contract example_1

(** val y : Contract_module.contract_module_ast list =
  [{Parsing.Contract_module.contract = "Auction";
    body =
     `Cons
       ({Parsing.Contract_module.entrypoint = ("bid", `Ident ("n", `Int_t));
         error = `Cons ("closed", `Cons ("close action", `Nill))},
        `Cons
          ({Parsing.Contract_module.entrypoint = ("close", `Wildcard);
            error = `Cons ("not owner", `Nill)},
           `Nill))}]**)



(*let transform_and_print ast =
  let () = List.iter (pp_ast Fmt.stdout) ast in
  transform ast
  |> print_transformation

let () =
  parse_contract example_contract 
  |> transform_and_print
  |> print_newline*)


(*let () =
  parse_contract example
  |> List.map Contract_module_j.string_of_contract_module_ast
  |> List.iter print_string
  |> print_newline*)


