# 6 "LexMichelson.mll"
 
open ParMichelson
open Lexing

let symbol_table = Hashtbl.create 6
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add symbol_table kwd tok)
                  [(";", SYMB1);("{", SYMB2);("}", SYMB3);("-", SYMB4);("(", SYMB5);(")", SYMB6)]

let resword_table = Hashtbl.create 179
let _ = List.iter (fun (kwd, tok) -> Hashtbl.add resword_table kwd tok)
                  [("parameter", KW_parameter);("storage", KW_storage);("code", KW_code);("Unit", KW_Unit);("True", KW_True);("False", KW_False);("Pair", KW_Pair);("Left", KW_Left);("Right", KW_Right);("Some", KW_Some);("None", KW_None);("Elt", KW_Elt);("DROP", KW_DROP);("DUP", KW_DUP);("SWAP", KW_SWAP);("DIG", KW_DIG);("DUG", KW_DUG);("PUSH", KW_PUSH);("SOME", KW_SOME);("NONE", KW_NONE);("UNIT", KW_UNIT);("NEVER", KW_NEVER);("IF_NONE", KW_IF_NONE);("PAIR", KW_PAIR);("CAR", KW_CAR);("CDR", KW_CDR);("UNPAIR", KW_UNPAIR);("LEFT", KW_LEFT);("RIGHT", KW_RIGHT);("IF_LEFT", KW_IF_LEFT);("NIL", KW_NIL);("CONS", KW_CONS);("IF_CONS", KW_IF_CONS);("SIZE", KW_SIZE);("EMPTY_SET", KW_EMPTY_SET);("EMPTY_MAP", KW_EMPTY_MAP);("EMPTY_BIG_MAP", KW_EMPTY_BIG_MAP);("MAP", KW_MAP);("ITER", KW_ITER);("MEM", KW_MEM);("GET", KW_GET);("UPDATE", KW_UPDATE);("IF", KW_IF);("LOOP", KW_LOOP);("LOOP_LEFT", KW_LOOP_LEFT);("LAMBDA", KW_LAMBDA);("EXEC", KW_EXEC);("APPLY", KW_APPLY);("DIP", KW_DIP);("FAILWITH", KW_FAILWITH);("CAST", KW_CAST);("RENAME", KW_RENAME);("CONCAT", KW_CONCAT);("SLICE", KW_SLICE);("PACK", KW_PACK);("UNPACK", KW_UNPACK);("ADD", KW_ADD);("SUB", KW_SUB);("MUL", KW_MUL);("EDIV", KW_EDIV);("ABS", KW_ABS);("ISNAT", KW_ISNAT);("INT", KW_INT);("NEG", KW_NEG);("LSL", KW_LSL);("LSR", KW_LSR);("OR", KW_OR);("AND", KW_AND);("XOR", KW_XOR);("NOT", KW_NOT);("COMPARE", KW_COMPARE);("EQ", KW_EQ);("NEQ", KW_NEQ);("LT", KW_LT);("GT", KW_GT);("LE", KW_LE);("GE", KW_GE);("SELF", KW_SELF);("SELF_ADDRESS", KW_SELF_ADDRESS);("CONTRACT", KW_CONTRACT);("TRANSFER_TOKENS", KW_TRANSFER_TOKENS);("SET_DELEGATE", KW_SET_DELEGATE);("CREATE_CONTRACT", KW_CREATE_CONTRACT);("IMPLICIT_ACCOUNT", KW_IMPLICIT_ACCOUNT);("VOTING_POWER", KW_VOTING_POWER);("NOW", KW_NOW);("LEVEL", KW_LEVEL);("AMOUNT", KW_AMOUNT);("BALANCE", KW_BALANCE);("CHECK_SIGNATURE", KW_CHECK_SIGNATURE);("BLAKE2B", KW_BLAKE2B);("KECCAK", KW_KECCAK);("SHA3", KW_SHA3);("SHA256", KW_SHA256);("SHA512", KW_SHA512);("HASH_KEY", KW_HASH_KEY);("SOURCE", KW_SOURCE);("SENDER", KW_SENDER);("ADDRESS", KW_ADDRESS);("CHAIN_ID", KW_CHAIN_ID);("TOTAL_VOTING_POWER", KW_TOTAL_VOTING_POWER);("PAIRING_CHECK", KW_PAIRING_CHECK);("SAPLING_EMPTY_STATE", KW_SAPLING_EMPTY_STATE);("SAPLING_VERIFY_UPDATE", KW_SAPLING_VERIFY_UPDATE);("TICKET", KW_TICKET);("READ_TICKET", KW_READ_TICKET);("SPLIT_TICKET", KW_SPLIT_TICKET);("JOIN_TICKETS", KW_JOIN_TICKETS);("OPEN_CHEST", KW_OPEN_CHEST);("FAIL", KW_FAIL);("CMPEQ", KW_CMPEQ);("CMPNEQ", KW_CMPNEQ);("CMPLT", KW_CMPLT);("CMPGT", KW_CMPGT);("CMPLE", KW_CMPLE);("CMPGE", KW_CMPGE);("IFEQ", KW_IFEQ);("IFNEQ", KW_IFNEQ);("IFLT", KW_IFLT);("IFGT", KW_IFGT);("IFLE", KW_IFLE);("IFGE", KW_IFGE);("IFCMPEQ", KW_IFCMPEQ);("IFCMPNEQ", KW_IFCMPNEQ);("IFCMPLT", KW_IFCMPLT);("IFCMPGT", KW_IFCMPGT);("IFCMPLE", KW_IFCMPLE);("IFCMPGE", KW_IFCMPGE);("ASSERT", KW_ASSERT);("ASSERT_EQ", KW_ASSERT_EQ);("ASSERT_NEQ", KW_ASSERT_NEQ);("ASSERT_LT", KW_ASSERT_LT);("ASSERT_GT", KW_ASSERT_GT);("ASSERT_LE", KW_ASSERT_LE);("ASSERT_GE", KW_ASSERT_GE);("ASSERT_CMPEQ", KW_ASSERT_CMPEQ);("ASSERT_CMPNEQ", KW_ASSERT_CMPNEQ);("ASSERT_CMPLT", KW_ASSERT_CMPLT);("ASSERT_CMPGT", KW_ASSERT_CMPGT);("ASSERT_CMPLE", KW_ASSERT_CMPLE);("ASSERT_CMPGE", KW_ASSERT_CMPGE);("ASSERT_NONE", KW_ASSERT_NONE);("ASSERT_SOME", KW_ASSERT_SOME);("ASSERT_LEFT", KW_ASSERT_LEFT);("ASSERT_RIGHT", KW_ASSERT_RIGHT);("IF_SOME", KW_IF_SOME);("IF_RIGHT", KW_IF_RIGHT);("operation", KW_operation);("contract", KW_contract);("option", KW_option);("list", KW_list);("set", KW_set);("ticket", KW_ticket);("pair", KW_pair);("or", KW_or);("lambda", KW_lambda);("map", KW_map);("big_map", KW_big_map);("bls12_381_g1", KW_bls12_381_g1);("bls12_381_g2", KW_bls12_381_g2);("bls12_381_fr", KW_bls12_381_fr);("sapling_transaction", KW_sapling_transaction);("sapling_state", KW_sapling_state);("chest", KW_chest);("chest_key", KW_chest_key);("unit", KW_unit);("never", KW_never);("bool", KW_bool);("int", KW_int);("nat", KW_nat);("string", KW_string);("chain_id", KW_chain_id);("bytes", KW_bytes);("mutez", KW_mutez);("key_hash", KW_key_hash);("key", KW_key);("signature", KW_signature);("timestamp", KW_timestamp);("address", KW_address)]

