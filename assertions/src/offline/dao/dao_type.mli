(** This module defines types of data access objects used to retrieve the contract code
    The contract code can either be given as an address on the chain, a file path
    or a string (mainly for testing purposes).
    How the code is retrieved and represented is abstracted away and depends on the backend.
*)

type dao_type = DAO_File of string
              | DAO_Chain of string
              | DAO_String of string
