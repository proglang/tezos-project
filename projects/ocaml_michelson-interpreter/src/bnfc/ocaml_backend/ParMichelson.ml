
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TOK_String of (
# 24 "ParMichelson.mly"
       (string)
# 11 "ParMichelson.ml"
  )
    | TOK_Str of (
# 25 "ParMichelson.mly"
       (string)
# 16 "ParMichelson.ml"
  )
    | TOK_Integer of (
# 23 "ParMichelson.mly"
       (int)
# 21 "ParMichelson.ml"
  )
    | TOK_Ident of (
# 20 "ParMichelson.mly"
       (string)
# 26 "ParMichelson.ml"
  )
    | TOK_Hex of (
# 26 "ParMichelson.mly"
       (string)
# 31 "ParMichelson.ml"
  )
    | TOK_EOF
    | TOK_Double of (
# 22 "ParMichelson.mly"
       (float)
# 37 "ParMichelson.ml"
  )
    | TOK_Char of (
# 21 "ParMichelson.mly"
       (char)
# 42 "ParMichelson.ml"
  )
    | SYMB6
    | SYMB5
    | SYMB4
    | SYMB3
    | SYMB2
    | SYMB1
    | KW_unit
    | KW_timestamp
    | KW_ticket
    | KW_string
    | KW_storage
    | KW_signature
    | KW_set
    | KW_sapling_transaction
    | KW_sapling_state
    | KW_parameter
    | KW_pair
    | KW_or
    | KW_option
    | KW_operation
    | KW_never
    | KW_nat
    | KW_mutez
    | KW_map
    | KW_list
    | KW_lambda
    | KW_key_hash
    | KW_key
    | KW_int
    | KW_contract
    | KW_code
    | KW_chest_key
    | KW_chest
    | KW_chain_id
    | KW_bytes
    | KW_bool
    | KW_bls12_381_g2
    | KW_bls12_381_g1
    | KW_bls12_381_fr
    | KW_big_map
    | KW_address
    | KW_XOR
    | KW_VOTING_POWER
    | KW_Unit
    | KW_UPDATE
    | KW_UNPAIR
    | KW_UNPACK
    | KW_UNIT
    | KW_True
    | KW_TRANSFER_TOKENS
    | KW_TOTAL_VOTING_POWER
    | KW_TICKET
    | KW_Some
    | KW_SWAP
    | KW_SUB
    | KW_SPLIT_TICKET
    | KW_SOURCE
    | KW_SOME
    | KW_SLICE
    | KW_SIZE
    | KW_SHA512
    | KW_SHA3
    | KW_SHA256
    | KW_SET_DELEGATE
    | KW_SENDER
    | KW_SELF_ADDRESS
    | KW_SELF
    | KW_SAPLING_VERIFY_UPDATE
    | KW_SAPLING_EMPTY_STATE
    | KW_Right
    | KW_RIGHT
    | KW_RENAME
    | KW_READ_TICKET
    | KW_Pair
    | KW_PUSH
    | KW_PAIRING_CHECK
    | KW_PAIR
    | KW_PACK
    | KW_OR
    | KW_OPEN_CHEST
    | KW_None
    | KW_NOW
    | KW_NOT
    | KW_NONE
    | KW_NIL
    | KW_NEVER
    | KW_NEQ
    | KW_NEG
    | KW_MUL
    | KW_MEM
    | KW_MAP
    | KW_Left
    | KW_LT
    | KW_LSR
    | KW_LSL
    | KW_LOOP_LEFT
    | KW_LOOP
    | KW_LEVEL
    | KW_LEFT
    | KW_LE
    | KW_LAMBDA
    | KW_KECCAK
    | KW_JOIN_TICKETS
    | KW_ITER
    | KW_ISNAT
    | KW_INT
    | KW_IMPLICIT_ACCOUNT
    | KW_IF_SOME
    | KW_IF_NONE
    | KW_IF_LEFT
    | KW_IF_CONS
    | KW_IFCMPNEQ
    | KW_IFCMPLT
    | KW_IFCMPLE
    | KW_IFCMPGT
    | KW_IFCMPGE
    | KW_IFCMPEQ
    | KW_IF
    | KW_HASH_KEY
    | KW_GT
    | KW_GET
    | KW_GE
    | KW_False
    | KW_FAILWITH
    | KW_Elt
    | KW_EXEC
    | KW_EQ
    | KW_EMPTY_SET
    | KW_EMPTY_MAP
    | KW_EMPTY_BIG_MAP
    | KW_EDIV
    | KW_DUP
    | KW_DUG
    | KW_DROP
    | KW_DIP
    | KW_DIG
    | KW_CREATE_CONTRACT
    | KW_CONTRACT
    | KW_CONS
    | KW_CONCAT
    | KW_COMPARE
    | KW_CHECK_SIGNATURE
    | KW_CHAIN_ID
    | KW_CDR
    | KW_CAST
    | KW_CAR
    | KW_BLAKE2B
    | KW_BALANCE
    | KW_APPLY
    | KW_AND
    | KW_AMOUNT
    | KW_ADDRESS
    | KW_ADD
    | KW_ABS
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState344
  | MenhirState340
  | MenhirState337
  | MenhirState329
  | MenhirState323
  | MenhirState322
  | MenhirState316
  | MenhirState313
  | MenhirState304
  | MenhirState291
  | MenhirState286
  | MenhirState281
  | MenhirState276
  | MenhirState271
  | MenhirState266
  | MenhirState261
  | MenhirState256
  | MenhirState251
  | MenhirState246
  | MenhirState241
  | MenhirState236
  | MenhirState231
  | MenhirState210
  | MenhirState209
  | MenhirState206
  | MenhirState205
  | MenhirState204
  | MenhirState202
  | MenhirState200
  | MenhirState198
  | MenhirState195
  | MenhirState194
  | MenhirState192
  | MenhirState191
  | MenhirState189
  | MenhirState183
  | MenhirState180
  | MenhirState178
  | MenhirState176
  | MenhirState174
  | MenhirState172
  | MenhirState170
  | MenhirState168
  | MenhirState166
  | MenhirState164
  | MenhirState162
  | MenhirState160
  | MenhirState155
  | MenhirState151
  | MenhirState149
  | MenhirState148
  | MenhirState145
  | MenhirState143
  | MenhirState141
  | MenhirState136
  | MenhirState128
  | MenhirState126
  | MenhirState118
  | MenhirState116
  | MenhirState115
  | MenhirState114
  | MenhirState111
  | MenhirState109
  | MenhirState106
  | MenhirState105
  | MenhirState101
  | MenhirState99
  | MenhirState76
  | MenhirState75
  | MenhirState73
  | MenhirState71
  | MenhirState69
  | MenhirState63
  | MenhirState59
  | MenhirState58
  | MenhirState52
  | MenhirState51
  | MenhirState50
  | MenhirState49
  | MenhirState48
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState36
  | MenhirState34
  | MenhirState31
  | MenhirState19
  | MenhirState18
  | MenhirState17
  | MenhirState14
  | MenhirState11
  | MenhirState10
  | MenhirState8
  | MenhirState5
  | MenhirState2
  | MenhirState0

