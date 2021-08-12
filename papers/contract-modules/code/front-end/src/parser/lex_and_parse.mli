open Contract_module_t

val print_past: contract_module_ast -> unit
val parse_contract: string -> contract_module_ast list
val parse_and_print: string -> unit
