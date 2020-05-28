open Bignum;;
open Base58;;


(*open Base;;*)
open Core;;
open Async;;
(*open Cohttp*);;
open Cohttp_async;;
open Yojson;;
open Yojson.Basic.Util;;
open ISO8601;;
open Ptime;;
open Ptime_clock;;
open Async_unix;;
open Tezos_crypto;;
(*max2: tz1ghdqCDWpaQtND8vb3YBJDW4EgZLDQRSBr
max1: tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF

max3: tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK

*)
(*print_string "Hello";;*)


let gettostring path =
	let s = "http://localhost:8732/" ^ path in
	let  uri = Uri.of_string s in
        Cohttp_async.Client.get uri
        >>= fun (_, body) ->
		Cohttp_async.Body.to_string body


let commandtojson path =
	(gettostring path)
		>>|Yojson.Basic.from_string

let getcounter addr =
	let s = "chains/main/blocks/head/context/contracts/"^ addr ^"/counter" in
	 (commandtojson s)>>| Yojson.Basic.Util.to_string >>| Int.of_string   >>| (fun x->(x+1))  >>| Int.to_string


let getvaluefromjson  json key =
	json |> member key (*|> to_string*)

let getstrfromjson json key = (getvaluefromjson  json key) |> to_string
let getintfromjson json key = (getvaluefromjson  json key) |> to_int


let getstoragelimit () =
	(commandtojson "chains/main/blocks/head/context/constants") >>|
	(fun x ->  getstrfromjson x "hard_storage_limit_per_operation")

let getstorageandgaslimit () =
	(commandtojson "chains/main/blocks/head/context/constants") >>|
	(fun x -> (getstrfromjson x "hard_gas_limit_per_operation", getstrfromjson x "hard_storage_limit_per_operation")    )

let getgaslimit () =
	(commandtojson "chains/main/blocks/head/context/constants") >>|
	(fun x -> getstrfromjson x "hard_gas_limit_per_operation")

let getblock () =
	(commandtojson "/monitor/bootstrapped") >>|
	(fun x -> (getstrfromjson x "block")    )



let getchain_id () =
	commandtojson "chains/main/chain_id" >>| Yojson.Basic.Util.to_string

let p1 (x,_)=x
let p2 (_,x)=x


let concatjsonlist= List.reduce_exn ~f:Yojson.Basic.Util.combine

let concatdefjsonlist l = l |> Deferred.all >>| concatjsonlist

let createsinglejsonassoc (x,y)= `Assoc [(x,`String y)]

let createjsonassoc l = l |>(List.map ~f:createsinglejsonassoc )|>concatjsonlist

let createsingljsoneassocfromdef (x,y)= y>>| (fun y->`Assoc [(x,`String y)])

let createjsonassocfromdefs l = l |>(List.map ~f:createsingljsoneassocfromdef)|>Deferred.all >>| concatjsonlist


let createrunopjsonhelper (amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch, fee) =
	 let json1=createjsonassoc [("kind",  "transaction");("source",  fromaddr);("amount", amount);("destination", toaddr)] in
	 let json2 = createjsonassocfromdefs [("fee", fee);("counter",counter);("gas_limit",gaslimit);("storage_limit",storagelimit)]  in
	 let json3=concatdefjsonlist [return json1;json2] in
	 let innerjsonlist= json3>>| fun x-> `List [x] in
	 [createsingljsoneassocfromdef ( "branch", branch );innerjsonlist >>| (fun x->`Assoc [("contents",x)])  ]
	 |> concatdefjsonlist

let createrunopjson (amount, fromaddr, toaddr,counter )= createrunopjsonhelper (amount, fromaddr, toaddr, getgaslimit(), getstoragelimit(), counter, getblock(),return "5000")


let posttojson path content =
	let s = "http://localhost:8732/" ^ path in
	let header = Cohttp.Header.init_with "Content-type" "application/json" in
	let  uri = Uri.of_string s in
	let jsoncontent= content |>Yojson.Basic.to_string |>Cohttp_async.Body.of_string in
        Cohttp_async.Client.post ~body:jsoncontent ~headers:header uri
        >>= fun (_, body) ->
		Cohttp_async.Body.to_string body >>|Yojson.Basic.from_string

 let operationtobinary json =
 	posttojson "chains/main/blocks/head/helpers/forge/operations"  json
 	>>|to_string