# 4 "ParMichelson.mly"
  
open AbsMichelson
open Lexing


# 320 "ParMichelson.ml"

let rec _menhir_goto_data_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1109 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1107 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_data)), _, (_2 : 'tv_data_list)) = _menhir_stack in
        let _v : 'tv_ParMichelson_pair = 
# 67 "ParMichelson.mly"
                   ( DPairSeq2 (_1, _2) )
# 335 "ParMichelson.ml"
         in
        _menhir_goto_ParMichelson_pair _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1108)) : 'freshtv1110)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1113 * _menhir_state * 'tv_data)) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1111 * _menhir_state * 'tv_data)) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_data)), _, (_3 : 'tv_data_list)) = _menhir_stack in
        let _v : 'tv_data_list = 
# 43 "ParMichelson.mly"
                         ( (fun (x,xs) -> x::xs) (_1, _3) )
# 347 "ParMichelson.ml"
         in
        _menhir_goto_data_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1112)) : 'freshtv1114)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1121 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1117 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1115 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data_list)) = _menhir_stack in
            let _v : 'tv_data = 
# 57 "ParMichelson.mly"
                          ( DBlock _2 )
# 366 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1116)) : 'freshtv1118)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1119 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1120)) : 'freshtv1122)
    | _ ->
        _menhir_fail ()

and _menhir_goto_map_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_map_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1101 * _menhir_state) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1097 * _menhir_state) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1095 * _menhir_state) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_map_list)) = _menhir_stack in
            let _v : 'tv_data = 
# 58 "ParMichelson.mly"
                         ( DMap _2 )
# 399 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1096)) : 'freshtv1098)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1099 * _menhir_state) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1100)) : 'freshtv1102)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1105 * _menhir_state * 'tv_map)) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1103 * _menhir_state * 'tv_map)) * _menhir_state * 'tv_map_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_map)), _, (_3 : 'tv_map_list)) = _menhir_stack in
        let _v : 'tv_map_list = 
# 72 "ParMichelson.mly"
                       ( (fun (x,xs) -> x::xs) (_1, _3) )
# 418 "ParMichelson.ml"
         in
        _menhir_goto_map_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1104)) : 'freshtv1106)
    | _ ->
        _menhir_fail ()

and _menhir_run322 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState322

and _menhir_goto_ParMichelson_pair : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ParMichelson_pair -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1093 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ParMichelson_pair) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1091 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_ParMichelson_pair) : 'tv_ParMichelson_pair) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _v : 'tv_data = 
# 52 "ParMichelson.mly"
                 ( DPair _2 )
# 683 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1092)) : 'freshtv1094)

and _menhir_run316 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_data -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
    | SYMB1 | SYMB3 | TOK_EOF ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState316
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState316

and _menhir_reduce36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_data_list = 
# 42 "ParMichelson.mly"
                        ( []  )
# 938 "ParMichelson.ml"
     in
    _menhir_goto_data_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prog -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1089 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1081 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1079 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prog)) = _menhir_stack in
        let _v : 'tv_prog = 
# 37 "ParMichelson.mly"
                  (  _1 )
# 960 "ParMichelson.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1080)) : 'freshtv1082)
    | TOK_EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1085 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1083 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prog)) = _menhir_stack in
        let _v : (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 972 "ParMichelson.ml"
        ) = 
# 33 "ParMichelson.mly"
                     ( _1 )
# 976 "ParMichelson.ml"
         in
        _menhir_goto_pProg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1087 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1088)) : 'freshtv1090)

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 25 "ParMichelson.mly"
       (string)
# 990 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1077) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 25 "ParMichelson.mly"
       (string)
# 1000 "ParMichelson.ml"
    )) : (
# 25 "ParMichelson.mly"
       (string)
# 1004 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_str = 
# 253 "ParMichelson.mly"
              ( Str (_1))
# 1009 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1075) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_str) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1073) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_str) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1071) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_str) : 'tv_str) = _v in
    ((let _v : 'tv_data = 
# 47 "ParMichelson.mly"
        ( DStr _1 )
# 1026 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1072)) : 'freshtv1074)) : 'freshtv1076)) : 'freshtv1078)

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 26 "ParMichelson.mly"
       (string)
# 1033 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1069) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 26 "ParMichelson.mly"
       (string)
# 1043 "ParMichelson.ml"
    )) : (
# 26 "ParMichelson.mly"
       (string)
# 1047 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_hex = 
# 254 "ParMichelson.mly"
              ( Hex (_1))
# 1052 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1067) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_hex) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1065) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_hex) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1063) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_hex) : 'tv_hex) = _v in
    ((let _v : 'tv_data = 
# 48 "ParMichelson.mly"
        ( DByte _1 )
# 1069 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1064)) : 'freshtv1066)) : 'freshtv1068)) : 'freshtv1070)

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Elt ->
        _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | SYMB3 ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1061) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 49 "ParMichelson.mly"
            ( DUnit  )
# 1344 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1062)

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1059) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 50 "ParMichelson.mly"
            ( DTrue  )
# 1357 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1060)

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1057) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 56 "ParMichelson.mly"
            ( DNone  )
# 2105 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1058)

and _menhir_run304 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_False ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_Left ->
        _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304

and _menhir_run305 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1055) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 51 "ParMichelson.mly"
             ( DFalse  )
# 2363 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1056)

and _menhir_goto_typeSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typeSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1049 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1047 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typeSeq) : 'tv_typeSeq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_typ = 
# 214 "ParMichelson.mly"
                    ( TPair _2 )
# 2383 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1048)) : 'freshtv1050)
    | MenhirState75 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1053 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1051 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typeSeq) : 'tv_typeSeq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typeSeq = 
# 203 "ParMichelson.mly"
                ( TTypSeq2 (_1, _2) )
# 2399 "ParMichelson.ml"
         in
        _menhir_goto_typeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1052)) : 'freshtv1054)
    | _ ->
        _menhir_fail ()

and _menhir_reduce169 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_cTyp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)) = _menhir_stack in
    let _v : 'tv_typ = 
# 207 "ParMichelson.mly"
         ( TCtype _1 )
# 2411 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_cTypeSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cTypeSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState44 | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1041 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cTypeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1039 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_cTypeSeq) : 'tv_cTypeSeq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 248 "ParMichelson.mly"
                     ( CPair _2 )
# 2431 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1040)) : 'freshtv1042)
    | MenhirState76 | MenhirState36 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1045 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cTypeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1043 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_cTypeSeq) : 'tv_cTypeSeq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTypeSeq = 
# 229 "ParMichelson.mly"
                  ( CTypSeq2 (_1, _2) )
# 2447 "ParMichelson.ml"
         in
        _menhir_goto_cTypeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1044)) : 'freshtv1046)
    | _ ->
        _menhir_fail ()

