(*open Bignum;;
  open Base58;;


  open Base;;*)
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



let checkresponse path (h, b) =
  let s = (Cohttp_async.Body.to_string b) in
  if h |> Cohttp_async.Response.status |> Cohttp.Code.code_of_status |> Cohttp.Code.is_error
  then s >>| (fun x-> failwith ("Error after RPC Call: " ^ path ^". " ^ x))
  else s

let gettostring path =
  let fullpath = "http://localhost:8732/" ^ path in
  fullpath |>  Uri.of_string |> Cohttp_async.Client.get
  (*>>= fun (_, body) ->
    		Cohttp_async.Body.to_string body*)
  >>= checkresponse fullpath


let commandtojson path =
  let x = (gettostring path) in
  (*let _= x>>|print_string in*)
  x >>| Yojson.Basic.from_string

let getcounter addr =
  ("chains/main/blocks/head/context/contracts/"^ addr ^"/counter")|>
  commandtojson >>| Yojson.Basic.Util.to_string >>| Int.of_string   >>| (fun x -> (x+1))  >>| Int.to_string


let getvaluefromjson  json key =
  json |> member key (*|> to_string*)

let getstrfromjson key json =  json |> member key |> to_string
let getintfromjson key json  = json |> member key |> to_int


let getconstants () =
  (commandtojson "chains/main/blocks/head/context/constants")

let constantstohardstoragelimit json = json|> getstrfromjson "hard_storage_limit_per_operation"

let constantstohardgaslimit json = json |> getstrfromjson "hard_gas_limit_per_operation"


(*let getstoragelimit () =
  (commandtojson "chains/main/blocks/head/context/constants")
  >>| getstrfromjson "hard_storage_limit_per_operation"

let getstorageandgaslimit () =
  (commandtojson "chains/main/blocks/head/context/constants")
  >>| (fun x -> (getstrfromjson  "hard_gas_limit_per_operation" x, getstrfromjson "hard_storage_limit_per_operation" x))

let getgaslimit () =
  (commandtojson "chains/main/blocks/head/context/constants")
  >>| getstrfromjson "hard_gas_limit_per_operation" *)

let getblock () =
  (commandtojson "/monitor/bootstrapped")
  >>| getstrfromjson "block"



let getchain_id () = commandtojson "chains/main/chain_id" >>| Yojson.Basic.Util.to_string
(*
let p1 (x, _) = x
let p2 (_, x) = x *)


let concatjsonlist = List.reduce_exn ~f:Yojson.Basic.Util.combine

let concatdefjsonlist l = l |> Deferred.all >>| concatjsonlist

let createsinglejsonassoc (x,y) = `Assoc [(x,`String y)]

let createjsonassoc l = l |> (List.map ~f:createsinglejsonassoc ) |> concatjsonlist

let createsingljsoneassocfromdef (x,y) = y >>| (fun y -> `Assoc [(x,`String y)])

let createjsonassocfromdefs l = l |> (List.map ~f:createsingljsoneassocfromdef) |> Deferred.all >>| concatjsonlist





let createtransferopjsonhelper (fromaddr, gaslimit, storagelimit, counter, branch, fee,jsonkinamdes) =
  let json1= createsinglejsonassoc ("source",  fromaddr) in
  let json2 = createjsonassocfromdefs [("fee", fee);("counter",counter);("gas_limit",gaslimit);("storage_limit",storagelimit)]  in
  let json3=concatdefjsonlist [return json1; return jsonkinamdes;json2] in
  let innerjsonlist= json3 >>| fun x -> `List [x] in
  [createsingljsoneassocfromdef ( "branch", branch );innerjsonlist >>| (fun x -> `Assoc [("contents",x)])  ]
  |> concatdefjsonlist

let createtransferopjson (amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch, fee) =
  let jsonkinamdes=createjsonassoc [("kind",  "transaction");("amount", amount);("destination", toaddr)] in
  createtransferopjsonhelper (fromaddr, gaslimit, storagelimit, counter, branch, fee,jsonkinamdes)





(*let createrunopjson (amount, fromaddr, toaddr, counter )= createtransferopjson (amount, fromaddr, toaddr, getgaslimit(), getstoragelimit(), counter, getblock(),return "5000")*)