let removeop x=
match x with
| Some x -> x
| _ -> failwith "Conversion not possible"

(*let getsig2 bin username =
	(*runs a Unix command and returns the Output*)
  (Async_unix.Process.run_exn  ~prog:"./tezos-client" ~args:["sign"; "bytes"; "0x03"^bin; "for" ; username])()
  >>|(fun x->String.split x ~on: ' ')
  >>|List.last_exn
  >>|fun x->String.slice x 0 ((String.length x)-1)
*)

let getprivatekey username =
	 (Async_unix.Process.run_lines_exn  ~prog:"/opt/tezos/tezos-client" ~args:["show"; "address"; username;"-S"])()
	 >>| (fun x -> List.nth_exn x 2 )
	>>| (fun x-> (String.split x ~on:':'))
	>>| List.last_exn


let getsig bin username =
	let pkey = username |> getprivatekey >>|Signature.Secret_key.of_b58check_exn in
	let bytes = (`Hex ("03"^bin)) |> Hex.to_bytes in
	pkey >>| (fun x-> Signature.sign  x bytes ) >>| Signature.to_b58check

let getsigtest bin key =
	let pkey = key |>Signature.Secret_key.of_b58check_exn in
	let bytes =  (`Hex ("03"^bin)) |> Hex.to_bytes in
	(Signature.sign  pkey bytes ) |> Signature.to_b58check






let signrunopjson unsignedjson signature =
	concatdefjsonlist [unsignedjson; createsingljsoneassocfromdef ("signature",signature)]


(*let extractgas json =
	let contentslist = json |>member "contents" in
	match contentslist with
	|`List [contents] -> contents |> member "metadata" |> member "operation_result"
	|_ -> failwith "error" *)



let extractgas json =
	(*let () = Yojson.Basic.pretty_print Format.std_formatter json in *)
	(json |> member "consumed_gas" |>to_string |>Int.of_string |>(fun x->x+100) |>Int.to_string)



let getprotocol () =
	let s= "chains/main/blocks/head/protocols" in
	(commandtojson s) >>| member "protocol" >>| to_string



(*
let rec dectohexhelper n s = if (Bigint.equal n Bigint.zero) then s else
			let v= (Bigint.of_int 16) in
			let r= (Bigint.to_int   Bigint.(n%v) |> removeop) in
			match  r with
			|  10 -> dectohexhelper Bigint.(n/v) ("a"^s)
			|  11 -> dectohexhelper Bigint.(n/v) ("b"^s)
			|  12 -> dectohexhelper Bigint.(n/v) ("c"^s)
			|  13 -> dectohexhelper Bigint.(n/v) ("d"^s)
			|  14 -> dectohexhelper Bigint.(n/v) ("e"^s)
			|  15 -> dectohexhelper Bigint.(n/v) ("f"^s)
			|  _ -> dectohexhelper Bigint.(n/v) ((string_of_int r) ^  s)


let dectohex n = dectohexhelper  n ""

let base58tohex s =
	s |> Base58.decode ~alphabet:bca
	|>  Num.string_of_num|>  Bigint.of_string  |>  dectohex |> (fun x->String.slice x 9((String.length x)-8)) *)


let base58tohex s= s |> Base58.safe_decode ~alphabet:Base58.Alphabet.bitcoin  |>removeop |>Hex.of_string|>Hex.show |>(fun x->String.slice x 10((String.length x)))


let createoperationhash signature binary =
	let operationhex=signature >>|base58tohex  in (*>>| Num.float_of_num >>|Printf.sprintf "%h") in*)
	Deferred.all [binary;operationhex] >>|(fun x-> List.reduce_exn  x ~f:  (^)  ) >>|(fun x->`String x )

let tupofdeftodefotup (x, y)  =
	[x;y]|>Deferred.all>>|
	 (fun l->match l with [a;b]-> (a,b)
						|_ -> failwith "unknown Error")

let computefee (opsize, gas) =	(100+ 1000*Int.of_string opsize+100*Int.of_string gas)|>(fun x-> (Float.of_int x)/. 1000.0)|> Float.to_int |> Int.to_string