and _menhir_goto_inte : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_inte -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1037) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_inte) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1035) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_inte) : 'tv_inte) = _v in
    ((let _v : 'tv_data = 
# 46 "ParMichelson.mly"
            ( DInt _1 )
# 2466 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1036)) : 'freshtv1038)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_data : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 53 "ParMichelson.mly"
                 ( DLeft _2 )
# 2488 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_False ->
            _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_Left ->
            _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState313 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState313 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState313 _v
        | SYMB1 | SYMB3 | TOK_EOF ->
            _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313) : 'freshtv990)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv995 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run316 _menhir_env (Obj.magic _menhir_stack)
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv991 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_data)), _, (_2 : 'tv_data)) = _menhir_stack in
            let _v : 'tv_ParMichelson_pair = 
# 66 "ParMichelson.mly"
                 ( DPairSeq1 (_1, _2) )
# 2752 "ParMichelson.ml"
             in
            _menhir_goto_ParMichelson_pair _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv993 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv994)) : 'freshtv996)
    | MenhirState111 | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv999 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run316 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv997 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv998)) : 'freshtv1000)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1003 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1001 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 54 "ParMichelson.mly"
                  ( DRight _2 )
# 2786 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)) : 'freshtv1004)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1007 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1005 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 55 "ParMichelson.mly"
                 ( DSome _2 )
# 2798 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1006)) : 'freshtv1008)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1009 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_False ->
            _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_Left ->
            _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState323) : 'freshtv1010)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1029 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1025 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1023 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)), _, (_3 : 'tv_data)) = _menhir_stack in
            let _v : 'tv_map = 
# 75 "ParMichelson.mly"
                             ( DMapSeq (_2, _3) )
# 3061 "ParMichelson.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1021) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_map) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1019 * _menhir_state * 'tv_map) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB1 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1013 * _menhir_state * 'tv_map) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_Elt ->
                    _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState329
                | SYMB3 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv1011) = Obj.magic _menhir_stack in
                    let (_menhir_s : _menhir_state) = MenhirState329 in
                    ((let _v : 'tv_map_list = 
# 70 "ParMichelson.mly"
                       ( []  )
# 3088 "ParMichelson.ml"
                     in
                    _menhir_goto_map_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1012)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState329) : 'freshtv1014)
            | SYMB3 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1015 * _menhir_state * 'tv_map) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_map)) = _menhir_stack in
                let _v : 'tv_map_list = 
# 71 "ParMichelson.mly"
        ( (fun x -> [x]) _1 )
# 3102 "ParMichelson.ml"
                 in
                _menhir_goto_map_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1016)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1017 * _menhir_state * 'tv_map) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1018)) : 'freshtv1020)) : 'freshtv1022)) : 'freshtv1024)) : 'freshtv1026)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1027 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1028)) : 'freshtv1030)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1033 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1031 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_instr = 
# 96 "ParMichelson.mly"
                     ( PUSH (_2, _3) )
# 3128 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1032)) : 'freshtv1034)
    | _ ->
        _menhir_fail ()

and _menhir_reduce153 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
    let _v : 'tv_instr_list = 
# 83 "ParMichelson.mly"
          ( (fun x -> [x]) _1 )
# 3140 "ParMichelson.ml"
     in
    _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run231 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | SYMB2 ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | SYMB1 | SYMB3 | TOK_EOF ->
        _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231

and _menhir_goto_instr_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instr_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv705 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv701 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv699 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 166 "ParMichelson.mly"
                                              ( CREATE_CONTRACT _3 )
# 3386 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)) : 'freshtv702)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv703 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv704)) : 'freshtv706)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv709 * _menhir_state * 'tv_instr)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv707 * _menhir_state * 'tv_instr)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_instr)), _, (_3 : 'tv_instr_list)) = _menhir_stack in
        let _v : 'tv_instr_list = 
# 84 "ParMichelson.mly"
                           ( (fun (x,xs) -> x::xs) (_1, _3) )
# 3405 "ParMichelson.ml"
         in
        _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv708)) : 'freshtv710)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv717 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv713 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv711 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 131 "ParMichelson.mly"
                                  ( DIP _3 )
# 3424 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)) : 'freshtv714)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv715 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv716)) : 'freshtv718)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv725 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv721 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv719 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)), _, (_4 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 132 "ParMichelson.mly"
                                      ( DIP_N (_2, _4) )
# 3450 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)) : 'freshtv722)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv723 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv724)) : 'freshtv726)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv735 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv731 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv727 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState241
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState241) : 'freshtv728)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv729 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)) : 'freshtv732)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv733 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv734)) : 'freshtv736)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv743 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv739 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv737 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 125 "ParMichelson.mly"
                                                        ( IF (_3, _6) )
# 3724 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)) : 'freshtv740)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv741 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv742)) : 'freshtv744)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv753 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv749 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv745 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState246
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv746)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv747 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv748)) : 'freshtv750)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv751 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv752)) : 'freshtv754)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv761 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv757 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv755 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 193 "ParMichelson.mly"
                                                             ( m_IFCMPEQ (_3, _6) )
# 3998 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)) : 'freshtv758)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv759 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv760)) : 'freshtv762)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv771 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv767 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv763 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState251
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251) : 'freshtv764)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv765 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv766)) : 'freshtv768)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv769 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv770)) : 'freshtv772)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv779 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv775 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv773 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 198 "ParMichelson.mly"
                                                             ( m_IFCMPGE (_3, _6) )
# 4272 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)) : 'freshtv776)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv777 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv778)) : 'freshtv780)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv789 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv785 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv781 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState256
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256) : 'freshtv782)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv783 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv787 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv797 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv793 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv791 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 196 "ParMichelson.mly"
                                                             ( m_IFCMPGT (_3, _6) )
# 4546 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv795 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv807 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv803 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv799 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState261
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState261) : 'freshtv800)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv801 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv802)) : 'freshtv804)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv805 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv806)) : 'freshtv808)
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv815 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv811 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv809 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 197 "ParMichelson.mly"
                                                             ( m_IFCMPLE (_3, _6) )
# 4820 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv813 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv814)) : 'freshtv816)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv825 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv821 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv817 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState266
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv818)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv819 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv820)) : 'freshtv822)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv823 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv824)) : 'freshtv826)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv833 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv829 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv827 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 195 "ParMichelson.mly"
                                                             ( m_IFCMPLT (_3, _6) )
# 5094 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)) : 'freshtv830)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv831 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)) : 'freshtv834)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv843 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv839 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv835 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState271
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271) : 'freshtv836)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv837 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv838)) : 'freshtv840)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv841 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv842)) : 'freshtv844)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv851 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv847 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv845 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 194 "ParMichelson.mly"
                                                              ( m_IFCMPNEQ (_3, _6) )
# 5368 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv846)) : 'freshtv848)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv849 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv850)) : 'freshtv852)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv861 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv857 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv853 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState276
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState276) : 'freshtv854)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv855 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv856)) : 'freshtv858)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv859 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv860)) : 'freshtv862)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv869 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv865 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv863 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 113 "ParMichelson.mly"
                                                             ( IF_CONS (_3, _6) )
