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
     `Cons
       ({Parsing.Contract_module_t.entrypoint = ("bid", `Ident ("n", `Int_t));
         error = `Cons ("closed", `Cons ("close action", `Nil))},
        `Cons
          ({Parsing.Contract_module_t.entrypoint = ("close", `Wildcard);
            error = `Cons ("not owner", `Nil)},
           `Nil))}]


**)

let example_1 = {|(contract type Auction = sig (paid entrypoint bid (n : int)
raises "closed" | "close action") (entrypoint close (_)
raises "not owner") end)|}

let y = parse_contract example_1

(** val y : Contract_module_t.contract_module_ast list =
  [{Parsing.Contract_module_t.contract = "Auction";
    body =
     `Cons
       ({Parsing.Contract_module_t.entrypoint = ("bid", `Ident ("n", `Int_t));
         error = `Cons ("closed", `Cons ("close action", `Nil))},
        `Cons
          ({Parsing.Contract_module_t.entrypoint = ("close", `Wildcard);
            error = `Cons ("not owner", `Nil)},
           `Nil))}]
**)


let () = parse_and_print example

let () = print_past ({Parsing.Contract_module_t.contract = "Auction";
    body =
     `Cons
       ({Parsing.Contract_module_t.entrypoint = ("bid", `Ident ("n", `Int_t));
         error = `Cons ("closed", `Cons ("close action", `Nil))},
        `Cons
          ({Parsing.Contract_module_t.entrypoint = ("close", `Wildcard);
            error = `Cons ("not owner", `Nil)},
           `Nil))})
(** AST
└──Contract: %Auction
    └──Entrypoint: %bid
      └──Pattern: Id:n
        └──Type: Int_t
    └──Error: %closed
      └──Error: %close action
        └──Error_list: %Nil
      └──Entrypoint: %close
        └──Pattern: Id:s
          └──Type: String_t
      └──Error: %not owner
        └──Error_list: %Nil
    └──Entrypoint_list: %Nil
**)


let () =
  parse_contract example
  |> List.map Contract_module_j.string_of_contract_module_ast
  |> List.iter print_string
  |> print_newline

(** {"contract":"Auction","body":["Cons",[{"entrypoint":["bid",["Ident",["n","Int_t"]]],"error":["Cons",["closed",["Cons",["close action","Nil"]]]]},["Cons",[{"entrypoint":["close",["Ident",["s","String_t"]]],"error":["Cons",["not owner","Nil"]]},"Nil"]]]]} **)