(*let unsignedpreapplyjsontofee unsignedpreapplyjson =
	let binary2= unsignedpreapplyjson>>=  operationtobinary  in
	let binary2len = binary2 >>|Bytes.of_string  >>|Bytes.length >>| Int.to_string in
	let signature2 =  binary2 >>= (fun x-> getsig x username) in
	let fee = (binary2len,extractedgas) |>tupofdeftodefotup >>| computefee *)


let checkstatus json =
	let json1 = (json |>(fun x->match x with  `List[c]-> c
								|_-> (*let () = (Yojson.Basic.pretty_print Format.std_formatter json) in*) json)) in

	let json2 =(json1 |> (fun x->match x with  (`Assoc a)-> x
								|_-> let () = (Yojson.Basic.pretty_print Format.std_formatter json1) in failwith "Failed to apply Operation (not received an Assoc)")) in

	let contentslist = json2 |>member "contents" in
	match contentslist with
	|`List [contents] -> let opres =(contents |> member "metadata" |> member "operation_result") in
							let status = opres |> member "status" in


						if (Yojson.Basic.equal status (`String "applied" ))then opres
						else let () = (Yojson.Basic.pretty_print Format.std_formatter json) in failwith "Failed to apply Operation "


	|_ -> let () = (Yojson.Basic.pretty_print Format.std_formatter json) in failwith "Failed to apply Operation (no contentslist)"

(*let checkerrorafter step response =
	match response with
	 `List  [ (`Assoc  a)]  -> if (List.length a) = 3 then (*((Yojson.Basic.pretty_print Format.std_formatter response);*) failwith ((response |>Yojson.Basic.to_string)) else response
	|_ -> response(*failwith "Run not succesfull"*) *)


