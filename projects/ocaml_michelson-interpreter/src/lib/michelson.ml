open Core

module Config = Config
module Value = Value

let eval_argument (ty : Value.typ) (arg : AbsMichelson.prog) : Value.value =
  match arg with
  | AbsMichelson.Contract _ -> failwith "Michelson.eval_argument: Given argument (parameter or storage) invalid"
(*  | AbsMichelson.Code x -> *)
  | AbsMichelson.Argument x ->
    try
    	Interpreter.evalValue ty x
    with
    	| Interpreter.TypeDataError (s,t,d) as e -> printf "Michelson.eval_argument: Given Argument is of wrong type:\n"; raise e

exception InterpreterError of string * string * string

let interpret (prog : AbsMichelson.prog) (parameter : AbsMichelson.prog) (storage : AbsMichelson.prog) conf : Value.value =
  let f prog =
    match prog with
    | AbsMichelson.Contract (typ0, typ1, instrs) -> (typ0, typ1, instrs)
    (*| AbsMichelson.Code instrs -> (None, instrs)*)
    | AbsMichelson.Argument _ -> failwith "Michelson.interpret: Given contract invalid"
  in
  let (typ0, typ1, instrs) = f prog in
  let (ty0, ty1) = (Interpreter.evalTyp typ0, Interpreter.evalTyp typ1) in
  if not ((Value.passable ty0) && (Value.storable ty1)) then failwith "Michelson.interpret: forbidden type of parameter or storage"
  else
  let conf = Config.of_yojson conf ty1 in
  let param = eval_argument ty0 parameter in
  let stor = eval_argument ty1 storage in
  let init_stack = [Value.IPair (param, stor)] in
  let end_stack : Value.value list = Interpreter.evalList instrs init_stack conf in
  match end_stack with (* should be [IPair (IList (TOperation, y), z)] where z is a value of type typ1/ty1 and y is list of operations *)
  | [x] ->
    (match x with
    | IPair (IList (TOperation, _ (*y*)), z) ->
      if (Value.equal_typ (Value.typeof z) ty1) then x (* TODO: pass operationlist y and storage z seperately to be handled in michelson.ml / or return updated wrapper data / or... *)
      else raise (InterpreterError ("Wrong output type", (Print.ty_to_str ty1), (Print.ty_to_str (Value.typeof z))))
    | _ -> failwith "Michelson.interpret: Illegal contract output"
    )
  | [] -> failwith "Michelson.interpret: Stack empty"
  | _ -> failwith "Michelson.interpret: Stack contains more then one value" (* TODO: return/show topmost stack?*)
  (* TODO: instr 'FAILWITH' abfangen *)
  (* TODO: create new exception type or Ok/Error result to propagate results back to michelson *)

let run source parameter storage (conf : Yojson.Basic.t) =
  let prog = Parse.parse source "Contract" in
  let param = Parse.parse parameter "Parameter" in
  let stor = Parse.parse storage "Storage" in
  let new_storage : Value.value  = interpret prog param stor conf in
  Print.val_to_str new_storage;  (*show_value new_storage;*)
