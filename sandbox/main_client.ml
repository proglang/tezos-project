(*****************************************************************************)
(*                                                                           *)
(* Open Source License                                                       *)
(* Copyright (c) 2018 Dynamic Ledger Solutions, Inc. <contact@tezos.com>     *)
(* Copyright (c) 2019 Nomadic Labs, <contact@nomadic-labs.com>               *)
(*                                                                           *)
(* Permission is hereby granted, free of charge, to any person obtaining a   *)
(* copy of this software and associated documentation files (the "Software"),*)
(* to deal in the Software without restriction, including without limitation *)
(* the rights to use, copy, modify, merge, publish, distribute, sublicense,  *)
(* and/or sell copies of the Software, and to permit persons to whom the     *)
(* Software is furnished to do so, subject to the following conditions:      *)
(*                                                                           *)
(* The above copyright notice and this permission notice shall be included   *)
(* in all copies or substantial portions of the Software.                    *)
(*                                                                           *)
(* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR*)
(* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  *)
(* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL   *)
(* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER*)
(* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING   *)
(* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER       *)
(* DEALINGS IN THE SOFTWARE.                                                 *)
(*                                                                           *)
(*****************************************************************************)

module Log = Internal_event.Legacy_logging.Make (struct
  let name = "client.main"
end)

open Client_config
open Client_context_unix
open Tezos_rpc_http_client_unix

let check_network ctxt =
  Version_services.version ctxt
  >>= function
  | Error _ ->
      Lwt.return_none
  | Ok {network_version; _} ->
      let has_prefix prefix =
        String.has_prefix ~prefix (network_version.chain_name :> string)
      in
      if has_prefix "SANDBOXED" then (
        Lwt.return_some `Sandbox )
      else if has_prefix "TEZOS_ZERONET" then (
        Lwt.return_some `Zeronet )
      else if has_prefix "TEZOS_ALPHANET" then (
        Lwt.return_some `Alphanet )
      else if has_prefix "TEZOS_BETANET" || has_prefix "TEZOS_MAINNET" then (
        Lwt.return_some `Mainnet )
      else Lwt.return_none

let get_commands_for_version ctxt network chain block protocol =
  Shell_services.Blocks.protocols ctxt ~chain ~block ()
  >>= function
  | Ok {next_protocol = version; _} -> (
    match protocol with
    | None ->
        return
          (Some version, Client_commands.commands_for_version version network)
    | Some given_version ->
        if not (Protocol_hash.equal version given_version) then
          Format.eprintf
            "@[<v 2>@{<warning>@{<title>Warning@}@}@,\
             The protocol provided via `--protocol` (%a)@,\
             is not the one retrieved from the node (%a).@]@\n\
             @."
            Protocol_hash.pp_short
            given_version
            Protocol_hash.pp_short
            version ;
        return
          ( Some version,
            Client_commands.commands_for_version given_version network ) )
  | Error errs -> (
    match protocol with
    | None ->
        Format.eprintf
          "@[<v 2>@{<warning>@{<title>Warning@}@}@,\
           Failed to acquire the protocol version from the node@,\
           %a@]@\n\
           @."
          (Format.pp_print_list pp)
          errs ;
        return (None, [])
    | Some version ->
        return
          (Some version, Client_commands.commands_for_version version network)
    )

let select_commands ctxt {chain; block; protocol; _} =
  check_network ctxt
  >>= fun network ->
  get_commands_for_version ctxt network chain block protocol
  >>|? fun (_, commands_for_version) ->
  Client_rpc_commands.commands
  @ Tezos_signer_backends_unix.Ledger.commands ()
  @ Client_keys_commands.commands network
  @ Client_helpers_commands.commands ()
  @ Mockup_commands.commands ()
  @ commands_for_version

let setup_remote_signer (module C : Client_main_run.M) client_config
    (rpc_config : RPC_client_unix.config) parsed_config_file =
  let module Remote_params = struct
    let authenticate pkhs payload =
      Client_keys.list_keys client_config
      >>=? fun keys ->
      match
        List.filter_map
          (function
            | (_, known_pkh, _, Some known_sk_uri)
              when List.exists
                     (fun pkh -> Signature.Public_key_hash.equal pkh known_pkh)
                     pkhs ->
                Some known_sk_uri
            | _ ->
                None)
          keys
      with
      | sk_uri :: _ ->
          Client_keys.sign client_config sk_uri payload
      | [] ->
          failwith
            "remote signer expects authentication signature, but no \
             authorized key was found in the wallet"

    let logger =
      (* overriding the logger we might already have with the one from
             module C *)
      match C.logger with Some logger -> logger | None -> rpc_config.logger
  end in
  let module Http =
    Tezos_signer_backends.Http.Make (RPC_client_unix) (Remote_params)
  in
  let module Https =
    Tezos_signer_backends.Https.Make (RPC_client_unix) (Remote_params)
  in
  let module Socket = Tezos_signer_backends_unix.Socket.Make (Remote_params) in
  Client_keys.register_signer
    ( module Tezos_signer_backends.Encrypted.Make (struct
      let cctxt = (client_config :> Client_context.prompter)
    end) ) ;
  Client_keys.register_signer (module Tezos_signer_backends.Unencrypted) ;
  Client_keys.register_signer
    (module Tezos_signer_backends_unix.Ledger.Signer_implementation) ;
  Client_keys.register_signer (module Socket.Unix) ;
  Client_keys.register_signer (module Socket.Tcp) ;
  Client_keys.register_signer (module Http) ;
  Client_keys.register_signer (module Https) ;
  match parsed_config_file with
  | None ->
      ()
  | Some parsed_config_file -> (
    match C.other_registrations with
    | Some r ->
        r parsed_config_file (module Remote_params)
    | None ->
        () )

  
