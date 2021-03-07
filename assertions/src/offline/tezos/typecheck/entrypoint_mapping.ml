open Tezos_ast

module EntrypointAssertionMapping =
  Map.Make(struct type t = Union_path.union_path
                  let compare = Union_path.compare end)

type ep_mapping = Ast.ast EntrypointAssertionMapping.t

(* Only prints the entrypoint part of the assertion AST for better overview *)
let pp_mapping ppf m =
  let bindings = EntrypointAssertionMapping.bindings m in
  List.iter
    (fun (p, ({entrypoint = ep; _}: Ast.ast)) ->
      Fmt.pf ppf "%a:\n" Union_path.pp p;
      Fmt.pf ppf "%a" Pp_ast.pp_ast_entrypoint ep)
    bindings
