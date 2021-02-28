open Tezos_ast
open Tezos_ast.Pp_ast

module EntrypointAssertionMapping =
  Map.Make(struct type t = Union_path.union_path
                  let compare = Union_path.compare end)

let pp_mapping ppf m =
  let bindings = EntrypointAssertionMapping.bindings m in
  let num_bindings = List.length bindings in
  Fmt.pf ppf "{";
  List.iteri (fun i (p, ({entrypoint = ep; _}: Ast.ast)) ->
      Union_path.pp ppf p;
      Fmt.pf ppf ":\n";
      if i < num_bindings then (pp_ast_entrypoint ppf ep; Fmt.pf ppf "\n")
      else (pp_ast_entrypoint ppf ep; Fmt.pf ppf ";\n")) bindings;
  Fmt.pf ppf "}"
