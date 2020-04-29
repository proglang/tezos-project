open Core
open Async
open Cohttp_async
open Yojson.Basic.Util

(*************************Queries****************************)
(*get head block constants*)
 let query_gas () =
	let  query_uri = Uri.of_string "http://localhost:8732/chains/main/blocks/head/context/constants" in
  Cohttp_async.Client.get query_uri
  >>= fun (_, body) ->
	Cohttp_async.Body.to_string body
  >>|Yojson.Basic.from_string

(*get bootstrapped*)
let query_bootstrapped () =
	let  query_uri = Uri.of_string "http://localhost:8732/monitor/bootstrapped" in
  Cohttp_async.Client.get query_uri
  >>= fun (_, body) ->
	Cohttp_async.Body.to_string body
  >>|Yojson.Basic.from_string

(*get main head block*)
let query_main_head () =
	let  query_uri = Uri.of_string "http://localhost:8732/monitor/heads/main" in
  Cohttp_async.Client.get query_uri
  >>= fun (_, body) ->
	Cohttp_async.Body.to_string body
  >>|Yojson.Basic.from_string

(*get main head operation*)
let query_main_head_operation block =
	let  query_uri = Uri.of_string ("http://localhost:8732/chains/main/blocks/" ^ block ^ "/operation_hashes") in
  Cohttp_async.Client.get query_uri
  >>= fun (_, body) ->
	Cohttp_async.Body.to_string body
  >>|Yojson.Basic.from_string

(*get main account counter*)
let query_counter account =
	let  query_uri = Uri.of_string ("http://localhost:8732/chains/main/blocks/head/context/contracts/" ^ account ^ "/counter") in
  Cohttp_async.Client.get query_uri
  >>= fun (_, body) ->
	Cohttp_async.Body.to_string body
  >>|Yojson.Basic.from_string >>| Yojson.Basic.Util.to_string


(**************Get data from queries**************************)
let get_data_from_json_query_gas json =
	let gas_operation = json |> member "hard_gas_limit_per_operation" |> to_string in
	let gas_block = json |> member "hard_gas_limit_per_block" |> to_string in
 (gas_operation, gas_block)


let get_data_from_json_query_bootstrapped json =
	let block = json |> member "block" |> to_string in
	let timestamp = json |> member "timestamp" |> to_string in
 (block, timestamp)

let get_data_from_json_query_main_head json =
	let hash = json |> member "hash" |> to_string in
  let level = json |> member "level" |> to_string in
  let timestamp = json |> member "timestamp" |> to_string in
  let predecessor = json |> member "predecessor" |> to_string in
 (hash, level, timestamp, predecessor)

(******************Get string from data***********************)
let get_string_from_data_gas (gas_operation, gas_block) =  "Gas per operation: " ^ gas_operation ^
								                                           " - Gas per block: " ^ gas_block

let get_string_from_data_bootstrapped (block, timestamp) =  "Block: " ^ block ^
								                                " - Timestamp: " ^ timestamp

let get_string_from_data_four (hash, level, timestamp, predecessor) =  "Hash: " ^ hash ^ " - Level: " ^ level ^
								                               " - Timestamp: " ^ timestamp ^ " - Predecessor" ^ predecessor

let get_string_from_data_counter counter =  "Counter: " ^ counter ^
								                                           "" 


(******************Functions**********************************)
let gas () =
	query_gas () >>| get_data_from_json_query_gas >>|get_string_from_data_gas

let bootstrapped () =
	query_bootstrapped () >>| get_data_from_json_query_bootstrapped >>|get_string_from_data_bootstrapped

let head () =
	query_main_head () >>| get_data_from_json_query_main_head >>|get_string_from_data_four

let operations block =
	query_main_head_operation block

let counter account =
	query_counter account >>| get_string_from_data_counter 

