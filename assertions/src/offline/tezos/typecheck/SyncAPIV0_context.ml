class unix_full_silent ~base_dir ~chain ~block ~confirmations ~password_filename
        ~rpc_config : Client_context.full =
  let log _ _ = Lwt.return_unit
  in
  object
    inherit Client_context_unix.unix_full
              ~base_dir
              ~chain
              ~block
              ~confirmations
              ~password_filename
              ~rpc_config

    inherit! Client_context.simple_printer log
end