let posttojson path content =
  let fullpath = "http://localhost:8732/" ^ path in
  let header = Cohttp.Header.init_with "Content-type" "application/json" in
  let uri = Uri.of_string fullpath in
  let jsoncontent= content |> Yojson.Basic.to_string |> Cohttp_async.Body.of_string in
  Cohttp_async.Client.post ~body:jsoncontent ~headers:header uri
  (*>>= fun (_, body) ->
    	Cohttp_async.Body.to_string body *)
  >>= checkresponse fullpath
  >>| Yojson.Basic.from_string


let operationtobinary json =
  (*let () = (Yojson.Basic.pretty_print Format.std_formatter json) in*)
  posttojson "chains/main/blocks/head/helpers/forge/operations"  json
  >>|to_string

(*let removeop x =
  match x with
  | Some x -> x
  | _ -> failwith "Conversion not possible" *)

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


let getsig username bin  =
  let pkey = username |> getprivatekey >>|Signature.Secret_key.of_b58check_exn in
  let bytes = (`Hex ("03"^bin)) |> Hex.to_bytes in
  pkey >>| (fun x -> Signature.sign  x bytes ) >>| Signature.to_b58check

(*let getsigtest bin key =
  let pkey = key |>Signature.Secret_key.of_b58check_exn in
  let bytes =  (`Hex ("03"^bin)) |> Hex.to_bytes in
  (Signature.sign  pkey bytes ) |> Signature.to_b58check *)


let signrunopjson unsignedjson signature = concatdefjsonlist [unsignedjson; createsingljsoneassocfromdef ("signature",signature)]



let runop json = posttojson "chains/main/blocks/head/helpers/scripts/run_operation" json

(*let extractgas json =
  	let contentslist = json |>member "contents" in
  	match contentslist with
  	|`List [contents] -> contents |> member "metadata" |> member "operation_result"
  	|_ -> failwith "error" *)



let extractgas json =
  (*let () = Yojson.Basic.pretty_print Format.std_formatter json in *)
  (json |> member "consumed_gas" |> to_string |> Int.of_string |> (fun x->x+100) |> Int.to_string)

let preapply json =  posttojson "chains/main/blocks/head/helpers/preapply/operations" json

let getprotocol () =
  "chains/main/blocks/head/protocols" |>
  commandtojson  >>| member "protocol" >>| to_string



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


(*let base58tohex s= s |> Base58.safe_decode ~alphabet:Base58.Alphabet.bitcoin  |>removeop |>Hex.of_string|>Hex.show |>(fun x->String.slice x 10((String.length x))) *)

let base58tohex s = s 	|> Base58.safe_decode ~alphabet:Base58.Alphabet.bitcoin
                    |> (fun x-> match x with Some x -> x
                                           | _ -> failwith "Cant convert " ^ s ^ "to hex" )
                    |> Hex.of_string |> Hex.show |> (fun x -> String.slice x 10((String.length x)))



let createoperationhash signature binary =
  let operationhex=signature >>|base58tohex  in (*>>| Num.float_of_num >>|Printf.sprintf "%h") in*)
  Deferred.all [binary;operationhex] >>|(fun x-> List.reduce_exn  x ~f:  (^)  ) >>|(fun x -> `String x )

let tupofdeftodefotup (x, y) =
  [x;y]|>Deferred.all
  >>| (fun l->match l with [a;b] -> (a,b)
                         |_ -> failwith "unknown Error")

(*let computefee (opsize, gas) =	(100 + 1000 * Int.of_string opsize + 100 * Int.of_string gas) |> (fun x-> (Float.of_int x) /. 1000.0) |> Float.to_int |> Int.to_string*)
let computefeehelper (opsize, gas) =  (100. +. 1.*. ((Float.of_string opsize)+.64.) +. 0.1 *. Float.of_string gas) |> Float.to_int |> Int.to_string

