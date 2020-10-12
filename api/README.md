# Tezos API

This OCaml API provides functions to interact with a Tezos node. It uses the Tezos libraries released on ```opam``` and
wraps them inside a more simplified and easy-to-use interface. The API heavily utilizes the tezos-client library with
its built-in input verification and prevalidation of operations in order to provide instant feedback and thus avoiding injections
of invalid operations.  
The source code of the Tezos libraries can be found on [Gitlab](https://gitlab.com/tezos/tezos/).
## Using Tezos_Api
To install the Tezos libraries with opam:  
```opam install tezos```

Once you have the Tezos libraries installed, you can easily build the Tezos_Api into your project using ```dune```. Your project structure should look like this:

```
.  
+-- dune  
+-- dune-project
+-- your_main.ml
+-- ...
+-- lib
|   +-- dune
|   +-- SyncAPIV0.mli
|   +-- SyncAPIV0.ml
|   +-- SyncAPIV0_context.mli
|   +-- SyncAPIV0_context.ml
|   +-- SyncAPIV0_error.mli
|   +-- SyncAPIV0_error.ml
```

Inside your projects root dune file, include the Tezos_api and the following dependencies:
```
(executables
 (names my_exe)
 (libraries tezos_api
 	    lwt
	    lwt.unix
	    unix
            ... )

  (flags (:standard -open Lwt
                     ...
  	 	     -linkall)))
```
Your dune-projects file should contain the following line:
``` (lang dune 1.11) ```

Build your project with  
``` dune build my_exe.exe```

## Code examples
### Example 1: Query the balance of an implicit account
```ocaml
  SyncAPIV0.get_contract "MickeyMouse"
  >>=? fun c->
  SyncAPIV0.get_balance c
  >>=? fun balance ->
  ....
```

### Example 2: Transfer tokens from one account to another
```ocaml
SyncAPIV0.get_pukh_from_alias "MickeyMouse"
>>=? fun pukh_mickey ->
SyncAPIV0.get_contract "MinnieMouse"
>>=? fun c_minnie ->
let amount = SyncAPIV0.Tez_t.tez 1.0 in
let fee = SyncAPIV0.Tez_t.tez 0.02 in
SyncAPIV0.transfer amount pukh_mickey c_minnie fee
>>=? fun oph ->
....
```

### Example 3: Calling a contract
```ocaml
SyncAPIV0.get_pukh_from_alias "MickeyMouse"
>>=? fun pukh_mickey ->
SyncAPIV0.get_contract "KT1VZGyuHDLpUaL67VkZ8gzhmXdn1yXxSwqi"
>>=? fun c ->
let amount = SyncAPIV0.Tez_t.tez 1.0 in
let fee = SyncAPIV0.Tez_t.tez 0.02 in
let entrypoint = "someEntrypoint" in
let arg = "Some arguments" in
SyncAPIV0.call_contract amount pukh_mickey c ~entrypoint ~arg fee
>>=? fun oph ->
....
```

### Example 4: Query an operation status
```ocaml
...
>>=? fun oph ->
SyncAPIV0.query oph
>>=? function
| Accepted result -> print_endline ("Consumed gas: " ^ string_of_int res.consumed_gas) ; ...
| Still_pending -> ...
| Rejected (Reason Insufficient_fee) -> ...
| ....
```

### Example 5: Error handling
```ocaml
begin
  SyncAPIV0.get_pukh_from_alias "MickeyMouse"
  >>=? fun pukh_mickey ->
  SyncAPIV0.get_contract "KT1VZGyuHDLpUaL67VkZ8gzhmXdn1yXxSwqi"
  >>=? fun c ->
  SyncAPIV0.call_contract amount pukh_mickey c ~entrypoint ~arg fee
end
>>= function
| Ok oph -> ...
| Error Node_connection_failed -> ...
| Error (Rejection Insufficient_fee) -> ...
| ....
```