let transfer (amount, fromaddr, toaddr, username) =
	let counter= getcounter(fromaddr) in
	let constants=getstorageandgaslimit() in
	let constantstoragelimit =constants >>|p2 in
	let constgaslimimit=constants >>|p1 in
	let unsignedrunopjson= createrunopjsonhelper (amount, fromaddr, toaddr, constgaslimimit, constantstoragelimit, counter, getblock(),return "0") in
	let binary1= unsignedrunopjson>>=  operationtobinary  in
	let signature =  binary1 >>= (fun x-> getsig x username) in
	let signedrunopjson =  signrunopjson unsignedrunopjson signature in
	let runopjson = concatdefjsonlist [signedrunopjson >>|(fun x->(`Assoc [("operation", x)]));createsingljsoneassocfromdef ("chain_id",getchain_id())] in
	let response = runopjson >>= (fun x -> posttojson "chains/main/blocks/head/helpers/scripts/run_operation" x) in
	let extractedgas = response >>|checkstatus >>| extractgas in
	let unsignedpreapplyjson = createrunopjsonhelper (amount, fromaddr, toaddr, extractedgas, return "0", counter, getblock(),return "0") in
	let binary2= unsignedpreapplyjson>>=  operationtobinary  in
	let binary2len = binary2 >>|Bytes.of_string  >>|Bytes.length >>| Int.to_string in
	(*let signature2 =  binary2 >>= (fun x-> getsig x username) in *)
	let fee = (binary2len,extractedgas) |>tupofdeftodefotup >>| computefee in
	let unsignedpreapplyjson2 = createrunopjsonhelper (amount, fromaddr, toaddr, extractedgas, return "0", counter, getblock(),fee) in
	let binary3= unsignedpreapplyjson2>>=  operationtobinary  in
	let signature3 =  binary3 >>= (fun x-> getsig x username) in
	let signedpreapplyjson = (concatdefjsonlist [(signrunopjson unsignedpreapplyjson2 signature3) ; createsingljsoneassocfromdef ("protocol",getprotocol())]) >>| (fun x-> `List [x]) in
	let x= signedpreapplyjson>>=(fun x -> posttojson "chains/main/blocks/head/helpers/preapply/operations" x) in
	let operationhash= createoperationhash signature3 binary3 in
	x>>|checkstatus >>=(fun x->operationhash) >>=(fun y->posttojson "injection/operation?chain=main"  y)>>|to_string

let  gettopipe path =
	let s = "http://localhost:8732/" ^ path in
	let  uri = Uri.of_string s in
        Cohttp_async.Client.get uri
        >>| fun (_, body) ->
		Cohttp_async.Body_raw.to_pipe body


let getchainheads() = gettopipe "monitor/heads/main"



let pipehelper x =
	match x with
	`Eof->   "End of File"
	|`Ok a ->  a

let getheadofchainhelper pipe =
	pipe |> Async_kernel.Pipe.read >>|pipehelper >>| Yojson.Basic.from_string >>|member "hash" >>|to_string

let getheadofchain ()=
	let pipe= getchainheads() in
	pipe >>=getheadofchainhelper

let ishashinblock (hash, block) =
	let flatblock= (block |>Yojson.Basic.Util.to_list |> Yojson.Basic.Util.flatten |> Yojson.Basic.Util.filter_string )in
	 List.mem flatblock hash Base.String.(=)

let getoperationhashes blockhash  = commandtojson ("chains/main/blocks/" ^ blockhash ^"/operation_hashes")



let rec searchhashhelper hash pipe counter=
	if counter =60 then failwith "operation not found" else
	print_string (string_of_int counter^"\n") ;
	let currblockhash = pipe >>=getheadofchainhelper  in
	let curroperationhashes = (currblockhash >>=getoperationhashes ) in
	curroperationhashes >>|(fun x->ishashinblock (hash,x))>>=
	(fun x  ->if x then (pipe >>|Async_kernel.Pipe.close_read>>=(fun ()->currblockhash )) else searchhashhelper hash pipe (counter+1))


let searchhash hash =
	let pipe =getchainheads() in
	pipe |>(fun x-> searchhashhelper hash x  0)





let transferandwait (amount, fromaddr, toaddr, username) =
	let operationhash = transfer (amount, fromaddr, toaddr, username) in
	let blockhash =operationhash >>=searchhash in
	(*[operationhash;blockhash] |>Deferred.all |>List.to*)
	(*operationhash >>| (fun x-> print_string ("transfer with operationhash "^x ^ "included in \n"))>>=
	fun ()->blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n"))*)
	(*let b= blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n")) in
	(operationhash,blockhash) *)
	let tuple= (operationhash,blockhash) |>tupofdeftodefotup
	in tuple >>| (fun (a,b)->print_string ("transfer with operationhash "^a ^ " included in block with blockhash " ^b ^"\n"))
	>>= fun ()->tuple
(*
	| (fun l->match l with [a;b]-> print_string ("transfer with operationhash "^a ^ " included in block with blockhash " ^b ^"\n")
																		|_ -> failwith "unknown Error")
	>>= fun ()-> (Deferred.all [operationhash;blockhash])
	*)



let gettimestamp () =
	(commandtojson "/monitor/bootstrapped") >>|
	(fun x -> (getstrfromjson x "timestamp")    )

let bootstrapped2 () =
	let chaintimestamp = gettimestamp ()>>|ISO8601.Permissive.time in
	let systime= (Ptime.to_rfc3339 (Ptime_clock.now ()))|> ISO8601.Permissive.time in
	let diff = chaintimestamp >>| (fun x-> systime -.x)>>| Float.abs in
	diff >>| (fun x-> if    Base.Float.(=) x 0. then true else false)



let bootstrapped3 ()  =
	Deferred.any [(after (sec 1000.))>>|(fun () -> false) ;
				bootstrapped2()]


(*let transferandwait2(amount, fromaddr, toaddr, username)  =
Deferred.any [(after (sec 1000.))>>|(fun () -> failwith "not bootstrapped") ;
				bootstrapped2()>>| fun x->if x then transferandwait(amount, fromaddr, toaddr, username) else failwith "not bootstrapped"]
*)

let transferandwait2 (amount, fromaddr, toaddr, username) =
	(bootstrapped3())>>= fun x->if x then transferandwait(amount, fromaddr, toaddr, username) else failwith "Not bootstrapped"


(*
let checkerrorafterrun (response) =
	match response with
	 `List  [ (`Assoc  a)]  -> (Yojson.Basic.pretty_print Format.std_formatter response); failwith "Run not succesfull" (*print_string "sucess"*)
	|_ -> response(*failwith "Run not succesfull"*)*)
