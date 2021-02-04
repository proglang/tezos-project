open Dao_type
open Tezos_ast.Ast

(* TODO: return Ast.tezos_ast list with completed types *)
val type_check : dao_type -> ast list -> unit Lwt.t