# 5642 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv864)) : 'freshtv866)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv867 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv868)) : 'freshtv870)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv879 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv875 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv871 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState281
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState281) : 'freshtv872)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv873 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv874)) : 'freshtv876)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv877 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv878)) : 'freshtv880)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv887 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv883 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv881 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 110 "ParMichelson.mly"
                                                             ( IF_LEFT (_3, _6) )
# 5916 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)) : 'freshtv884)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv885 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv886)) : 'freshtv888)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv897 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv893 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv889 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState286
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286) : 'freshtv890)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv891 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv892)) : 'freshtv894)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv895 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv896)) : 'freshtv898)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv905 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv901 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv899 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 101 "ParMichelson.mly"
                                                             ( IF_NONE (_3, _6) )
# 6190 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv900)) : 'freshtv902)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv903 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv904)) : 'freshtv906)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv915 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv911 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv907 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_ADD ->
                    _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_ADDRESS ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_AMOUNT ->
                    _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_AND ->
                    _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_APPLY ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_BALANCE ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_BLAKE2B ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CAR ->
                    _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CAST ->
                    _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CDR ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CHAIN_ID ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CHECK_SIGNATURE ->
                    _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_COMPARE ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CONCAT ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CONS ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CONTRACT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_CREATE_CONTRACT ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_DIG ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_DIP ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_DROP ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_DUG ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_DUP ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EDIV ->
                    _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EMPTY_MAP ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EMPTY_SET ->
                    _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EQ ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_EXEC ->
                    _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_FAILWITH ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_GE ->
                    _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_GET ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_GT ->
                    _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_HASH_KEY ->
                    _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IF ->
                    _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPEQ ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPGE ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPGT ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPLE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPLT ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IFCMPNEQ ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IF_CONS ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IF_LEFT ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IF_NONE ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IF_SOME ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | SYMB3 ->
                    _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState291
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState291) : 'freshtv908)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv909 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv910)) : 'freshtv912)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv913 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv914)) : 'freshtv916)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv923 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv919 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv917 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 199 "ParMichelson.mly"
                                                             ( m_IF_SOME (_3, _6) )
# 6464 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv918)) : 'freshtv920)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv921 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv922)) : 'freshtv924)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv931 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv927 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv925 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 119 "ParMichelson.mly"
                                   ( ITER _3 )
# 6490 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv926)) : 'freshtv928)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv929 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv930)) : 'freshtv932)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv939 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv935 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv933 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)), _, (_5 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 128 "ParMichelson.mly"
                                             ( LAMBDA (_2, _3, _5) )
# 6516 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv934)) : 'freshtv936)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv937 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv938)) : 'freshtv940)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv947 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv943 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv941 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 126 "ParMichelson.mly"
                                   ( LOOP _3 )
# 6542 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv942)) : 'freshtv944)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv945 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv946)) : 'freshtv948)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv955 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv951 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv949 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 127 "ParMichelson.mly"
                                        ( LOOP_LEFT _3 )
# 6568 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv953 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv954)) : 'freshtv956)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv963 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv959 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv957 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 118 "ParMichelson.mly"
                                  ( MAP _3 )
# 6594 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)) : 'freshtv960)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv961 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv962)) : 'freshtv964)
    | MenhirState2 | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv971 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv967 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv965 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 88 "ParMichelson.mly"
                           ( BLOCK _2 )
# 6620 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv969 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv970)) : 'freshtv972)
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv979 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv975 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv973 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_5 : 'tv_typ)), _, (_9 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_prog = 
# 38 "ParMichelson.mly"
                                                                               ( Contract (_2, _5, _9) )
# 6646 "ParMichelson.ml"
             in
            _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv977 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv978)) : 'freshtv980)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv983 * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv981 * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_instr_list)) = _menhir_stack in
        let _v : 'tv_prog = 
# 39 "ParMichelson.mly"
               ( Code _1 )
# 6665 "ParMichelson.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | _ ->
        _menhir_fail ()

and _menhir_goto_pProg : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 6674 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv697) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 6683 "ParMichelson.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv695) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 6691 "ParMichelson.ml"
    )) : (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 6695 "ParMichelson.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv696)) : 'freshtv698)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv585 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv583 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 218 "ParMichelson.mly"
                        ( TBig_map (_2, _3) )
# 6712 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)) : 'freshtv586)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 209 "ParMichelson.mly"
                    ( TContract _2 )
# 6724 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv592)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv595 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv593 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 216 "ParMichelson.mly"
                      ( TLambda (_2, _3) )
# 6812 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 211 "ParMichelson.mly"
                ( TList _2 )
# 6824 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv603 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv601 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 217 "ParMichelson.mly"
                    ( TMap (_2, _3) )
# 6836 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv602)) : 'freshtv604)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv605 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 210 "ParMichelson.mly"
                  ( TOption _2 )
# 6848 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)) : 'freshtv608)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv609 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv610)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv613 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv611 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 215 "ParMichelson.mly"
                  ( TOr (_2, _3) )
# 6936 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv615 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv616)
    | MenhirState75 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | SYMB6 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv617 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typeSeq = 
# 202 "ParMichelson.mly"
                  ( TTypSeq1 (_1, _2) )
# 7094 "ParMichelson.ml"
             in
            _menhir_goto_typeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv618)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv620)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv627 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB6 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv623 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv621 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typ = 
# 206 "ParMichelson.mly"
                      (  _2 )
# 7117 "ParMichelson.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv622)) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv625 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv631 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv629 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 139 "ParMichelson.mly"
                  ( UNPACK _2 )
# 7136 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)) : 'freshtv632)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv635 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv633 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 109 "ParMichelson.mly"
                 ( RIGHT _2 )
# 7148 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv637 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_False ->
            _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_Left ->
            _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv638)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv639 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 98 "ParMichelson.mly"
                ( NONE _2 )
# 7404 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)) : 'freshtv642)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 111 "ParMichelson.mly"
               ( NIL _2 )
# 7416 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)) : 'freshtv646)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 108 "ParMichelson.mly"
                ( LEFT _2 )