let unescapeInitTail (s:string) : string =
  let rec unesc s = match s with
      '\\'::c::cs when List.mem c ['\"'; '\\'; '\''] -> c :: unesc cs
    | '\\'::'n'::cs  -> '\n' :: unesc cs
    | '\\'::'t'::cs  -> '\t' :: unesc cs
    | '\\'::'r'::cs  -> '\r' :: unesc cs
    | '\"'::[]    -> []
    | c::cs      -> c :: unesc cs
    | _         -> []
  (* explode/implode from caml FAQ *)
  in let explode (s : string) : char list =
      let rec exp i l =
        if i < 0 then l else exp (i - 1) (s.[i] :: l) in
      exp (String.length s - 1) []
  in let implode (l : char list) : string =
      let res = Buffer.create (List.length l) in
      List.iter (Buffer.add_char res) l;
      Buffer.contents res
  in implode (unesc (List.tl (explode s)))

let incr_lineno (lexbuf:Lexing.lexbuf) : unit =
    let pos = lexbuf.lex_curr_p in
        lexbuf.lex_curr_p <- { pos with
            pos_lnum = pos.pos_lnum + 1;
            pos_bol = pos.pos_cnum;
        }

# 42 "LexMichelson.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\243\255\244\255\245\255\003\000\218\000\078\000\095\000\
    \002\000\254\255\004\000\253\255\019\001\020\001\062\000\085\001\
    \247\255\185\001\113\000\181\001\205\001\037\001\132\000\048\001\
    \091\001\016\001\004\000\246\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\005\000\004\000\004\000\
    \255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\003\000\007\000\255\255\007\000\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\255\255\000\000\000\000\000\000\026\000\255\255\255\255\255\255\
    \008\000\000\000\010\000\000\000\255\255\013\000\255\255\015\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\002\000\000\000\013\000\003\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\000\000\008\000\010\000\011\000\000\000\000\000\004\000\
    \009\000\009\000\255\255\027\000\000\000\009\000\000\000\000\000\
    \007\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\000\000\009\000\000\000\000\000\000\000\000\000\
    \000\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\000\000\000\000\000\000\012\000\025\000\
    \013\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\009\000\018\000\009\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \000\000\000\000\000\000\000\000\000\000\018\000\000\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\000\000\013\000\000\000\000\000\000\000\000\000\000\000\
    \013\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\000\000\013\000\000\000\000\000\000\000\
    \013\000\024\000\013\000\000\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\000\000\000\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\019\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\000\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \001\000\005\000\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\008\000\011\000\026\000\
    \000\000\005\000\015\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\255\255\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\000\000\000\000\026\000\000\000\000\000\008\000\
    \014\000\000\000\000\000\000\000\000\000\013\000\000\000\016\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\026\000\000\000\
    \000\000\008\000\026\000\000\000\026\000\008\000\000\000\008\000\
    \000\000\000\000\022\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\000\000\000\000\000\000\
    \000\000\000\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\017\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\000\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\000\000\015\000\000\000\000\000\000\000\000\000\
    \015\000\000\000\000\000\000\000\000\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\000\000\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\255\255\015\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\
    \000\000\000\000\000\000\015\000\000\000\015\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\008\000\000\000\010\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\000\000\008\000\255\255\255\255\000\000\
    \000\000\000\000\004\000\026\000\255\255\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\008\000\004\000\
    \014\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\006\000\000\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \255\255\255\255\255\255\255\255\255\255\007\000\255\255\007\000\
    \007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
    \007\000\255\255\014\000\255\255\255\255\255\255\255\255\255\255\
    \014\000\018\000\018\000\018\000\018\000\018\000\018\000\018\000\
    \018\000\018\000\018\000\255\255\014\000\255\255\255\255\255\255\
    \014\000\022\000\014\000\255\255\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\005\000\008\000\004\000\010\000\255\255\255\255\255\255\
    \255\255\255\255\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\012\000\013\000\025\000\
    \255\255\005\000\012\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\021\000\021\000\021\000\
    \021\000\021\000\021\000\021\000\021\000\021\000\021\000\015\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\255\255\255\255\025\000\255\255\255\255\012\000\
    \013\000\255\255\255\255\255\255\255\255\012\000\255\255\015\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\025\000\255\255\
    \255\255\012\000\025\000\255\255\025\000\012\000\255\255\012\000\
    \255\255\255\255\021\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\255\255\255\255\255\255\
    \255\255\255\255\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\015\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\255\255\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\255\255\017\000\255\255\255\255\255\255\255\255\
    \017\000\255\255\255\255\255\255\255\255\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\019\000\019\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\019\000\019\000\
    \019\000\019\000\019\000\019\000\255\255\020\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\020\000\020\000\020\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\020\000\020\000\
    \020\000\020\000\020\000\020\000\013\000\017\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\017\000\
    \255\255\255\255\255\255\017\000\255\255\017\000\020\000\020\000\
    \020\000\020\000\020\000\020\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\015\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 65 "LexMichelson.mll"
                ( token lexbuf )