let computefee  (amount, fromaddr, toaddr)  (extractedgas, counter)=
  let unsignedpreapplyjson = createtransferopjson (amount, fromaddr, toaddr, extractedgas, return "0", counter, getblock(),return "0") in
  let binary2 = unsignedpreapplyjson >>=  operationtobinary in
  let binary2len = binary2 >>| Bytes.of_string  >>| Bytes.length >>| Int.to_string in
  (*let signature2 =  binary2 >>= (fun x-> getsig x username) in *)
  let fee = (binary2len,extractedgas) |> tupofdeftodefotup >>| computefeehelper  in
  let _ = fee >>|print_string in
  fee


(*let unsignedpreapplyjsontofee unsignedpreapplyjson =
  	let binary2= unsignedpreapplyjson>>=  operationtobinary  in
  	let binary2len = binary2 >>|Bytes.of_string  >>|Bytes.length >>| Int.to_string in
  	let signature2 =  binary2 >>= (fun x-> getsig x username) in
  	let fee = (binary2len,extractedgas) |>tupofdeftodefotup >>| computefee *)


let checkstatus json =
  json |> (fun x-> match x with  `List[c] -> c
                                            |_-> (*let () = (Yojson.Basic.pretty_print Format.std_formatter json) in*) json)

  |> (fun x -> match x with  (`Assoc a) -> x
                                              |_-> let () = (Yojson.Basic.pretty_print Format.std_formatter x) in failwith "Failed to apply Operation (not received an Assoc)")

  |> member "contents" |> (fun contentslist ->
  match contentslist with
  |`List [contents] -> let opres =(contents |> member "metadata" |> member "operation_result") in
    let status = opres |> member "status" in


    if (Yojson.Basic.equal status (`String "applied" ))
    then opres
    else let () = (Yojson.Basic.pretty_print Format.std_formatter json) in failwith "Failed to apply Operation "


  |_ -> let () = (Yojson.Basic.pretty_print Format.std_formatter json) in failwith "Failed to apply Operation (no contentslist)")

(*let checkerrorafter step response =
  	match response with
  	 `List  [ (`Assoc  a)]  -> if (List.length a) = 3 then (*((Yojson.Basic.pretty_print Format.std_formatter response);*) failwith ((response |>Yojson.Basic.to_string)) else response
  	|_ -> response(*failwith "Run not succesfull"*) *)



let injectop ophash = posttojson "injection/operation?chain=main"  ophash

