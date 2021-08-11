(*open Contract_module*)

(*val print_past: assertion_ast -> unit*)
val parse_contract: string -> Contract_module_t.contract_module_ast list
(*val parse_and_print: string -> unit*)