# 262 "LexMichelson.ml"

  | 1 ->
# 66 "LexMichelson.mll"
                ( let x = lexeme lexbuf in try Hashtbl.find symbol_table x with Not_found -> failwith ("internal lexer error: reserved symbol " ^ x ^ " not found in hashtable") )
# 267 "LexMichelson.ml"

  | 2 ->
# 67 "LexMichelson.mll"
                ( let l = lexeme lexbuf in try Hashtbl.find resword_table l with Not_found -> TOK_Str l )
# 272 "LexMichelson.ml"

  | 3 ->
# 68 "LexMichelson.mll"
                ( let l = lexeme lexbuf in try Hashtbl.find resword_table l with Not_found -> TOK_Hex l )
# 277 "LexMichelson.ml"

  | 4 ->
# 69 "LexMichelson.mll"
                ( let l = lexeme lexbuf in try Hashtbl.find resword_table l with Not_found -> TOK_Nat l )
# 282 "LexMichelson.ml"

  | 5 ->
# 71 "LexMichelson.mll"
                ( let l = lexeme lexbuf in try Hashtbl.find resword_table l with Not_found -> TOK_Ident l )
# 287 "LexMichelson.ml"

  | 6 ->
# 72 "LexMichelson.mll"
                ( TOK_Integer (int_of_string (lexeme lexbuf)) )
# 292 "LexMichelson.ml"

  | 7 ->
# 74 "LexMichelson.mll"
                ( TOK_Double (float_of_string (lexeme lexbuf)) )
# 297 "LexMichelson.ml"

  | 8 ->
# 76 "LexMichelson.mll"
                ( TOK_String (unescapeInitTail (lexeme lexbuf)) )
# 302 "LexMichelson.ml"

  | 9 ->
# 78 "LexMichelson.mll"
                ( TOK_Char (lexeme lexbuf).[1] )
# 307 "LexMichelson.ml"

  | 10 ->
# 80 "LexMichelson.mll"
                ( token lexbuf )
# 312 "LexMichelson.ml"

  | 11 ->
# 81 "LexMichelson.mll"
                ( incr_lineno lexbuf; token lexbuf )
# 317 "LexMichelson.ml"

  | 12 ->
# 82 "LexMichelson.mll"
                ( TOK_EOF )
# 322 "LexMichelson.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

