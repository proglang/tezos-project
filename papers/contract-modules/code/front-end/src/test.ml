open Parsing.Lex_and_parse
open Parsing

let example = {|(contract type Auction = sig (paid entrypoint bid (n : int)
raises "closed" | "close action") (entrypoint close (s : string)
raises "not owner") end)|}

let x = parse_contract example

(**
val x : Contract_module_t.contract_module_ast list =
  [{Parsing.Contract_module_t.contract = "Auction";
    body =
     [{Parsing.Contract_module_t.entrypoint = ("bid", `Ident ("n", `Int_t));
       errors = ["closed"; "close action"]};
      {Parsing.Contract_module_t.entrypoint =
        ("close", `Ident ("s", `String_t));
       errors = ["not owner"]}]}]

**)

let example_1 = {|(contract type Auction = sig (paid entrypoint bid (n : int)
raises "closed" | "close action") (entrypoint close (_)
raises "not owner") end)|}

let y = parse_contract example_1

(** 
val y : Contract_module_t.contract_module_ast list =
  [{Parsing.Contract_module_t.contract = "Auction";
    body =
     [{Parsing.Contract_module_t.entrypoint = ("bid", `Ident ("n", `Int_t));
       errors = ["closed"; "close action"]};
      {Parsing.Contract_module_t.entrypoint = ("close", `Wildcard);
       errors = ["not owner"]}]}]

**)

let example_2 = {|(contract type Auction = sig (paid entrypoint bid (left (right (n : int)))
raises "closed" | "close action") (entrypoint close (_)
raises "not owner") end)|}

let z = parse_contract example_2

(** 
val z : Contract_module_t.contract_module_ast list =
  [{Parsing.Contract_module_t.contract = "Auction";
    body =
     [{Parsing.Contract_module_t.entrypoint =
        ("bid", `Left (`Right (`Ident ("n", `Int_t))));
       errors = ["closed"; "close action"]};
      {Parsing.Contract_module_t.entrypoint = ("close", `Wildcard);
       errors = ["not owner"]}]}]
**)

let () = parse_and_print example

(** 
**)


let () =
  parse_contract example
  |> List.map Contract_module_j.string_of_contract_module_ast
  |> List.iter print_string
  |> print_newline

(** {"contract":"Auction",
     "body":[[{"entrypoint":["bid",["Ident",["n","Int_t"]]],
              "errors":[["closed","close action"]]},
              {"entrypoint":["close",["Ident",["s","String_t"]]],
               "errors":[["not owner"]]}]]}
 **)

