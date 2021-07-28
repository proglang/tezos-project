type auction = {
  active : bool;
  owner : address;
  high_bidder : address;
  high_bid : tez;
}

type storage = (string, auction) map

let%entry create
  (parameter : string)
  (storage : storage) =
  if Map.mem parameter storage then
    failwith "auction exists"
  else
    ([], Map.add parameter 
      {active= true; 
       owner=Current.sender ();
       high_bidder=Current.sender ();
       high_bid=Current.amount ();
       } storage)
       
let%entry bid 
  (parameter : string)
  (storage : storage) =
  match Map.find parameter storage with
  | None ->
    failwith "auction does not exist"
  | Some auction ->
    if not auction.active then
      failwith "auction closed"
    else
      if Current.amount () <= auction.high_bid then
        failwith "bid too low"
      else
        let previous_bidder = auction.high_bidder in
        let previous_bid = auction.high_bid in
        let op = Contract.call previous_bidder previous_bid default () in
        ( [op], 
        Map.update parameter (Some {active= true; owner= auction.owner; 
          high_bidder= Current.sender (); high_bid=Current.amount()}) storage)
        
let%entry close
  (parameter : string)
  (storage : storage) =
  match Map.find parameter storage with
  | None ->
    failwith "auction does not exist"
  | Some auction ->
    if not auction.active then
      failwith "auction closed"
    else
      if not (auction.owner = Current.sender()) then
        failwith "not owner"
      else
        let op = Contract.call auction.owner auction.high_bid default () in
        ([op],
        Map.update parameter (Some {active= false; owner= auction.owner; 
                             high_bidder= auction.high_bidder;
                             high_bid= auction.high_bid}) storage)