# 7428 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv652)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv657 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB2 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv653 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_ABS ->
                _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ADD ->
                _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ADDRESS ->
                _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_AMOUNT ->
                _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_AND ->
                _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_APPLY ->
                _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_BALANCE ->
                _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_BLAKE2B ->
                _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CAR ->
                _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CAST ->
                _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CDR ->
                _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CHAIN_ID ->
                _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CHECK_SIGNATURE ->
                _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_COMPARE ->
                _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONCAT ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONS ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONTRACT ->
                _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CREATE_CONTRACT ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DIG ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DIP ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DROP ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DUG ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DUP ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EDIV ->
                _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_BIG_MAP ->
                _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_MAP ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_SET ->
                _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EQ ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EXEC ->
                _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_FAILWITH ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GE ->
                _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GET ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GT ->
                _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_HASH_KEY ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF ->
                _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPEQ ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPGE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPGT ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPLE ->
                _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPLT ->
                _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IFCMPNEQ ->
                _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_CONS ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_LEFT ->
                _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_NONE ->
                _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_SOME ->
                _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IMPLICIT_ACCOUNT ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_INT ->
                _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ISNAT ->
                _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ITER ->
                _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_JOIN_TICKETS ->
                _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_KECCAK ->
                _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LAMBDA ->
                _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LE ->
                _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LEFT ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LEVEL ->
                _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LOOP ->
                _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LOOP_LEFT ->
                _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LSL ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LSR ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_LT ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_MAP ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_MEM ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_MUL ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NEG ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NEQ ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NEVER ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NIL ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NONE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NOT ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_NOW ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_OPEN_CHEST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_OR ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_PACK ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_PAIR ->
                _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_PAIRING_CHECK ->
                _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_PUSH ->
                _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_READ_TICKET ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_RENAME ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_RIGHT ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SAPLING_EMPTY_STATE ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SAPLING_VERIFY_UPDATE ->
                _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SELF ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SELF_ADDRESS ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SENDER ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SET_DELEGATE ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SHA256 ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SHA3 ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SHA512 ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SIZE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SLICE ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SOME ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SOURCE ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SPLIT_TICKET ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SUB ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_SWAP ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_TICKET ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_TOTAL_VOTING_POWER ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_TRANSFER_TOKENS ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_UNIT ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_UNPACK ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_UNPAIR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_UPDATE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_VOTING_POWER ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_XOR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | SYMB2 ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | SYMB3 ->
                _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv654)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv655 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)) : 'freshtv658)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 116 "ParMichelson.mly"
                          ( EMPTY_MAP (_2, _3) )
# 7751 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)) : 'freshtv662)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv665 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv663 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 117 "ParMichelson.mly"
                              ( EMPTY_BIG_MAP (_2, _3) )
# 7763 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 163 "ParMichelson.mly"
                    ( CONTRACT _2 )
# 7775 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv668)) : 'freshtv670)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_storage ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv671 * _menhir_state) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_address ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_big_map ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_bls12_381_fr ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_bls12_381_g1 ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_bls12_381_g2 ->
                    _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_bool ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_bytes ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_chain_id ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_chest ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_chest_key ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_contract ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_int ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_key ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_key_hash ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_lambda ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_list ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_map ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_mutez ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_nat ->
                    _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_never ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_operation ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_option ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_or ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_pair ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_sapling_state ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_sapling_transaction ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_set ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_signature ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_string ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_ticket ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_timestamp ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | KW_unit ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | SYMB5 ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState340
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv672)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv673 * _menhir_state) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv674)) : 'freshtv676)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv693 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv689 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_code ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv685 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SYMB2 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv681 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | KW_ABS ->
                        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_ADD ->
                        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_ADDRESS ->
                        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_AMOUNT ->
                        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_AND ->
                        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_APPLY ->
                        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_BALANCE ->
                        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_BLAKE2B ->
                        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CAR ->
                        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CAST ->
                        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CDR ->
                        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CHAIN_ID ->
                        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CHECK_SIGNATURE ->
                        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_COMPARE ->
                        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CONCAT ->
                        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CONS ->
                        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CONTRACT ->
                        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_CREATE_CONTRACT ->
                        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_DIG ->
                        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_DIP ->
                        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_DROP ->
                        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_DUG ->
                        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_DUP ->
                        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EDIV ->
                        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EMPTY_BIG_MAP ->
                        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EMPTY_MAP ->
                        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EMPTY_SET ->
                        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EQ ->
                        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_EXEC ->
                        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_FAILWITH ->
                        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_GE ->
                        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_GET ->
                        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_GT ->
                        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_HASH_KEY ->
                        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IF ->
                        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPEQ ->
                        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPGE ->
                        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPGT ->
                        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPLE ->
                        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPLT ->
                        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IFCMPNEQ ->
                        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IF_CONS ->
                        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IF_LEFT ->
                        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IF_NONE ->
                        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IF_SOME ->
                        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_IMPLICIT_ACCOUNT ->
                        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_INT ->
                        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_ISNAT ->
                        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_ITER ->
                        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_JOIN_TICKETS ->
                        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_KECCAK ->
                        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LAMBDA ->
                        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LE ->
                        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LEFT ->
                        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LEVEL ->
                        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LOOP ->
                        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LOOP_LEFT ->
                        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LSL ->
                        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LSR ->
                        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_LT ->
                        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_MAP ->
                        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_MEM ->
                        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_MUL ->
                        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NEG ->
                        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NEQ ->
                        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NEVER ->
                        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NIL ->
                        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NONE ->
                        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NOT ->
                        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_NOW ->
                        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_OPEN_CHEST ->
                        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_OR ->
                        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_PACK ->
                        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_PAIR ->
                        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_PAIRING_CHECK ->
                        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_PUSH ->
                        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_READ_TICKET ->
                        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_RENAME ->
                        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_RIGHT ->
                        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SAPLING_EMPTY_STATE ->
                        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SAPLING_VERIFY_UPDATE ->
                        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SELF ->
                        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SELF_ADDRESS ->
                        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SENDER ->
                        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SET_DELEGATE ->
                        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SHA256 ->
                        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SHA3 ->
                        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SHA512 ->
                        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SIZE ->
                        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SLICE ->
                        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SOME ->
                        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SOURCE ->
                        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SPLIT_TICKET ->
                        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SUB ->
                        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_SWAP ->
                        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_TICKET ->
                        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_TOTAL_VOTING_POWER ->
                        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_TRANSFER_TOKENS ->
                        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_UNIT ->
                        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_UNPACK ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_UNPAIR ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_UPDATE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_VOTING_POWER ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | KW_XOR ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | SYMB2 ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | SYMB3 ->
                        _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState344
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState344) : 'freshtv682)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv683 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv684)) : 'freshtv686)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv687 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv688)) : 'freshtv690)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv691 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)
    | _ ->
        _menhir_fail ()

and _menhir_goto_cTyp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cTyp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 246 "ParMichelson.mly"
                   ( COption _2 )
# 8157 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv540)) : 'freshtv542)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_option ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_or ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_pair ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv544)
    | MenhirState71 | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv547 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv545 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 247 "ParMichelson.mly"
                    ( COr (_2, _3) )
# 8213 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)) : 'freshtv548)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_option ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_or ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_pair ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv550)
    | MenhirState76 | MenhirState36 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv553 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_option ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_or ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_pair ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | KW_big_map | KW_bls12_381_fr | KW_bls12_381_g1 | KW_bls12_381_g2 | KW_chest | KW_chest_key | KW_contract | KW_lambda | KW_list | KW_map | KW_operation | KW_sapling_state | KW_sapling_transaction | KW_set | KW_ticket | SYMB1 | SYMB2 | SYMB3 | SYMB4 | SYMB5 | SYMB6 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv551 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)), _, (_2 : 'tv_cTyp)) = _menhir_stack in
            let _v : 'tv_cTypeSeq = 
# 228 "ParMichelson.mly"
                     ( CTypSeq1 (_1, _2) )
# 8307 "ParMichelson.ml"
             in
            _menhir_goto_cTypeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv554)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv555 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_typ = 
