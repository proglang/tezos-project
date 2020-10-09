open Tezos_api
open Tezos_api.SyncAPIV0_error.Answer
open Tezos_api.SyncAPIV0_error
open Str

let src_arg = ref "tamara"
let contract_arg = ref "auction"
let min_bid_arg = ref 50
let max_bid_arg = ref 1000
let step_arg = ref 50
let base_fee_arg = ref 0.00232
let base_dir_arg = ref "/home/bernhard/.tezos-client"
let charge_arg = ref 2.0

let usage = "Usage: " ^ Sys.argv.(0) ^ " [--src s] [--dst d] [--min i] [--max i] [--step i] [--base-fee f] [--dir d])"
let spec_list = [
    ("--src", Arg.Set_string src_arg, ": alias/address of the bidder accountd; default = " ^ !src_arg);
    ("--dst", Arg.Set_string contract_arg, ": auction contract alias or address; defaulz =" ^ !contract_arg);
    ("--min", Arg.Set_int min_bid_arg, ": sets the starting bid in mutez; default = " ^ (string_of_int !min_bid_arg));
    ("--max", Arg.Set_int max_bid_arg, ": sets the maximum bid in mutez; default = " ^ (string_of_int !max_bid_arg));
    ("--step", Arg.Set_int step_arg, ": sets the bid increase in mutez; default = " ^ (string_of_int !step_arg));
    ("--base-fee", Arg.Set_float base_fee_arg, ": sets the base fee to be paid; default = " ^ (string_of_float !base_fee_arg));
    ("--dir", Arg.Set_string base_dir_arg, ": the path to the tezos-client base directory; default = " ^ !base_dir_arg);
    ("--charge", Arg.Set_float charge_arg, ": sets the participation charge in tez; default = " ^ (string_of_float !charge_arg))
  ]

type runtime_error = Bid_too_low | Auction_closed | Other

let runtime_errors_map =
  let open Base in
  Base.Map.of_alist_exn (module String)
    [
      ("your bid is lower than or equal to the current highest bid.", Bid_too_low);
      ("The auction is closed since the number of accepted bids exceeds 10.", Auction_closed);
    ]

let print_fatal_error msg =
  print_endline @@ Format.asprintf "\027[1;4;31mERROR:%a" Fmt.string "";
  print_endline @@ Format.asprintf "\027[0m%a" Fmt.string msg;
  print_endline "";
  print_endline @@ Format.asprintf "\027[1;4mUsage:%a" Fmt.string "";
  print_endline @@ Format.asprintf "\027[0m%a" Fmt.string usage

let print_result succ msg =
  print_endline @@ Format.asprintf "\027[1;4;mAUCTION RESULT:%a" Fmt.string "";
  if succ then print_endline @@ Format.asprintf "\027[32m[%a]" Fmt.string "Success"
  else print_endline @@ Format.asprintf "\027[33m[%a]" Fmt.string "Defeat";
  print_endline "";
  print_endline @@ Format.asprintf "\027[0m%a" Fmt.string msg

let parse_acc acc_arg =
  SyncAPIV0.get_pukh_from_alias acc_arg
  >>= function
  | Ok pkh -> return pkh
  | Error _ -> SyncAPIV0.get_pukh_from_hash acc_arg

let place_bid src contr bid charge fee =
  let bid_str = string_of_int bid in
  let src_str = SyncAPIV0.string_of_pukh src in
  let arg = "(Pair " ^ bid_str ^ "\"" ^ src_str ^ "\")" in
  let fee_tz = SyncAPIV0.Tez_t.tez fee in
  SyncAPIV0.call_contract charge src contr ~arg fee_tz

let match_runtime_error s =
  let rec match_error l str = match l with
    | [] -> Other
    | x::xs -> (
      let r = Str.regexp x in
      if string_match r s 0 then (Base.Map.find_exn runtime_errors_map x)
      else match_error xs str
    )
  in
  let keys = Base.Map.keys runtime_errors_map in
  return @@ match_error keys s

let rec run_bidding src contr bid charge base_fee =
  begin
    place_bid src contr bid charge base_fee
  (* wait loop etc.*)
  end
  >>= function
  | Ok _ -> return 1
  | Error (Rejection Michelson_runtime_error s) ->
     begin
       match_runtime_error s
       >>=? function
       | Bid_too_low -> (
          let new_bid = bid + !step_arg in
          if new_bid > !max_bid_arg then (print_result false "The maximum bid was reached - cannot bid higher."; return 1)
          else run_bidding src contr new_bid charge base_fee)
       | Auction_closed -> print_result false "A bid couldn't be placed because the auction was closed"; return 1
       | Other -> print_fatal_error s; return 0
     end
  | Error Node_connection_failed -> print_fatal_error "Connection to Tezos node failed!"; return 0
  | Error RPC_error {uri} -> print_fatal_error ("An error occurred during a RPC call to this address: " ^ uri); return 0
  | Error Keys_not_found
    | Error Unknown_secret_key
    | Error Unknown_public_key -> print_fatal_error "Keys of the bidder account were not found"; return 0
  | Error Invalid_public_key_hash -> print_fatal_error "Public key hash of the bidder account is malformed"; return 0
  | Error (Wrong_contract_notation c) -> print_fatal_error ("Unknown contract or malformed notation: " ^ c); return 0
  | Error Not_callable -> print_fatal_error "Given contract address/alias is not an originated contract" ; return 0
  | Error (Unknown s) -> print_fatal_error s; return 0
  | Error _ -> print_fatal_error "Some other fatal error"; return 0

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  SyncAPIV0.set_basedir !base_dir_arg;
  begin
    let charge = SyncAPIV0.Tez_t.tez !charge_arg in
    parse_acc !src_arg
    >>=? fun src ->
    SyncAPIV0.get_contract !contract_arg
    >>=? fun contract ->
    run_bidding src contract !min_bid_arg charge !base_fee_arg
  end
  >>= function
  | Ok retcode -> Lwt.return retcode
  | Error _ -> Lwt.return 0
  
  let () =
    Stdlib.exit @@ Lwt_main.run main