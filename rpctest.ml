(*Max*)
open Core;;
open Async;;
open Cohttp;;
open Cohttp_async;;
open Yojson;;
open Yojson.Basic.Util;;
open Ptime;;
open Ptime_clock;;


let tupletoinfo t =
	match t with
	(hash,timestamp)-> let s = "Current head: " ^ (String.slice hash 0 12) ^
								"(timestamp: " ^ (String.slice timestamp  0 ((String.length timestamp) -1) ) ^"-00:00, " ^
								"validation: " ^ (Ptime.to_rfc3339 (Ptime_clock.now ())) ^")\n" ^ "Bootstrapped"
						in s


let bootstrappedtojson () =
	let s = "http://localhost:8732/monitor/bootstrapped" in
	let  uri = Uri.of_string s in
        Cohttp_async.Client.get uri
        >>= fun (_, body) ->
		Cohttp_async.Body.to_string body
		>>|Yojson.Basic.from_string

let jsontostrings json =
	let blockhash = json |> member "block" |> to_string in
	let timestamp = json |> member "timestamp" |> to_string in
	(blockhash,timestamp)

let bootstrapped () =
	(bootstrappedtojson ()) >>| jsontostrings >>|tupletoinfo >>| print_string

