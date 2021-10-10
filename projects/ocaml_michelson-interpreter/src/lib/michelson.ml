open Core
open Lexing
open Interpreter

(*

let rec print_tokens tokens = function
    | [] -> printf ""
    | hd :: tl -> printf "%s\n" (Token.tag_to_string hd); print_tokens tl*)

let parse (c : in_channel) : AbsMichelson.prog =
  ParMichelson.pProg LexMichelson.token (Lexing.from_channel c)
;;

let interpret (prog : AbsMichelson.prog) (parameter : string) (storage : string) (data : string * string * string * string * string * string * string) =
  let f data : Interpreter.tx_data = match data with
  | (balance, source, sender, self, self_address, amount, timestamp) ->
    {
      balance = Interpreter.IMutez (int_of_string balance);
      source;
      sender;
      self;
      self_address;
      amount = Interpreter.IMutez (int_of_string amount);
      timestamp;
    }
  in
  (* get parameter and storages types 'typ' from ast and add "(Pair parameter storage)" to stack
  or use instruction "PUSH (pair typ1 typ2) (parameter storage)" to ast or add it seperately! *)
  (*let start = parse "PUSH (pair "^ typ1 ^ " "^ typ2 ^") (" ^ parameter ^ " " ^ storage ^ ")" in*)
  match prog with
    | AbsMichelson.Contract (typ1, typ2, instrs) ->
      let (param, stor) = resolve typ1 parameter, resolve typ2 storage in (* resolve should switch ParserTypes to Interpreter.value, maybe it is needed to call the parser for parameter & storage and then run Interpreter.evalType *)
      Interpreter.evalList Interpreter.evalInstr (f data) instrs (IPair (param, stor):: [])
(*    | AbsMichelson.Code instrs -> assert "Code only not implemented"*)
(*      let stack = interpretInstr AbsMichelson.PUSH (AbsMichelson.TPair (* or CPair?? *) typ1 typ2) (AbsMichelson.DPair param stor) in
      interpretInstrs instr stack*)
    | _ -> assert "interpret: Not a contract"

let run source parameter storage (data : Interpreter.tx_data) =
  printf "Source:\n'%s' \nParameter: '%s' \nStorage: '%s' \n%!" source parameter storage
  let prog = parse source in
  interpret prog parameter storage data;

(*    Lexer.newLexer source
    |> Lexer.generateTokens

    let tokens = Lexer.generateTokens source in
(*    for i=0 to (List.length tokens - 1) do
        printf "%" tokens.
    done*)
    print_tokens tokens*)

;;