# 213 "ParMichelson.mly"
                   ( TTicket _2 )
# 8323 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv561 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_typ = 
# 212 "ParMichelson.mly"
                ( TSet _2 )
# 8335 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)) : 'freshtv562)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv563 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv564)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv565 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv566)
    | MenhirState337 | MenhirState340 | MenhirState105 | MenhirState148 | MenhirState149 | MenhirState210 | MenhirState195 | MenhirState192 | MenhirState145 | MenhirState128 | MenhirState126 | MenhirState101 | MenhirState10 | MenhirState11 | MenhirState73 | MenhirState75 | MenhirState69 | MenhirState49 | MenhirState50 | MenhirState51 | MenhirState63 | MenhirState52 | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        (_menhir_reduce169 _menhir_env (Obj.magic _menhir_stack) : 'freshtv568)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        (_menhir_reduce169 _menhir_env (Obj.magic _menhir_stack) : 'freshtv570)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_option ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_or ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_pair ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | KW_big_map | KW_bls12_381_fr | KW_bls12_381_g1 | KW_bls12_381_g2 | KW_chest | KW_chest_key | KW_contract | KW_lambda | KW_list | KW_map | KW_operation | KW_sapling_state | KW_sapling_transaction | KW_set | KW_ticket | SYMB5 ->
            _menhir_reduce169 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv572)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv573 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_option ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_or ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_pair ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | KW_big_map | KW_bls12_381_fr | KW_bls12_381_g1 | KW_bls12_381_g2 | KW_chest | KW_chest_key | KW_contract | KW_lambda | KW_list | KW_map | KW_operation | KW_sapling_state | KW_sapling_transaction | KW_set | KW_ticket | SYMB5 ->
            _menhir_reduce169 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv574)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv577 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_instr = 
# 115 "ParMichelson.mly"
                      ( EMPTY_SET _2 )
# 8599 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)) : 'freshtv578)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192) : 'freshtv580)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv582)
    | _ ->
        _menhir_fail ()

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "ParMichelson.mly"
       (int)
# 8895 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 23 "ParMichelson.mly"
       (int)
# 8905 "ParMichelson.ml"
    )) : (
# 23 "ParMichelson.mly"
       (int)
# 8909 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_int = 
# 252 "ParMichelson.mly"
                    ( _1 )
# 8914 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_int) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv479 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 124 "ParMichelson.mly"
                  ( UPDATE_N _2 )
# 8931 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv481 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 107 "ParMichelson.mly"
                  ( UNPAIR_N _2 )
# 8943 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)) : 'freshtv484)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_typ = 
# 222 "ParMichelson.mly"
                               ( TSapling_transaction _2 )
# 8955 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv491 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv489 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_typ = 
# 223 "ParMichelson.mly"
                         ( TSapling_state _2 )
# 8967 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv490)) : 'freshtv492)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 186 "ParMichelson.mly"
                               ( SAPLING_EMPTY_STATE _2 )
# 8979 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)) : 'freshtv496)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_inte = 
# 79 "ParMichelson.mly"
              ( DIntNeg _2 )
# 8991 "ParMichelson.ml"
         in
        _menhir_goto_inte _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)) : 'freshtv500)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 103 "ParMichelson.mly"
                ( PAIR_N _2 )
# 9003 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)) : 'freshtv504)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 122 "ParMichelson.mly"
               ( GET_N _2 )
# 9015 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 92 "ParMichelson.mly"
               ( DUP_N _2 )
# 9027 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)) : 'freshtv512)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 95 "ParMichelson.mly"
               ( DUG_N _2 )
# 9039 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)) : 'freshtv516)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 90 "ParMichelson.mly"
                ( DROP_N _2 )
# 9051 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 94 "ParMichelson.mly"
               ( DIG_N _2 )
# 9063 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)) : 'freshtv524)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv529 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB2 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_ABS ->
                _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_ADD ->
                _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_ADDRESS ->
                _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_AMOUNT ->
                _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_AND ->
                _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_APPLY ->
                _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_BALANCE ->
                _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_BLAKE2B ->
                _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CAR ->
                _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CAST ->
                _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CDR ->
                _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CHAIN_ID ->
                _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CHECK_SIGNATURE ->
                _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_COMPARE ->
                _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CONCAT ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CONS ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CONTRACT ->
                _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_CREATE_CONTRACT ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_DIG ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_DIP ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_DROP ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_DUG ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_DUP ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EDIV ->
                _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EMPTY_BIG_MAP ->
                _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EMPTY_MAP ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EMPTY_SET ->
                _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EQ ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_EXEC ->
                _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_FAILWITH ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_GE ->
                _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_GET ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_GT ->
                _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_HASH_KEY ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IF ->
                _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPEQ ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPGE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPGT ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPLE ->
                _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPLT ->
                _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IFCMPNEQ ->
                _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IF_CONS ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IF_LEFT ->
                _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IF_NONE ->
                _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IF_SOME ->
                _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_IMPLICIT_ACCOUNT ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_INT ->
                _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_ISNAT ->
                _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_ITER ->
                _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_JOIN_TICKETS ->
                _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_KECCAK ->
                _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LAMBDA ->
                _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LE ->
                _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LEFT ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LEVEL ->
                _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LOOP ->
                _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LOOP_LEFT ->
                _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LSL ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LSR ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_LT ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_MAP ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_MEM ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_MUL ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NEG ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NEQ ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NEVER ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NIL ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NONE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NOT ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_NOW ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_OPEN_CHEST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_OR ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_PACK ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_PAIR ->
                _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_PAIRING_CHECK ->
                _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_PUSH ->
                _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_READ_TICKET ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_RENAME ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_RIGHT ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SAPLING_EMPTY_STATE ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SAPLING_VERIFY_UPDATE ->
                _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SELF ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SELF_ADDRESS ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SENDER ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SET_DELEGATE ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SHA256 ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SHA3 ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SHA512 ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SIZE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SLICE ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SOME ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SOURCE ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SPLIT_TICKET ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SUB ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_SWAP ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_TICKET ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_TOTAL_VOTING_POWER ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_TRANSFER_TOKENS ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_UNIT ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_UNPACK ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_UNPAIR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_UPDATE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_VOTING_POWER ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | KW_XOR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | SYMB2 ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | SYMB3 ->
                _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState236
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv526)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)) : 'freshtv530)
    | MenhirState106 | MenhirState111 | MenhirState323 | MenhirState322 | MenhirState114 | MenhirState115 | MenhirState316 | MenhirState313 | MenhirState116 | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv533 * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_inte = 
# 78 "ParMichelson.mly"
           ( DIntPos _1 )
# 9310 "ParMichelson.ml"
         in
        _menhir_goto_inte _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)) : 'freshtv534)
    | _ ->
        _menhir_fail ()) : 'freshtv536)) : 'freshtv538)