let addheaderforrunop signedrunopjson =
  concatdefjsonlist [return (`Assoc [("operation", signedrunopjson)]);createsingljsoneassocfromdef ("chain_id",getchain_id () )]


let addheaderforpreapply signedpreapplyjson =
  (concatdefjsonlist [ return signedpreapplyjson ; createsingljsoneassocfromdef ("protocol",getprotocol () )]) >>| (fun x-> `List [x])



let constantstooriginationsize json = json |> getintfromjson "origination_size"


let getvaluesforrunop (fromaddr) =
  let counter = getcounter(fromaddr) in
  let constants = getconstants () in
  let constantstoragelimit = constants >>| constantstohardstoragelimit in
  let constgaslimimit = constants >>| constantstohardgaslimit in
  let constorginationlimit = constants >>| constantstooriginationsize in
  (counter,constantstoragelimit,constgaslimimit,constorginationlimit)




let preapplyandinject username unsignedpreapplyjson =
  let binary = unsignedpreapplyjson >>=  operationtobinary  in
  let signature2 =  binary >>= getsig username in
  let responsetopreapply = signrunopjson unsignedpreapplyjson signature2 >>= addheaderforpreapply >>= preapply in
  let operationhash = createoperationhash signature2 binary in
  responsetopreapply >>| checkstatus >>= (fun x -> operationhash) >>= injectop >>| to_string




let extractedvalueorzero name json =
  json |> member name|> (fun x->match x with
                                  `Null->`String "0"
                                  |x->x)
  |> to_string |> Int.of_string



let extractstorage = extractedvalueorzero "storage_size"

let extractpaidstoragesizediff json =  json |> extractedvalueorzero "paid_storage_size_diff" |> (fun x->x+20) |> Int.to_string



let runopandgetvaluesforpreapply username unsignedrunopjson=
let signature =  unsignedrunopjson >>=  operationtobinary >>=  getsig  username in
  let opres =  signrunopjson unsignedrunopjson signature >>=addheaderforrunop >>= runop >>| checkstatus in
  let extractedgas = opres >>| extractgas in
  let extractedstorage = opres >>| extractstorage in
  let fee = return "5000" in
  let paidstoragesizediff = opres >>| extractpaidstoragesizediff in
  (extractedgas,extractedstorage,fee,paidstoragesizediff)


let transfer  (amount, fromaddr, toaddr, username) =
  let (counter,constantstoragelimit,constgaslimimit,_)=getvaluesforrunop (fromaddr) in
  let unsignedrunopjson = createtransferopjson (amount, fromaddr, toaddr, constgaslimimit, constantstoragelimit, counter, getblock (), return "0") in
  let (extractedgas,_,fee,_) = runopandgetvaluesforpreapply username unsignedrunopjson in
  (*let fee = computefee (amount, fromaddr, toaddr) (extractedgas,counter)in*)
  let unsignedpreapplyjson = createtransferopjson (amount, fromaddr, toaddr, extractedgas, return "0", counter, getblock (),fee) in
  preapplyandinject username unsignedpreapplyjson




let gettopipe path =
  ("http://localhost:8732/" ^ path)|>
  Uri.of_string  |>
  Cohttp_async.Client.get
  >>| fun (_, body) ->
  Cohttp_async.Body_raw.to_pipe body


let getchainheads () = gettopipe "monitor/heads/main"



let pipehelper x =
  match x with
    `Eof-> "End of File"
  |`Ok a ->  a

let getheadofchainhelper pipe =
  pipe |> Async_kernel.Pipe.read >>| pipehelper >>| Yojson.Basic.from_string >>| member "hash" >>| to_string

(*let getheadofchain () =
  	let pipe= getchainheads () in
  	pipe >>=getheadofchainhelper *)

let ishashinblock (hash, block) =
  let flatblock= (block |>Yojson.Basic.Util.to_list |> Yojson.Basic.Util.flatten |> Yojson.Basic.Util.filter_string ) in
  List.mem flatblock hash Base.String.(=)

let getoperationhashes blockhash  = commandtojson ("chains/main/blocks/" ^ blockhash ^"/operation_hashes")



let rec searchhashhelper hash pipe counter=
  if counter = 60 then failwith "operation_not_found" else
    print_string (string_of_int counter^"\n");
  let currblockhash = pipe >>= getheadofchainhelper  in
  let curroperationhashes = (currblockhash >>= getoperationhashes ) in
  curroperationhashes >>| (fun x->ishashinblock (hash,x))
  >>= (fun x  -> if x then (pipe >>| Async_kernel.Pipe.close_read
                            >>= (fun () -> currblockhash )) else searchhashhelper hash pipe (counter + 1))


let searchhash hash =
  let pipe =getchainheads () in
  pipe |> (fun x -> searchhashhelper hash x 0)


let injectandwaithelper kind operationhash  =
  let blockhash = operationhash >>= searchhash in
  let tuple = (operationhash,blockhash) |> tupofdeftodefotup in
  tuple >>| (fun (a,b)->print_string (kind ^ " with operationhash "^ a ^ " included in block with blockhash " ^ b ^"\n"))
  >>= fun () -> tuple


let transferandwait (amount, fromaddr, toaddr, username) =
  let operationhash = transfer (amount, fromaddr, toaddr, username) in
   injectandwaithelper "transfer" operationhash

(*

(let transferandwait (amount, fromaddr, toaddr, username) =
  let operationhash = transfer (amount, fromaddr, toaddr, username) in
  let blockhash = operationhash >>= searchhash in
  (*[operationhash;blockhash] |>Deferred.all |>List.to*)
  (*operationhash >>| (fun x-> print_string ("transfer with operationhash "^x ^ "included in \n"))>>=
    	fun ()->blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n"))*)
  (*let b= blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n")) in
    	(operationhash,blockhash) *)
  let tuple = (operationhash,blockhash) |> tupofdeftodefotup
  in tuple >>| (fun (a,b)->print_string ("transfer with operationhash "^ a ^ " included in block with blockhash " ^ b ^"\n"))
  >>= fun () -> tuple*)
(*
	| (fun l->match l with [a;b]-> print_string ("transfer with operationhash "^a ^ " included in block with blockhash " ^b ^"\n")
																		|_ -> failwith "unknown Error")
	>>= fun ()-> (Deferred.all [operationhash;blockhash])
	*)


let gettimestamp () =
  (commandtojson "/monitor/bootstrapped") >>|
  getstrfromjson "timestamp"


let bootstrapped2 () =
  let chaintimestamp = gettimestamp () >>| ISO8601.Permissive.time in
  let systime = (Ptime.to_rfc3339 (Ptime_clock.now () )) |> ISO8601.Permissive.time in
  let diff = chaintimestamp >>| (fun x-> systime -. x) >>| Float.abs in
  diff >>| (fun x -> if    Base.Float.(=) x 0. then true else false)



let bootstrapped3 ()  =
  Deferred.any [(after (sec 1000.)) >>| (fun () -> false); bootstrapped2()]


(*let transferandwait2(amount, fromaddr, toaddr, username)  =
  Deferred.any [(after (sec 1000.))>>|(fun () -> failwith "not bootstrapped") ;
  				bootstrapped2()>>| fun x->if x then transferandwait(amount, fromaddr, toaddr, username) else failwith "not bootstrapped"]
*)

let transferandwait2 (amount, fromaddr, toaddr, username) =
  (bootstrapped3 () ) >>= fun x -> if x then transferandwait (amount, fromaddr, toaddr, username) else failwith "Not bootstrapped"


let rec transferandrepeat (amount, fromaddr, toaddr, username) =
     try transferandwait2 (amount, fromaddr, toaddr, username)
    with operation_not_found ->transferandrepeat (amount, fromaddr, toaddr, username)


let transferandrepeat2 (amount, fromaddr, toaddr, username) =
  Deferred.any [(after (sec (5. *.  60.))) >>| (fun () ->("not ","succesfull")); transferandrepeat (amount, fromaddr, toaddr, username)]
(*
let checkerrorafterrun (response) =
	match response with
	 `List  [ (`Assoc  a)]  -> (Yojson.Basic.pretty_print Format.std_formatter response); failwith "Run not succesfull" (*print_string "sucess"*)
	|_ -> response(*failwith "Run not succesfull"*)*)


(*let ()=print_string "Hello"*)


(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)



let createcontractopjson (balance, fromaddr, code, storage, gaslimit, storagelimit, counter, branch, fee) =
  (*let script=createjsonassoc[("code",code);("storage",storage )] (*|>(fun x-> `List [x])*) in *)
  let script=`Assoc[("code",code);("storage",storage )] in
  let scriptassoc = `Assoc [("script", script)] (* |>(fun x-> `List [x]) *)in
  let json1=createjsonassoc [("kind",  "origination");("balance", balance)] in
  let json2= concatjsonlist [json1;scriptassoc] in
  createtransferopjsonhelper (fromaddr, gaslimit, storagelimit, counter, branch, fee,json2)


let originatecontract  (balance, fromaddr, code, storage, username) =
  let (counter,constantstoragelimit,constgaslimimit,constorginationlimit)=getvaluesforrunop (fromaddr) in
  let unsignedrunopjson = createcontractopjson (balance, fromaddr, code ,storage, constgaslimimit, constantstoragelimit, counter, getblock (), return "0") in
  let (extractedgas,extractedstorage,fee,_) = runopandgetvaluesforpreapply username unsignedrunopjson in
    (*let fee = computefee (amount, fromaddr, toaddr) (extractedgas,counter)in*)
  let computedstoragelimit = [extractedstorage;constorginationlimit]|> Deferred.all >>| List.reduce_exn ~f: (+)  >>| Int.to_string in
  let unsignedpreapplyjson = createcontractopjson(balance, fromaddr, code ,storage, extractedgas, computedstoragelimit, counter, getblock (), fee) in
  preapplyandinject username unsignedpreapplyjson





let originateandwait  (balance, fromaddr, code, storage, username) =
  let operationhash = originatecontract (balance, fromaddr, code, storage, username) in
  injectandwaithelper "smart contract" operationhash


(*let originateandwait (balance, fromaddr, code, storage, username) =
  let operationhash = originatecontract (balance, fromaddr, code, storage, username) in
  let blockhash = operationhash >>= searchhash in
  (*[operationhash;blockhash] |>Deferred.all |>List.to*)
  (*operationhash >>| (fun x-> print_string ("transfer with operationhash "^x ^ "included in \n"))>>=
      fun ()->blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n"))*)
  (*let b= blockhash >>| (fun x-> print_string ("block with blockhash " ^x ^"\n")) in
      (operationhash,blockhash) *)
  let tuple = (operationhash,blockhash) |> tupofdeftodefotup
  in tuple >>| (fun (a,b)->print_string ("smart contract with operationhash "^ a ^ " included in block with blockhash " ^ b ^"\n"))
  >>= fun () -> tuple*)




(*
let storagetest= Yojson.Basic.from_string "{\"string\":\"hello\"}"
let codetest = Yojson.Basic.from_string "[{\"prim\":\"parameter\",\"args\":[{\"prim\":\"string\"}]},{\"prim\":\"storage\",\"args\":[{\"prim\":\"string\"}]},{\"prim\":\"code\",\"args\":[[{\"prim\":\"CAR\"},{\"prim\":\"NIL\",\"args\":[{\"prim\":\"operation\"}]},{\"prim\":\"PAIR\"}]]}]"
let testhelper = ("1000000","tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK",codetest,storagetest, "max3")
*)



(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)

let createruncontractopjsonhelper (amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch, fee, parameters) =
let jsonkinamdes=createjsonassoc [("kind",  "transaction");("amount", amount);("destination", toaddr)] in
  let json1= [jsonkinamdes;`Assoc[("parameters", parameters)]] |> concatjsonlist in
  createtransferopjsonhelper (fromaddr, gaslimit, storagelimit, counter, branch, fee,json1)



let createruncontractopjson ?entrypoint:(entrypoint="default")(amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch, fee, value) =
  let parameters = `Assoc [("entrypoint", `String "default"); ("value", `Assoc [("string", `String value)])] in
  createruncontractopjsonhelper (amount, fromaddr, toaddr, gaslimit, storagelimit, counter, branch, fee, parameters)




let runcontract  (amount, fromaddr, toaddr, username,parameters) =
  let (counter,constantstoragelimit,constgaslimimit,_)=getvaluesforrunop (fromaddr) in
  let unsignedrunopjson = createruncontractopjson (amount, fromaddr, toaddr, constgaslimimit, constantstoragelimit, counter, getblock (), return "0",parameters) in
  let (extractedgas,_,fee,paidstoragesizediff) = runopandgetvaluesforpreapply username unsignedrunopjson in
  (*let fee = computefee (amount, fromaddr, toaddr) (extractedgas,counter)in*)
  let unsignedpreapplyjson = createruncontractopjson (amount, fromaddr, toaddr, extractedgas, paidstoragesizediff , counter, getblock (),fee,parameters) in
  preapplyandinject username unsignedpreapplyjson



let runcontractandwait  (amount, fromaddr, toaddr, username, value) =
  let operationhash = runcontract  (amount, fromaddr, toaddr, username, value) in
  injectandwaithelper "smart-contract-interaction" operationhash

(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)
(*--------------------------------------------------------------------------*)













let transfertesttuple = ("12","tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK","tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF","max3")

let runcontracttesttuple =("0","tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK","KT1Lbs7oYhy5DF7e65Jcan4R5ajYqrqTch9U","max3","worldWorld")

let storagetest= Yojson.Basic.from_string "{\"string\":\"hello\"}"
let codetest = Yojson.Basic.from_string "[{\"prim\":\"parameter\",\"args\":[{\"prim\":\"string\"}]},{\"prim\":\"storage\",\"args\":[{\"prim\":\"string\"}]},{\"prim\":\"code\",\"args\":[[{\"prim\":\"CAR\"},{\"prim\":\"NIL\",\"args\":[{\"prim\":\"operation\"}]},{\"prim\":\"PAIR\"}]]}]"
let originatetesttuple = ("10","tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK",codetest,storagetest, "max3")




let testtransfer () = transferandwait transfertesttuple


let testruncontract ()= runcontractandwait runcontracttesttuple
let testoriginate () = originateandwait originatetesttuple



let test ()=
 let _= testtransfer() in
  let _= testruncontract() in
  let _ = testoriginate() in ()
