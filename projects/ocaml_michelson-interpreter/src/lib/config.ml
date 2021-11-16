open Base
open Core
open Yojson

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

let of_yojson json contract_typ : contract_var =
  try
    (* Locally open the JSON manipulation functions *)
    let open Yojson.Basic.Util in
    let source = json |> member "source" |> to_string in
    let sender = json |> member "sender" |> to_string in
    let self_address = json |> member "self_address" |> to_string in
    let balance = json |> member "balance" |> to_string in
    let amount = json |> member "amount" |> to_string in
    let timestamp = json |> member "timestamp" |> to_string in
    let chain_id = json |> member "chain_id" |> to_string in
    let level = json |> member "level" |> to_string in
    let tot_voting_power = json |> member "tot_voting_power" |> to_string in
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
  with
    | e -> print_endline "Config: Error when parsing configuration file (json)\n"; raise e


let parse_string str = Yojson.Basic.from_string str
let parse_file filename = Yojson.Basic.from_file filename


(*    try
    let c = Yojson.Safe.from_file filename in
    {
      source = IAddress c.source;
      sender = IAddress c.sender;
      self = IContract (contract_typ, c.self_address);
      self_address = IAddress c.self_address;
      balance = IMutez (Mutez.of_string c.balance);
      amount = IMutez (Mutez.of_string c.amount);
      timestamp = ITimestamp (Tstamp.of_rfc3339 c.timestamp);
      chain_id = IBytes (Bytes.of_string c.chain_id)  ;
      level = INat (Z.of_string c.level) ;
      tot_voting_power = INat (Z.of_string c.tot_voting_power) ;
      (*chain-data : ? ;*) (* map of environment contract data *)
    }
  with
    | e -> raise e (* error in parse_json? *)*)



(*

type input = { (* transaction parameters *)
  source : string ; (* IAdress *)
  sender : string ; (* IAdress *)
  self_address : string ; (* IAdress *)
  balance : string ; (* IMutez  *)
  amount : string ; (* IMutez *)
  timestamp : string ; (* ITimestamp, (minimal injection time for the current block +60s, used in the NOW instruction) *)
  chain_id : string ; (* bytes? *)
  level : string ; (* INat *)
  tot_voting_power : string ; (* nat? *)
  (*chain-data : ? ;*) (* map of environment contract data *)
}(*[@@deriving yojson]*)*)
