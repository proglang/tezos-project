open Tezos_api
open Tezos_api.SyncAPIV0_error.Answer
open Tezos_api.SyncAPIV0_error

let src_arg = ref "tamara"
let contract_arg = ref "auction"
let min_bid_arg = ref 50
let max_bid_arg = ref 1000
let step_arg = ref 50
let base_fee_arg = ref 0.00232
let base_dir_arg = ref "$HOME/.tezos-client"
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

  (*
let run_bid src contr bid charge fee =
  place_bid src contr bid charge fee
  >>= function
  | Ok oph -> return (oph, )
  | Error 
   *)
let main =
  Arg.parse
    spec_list
    (fun x -> raise (Arg.Bad ("Bad argument: " ^ x)))
    usage;
  SyncAPIV0.set_basedir !base_dir_arg;
  let charge = SyncAPIV0.Tez_t.tez !charge_arg in
  parse_acc !src_arg
  >>=? fun src ->
  SyncAPIV0.get_contract !contract_arg
  >>=? fun contract ->
  place_bid src contract !min_bid_arg charge !base_fee_arg
  >>= function
  | Ok _ -> print_endline "Injection successful"; return 1
  | Error (Rejection Michelson_runtime_error) -> print_endline "Michelson_runtime_error"; return 0
  | Error _ -> print_endline "Error"; return 0
  
  let () =
    Stdlib.exit @@ Lwt_main.run ((fun () -> main >>= fun _ -> Lwt.return 1) ())