and _menhir_goto_instr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState344 | MenhirState2 | MenhirState136 | MenhirState141 | MenhirState143 | MenhirState151 | MenhirState155 | MenhirState160 | MenhirState291 | MenhirState162 | MenhirState286 | MenhirState164 | MenhirState281 | MenhirState166 | MenhirState276 | MenhirState168 | MenhirState271 | MenhirState170 | MenhirState266 | MenhirState172 | MenhirState261 | MenhirState174 | MenhirState256 | MenhirState176 | MenhirState251 | MenhirState178 | MenhirState246 | MenhirState180 | MenhirState241 | MenhirState236 | MenhirState205 | MenhirState231 | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack)
        | SYMB3 | TOK_EOF ->
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv459 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | MenhirState106 | MenhirState323 | MenhirState322 | MenhirState114 | MenhirState115 | MenhirState316 | MenhirState313 | MenhirState116 | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv465 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv463 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
            let _v : 'tv_instr = 
# 87 "ParMichelson.mly"
                    (  _1 )
# 9353 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)) : 'freshtv466)
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv467 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
            let _v : 'tv_data = 
# 59 "ParMichelson.mly"
          ( DInstruction _1 )
# 9363 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv469 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack)
        | SYMB3 ->
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv473 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)) : 'freshtv476)
    | _ ->
        _menhir_fail ()

and _menhir_reduce152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_instr_list = 
# 82 "ParMichelson.mly"
                         ( []  )
# 9398 "ParMichelson.ml"
     in
    _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SYMB2 ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SYMB3 ->
        _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv257 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv259 * _menhir_state) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * 'tv_map)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state * 'tv_data)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv275 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv277 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv279 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv281 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv283 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv285 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv287 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv289 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv291 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv293 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv295 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv297 * _menhir_state) * _menhir_state * 'tv_int)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv299 * _menhir_state * 'tv_instr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv317 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv347 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv349 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv353 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv355 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv363 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv365 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv384)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv392)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv396)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv397 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv399 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv408)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv413 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv415 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv417 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv420)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv423 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv425 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv426)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv427 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv428)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv429 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv431 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv434)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv435 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv437 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv439 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv440)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv441 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv444)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv446)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453) = Obj.magic _menhir_stack in
        let (_endpos__1_ : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _v : (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 10134 "ParMichelson.ml"
        ) = let _endpos = _endpos__1_ in
        let _symbolstartpos = _startpos__1_ in
        
# 34 "ParMichelson.mly"
          ( raise (BNFC_Util.Parse_error (_symbolstartpos, _endpos)) )
# 10140 "ParMichelson.ml"
         in
        _menhir_goto_pProg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)) : 'freshtv458)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv255) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 232 "ParMichelson.mly"
               ( CUnit  )
# 10230 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv253) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 244 "ParMichelson.mly"
                 ( CTimestamp  )
# 10243 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv251) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 237 "ParMichelson.mly"
              ( CString  )
# 10301 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 243 "ParMichelson.mly"
                 ( CSignature  )
# 10314 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 208 "ParMichelson.mly"
                 ( TOperation  )
# 10629 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv248)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv245) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 233 "ParMichelson.mly"
             ( CNever  )
# 10642 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 236 "ParMichelson.mly"
           ( CNat  )
# 10655 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 240 "ParMichelson.mly"
             ( CMutez  )
# 10668 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 241 "ParMichelson.mly"
                ( CKey_hash  )
# 10880 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 242 "ParMichelson.mly"
           ( CKey  )
# 10893 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 235 "ParMichelson.mly"
           ( CInt  )
# 10906 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv236)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 225 "ParMichelson.mly"
                 ( TChest_key  )
# 10996 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 224 "ParMichelson.mly"
             ( TChest  )
# 11009 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 238 "ParMichelson.mly"
                ( CChain_id  )
# 11022 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 239 "ParMichelson.mly"
             ( CBytes  )
# 11035 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 234 "ParMichelson.mly"
            ( CBool  )
# 11048 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 220 "ParMichelson.mly"
                    ( TBls_g2  )
# 11061 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 219 "ParMichelson.mly"
                    ( TBls_g1  )
# 11074 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 221 "ParMichelson.mly"
                    ( TBls_fr  )
# 11087 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 245 "ParMichelson.mly"
               ( CAddress  )
# 11145 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 152 "ParMichelson.mly"
           ( XOR  )
# 11158 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 168 "ParMichelson.mly"
                    ( VOTING_POWER  )
# 11171 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 123 "ParMichelson.mly"
              ( UPDATE  )
# 11190 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 106 "ParMichelson.mly"
              ( UNPAIR  )
# 11213 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv207) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 99 "ParMichelson.mly"
            ( UNIT  )
# 11307 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv205) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 164 "ParMichelson.mly"
                       ( TRANSFER_TOKENS  )
# 11320 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv206)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv203) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 184 "ParMichelson.mly"
                          ( TOTAL_VOTING_POWER  )
# 11333 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 188 "ParMichelson.mly"
              ( TICKET  )
# 11346 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 93 "ParMichelson.mly"
            ( SWAP  )
# 11359 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 141 "ParMichelson.mly"
           ( SUB  )
# 11372 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv195) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 190 "ParMichelson.mly"
                    ( SPLIT_TICKET  )
# 11385 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 180 "ParMichelson.mly"
              ( SOURCE  )
# 11398 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv191) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 97 "ParMichelson.mly"
            ( SOME  )
# 11411 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv192)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv189) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 137 "ParMichelson.mly"
             ( SLICE  )
# 11424 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 114 "ParMichelson.mly"
            ( SIZE  )
# 11437 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv185) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 178 "ParMichelson.mly"
              ( SHA512  )
# 11450 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv183) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 176 "ParMichelson.mly"
            ( SHA3  )
# 11463 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv181) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 177 "ParMichelson.mly"
              ( SHA256  )
# 11476 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 165 "ParMichelson.mly"
                    ( SET_DELEGATE  )
# 11489 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 181 "ParMichelson.mly"
              ( SENDER  )
# 11502 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 162 "ParMichelson.mly"
                    ( SELF_ADDRESS  )
# 11515 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 161 "ParMichelson.mly"
            ( SELF  )
# 11528 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv171) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 187 "ParMichelson.mly"
                             ( SAPLING_VERIFY_UPDATE  )
# 11541 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 135 "ParMichelson.mly"
              ( RENAME  )
# 11644 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 189 "ParMichelson.mly"
                   ( READ_TICKET  )
# 11657 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run117 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 185 "ParMichelson.mly"
                     ( PAIRING_CHECK  )
# 11747 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)

and _menhir_run118 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 102 "ParMichelson.mly"
            ( PAIR  )
# 11766 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv164)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 138 "ParMichelson.mly"
            ( PACK  )
# 11783 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)

and _menhir_run121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 150 "ParMichelson.mly"
          ( OR  )
