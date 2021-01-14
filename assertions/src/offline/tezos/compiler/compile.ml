open Transformation
open Compile_header
open Sanity_check
open Core

let compile (asts: ast list) =
  sanity_check asts;
  let data = compile_header asts in
  Out_channel.write_all "output.tz" ~data


