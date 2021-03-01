open Tezos_ast
open Tezos_ast.Pp_ast

module EntrypointAssertionMapping =
  Map.Make(struct type t = Union_path.union_path
                  let compare = Union_path.compare end)

let pp_mapping ppf m =
  let bindings = EntrypointAssertionMapping.bindings m in
  let num_bindings = List.length bindings in
  List.iteri
    (fun i (p, ({entrypoint = ep; _}: Ast.ast)) ->
      Fmt.pf ppf "%a:\n" Union_path.pp p;
      if i < num_bindings then (Fmt.pf ppf "%a\n" pp_ast_entrypoint ep)
      else (Fmt.pf ppf "%a;\n" pp_ast_entrypoint ep))
    bindings;
