(* Maximilian Hertenstein*)

(*Checks if there was an error in an http-request*)
val checkresponse : string -> Response.t * Body.t -> string Deferred.t = <fun>

(*Perfoms http-get with prefix "http://localhost:8732/" and returns the response as a string *)
val gettostring : string -> string Deferred.t = <fun>

(*Like above but returns the response as a json *)
val commandtojson : string -> Basic.t Deferred.t = <fun>

(*Returns the current counter of an tz adress  *)
val getcounter : string -> string Deferred.t = <fun>

(*Extracts a value from a json and returns a json*)
val getvaluefromjson : Basic.t -> string -> Basic.t = <fun>

(*Extracts a value from a json and returns a string*)
val getstrfromjson : string -> Basic.t -> string = <fun>

(*Extracts a value from a json and returns an integer*)
val getintfromjson : string -> Basic.t -> int = <fun>

(*Returns the current configuration of the network*)
val getconstants : unit -> Basic.t Deferred.t = <fun>

(*Extract the hard storagelimit from the current configuration*)
val constantstohardstoragelimit : Basic.t -> string = <fun>

(*Extract the hard gas limit from the current configuration*)
val constantstohardgaslimit : Basic.t -> string = <fun>

(*Returns the last baked block*)
val getblock : unit -> string Deferred.t = <fun>

(*Returns the chain id*)
val getchain_id : unit -> string Deferred.t = <fun>

(*Concatenate jsonlists*)
val concatjsonlist : Basic.t list -> Basic.t = <fun>

(*Concatenate deffered jsonlists*)
val concatdefjsonlist : Basic.t Deferred.t list -> Basic.t Deferred.t = <fun>

