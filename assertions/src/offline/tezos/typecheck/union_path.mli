open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
(*open Tezos_ast*)

type union_path = Left of union_path
                | Right of union_path
                | T

(* Returns the union paths for all entrypoints in the given Micheline AST *)
val from_micheline : (int, prim) Micheline.node -> (string * union_path) list

(* val from_assertion_type : Ast.pattern -> union_path *)

val eq : union_path -> union_path -> bool

(* add : level -> path -> path *)
val add : union_path -> union_path -> union_path

val pp : Format.formatter ->  union_path -> unit
