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
let fee_increase_arg = ref 0.001
let base_dir_arg = ref "/home/bernhard/.tezos-client"
let charge_arg = ref 2.0
let burn_cap_arg = ref 1.0
let fee_cap_arg = ref 1.0
let wait_conf_arg = ref 10

let usage = "Usage: " ^ Sys.argv.(0) ^ " [--src s] [--dst d] [--min i] [--max i] [--step i] [--base-fee f] [--dir d])"
let spec_list = [
    ("--src", Arg.Set_string src_arg, ": alias/address of the bidder accountd; default = " ^ !src_arg);
    ("--dst", Arg.Set_string contract_arg, ": auction contract alias or address; defaulz =" ^ !contract_arg);
    ("--min", Arg.Set_int min_bid_arg, ": sets the starting bid in mutez; default = " ^ (string_of_int !min_bid_arg));
    ("--max", Arg.Set_int max_bid_arg, ": sets the maximum bid in mutez; default = " ^ (string_of_int !max_bid_arg));
    ("--step", Arg.Set_int step_arg, ": sets the bid increase in mutez; default = " ^ (string_of_int !step_arg));
    ("--base-fee", Arg.Set_float base_fee_arg, ": sets the base fee to be paid; default = " ^ (string_of_float !base_fee_arg));
    ("--fee_incr", Arg.Set_float fee_increase_arg, ": sets the fee increase; default = " ^ (string_of_float !fee_increase_arg));
    ("--dir", Arg.Set_string base_dir_arg, ": the path to the tezos-client base directory; default = " ^ !base_dir_arg);
    ("--charge", Arg.Set_float charge_arg, ": sets the participation charge in tez; default = " ^ (string_of_float !charge_arg));
    ("--fee-cap", Arg.Set_float fee_cap_arg, ": sets the fee cap in tez; default = " ^ (string_of_float !fee_cap_arg));
    ("--burn-cap", Arg.Set_float burn_cap_arg, ": sets the burn cap in tez; default = " ^ (string_of_float !burn_cap_arg));
    ("--confirmation", Arg.Set_int wait_conf_arg, ": sets timespan in seconds to wait for counterbids; default = " ^ (string_of_int !wait_conf_arg))
  ]

type runtime_error = Bid_too_low | Auction_closed | Other

let runtime_errors_map =
  let open Base in
  Base.Map.of_alist_exn (module String)
    [
      ("A FAILWITH instruction was reached.*your bid is lower than or equal to the current highest bid.", Bid_too_low);
      ("A FAILWITH instruction was reached.*The auction is closed since the number of accepted bids exceeds 10.", Auction_closed);
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
      try
        let _ = search_forward r str 0 in
        Base.Map.find_exn runtime_errors_map x
      with Not_found -> match_error xs str
    )
  in
  let keys = Base.Map.keys runtime_errors_map in
  let newline = Str.regexp "\n" in
  let stripped = s |> Str.global_replace newline "" in
  return @@ match_error keys stripped

let increase_bid current_bid =
  let new_bid = current_bid + !step_arg in
  if new_bid > !max_bid_arg then None
  else Some new_bid

let rec wait_for_inclusion oph =
  Unix.sleep 2;
  SyncAPIV0.query oph
  >>=? function
  | Accepted res -> return res
  | Still_pending -> (wait_for_inclusion oph)
  | Rejected (Reason failure) -> fail (Rejection failure)
  | Rejected _ -> fail (Unknown "Operation was rejected for some unknown reason")
  | Missing -> fail (Unknown "Operation has timed out")
  | Unprocessed -> (wait_for_inclusion oph)

let rec wait_for_confirmation to_wait addr balance =
  if to_wait = 0 then return true
  else
  begin
    Unix.sleep 1;
    SyncAPIV0.get_balance addr
    >>=? fun cur_balance ->
    if cur_balance > balance then (print_endline "Someone placed a higher bid!"; return false)
    else wait_for_confirmation (to_wait - 1) addr balance
  end

let rec run_bidding src contr bid charge fee =
  begin
    print_endline ("Placing a bid of " ^ (string_of_int bid) ^ " mutez");
    place_bid src contr bid charge fee
    >>=? fun oph ->
    print_endline "Waiting for inclusion...";
    wait_for_inclusion oph
    >>=? fun _ ->
    SyncAPIV0.get_contract !src_arg
    >>=? fun src_contr ->
    SyncAPIV0.get_balance src_contr
    >>=? fun balance ->
    print_endline "Waiting for counterbids...";
    wait_for_confirmation !wait_conf_arg src_contr balance
    >>=? function
    | true -> return 1
    | false -> run_bidding src contr bid charge fee
  end
  >>= function
  | Ok _ -> print_result true ("Placed the currently highest bid (" ^ (string_of_int bid) ^ " mutez)"); return 1
  | Error (Rejection Michelson_runtime_error s) ->
     begin
       match_runtime_error s
       >>=? function
       | Bid_too_low -> (
         match increase_bid bid with
         | Some new_bid -> (print_endline "Bid too low - trying again with a higher bid.." ; run_bidding src contr new_bid charge fee)
         | None -> (print_result false "The maximum bid was reached - cannot bid higher."; return 1))
       | Auction_closed -> print_result false "A bid couldn't be placed because the auction was closed"; return 1
       | Other -> print_fatal_error s; return 0
     end
  | Error (Rejection Insufficient_fee) -> print_endline "Fee too low - trying again with higher fee..." ; run_bidding src contr bid charge (fee +. !fee_increase_arg)
  | Error Node_connection_failed -> print_fatal_error "Connection to Tezos node failed!"; return 0
  | Error RPC_error {uri} -> print_fatal_error ("An error occurred during a RPC call to this address: " ^ uri); return 0
  | Error Keys_not_found
    | Error Unknown_secret_key
    | Error Unknown_public_key -> print_fatal_error "Keys of the bidder account were not found"; return 0
  | Error Invalid_public_key_hash -> print_fatal_error "Public key hash of the bidder account is malformed"; return 0
  | Error (Wrong_contract_notation c) -> print_fatal_error ("Unknown contract or malformed notation: " ^ c); return 0
  | Error Not_callable -> print_fatal_error "Given contract address/alias is not an originated contract" ; return 0
  | Error (Rejection Insufficient_balance) -> print_fatal_error "Insufficient balance of the bidder account" ; return 0
  | Error (Rejection Reached_burncap) -> print_fatal_error "The burncap was reached" ; return 0
  | Error (Rejection Reached_feecap) -> print_fatal_error "The feecap was reached" ; return 0
  | Error (Rejection Michelson_parser_error) -> print_fatal_error "Invalid/malformed contract arguments" ; return 0
  | Error (Unknown s) -> print_fatal_error s; return 0
  | Error _ -> print_fatal_error "Some other fatal error"; return 0

let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  SyncAPIV0.set_basedir !base_dir_arg;
  let burn_cap = if !burn_cap_arg > 0.0 then SyncAPIV0.Tez_t.tez !burn_cap_arg
                 else SyncAPIV0.Tez_t.zero in
  let fee_cap = if !fee_cap_arg > 0.0 then SyncAPIV0.Tez_t.tez !fee_cap_arg
                 else SyncAPIV0.Tez_t.zero in
  SyncAPIV0.set_fee_parameters ~fee_cap:fee_cap ~burn_cap:burn_cap ();
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