(*Converts a a pair to json-association if the type of 'a is string*)
val createsinglejsonassoc :
  'a * 'b -> [> `Assoc of ('a * [> `String of 'b ]) list ] = <fun>

(*Converts a a association-list to json-association*)
val createjsonassoc : (string * string) list -> Basic.t = <fun>

(*Like createsingljsoneassocf but needs a deffered and returns a deffered*)
val createsingljsoneassocfromdef :
  'a * 'b Deferred.t ->
  [> `Assoc of ('a * [> `String of 'b ]) list ] Deferred.t = <fun>

(*Like createjsonassoc but needs a deffered and returns a deffered*)
val createjsonassocfromdefs :
  (string * string Deferred.t) list -> Basic.t Deferred.t = <fun>

(* Creates the a json that is needed in the jsons that are used for
run operation and preapply operation in transfer originate ocntract
 and interactionwithcontact. For example:


  { "branch": "BLG3vpwWCxP8voSyfCRjDmPnVegiXJeacyShQL4aRrJ5NFqbZnF",
        "contents":
          [ {
              "source": "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF", "fee": "0",
              "counter": "748642", "gas_limit": "1040000",
              "storage_limit": "60000",
               } ],
        "signature":
          "edsigtXomBKi5CTRf5cjATJWSyaRvhfYNHqSUGrn4SdbYRcGwQrUGjzEfQDTuqHhuA8b2d8NarZjz8TRf65WkpQmo423BtomS8Q" } *)
val createtransferopjsonhelper :
  string * string Deferred.t * string Deferred.t * string Deferred.t *
  string Deferred.t * string Deferred.t * Basic.t -> Basic.t Deferred.t = <fun>


(* Creates the json corresponding to an transfer. For example:


  { "branch": "BLG3vpwWCxP8voSyfCRjDmPnVegiXJeacyShQL4aRrJ5NFqbZnF",
        "contents":
          [ {
              "source": "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF", "fee": "0",
              "counter": "748642", "gas_limit": "1040000",
              "storage_limit": "60000",
               } ],
        "signature":
          "edsigtXomBKi5CTRf5cjATJWSyaRvhfYNHqSUGrn4SdbYRcGwQrUGjzEfQDTuqHhuA8b2d8NarZjz8TRf65WkpQmo423BtomS8Q" } *)
val createtransferopjson :
  string * string * string * string Deferred.t * string Deferred.t *
  string Deferred.t * string Deferred.t * string Deferred.t ->
  Basic.t Deferred.t = <fun>

(*Like gettojson but sends a http-post request, the header needs to be json*)
val posttojson : string -> Basic.t -> Basic.t Deferred.t = <fun>


(*Uses an rpc-call to ceonvert the json of an operation to a binary value in base58-format*)
val operationtobinary : Basic.t -> string Deferred.t = <fun>

(*Returns the private key of an user*)
val getprivatekey : string -> string Deferred.t = <fun>

(*Returns the signature for an operation, needs the binary representation and the username*)
val getsig : string -> string -> string Deferred.t = <fun>

(*Signs a json using getsig *)
val signrunopjson :
  Basic.t Deferred.t -> string Deferred.t -> Basic.t Deferred.t = <fun>

val runop : Basic.t -> Basic.t Deferred.t = <fun>
(*Runs an operation, needs json-format that is returned by addheaderforrunop *)

val extractgas : Basic.t -> string = <fun>
(*Extracts the used gas value from a respone to runop*)

val preapply : Basic.t -> Basic.t Deferred.t = <fun>
(*Preapply an operation. Needs json-format that is returned by addheaderforrunop*)

(*Returns the current protocol*)
val getprotocol : unit -> string Deferred.t = <fun>

(*Convert from base58 to hexadecimal*)
val base58tohex : string -> string = <fun>

(*Returns the operationhash. The arguments are the hexadecimal representation of the operation and the signature*)
val createoperationhash :
  string Deferred.t -> string Deferred.t -> [> `String of string ] Deferred.t =
  <fun>

(*Converts a pair of deffereds to a Deffered pair*)
val tupofdeftodefotup : 'a Deferred.t * 'a Deferred.t -> ('a * 'a) Deferred.t =
  <fun>


val computefeehelper : string * string -> string = <fun>
(*Computes the fee that is needed for an operation to be insert. Does not produce good results. *)
val computefee :
  string * string * string ->
  string Deferred.t * string Deferred.t -> string Deferred.t = <fun>


(*Checks the response to prapply and rundop for the status. If the Status is not "applied" it raises an error. Also cuts out an smaller part of the response.
For example:
{ "status": "applied",
                  "balance_updates":
                    [ { "kind": "contract",
                        "contract": "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF",
                        "change": "-10000000" },
                      { "kind": "contract",
                        "contract": "tz1Pz2TM1hQHgTcNyQ83DgVCZrCn2h3YScML",
                        "change": "10000000" } ], "consumed_gas": "10207" } *)
val checkstatus : Basic.t -> Basic.t = <fun>

(*Injects the operationshash*)
val injectop : Basic.t -> Basic.t Deferred.t = <fun>

(*Prepares the json from  createtransferopjson, createruncontractopjson, createcontractopjson for a run.
  For example:
    { "operation":
      { "branch": "BLG3vpwWCxP8voSyfCRjDmPnVegiXJeacyShQL4aRrJ5NFqbZnF",
        "contents":
          [ { "kind": "transaction",
              "source": "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF", "fee": "0",
              "counter": "748642", "gas_limit": "1040000",
              "storage_limit": "60000", "amount": "10000000",
              "destination": "tz1Pz2TM1hQHgTcNyQ83DgVCZrCn2h3YScML" } ],
        "signature":
          "edsigtXomBKi5CTRf5cjATJWSyaRvhfYNHqSUGrn4SdbYRcGwQrUGjzEfQDTuqHhuA8b2d8NarZjz8TRf65WkpQmo423BtomS8Q" },
    "chain_id": "NetXjD3HPJJjmcd" }*)
val addheaderforrunop : Basic.t -> Basic.t Deferred.t = <fun>

(*Prepares the json from  createtransferopjson, createruncontractopjson, createcontractopjson for preapplying.
Example:
[ { "protocol": "PsCARTHAGazKbHtnKfLzQg3kms52kSRpgnDY982a9oYsSXRLQEb",
      "branch": "BLG3vpwWCxP8voSyfCRjDmPnVegiXJeacyShQL4aRrJ5NFqbZnF",
      "contents":
        [ { "kind": "transaction",
            "source": "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF", "fee": "1284",
            "counter": "748642", "gas_limit": "10307", "storage_limit": "0",
            "amount": "10000000",
            "destination": "tz1Pz2TM1hQHgTcNyQ83DgVCZrCn2h3YScML" } ],
      "signature":
        "edsigtodiK4U8qR99oHqBoe7osC8RucmahBqexqPUrBcJo9foSCfyxRZ2GteLxC9ySN1wSuy6ksfQAqa6LkTjuvHnx8Emxv1smh" } ]*)
val addheaderforpreapply : Basic.t -> [> `List of Basic.t list ] Deferred.t =
  <fun>

(*Extracts the Originationsize from the response to getconstants*)
val constantstooriginationsize : Basic.t -> int = <fun>

(*Returns all values that are need for runop*)
val getvaluesforrunop :
  string ->
  string Deferred.t * string Deferred.t * string Deferred.t * int Deferred.t =
  <fun>

(*Preapply and inject an operation. Format needs to be like the json returned from addheaderforpreapply*)
val preapplyandinject : string -> Basic.t Deferred.t -> string Deferred.t =
  <fun>

(*Extracts a value from a json. Returns 0 if key is not found *)
val extractedvalueorzero : string -> Basic.t -> int = <fun>

(*Extracts the needed storage from the result of runop*)
val extractstorage : Basic.t -> int = <fun>

(*Extracts the paidstoragesizediff from the result of runop*)
val extractpaidstoragesizediff : Basic.t -> string = <fun>

(*Run an and returns values need for preapplying. Format needs to be like the json returned from addheaderforrunop*)
val runopandgetvaluesforpreapply :
  string ->
  Basic.t Deferred.t ->
  string Deferred.t * int Deferred.t * string Deferred.t * string Deferred.t =
  <fun>


(*Perform a transfer*)
val transfer : string * string * string * string -> string Deferred.t = <fun>

(*Return a pipe after http-get*)
val gettopipe : string -> string Async_kernel.Pipe.Reader.t Deferred.t = <fun>

(*Return a pipe that contains the current head of the chain*)
val getchainheads : unit -> string Async_kernel.Pipe.Reader.t Deferred.t =
  <fun>


val pipehelper : [< `Eof | `Ok of string ] -> string = <fun>
val getheadofchainhelper :
  string Async_kernel.Pipe.Reader.t -> string Deferred.t = <fun>

(*Checks if an hash is in a block*)
val ishashinblock : string * Basic.t -> bool = <fun>

(*Return the operationhashes in a block*)
val getoperationhashes : string -> Basic.t Deferred.t = <fun>
val searchhashhelper :
  string ->
  string Async_kernel.Pipe.Reader.t Deferred.t -> int -> string Deferred.t =
  <fun>

(*Look for an operaionhash in the head of the chain. Fail if 60 blocks did not contain the hash*)
val searchhash : string -> string Deferred.t = <fun>

(*Inject the hash of an operation and check if it gets included*)
val injectandwaithelper :
  string -> string Deferred.t -> (string * string) Deferred.t = <fun>

(*Perform an transfer and wait if the operation hash gets included*)
val transferandwait :
  string * string * string * string -> (string * string) Deferred.t = <fun>


(*Get the timestamp of the chain*)
val gettimestamp : unit -> string Deferred.t = <fun>
val bootstrapped2 : unit -> bool Deferred.t = <fun>

(*alternative to bootstrapped. Also checks if the timestamp of the chain is the timestamp
of the system and the response to bootstrapped does not need to much time*)
val bootstrapped3 : unit -> bool Deferred.t = <fun>
val transferandwait2 :
  string * string * string * string -> (string * string) Deferred.t = <fun>
val transferandrepeat :
  string * string * string * string -> (string * string) Deferred.t = <fun>
val transferandrepeat2 :
  string * string * string * string -> (string * string) Deferred.t = <fun>

(*Create a json needed to originate a contract.*)
val createcontractopjson :
  string * string * Basic.t * Basic.t * string Deferred.t * string Deferred.t *
  string Deferred.t * string Deferred.t * string Deferred.t ->
  Basic.t Deferred.t = <fun>

(*Originates a contract and returns the hash of the operation*)
val originatecontract :
  string * string * Basic.t * Basic.t * string -> string Deferred.t = <fun>


(*Originates a contract and waits if the operation gets included*)
val originateandwait :
  string * string * Basic.t * Basic.t * string -> (string * string) Deferred.t =
  <fun>


val createruncontractopjsonhelper :
  string * string * string * string Deferred.t * string Deferred.t *
  string Deferred.t * string Deferred.t * string Deferred.t * Basic.t ->
  Basic.t Deferred.t = <fun>


(*Create a json needed to run a contract. Example:
"branch": "BKwnWEmgZknFW4bMggYGbJbrsSrJCEhrVU6sCd6j8X199gDTnuU",
      "contents":
        [ { "kind": "transaction",
            "source": "tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK", "fee": "1440",
            "counter": "828954", "gas_limit": "11664", "storage_limit": "0",
            "amount": "100000000",
            "destination": "KT1Lbs7oYhy5DF7e65Jcan4R5ajYqrqTch9U",
            "parameters":
              { "entrypoint": "default",
                "value": { "string": "WorldWorld" } } } ]}
              *)
val createruncontractopjson :
  ?entrypoint:string ->
  string * string * string * string Deferred.t * string Deferred.t *
  string Deferred.t * string Deferred.t * string Deferred.t * string ->
  Basic.t Deferred.t = <fun>

(*Run a contract*)
val runcontract :
  string * string * string * string * string -> string Deferred.t = <fun>

(*Run a contract and wait if it it gets included*)
val runcontractandwait :
  string * string * string * string * string -> (string * string) Deferred.t =
  <fun>














val transfertesttuple : string * string * string * string =
  ("12", "tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK",
   "tz1XLWkD3EXcmEu58rcCSnKVVp1bhwftLAdF", "max3")
val runcontracttesttuple : string * string * string * string * string =
  ("0", "tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK",
   "KT1Lbs7oYhy5DF7e65Jcan4R5ajYqrqTch9U", "max3", "worldWorld")
val storagetest : Basic.t = `Assoc [("string", `String "hello")]
val codetest : Basic.t =
  `List
    [`Assoc
       [("prim", `String "parameter");
        ("args", `List [`Assoc [("prim", `String "string")]])];
     `Assoc
       [("prim", `String "storage");
        ("args", `List [`Assoc [("prim", `String "string")]])];
     `Assoc
       [("prim", `String "code");
        ("args",
         `List
           [`List
              [`Assoc [("prim", `String "CAR")];
               `Assoc
                 [("prim", `String "NIL");
                  ("args", `List [`Assoc [("prim", `String "operation")]])];
               `Assoc [("prim", `String "PAIR")]]])]]
val originatetesttuple : string * string * Basic.t * Basic.t * string =
  ("10", "tz1dhHg83NiG4EfZmBhsL92Yo224w4ufM7BK",
   `List
     [`Assoc
        [("prim", `String "parameter");
         ("args", `List [`Assoc [("prim", `String "string")]])];
      `Assoc
        [("prim", `String "storage");
         ("args", `List [`Assoc [("prim", `String "string")]])];
      `Assoc
        [("prim", `String "code");
         ("args",
          `List
            [`List
               [`Assoc [("prim", `String "CAR")];
                `Assoc
                  [("prim", `String "NIL");
                   ("args", `List [`Assoc [("prim", `String "operation")]])];
                `Assoc [("prim", `String "PAIR")]]])]],
   `Assoc [("string", `String "hello")], "max3")
val testtransfer : unit -> (string * string) Deferred.t = <fun>
val testruncontract : unit -> (string * string) Deferred.t = <fun>
val testoriginate : unit -> (string * string) Deferred.t = <fun>
val test : unit -> unit = <fun>
