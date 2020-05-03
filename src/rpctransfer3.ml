(*Max*)
open Bignum;;
open Base58;;
open Base;;
open Core;;
open Async;;
open Cohttp;;
open Cohttp_async;;
open Yojson;;
open Yojson.Basic.Util;;
open Ptime;;
open Ptime_clock;;
open Async_unix;;


(*max3: tz1WNYJySeMEnRMXEqEWFzsn5RiZT1EfuubR
max1: tz1bGrXmUMtXS9LXFFLDspQnT5uBshzAi5mt
*)
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


let createrunopjsonhelper (amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch) =
	 let json1=createjsonassoc [("kind",  "transaction");("source",  fromaddr);("fee", "50000");("amount", amount);("destination", toaddr)] in
	 let json2 = createjsonassocfromdefs [("counter",counter);("gas_limit",gaslimit);("storage_limit",storagelimit)]  in 
	 let json3=concatdefjsonlist [return json1;json2] in
	 let innerjsonlist= json3>>| fun x-> `List [x] in
	 [createsingljsoneassocfromdef ( "branch", branch );innerjsonlist >>| (fun x->`Assoc [("contents",x)])  ] 
	 |> concatdefjsonlist

let createrunopjson (amount, fromaddr, toaddr,counter )= createrunopjsonhelper (amount, fromaddr, toaddr, getgaslimit(), getstoragelimit(), counter, getblock())


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


let getsig bin username =
	(*runs a Unix command and returns the Output*)
  (Async_unix.Process.run_exn  ~prog:"./tezos-client" ~args:["sign"; "bytes"; "0x03"^bin; "for" ; username])()
  >>|(fun x->String.split x ~on: ' ')
  >>|List.last_exn
  >>|fun x->String.slice x 0 ((String.length x)-1)


let signrunopjson unsignedjson signature = 
	concatdefjsonlist [unsignedjson; createsingljsoneassocfromdef ("signature",signature)] 


let extractgas json =
	let contentslist = json |>member "contents" in
	match contentslist with 
	|`List [contents] -> contents |> member "metadata" |> member "operation_result" |> member "consumed_gas" |>to_string |>Int.of_string |>(fun x->x+100) |>Int.to_string
	|_ -> failwith "error"


let getprotocol () = 
	let s= "chains/main/blocks/head/protocols" in
	(commandtojson s) >>| member "protocol" >>| to_string


let removeop x= 
match x with
| Some x -> x
| _ -> failwith "Conversion not possible" 

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
	s |> Base58.decode ~alphabet:Base58.bitcoin_alphabet 
	|>  Num.string_of_num|>  Bigint.of_string  |>  dectohex |> (fun x->String.slice x 9((String.length x)-8))

let createoperationhash signature binary =
	let operationhex=signature >>|base58tohex  in (*>>| Num.float_of_num >>|Printf.sprintf "%h") in*)
	Deferred.all [binary;operationhex] >>|(fun x-> List.reduce_exn  x ~f:  (^)  ) >>|(fun x->`String x ) 


let transfer (amount, fromaddr, toaddr, username) = 
	let counter= getcounter(fromaddr) in
	let constants=getstorageandgaslimit() in
	let constantstoragelimit =constants >>|p2 in  
	let constgaslimimit=constants >>|p1 in
	let unsignedrunopjson= createrunopjsonhelper (amount, fromaddr, toaddr, constgaslimimit, constantstoragelimit, counter, getblock()) in
	let binary1= unsignedrunopjson>>=  operationtobinary  in 
	let signature =  binary1 >>= (fun x-> getsig x username) in 
	let signedrunopjson =  signrunopjson unsignedrunopjson signature in 
	let runopjson = concatdefjsonlist [signedrunopjson >>|(fun x->(`Assoc [("operation", x)]));createsingljsoneassocfromdef ("chain_id",getchain_id())] in 
	let response = runopjson >>= (fun x -> posttojson "chains/main/blocks/head/helpers/scripts/run_operation" x) in
	let extractedgas = response >>|extractgas in 
	let unsignedpreapplyjson = createrunopjsonhelper (amount, fromaddr, toaddr, extractedgas, return "0", counter, getblock()) in
	let binary2= unsignedpreapplyjson>>=  operationtobinary  in 
	let signature2 =  binary2 >>= (fun x-> getsig x username) in 
	let signedpreapplyjson = (concatdefjsonlist [(signrunopjson unsignedpreapplyjson signature2) ; createsingljsoneassocfromdef ("protocol",getprotocol())]) >>| (fun x-> `List [x]) in
	let x= signedpreapplyjson>>=(fun x -> posttojson "chains/main/blocks/head/helpers/preapply/operations" x) in 
	let operationhash= createoperationhash signature2 binary2 in
	x>>=(fun x->operationhash) >>=(fun y->posttojson "injection/operation?chain=main"  y)

