(** This module defines a type to represent paths of entrypoints within their type
    (especially (nested) unions) and basic functions to operate on this type.

    Examples:
    parameter (or %default (int %A) (or %BC (bool %B) (int %C)))

    %default => T
    %A => Left T
    %BC => Right T
    %C => Right (Left (Left T))
    %D => Right (Left (Right T))

  (entrypoint (left (right (i: int))) ...)
   %xy => Left (Right T)
 *)

open Tezos_raw_protocol_007_PsDELPH1.Michelson_v1_primitives
open Tezos_ast

(** Represents an entrypoint path within the contract parameter type *)
type union_path = Left of union_path (** the first type of the union *)
                | Right of union_path (** the second type of the union *)
                | T (** terminates a path *)

(** Returns the union paths for all entrypoints in the given Micheline AST *)
val from_micheline : (int, prim) Micheline.node -> (string * union_path) list

(** Returns the union path of the given Tezos type pattern *)
val from_assertion_pattern : Ast.pattern -> union_path

(** The equal function for union_paths *)
val eq : union_path -> union_path -> bool

(** The compare function for union_paths (needed for Map.Make) with the same specs as compare.
    The total order of union_paths is defined as follows:
    T > LT > L...T > RT > R...T *)
val compare : union_path -> union_path -> int

(** [extend p1 p2] extends path p2 with p1
    @param p1 extension
    @param p2 path to be extended
    example: extend (Left T) (Right T) = Right (Left T)
*)
val extend : union_path -> union_path -> union_path

(** [remove_prefixes paths path] removes all prefix paths of path from the given list (including path itself).
    @param paths a list of union_paths
    @param path a union_path
    example:
    remove_prefixes [T, Left T, Right T, Left (Right T)] (Left (Right T)) = [ Right T ]
*)
val remove_prefixes : union_path list -> union_path -> union_path list

(** [remove_with_prefixes paths path] removes all paths which contain the prefix path from the
    given list (including path itself).
    @param paths a list of union_paths
    @param path a prefix
    example:
    remove_with_prefix [T, Left T, Right T, Left (Right T)] (Left T) = [T, Right T ]
*)
val remove_with_prefix : union_path list -> union_path -> union_path list

(** Pretty printer for union_paths; uses abbrevations L/R for Left/Right *)
val pp : Format.formatter ->  union_path -> unit
