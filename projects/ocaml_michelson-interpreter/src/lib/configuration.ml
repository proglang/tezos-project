open Base

open Value

type contract_var = { (* transaction parameters *)
  source : value ; (* IAdress *)
  sender : value ; (* IAdress *)
  self : value ; (* IContract *)
  self_address : value ; (* IAdress *)
  balance : value ; (* IMutez  *)
  amount : value ; (* IMutez *)
  timestamp : value ; (* ITimestamp, (minimal injection time for the current block +60s, used in the NOW instruction) *)
  chain_id : value ; (* bytes? *)
  level : value ; (* INat *)
  tot_voting_power : value ; (* nat? *)
  (*chain-data : ? ;*) (* map of environment contract data *)
}

(* TODO: either outsource this parsing or implement several parsing functions for configurations? *)
let parse_env env contract_typ : contract_var =
  try
    let env = String.split env ~on:';' in
    match env with
    | source :: sender :: self_address :: balance :: amount :: timestamp :: chain_id :: level :: tot_voting_power :: [] ->
      {
        source = IAddress source;
        sender = IAddress sender;
        self = IContract (contract_typ, self_address);
        self_address = IAddress self_address;
        balance = IMutez (Mutez.of_string balance);
        amount = IMutez (Mutez.of_string amount);
        timestamp = ITimestamp (Tstamp.of_rfc3339 timestamp);
        chain_id = IBytes (Bytes.of_string chain_id)  ;
        level = INat (Z.of_string level) ;
        tot_voting_power = INat (Z.of_string tot_voting_power) ;
        (*chain-data : ? ;*) (* map of environment contract data *)
      }
    | _ -> failwith "Interpreter.parse_env: Illegal input"
  with
    | e -> raise e
(*
    | Invalid_argument s -> failwith "..."
*)
(*  	| _ -> failwith "Unknown"*)