# 11796 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 192 "ParMichelson.mly"
                  ( OPEN_CHEST  )
# 11809 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 169 "ParMichelson.mly"
           ( NOW  )
# 11822 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 153 "ParMichelson.mly"
           ( NOT  )
# 11835 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)

and _menhir_run126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 100 "ParMichelson.mly"
             ( NEVER  )
# 12002 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 156 "ParMichelson.mly"
           ( NEQ  )
# 12015 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 147 "ParMichelson.mly"
           ( NEG  )
# 12028 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 142 "ParMichelson.mly"
           ( MUL  )
# 12041 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 120 "ParMichelson.mly"
           ( MEM  )
# 12054 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv140)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 157 "ParMichelson.mly"
          ( LT  )
# 12303 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 149 "ParMichelson.mly"
           ( LSR  )
# 12316 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 148 "ParMichelson.mly"
           ( LSL  )
# 12329 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv134)

and _menhir_run140 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv130)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv126)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 170 "ParMichelson.mly"
             ( LEVEL  )
# 12814 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv124)

and _menhir_run145 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState145
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145

and _menhir_run147 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv121) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 159 "ParMichelson.mly"
          ( LE  )
# 12904 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)

and _menhir_run148 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148

and _menhir_run152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 175 "ParMichelson.mly"
              ( KECCAK  )
# 12994 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 191 "ParMichelson.mly"
                    ( JOIN_TICKETS  )
# 13007 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv114)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 145 "ParMichelson.mly"
             ( SNAT  )
# 13256 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 146 "ParMichelson.mly"
           ( INT  )
# 13269 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)

and _menhir_run158 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 167 "ParMichelson.mly"
                        ( IMPLICIT_ACCOUNT  )
# 13282 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)

and _menhir_run159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv104)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)

and _menhir_run161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv100)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv96)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)

and _menhir_run165 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv92)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)

and _menhir_run167 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168) : 'freshtv88)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)

and _menhir_run169 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv84)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)

and _menhir_run171 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv80)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv76)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv72)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_run179 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv64)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 179 "ParMichelson.mly"
                ( HASH_KEY  )
# 15891 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv62)

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 158 "ParMichelson.mly"
          ( GT  )
# 15904 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 121 "ParMichelson.mly"
           ( GET  )
# 15923 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 160 "ParMichelson.mly"
          ( GE  )
# 15940 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 133 "ParMichelson.mly"
                ( FAILWITH  )
# 15953 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)

and _menhir_run187 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 129 "ParMichelson.mly"
            ( EXEC  )
# 15966 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv52)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv49) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 155 "ParMichelson.mly"
          ( EQ  )
# 15979 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv50)

and _menhir_run189 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191

and _menhir_run194 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState194
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194

and _menhir_run197 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 143 "ParMichelson.mly"
            ( EDIC  )
# 16127 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv48)

and _menhir_run198 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 91 "ParMichelson.mly"
           ( DUP  )
# 16146 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198

and _menhir_run200 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200

and _menhir_run202 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IFCMPEQ | KW_IFCMPGE | KW_IFCMPGT | KW_IFCMPLE | KW_IFCMPLT | KW_IFCMPNEQ | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IF_SOME | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 89 "ParMichelson.mly"
            ( DROP  )
# 16182 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202

and _menhir_run204 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState204 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv42)
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206

and _menhir_run208 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_ADD ->
            _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_ADDRESS ->
            _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_AMOUNT ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_AND ->
            _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_APPLY ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_BALANCE ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_BLAKE2B ->
            _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CAR ->
            _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CAST ->
            _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CDR ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CHAIN_ID ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CHECK_SIGNATURE ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_COMPARE ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CONCAT ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CONS ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CONTRACT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_CREATE_CONTRACT ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_DIG ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_DIP ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_DROP ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_DUG ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_DUP ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EDIV ->
            _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EMPTY_BIG_MAP ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EMPTY_MAP ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EMPTY_SET ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EQ ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_EXEC ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_FAILWITH ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_GE ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_GET ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_GT ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_HASH_KEY ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IF ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPEQ ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPGE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPGT ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPLE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPLT ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IFCMPNEQ ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IF_CONS ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IF_LEFT ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IF_NONE ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IF_SOME ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | SYMB3 ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv38)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)

and _menhir_run210 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState210
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210

and _menhir_run212 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 112 "ParMichelson.mly"
            ( CONS  )
# 16762 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv36)

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 136 "ParMichelson.mly"
              ( CONCAT  )
# 16775 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run214 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 154 "ParMichelson.mly"
               ( COMPARE  )
# 16788 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)

and _menhir_run215 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 173 "ParMichelson.mly"
                       ( CHECK_SIGNATURE  )
# 16801 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv30)

and _menhir_run216 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 183 "ParMichelson.mly"
                ( CHAIN_ID  )
# 16814 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run217 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 105 "ParMichelson.mly"
           ( CDR  )
# 16827 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run218 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 134 "ParMichelson.mly"
            ( CAST  )
# 16840 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run219 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 104 "ParMichelson.mly"
           ( CAR  )
# 16853 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run220 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 174 "ParMichelson.mly"
               ( BLAKE2B  )
# 16866 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)

and _menhir_run221 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 172 "ParMichelson.mly"
               ( BALANCE  )
# 16879 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)

and _menhir_run222 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 130 "ParMichelson.mly"
             ( APPLY  )
# 16892 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)

and _menhir_run223 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 151 "ParMichelson.mly"
           ( AND  )
# 16905 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run224 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 171 "ParMichelson.mly"
              ( AMOUNT  )
# 16918 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run225 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 182 "ParMichelson.mly"
               ( ADDRESS  )
# 16931 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run226 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 140 "ParMichelson.mly"
           ( ADD  )
# 16944 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run227 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 144 "ParMichelson.mly"
           ( ABS  )
# 16957 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and pProg : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 29 "ParMichelson.mly"
      (AbsMichelson.prog)
# 16976 "ParMichelson.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ADD ->
        _menhir_run226 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ADDRESS ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_AMOUNT ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_AND ->
        _menhir_run223 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_APPLY ->
        _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_BALANCE ->
        _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_BLAKE2B ->
        _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CAR ->
        _menhir_run219 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CAST ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CDR ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CHAIN_ID ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CHECK_SIGNATURE ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_COMPARE ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONCAT ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONS ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONTRACT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CREATE_CONTRACT ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DIG ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DIP ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DROP ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DUG ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DUP ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EDIV ->
        _menhir_run197 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_BIG_MAP ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_MAP ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_SET ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EQ ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EXEC ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_FAILWITH ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GE ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GET ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GT ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_HASH_KEY ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPEQ ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPGE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPGT ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPLE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPLT ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IFCMPNEQ ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_CONS ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_LEFT ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_NONE ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_SOME ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_parameter ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState337) : 'freshtv2)
    | SYMB2 ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SYMB1 | TOK_EOF ->
        _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv4))

# 269 "<standard.mly>"
  

# 17288 "ParMichelson.ml"