let setup_http_rpc_client_config parsed_args base_dir rpc_config =
  (* Make sure that base_dir is not a mockup. *)
  ( match Tezos_mockup.Persistence.classify_base_dir base_dir with
  | Base_dir_is_mockup ->
      failwith
        "%s is setup as a mockup, yet mockup mode is not active"
        base_dir
  | _ ->
      return_unit )
  >>=? fun () ->
  return
  @@ new unix_full
       ~chain:
         ( match parsed_args with
         | Some p ->
             p.Client_config.chain
         | None ->
             Client_config.default_chain )
       ~block:
         ( match parsed_args with
         | Some p ->
             p.Client_config.block
         | None ->
             Client_config.default_block )
       ~confirmations:
         ( match parsed_args with
         | Some p ->
             p.Client_config.confirmations
         | None ->
             None )
       ~password_filename:
         ( match parsed_args with
         | Some p ->
             p.Client_config.password_filename
         | None ->
             None )
       ~base_dir
       ~rpc_config

let setup_client_config (parsed_args : Client_config.cli_args option) base_dir
      rpc_config = setup_http_rpc_client_config parsed_args base_dir rpc_config

let main =
  Internal_event_unix.init ()
  >>= fun () ->
  Lwt.catch
    (fun () ->
      Client_config.parse_config_args
                 (new unix_full
                  ~chain:Client_config.default_chain
                  ~block:Client_config.default_block
                  ~confirmations:None
                  ~password_filename:None
                  ~base_dir:Client_config.default_base_dir
                  ~rpc_config:RPC_client_unix.default_config)
                 ["-P"; "8733"; "show"; "address"; "tamara"]
      >>=? (fun (parsed, remaining) ->
       let parsed_config_file = parsed.Client_config.parsed_config_file
       and parsed_args = parsed.Client_config.parsed_args
       and config_commands = parsed.Client_config.config_commands
       and require_auth = parsed.Client_config.require_auth in           
       let rpc_config : RPC_client_unix.config =
         match parsed_config_file with
         | None ->
            RPC_client_unix.default_config
         | Some parsed_config_file ->
            {
              RPC_client_unix.default_config with
              host =
                parsed_config_file.Client_config.Cfg_file.node_addr;
              port =
                parsed_config_file.Client_config.Cfg_file.node_port;
              tls = parsed_config_file.Client_config.Cfg_file.tls;
            }
       in
       setup_client_config parsed.Client_config.parsed_args Client_config.default_base_dir rpc_config
       >>=? fun client_config ->
       setup_remote_signer
         (module Client_config)
         client_config
         rpc_config
         parsed_config_file ;
       ( match parsed_args with
       | Some parsed_args ->
          select_commands
            (client_config :> RPC_client_unix.http_ctxt)
            parsed_args
       | None ->
          return_nil )
       >>=? fun other_commands ->
       Clic.dispatch
         (Client_config.clic_commands
            ~base_dir:Client_config.default_base_dir
            ~config_commands:config_commands
            ~builtin_commands:[]
            ~other_commands:other_commands
            ~require_auth)
         client_config
         remaining)
       >>= function
       | Ok () ->
          Lwt.return 0
       | _ ->
          Lwt.return 1)
    (function
     | Client_commands.Version_not_found ->
          Format.eprintf
            "@{<error>@{<title>Fatal error@}@} unknown protocol version.@." ;
          Lwt.return 1
      | Failure message ->
          Format.eprintf
            "@{<error>@{<title>Fatal error@}@}@.  @[<h 0>%a@]@."
            Format.pp_print_text
            message ;
          Lwt.return 1
      | exn ->
          Format.printf
            "@{<error>@{<title>Fatal error@}@}@.  @[<h 0>%a@]@."
            Format.pp_print_text
            (Printexc.to_string exn) ;
          Lwt.return 1 )
      >>= fun retcode ->
      print_int retcode ;
      Internal_event_unix.close() >>= fun () -> Lwt.return retcode
       

let run =
  Lwt_exit.exit_on Sys.sigint ;
  Lwt_exit.exit_on Sys.sigterm ;
  Stdlib.exit @@ Lwt_main.run @@ Lwt_exit.wrap_promise
  @@ main
