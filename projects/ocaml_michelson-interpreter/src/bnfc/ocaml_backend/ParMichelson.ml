
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TOK_String of (
# 22 "ParMichelson.mly"
       (string)
# 11 "ParMichelson.ml"
  )
    | TOK_Str of (
# 23 "ParMichelson.mly"
       (string)
# 16 "ParMichelson.ml"
  )
    | TOK_Integer of (
# 21 "ParMichelson.mly"
       (int)
# 21 "ParMichelson.ml"
  )
    | TOK_Ident of (
# 18 "ParMichelson.mly"
       (string)
# 26 "ParMichelson.ml"
  )
    | TOK_Hex of (
# 24 "ParMichelson.mly"
       (string)
# 31 "ParMichelson.ml"
  )
    | TOK_EOF
    | TOK_Double of (
# 20 "ParMichelson.mly"
       (float)
# 37 "ParMichelson.ml"
  )
    | TOK_Char of (
# 19 "ParMichelson.mly"
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
    | KW_IF_NONE
    | KW_IF_LEFT
    | KW_IF_CONS
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
  | MenhirState293
  | MenhirState289
  | MenhirState286
  | MenhirState283
  | MenhirState273
  | MenhirState271
  | MenhirState270
  | MenhirState267
  | MenhirState265
  | MenhirState255
  | MenhirState242
  | MenhirState237
  | MenhirState232
  | MenhirState227
  | MenhirState222
  | MenhirState217
  | MenhirState196
  | MenhirState195
  | MenhirState192
  | MenhirState191
  | MenhirState190
  | MenhirState188
  | MenhirState186
  | MenhirState184
  | MenhirState181
  | MenhirState180
  | MenhirState178
  | MenhirState177
  | MenhirState175
  | MenhirState169
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

# 2 "ParMichelson.mly"
  
open AbsMichelson
open Lexing


# 300 "ParMichelson.ml"

let rec _menhir_goto_data_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv919 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv915 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv913 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data_list)) = _menhir_stack in
            let _v : 'tv_data = 
# 66 "ParMichelson.mly"
                          ( DBlock _2 )
# 322 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv914)) : 'freshtv916)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv917 * _menhir_state) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv918)) : 'freshtv920)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv923 * _menhir_state * 'tv_data)) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv921 * _menhir_state * 'tv_data)) * _menhir_state * 'tv_data_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_data)), _, (_3 : 'tv_data_list)) = _menhir_stack in
        let _v : 'tv_data_list = 
# 44 "ParMichelson.mly"
                         ( (fun (x,xs) -> x::xs) (_1, _3) )
# 341 "ParMichelson.ml"
         in
        _menhir_goto_data_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv922)) : 'freshtv924)
    | _ ->
        _menhir_fail ()

and _menhir_reduce34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_data_list = 
# 43 "ParMichelson.mly"
                        ( []  )
# 352 "ParMichelson.ml"
     in
    _menhir_goto_data_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_mapSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mapSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv903 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data)) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv901 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data)) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)), _, (_3 : 'tv_data)), _, (_5 : 'tv_mapSeq)) = _menhir_stack in
        let _v : 'tv_mapSeq = 
# 52 "ParMichelson.mly"
                                  ( DMapSeq2 (_2, _3, _5) )
# 369 "ParMichelson.ml"
         in
        _menhir_goto_mapSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)) : 'freshtv904)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv911 * _menhir_state) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv907 * _menhir_state) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv905 * _menhir_state) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_mapSeq)) = _menhir_stack in
            let _v : 'tv_data = 
# 67 "ParMichelson.mly"
                       ( DMap _2 )
# 388 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv906)) : 'freshtv908)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv909 * _menhir_state) * _menhir_state * 'tv_mapSeq) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv910)) : 'freshtv912)
    | _ ->
        _menhir_fail ()

and _menhir_run270 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_IF_NONE ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_Left ->
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState270
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState270

and _menhir_goto_pairSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_pairSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv895 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_pairSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv893 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_pairSeq) : 'tv_pairSeq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_data = 
# 61 "ParMichelson.mly"
                    ( DPair2 _2 )
# 648 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState267 | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv899 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_pairSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv897 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_pairSeq) : 'tv_pairSeq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_pairSeq = 
# 48 "ParMichelson.mly"
                 ( DPairSeq2 (_1, _2) )
# 664 "ParMichelson.ml"
         in
        _menhir_goto_pairSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)
    | _ ->
        _menhir_fail ()

and _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prog -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv891 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv887 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv885 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prog)) = _menhir_stack in
        let _v : (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 687 "ParMichelson.ml"
        ) = 
# 31 "ParMichelson.mly"
                     ( _1 )
# 691 "ParMichelson.ml"
         in
        _menhir_goto_pProg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv889 * _menhir_state * 'tv_prog) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv890)) : 'freshtv892)

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "ParMichelson.mly"
       (string)
# 705 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv883) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 23 "ParMichelson.mly"
       (string)
# 715 "ParMichelson.ml"
    )) : (
# 23 "ParMichelson.mly"
       (string)
# 719 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_str = 
# 235 "ParMichelson.mly"
              ( Str (_1))
# 724 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv881) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_str) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv879) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_str) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv877) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_str) : 'tv_str) = _v in
    ((let _v : 'tv_data = 
# 56 "ParMichelson.mly"
        ( DStr _1 )
# 741 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv878)) : 'freshtv880)) : 'freshtv882)) : 'freshtv884)

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 24 "ParMichelson.mly"
       (string)
# 748 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv875) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 24 "ParMichelson.mly"
       (string)
# 758 "ParMichelson.ml"
    )) : (
# 24 "ParMichelson.mly"
       (string)
# 762 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_hex = 
# 236 "ParMichelson.mly"
              ( Hex (_1))
# 767 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv873) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_hex) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv871) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_hex) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_hex) : 'tv_hex) = _v in
    ((let _v : 'tv_data = 
# 57 "ParMichelson.mly"
        ( DByte _1 )
# 784 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)) : 'freshtv872)) : 'freshtv874)) : 'freshtv876)

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
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_Elt ->
        _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | KW_IF_NONE ->
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
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState111
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
        _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 58 "ParMichelson.mly"
            ( DUnit  )
# 1045 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv865) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 59 "ParMichelson.mly"
            ( DTrue  )
# 1058 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | KW_IF_NONE ->
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
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState114
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
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | KW_IF_NONE ->
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
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState115
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
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | KW_IF_NONE ->
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
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState116
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
    let (_menhir_stack : 'freshtv863) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 65 "ParMichelson.mly"
            ( DNone  )
# 1764 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv864)

and _menhir_run255 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_False ->
        _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_IF_NONE ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_Left ->
        _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_None ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_Pair ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_Right ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_Some ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_True ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_Unit ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | SYMB2 ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | SYMB4 ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState255
    | TOK_Hex _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
    | TOK_Str _v ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState255

and _menhir_run256 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv861) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_data = 
# 60 "ParMichelson.mly"
             ( DFalse  )
# 2008 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)

and _menhir_goto_typeSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typeSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv853 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typeSeq) : 'tv_typeSeq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_typ = 
# 196 "ParMichelson.mly"
                    ( TPair _2 )
# 2028 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv854)) : 'freshtv856)
    | MenhirState75 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typeSeq) : 'tv_typeSeq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typeSeq = 
# 185 "ParMichelson.mly"
                ( TTypSeq2 (_1, _2) )
# 2044 "ParMichelson.ml"
         in
        _menhir_goto_typeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv858)) : 'freshtv860)
    | _ ->
        _menhir_fail ()

and _menhir_reduce159 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_cTyp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)) = _menhir_stack in
    let _v : 'tv_typ = 
# 189 "ParMichelson.mly"
         ( TCtype _1 )
# 2056 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_cTypeSeq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cTypeSeq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState44 | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cTypeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv845 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_cTypeSeq) : 'tv_cTypeSeq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 230 "ParMichelson.mly"
                     ( CPair _2 )
# 2076 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv846)) : 'freshtv848)
    | MenhirState76 | MenhirState36 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv851 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cTypeSeq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_cTypeSeq) : 'tv_cTypeSeq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTypeSeq = 
# 211 "ParMichelson.mly"
                  ( CTypSeq2 (_1, _2) )
# 2092 "ParMichelson.ml"
         in
        _menhir_goto_cTypeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)) : 'freshtv852)
    | _ ->
        _menhir_fail ()

and _menhir_goto_inta : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_inta -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv843) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_inta) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv841) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_inta) : 'tv_inta) = _v in
    ((let _v : 'tv_data = 
# 55 "ParMichelson.mly"
            ( DInt _1 )
# 2111 "ParMichelson.ml"
     in
    _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_data : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv803 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 62 "ParMichelson.mly"
                 ( DLeft _2 )
# 2133 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)) : 'freshtv806)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_False ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_IF_NONE ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_Left ->
            _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv808)
    | MenhirState267 | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_False ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_IF_NONE ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_Left ->
            _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
        | SYMB1 | SYMB3 | TOK_EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv809 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_data)), _, (_2 : 'tv_data)) = _menhir_stack in
            let _v : 'tv_pairSeq = 
# 47 "ParMichelson.mly"
                    ( DPairSeq1 (_1, _2) )
# 2599 "ParMichelson.ml"
             in
            _menhir_goto_pairSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267) : 'freshtv812)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv815 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv813 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 63 "ParMichelson.mly"
                  ( DRight _2 )
# 2615 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)) : 'freshtv816)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv819 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv817 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_data = 
# 64 "ParMichelson.mly"
                 ( DSome _2 )
# 2627 "ParMichelson.ml"
         in
        _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
    | MenhirState270 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv821 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_False ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_IF_NONE ->
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
        | KW_Left ->
            _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState271
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
        | KW_None ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState271
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
        | KW_Pair ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_Right ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState271
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
        | KW_Some ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_True ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_Unit ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | SYMB2 ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | SYMB4 ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | TOK_Hex _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | TOK_Integer _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | TOK_Str _v ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271) : 'freshtv822)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv829 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv825 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_Elt ->
                _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState273
            | SYMB3 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv823 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data)) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_data)), _, (_3 : 'tv_data)) = _menhir_stack in
                let _v : 'tv_mapSeq = 
# 51 "ParMichelson.mly"
                                ( DMapSeq1 (_2, _3) )
# 2881 "ParMichelson.ml"
                 in
                _menhir_goto_mapSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273) : 'freshtv826)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv827 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv828)) : 'freshtv830)
    | MenhirState283 | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv831 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_ABS ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_ADD ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_ADDRESS ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_AMOUNT ->
                _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_AND ->
                _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_APPLY ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_BALANCE ->
                _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_BLAKE2B ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CAR ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CAST ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CDR ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CHAIN_ID ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CHECK_SIGNATURE ->
                _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_COMPARE ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CONCAT ->
                _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CONS ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CONTRACT ->
                _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_CREATE_CONTRACT ->
                _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_DIG ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_DIP ->
                _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_DROP ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_DUG ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_DUP ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EDIV ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EMPTY_BIG_MAP ->
                _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EMPTY_MAP ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EMPTY_SET ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EQ ->
                _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_EXEC ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_FAILWITH ->
                _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_False ->
                _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_GE ->
                _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_GET ->
                _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_GT ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_HASH_KEY ->
                _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_IF ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_IF_CONS ->
                _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_IF_LEFT ->
                _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_IF_NONE ->
                _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_IMPLICIT_ACCOUNT ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_INT ->
                _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_ISNAT ->
                _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_ITER ->
                _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_JOIN_TICKETS ->
                _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_KECCAK ->
                _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LAMBDA ->
                _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LE ->
                _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LEFT ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LEVEL ->
                _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LOOP ->
                _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LOOP_LEFT ->
                _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LSL ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LSR ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_LT ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_Left ->
                _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_MAP ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_MEM ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_MUL ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NEG ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NEQ ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NEVER ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NIL ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NONE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NOT ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_NOW ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_None ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_OPEN_CHEST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_OR ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_PACK ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_PAIR ->
                _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_PAIRING_CHECK ->
                _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_PUSH ->
                _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_Pair ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_READ_TICKET ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_RENAME ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_RIGHT ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_Right ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SAPLING_EMPTY_STATE ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SAPLING_VERIFY_UPDATE ->
                _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SELF ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SELF_ADDRESS ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SENDER ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SET_DELEGATE ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SHA256 ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SHA3 ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SHA512 ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SIZE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SLICE ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SOME ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SOURCE ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SPLIT_TICKET ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SUB ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_SWAP ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_Some ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_TICKET ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_TOTAL_VOTING_POWER ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_TRANSFER_TOKENS ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_True ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_UNIT ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_UNPACK ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_UNPAIR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_UPDATE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_Unit ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_VOTING_POWER ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | KW_XOR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | SYMB2 ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | SYMB4 ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | TOK_Hex _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
            | TOK_Integer _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
            | TOK_Str _v ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
            | SYMB3 ->
                _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState283
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState283) : 'freshtv832)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv833 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv834)) : 'freshtv836)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv839 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv837 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_data)) = _menhir_stack in
        let _v : 'tv_instr = 
# 85 "ParMichelson.mly"
                     ( IPUSH (_2, _3) )
# 3149 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv838)) : 'freshtv840)
    | _ ->
        _menhir_fail ()

and _menhir_reduce37 : _menhir_env -> ('ttv_tail * _menhir_state * 'tv_instr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
    let _v : 'tv_instr = 
# 76 "ParMichelson.mly"
                    (  _1 )
# 3161 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce144 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
    let _v : 'tv_instr_list = 
# 72 "ParMichelson.mly"
          ( (fun x -> [x]) _1 )
# 3171 "ParMichelson.ml"
     in
    _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run217 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_IF_NONE ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_IMPLICIT_ACCOUNT ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_INT ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_ISNAT ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_ITER ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_JOIN_TICKETS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_KECCAK ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LAMBDA ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LE ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LEFT ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LEVEL ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LOOP ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LOOP_LEFT ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LSL ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LSR ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_LT ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_MAP ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_MEM ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_MUL ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NEG ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NEQ ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NEVER ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NIL ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NONE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NOT ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_NOW ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_OPEN_CHEST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_OR ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_PACK ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_PAIR ->
        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_PAIRING_CHECK ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_PUSH ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_READ_TICKET ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_RENAME ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_RIGHT ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SAPLING_EMPTY_STATE ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SAPLING_VERIFY_UPDATE ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SELF ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SELF_ADDRESS ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SENDER ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SET_DELEGATE ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SHA256 ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SHA3 ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SHA512 ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SIZE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SLICE ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SOME ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SOURCE ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SPLIT_TICKET ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SUB ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_SWAP ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_TICKET ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_TOTAL_VOTING_POWER ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_TRANSFER_TOKENS ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_UNIT ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_UNPACK ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_UNPAIR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_UPDATE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_VOTING_POWER ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | KW_XOR ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | SYMB2 ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | SYMB3 | TOK_EOF ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState217
    | SYMB1 ->
        _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217

and _menhir_goto_instr_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instr_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv649 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv645 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv643 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 155 "ParMichelson.mly"
                                              ( ICREATE_CONTRACT _3 )
# 3405 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)) : 'freshtv646)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv647 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)) : 'freshtv650)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv653 * _menhir_state * 'tv_instr)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv651 * _menhir_state * 'tv_instr)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_instr)), _, (_3 : 'tv_instr_list)) = _menhir_stack in
        let _v : 'tv_instr_list = 
# 73 "ParMichelson.mly"
                           ( (fun (x,xs) -> x::xs) (_1, _3) )
# 3424 "ParMichelson.ml"
         in
        _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv652)) : 'freshtv654)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv657 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv655 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 120 "ParMichelson.mly"
                                  ( IDIP _3 )
# 3443 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv656)) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv659 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv669 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv665 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv663 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)), _, (_4 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 121 "ParMichelson.mly"
                                      ( IDIP_N (_2, _4) )
# 3469 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv667 * _menhir_state) * _menhir_state * 'tv_int)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv668)) : 'freshtv670)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv679 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv675 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv671 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_ADD ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_ADDRESS ->
                    _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_AMOUNT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_AND ->
                    _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_APPLY ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_BALANCE ->
                    _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_BLAKE2B ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CAR ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CAST ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CDR ->
                    _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CHAIN_ID ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CHECK_SIGNATURE ->
                    _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_COMPARE ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CONCAT ->
                    _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CONS ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CONTRACT ->
                    _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_CREATE_CONTRACT ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_DIG ->
                    _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_DIP ->
                    _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_DROP ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_DUG ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_DUP ->
                    _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EDIV ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EMPTY_MAP ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EMPTY_SET ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EQ ->
                    _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_EXEC ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_FAILWITH ->
                    _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_GE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_GET ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_GT ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_HASH_KEY ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_IF ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_IF_CONS ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_IF_LEFT ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_IF_NONE ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | SYMB3 ->
                    _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState227
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227) : 'freshtv672)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv673 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv674)) : 'freshtv676)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv677 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv687 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv683 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv681 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 114 "ParMichelson.mly"
                                                        ( IIF (_3, _6) )
# 3729 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv682)) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv685 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv686)) : 'freshtv688)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv697 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv693 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv689 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_ADD ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_ADDRESS ->
                    _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_AMOUNT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_AND ->
                    _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_APPLY ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_BALANCE ->
                    _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_BLAKE2B ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CAR ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CAST ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CDR ->
                    _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CHAIN_ID ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CHECK_SIGNATURE ->
                    _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_COMPARE ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CONCAT ->
                    _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CONS ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CONTRACT ->
                    _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_CREATE_CONTRACT ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_DIG ->
                    _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_DIP ->
                    _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_DROP ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_DUG ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_DUP ->
                    _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EDIV ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EMPTY_MAP ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EMPTY_SET ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EQ ->
                    _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_EXEC ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_FAILWITH ->
                    _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_GE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_GET ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_GT ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_HASH_KEY ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_IF ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_IF_CONS ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_IF_LEFT ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_IF_NONE ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | SYMB3 ->
                    _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232) : 'freshtv690)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv691 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv695 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv696)) : 'freshtv698)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv705 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv701 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv699 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 102 "ParMichelson.mly"
                                                             ( IIF_CONS (_3, _6) )
# 3989 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)) : 'freshtv702)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv703 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv704)) : 'freshtv706)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv715 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv711 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv707 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_ADD ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_ADDRESS ->
                    _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_AMOUNT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_AND ->
                    _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_APPLY ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_BALANCE ->
                    _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_BLAKE2B ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CAR ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CAST ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CDR ->
                    _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CHAIN_ID ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CHECK_SIGNATURE ->
                    _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_COMPARE ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CONCAT ->
                    _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CONS ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CONTRACT ->
                    _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_CREATE_CONTRACT ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_DIG ->
                    _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_DIP ->
                    _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_DROP ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_DUG ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_DUP ->
                    _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EDIV ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EMPTY_MAP ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EMPTY_SET ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EQ ->
                    _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_EXEC ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_FAILWITH ->
                    _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_GE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_GET ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_GT ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_HASH_KEY ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_IF ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_IF_CONS ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_IF_LEFT ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_IF_NONE ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | SYMB3 ->
                    _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState237
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237) : 'freshtv708)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv709 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv710)) : 'freshtv712)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv713 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv714)) : 'freshtv716)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv723 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv719 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv717 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 99 "ParMichelson.mly"
                                                             ( IIF_LEFT (_3, _6) )
# 4249 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv718)) : 'freshtv720)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv721 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv722)) : 'freshtv724)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv733 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv729 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SYMB2 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv725 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_ABS ->
                    _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_ADD ->
                    _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_ADDRESS ->
                    _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_AMOUNT ->
                    _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_AND ->
                    _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_APPLY ->
                    _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_BALANCE ->
                    _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_BLAKE2B ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CAR ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CAST ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CDR ->
                    _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CHAIN_ID ->
                    _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CHECK_SIGNATURE ->
                    _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_COMPARE ->
                    _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CONCAT ->
                    _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CONS ->
                    _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CONTRACT ->
                    _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_CREATE_CONTRACT ->
                    _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_DIG ->
                    _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_DIP ->
                    _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_DROP ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_DUG ->
                    _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_DUP ->
                    _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EDIV ->
                    _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EMPTY_BIG_MAP ->
                    _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EMPTY_MAP ->
                    _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EMPTY_SET ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EQ ->
                    _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_EXEC ->
                    _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_FAILWITH ->
                    _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_GE ->
                    _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_GET ->
                    _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_GT ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_HASH_KEY ->
                    _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_IF ->
                    _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_IF_CONS ->
                    _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_IF_LEFT ->
                    _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_IF_NONE ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_IMPLICIT_ACCOUNT ->
                    _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_INT ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_ISNAT ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_ITER ->
                    _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_JOIN_TICKETS ->
                    _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_KECCAK ->
                    _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LAMBDA ->
                    _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LE ->
                    _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LEFT ->
                    _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LEVEL ->
                    _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LOOP ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LOOP_LEFT ->
                    _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LSL ->
                    _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LSR ->
                    _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_LT ->
                    _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_MAP ->
                    _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_MEM ->
                    _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_MUL ->
                    _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NEG ->
                    _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NEQ ->
                    _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NEVER ->
                    _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NIL ->
                    _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NONE ->
                    _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NOT ->
                    _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_NOW ->
                    _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_OPEN_CHEST ->
                    _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_OR ->
                    _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_PACK ->
                    _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_PAIR ->
                    _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_PAIRING_CHECK ->
                    _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_PUSH ->
                    _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_READ_TICKET ->
                    _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_RENAME ->
                    _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_RIGHT ->
                    _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SAPLING_EMPTY_STATE ->
                    _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SAPLING_VERIFY_UPDATE ->
                    _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SELF ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SELF_ADDRESS ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SENDER ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SET_DELEGATE ->
                    _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SHA256 ->
                    _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SHA3 ->
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SHA512 ->
                    _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SIZE ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SLICE ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SOME ->
                    _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SOURCE ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SPLIT_TICKET ->
                    _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SUB ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_SWAP ->
                    _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_TICKET ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_TOTAL_VOTING_POWER ->
                    _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_TRANSFER_TOKENS ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_UNIT ->
                    _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_UNPACK ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_UNPAIR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_UPDATE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_VOTING_POWER ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | KW_XOR ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | SYMB2 ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | SYMB3 ->
                    _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState242
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242) : 'freshtv726)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv727 * _menhir_state)) * _menhir_state * 'tv_instr_list)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv728)) : 'freshtv730)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv731 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv732)) : 'freshtv734)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv741 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv737 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv735 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)), _, (_6 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 90 "ParMichelson.mly"
                                                             ( IIF_NONE (_3, _6) )
# 4509 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)) : 'freshtv738)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv739 * _menhir_state)) * _menhir_state * 'tv_instr_list))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv740)) : 'freshtv742)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv749 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv745 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv743 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 108 "ParMichelson.mly"
                                   ( IITER _3 )
# 4535 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv744)) : 'freshtv746)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv747 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv748)) : 'freshtv750)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv757 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv753 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv751 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)), _, (_5 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 117 "ParMichelson.mly"
                                             ( ILAMBDA (_2, _3, _5) )
# 4561 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv755 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv756)) : 'freshtv758)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv765 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv761 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv759 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 115 "ParMichelson.mly"
                                   ( ILOOP _3 )
# 4587 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv763 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv764)) : 'freshtv766)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv773 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv769 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv767 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 116 "ParMichelson.mly"
                                        ( ILOOP_LEFT _3 )
# 4613 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)) : 'freshtv770)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv771 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv772)) : 'freshtv774)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv781 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv777 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv775 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 107 "ParMichelson.mly"
                                  ( IMAP _3 )
# 4639 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)) : 'freshtv778)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv779 * _menhir_state)) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv780)) : 'freshtv782)
    | MenhirState2 | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_instr = 
# 77 "ParMichelson.mly"
                           ( IBLOCK _2 )
# 4665 "ParMichelson.ml"
             in
            _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv797 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB3 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv793 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv791 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_5 : 'tv_typ)), _, (_9 : 'tv_instr_list)) = _menhir_stack in
            let _v : 'tv_prog = 
# 35 "ParMichelson.mly"
                                                                                  ( Contract (_2, _5, _9) )
# 4691 "ParMichelson.ml"
             in
            _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((((('freshtv795 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801 * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_instr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_instr_list)) = _menhir_stack in
        let _v : 'tv_prog = 
# 36 "ParMichelson.mly"
               ( Code _1 )
# 4710 "ParMichelson.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)) : 'freshtv802)
    | _ ->
        _menhir_fail ()

and _menhir_goto_pProg : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 4719 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv641) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 4728 "ParMichelson.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv639) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 4736 "ParMichelson.ml"
    )) : (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 4740 "ParMichelson.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv640)) : 'freshtv642)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv529 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv527 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 200 "ParMichelson.mly"
                        ( TBig_map (_2, _3) )
# 4757 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv528)) : 'freshtv530)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv533 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 194 "ParMichelson.mly"
                    ( TContract _2 )
# 4769 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)) : 'freshtv534)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv536)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv539 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv537 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 198 "ParMichelson.mly"
                      ( TLambda (_2, _3) )
# 4857 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)) : 'freshtv540)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 191 "ParMichelson.mly"
                ( TList _2 )
# 4869 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)) : 'freshtv544)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv547 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv545 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 199 "ParMichelson.mly"
                    ( TMap (_2, _3) )
# 4881 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)) : 'freshtv548)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv551 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv549 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 190 "ParMichelson.mly"
                  ( TOption _2 )
# 4893 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)) : 'freshtv552)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv553 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv554)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv557 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv555 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_typ = 
# 197 "ParMichelson.mly"
                  ( TOr (_2, _3) )
# 4981 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv560)
    | MenhirState75 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv563 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | SYMB6 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv561 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typeSeq = 
# 184 "ParMichelson.mly"
                  ( TTypSeq1 (_1, _2) )
# 5139 "ParMichelson.ml"
             in
            _menhir_goto_typeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv564)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB6 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv567 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv565 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typ = 
# 188 "ParMichelson.mly"
                      (  _2 )
# 5162 "ParMichelson.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)) : 'freshtv568)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv570)) : 'freshtv572)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 128 "ParMichelson.mly"
                  ( IUNPACK _2 )
# 5181 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv574)) : 'freshtv576)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv577 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 98 "ParMichelson.mly"
                 ( IRIGHT _2 )
# 5193 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_False ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | KW_IF_NONE ->
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
            _menhir_run255 _menhir_env (Obj.magic _menhir_stack) MenhirState106
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv582)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv583 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 87 "ParMichelson.mly"
                ( INONE _2 )
# 5435 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)) : 'freshtv586)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 100 "ParMichelson.mly"
               ( INIL _2 )
# 5447 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 97 "ParMichelson.mly"
                ( ILEFT _2 )
# 5459 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv596)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv601 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB2 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv597 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_ABS ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ADD ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_ADDRESS ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_AMOUNT ->
                _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_AND ->
                _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_APPLY ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_BALANCE ->
                _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_BLAKE2B ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CAR ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CAST ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CDR ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CHAIN_ID ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CHECK_SIGNATURE ->
                _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_COMPARE ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONCAT ->
                _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONS ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CONTRACT ->
                _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_CREATE_CONTRACT ->
                _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DIG ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DIP ->
                _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DROP ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DUG ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_DUP ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EDIV ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_BIG_MAP ->
                _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_MAP ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EMPTY_SET ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EQ ->
                _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_EXEC ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_FAILWITH ->
                _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GE ->
                _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GET ->
                _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_GT ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_HASH_KEY ->
                _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_CONS ->
                _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_LEFT ->
                _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | KW_IF_NONE ->
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
                _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv598)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv599 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv600)) : 'freshtv602)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv605 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv603 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 105 "ParMichelson.mly"
                          ( IEMPTY_MAP (_2, _3) )
# 5768 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv609 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv607 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 106 "ParMichelson.mly"
                              ( IEMPTY_BIG_MAP (_2, _3) )
# 5780 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)) : 'freshtv610)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv611 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
        let _v : 'tv_instr = 
# 152 "ParMichelson.mly"
                    ( ICONTRACT _2 )
# 5792 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv623 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_storage ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv615 * _menhir_state) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | KW_address ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_big_map ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_bls12_381_fr ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_bls12_381_g1 ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_bls12_381_g2 ->
                    _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_bool ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_bytes ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_chain_id ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_chest ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_chest_key ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_contract ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_int ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_key ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_key_hash ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_lambda ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_list ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_map ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_mutez ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_nat ->
                    _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_never ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_operation ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_option ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_or ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_pair ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_sapling_state ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_sapling_transaction ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_set ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_signature ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_string ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_ticket ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_timestamp ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | KW_unit ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | SYMB5 ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState289
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289) : 'freshtv616)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv617 * _menhir_state) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv618)) : 'freshtv620)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv621 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv622)) : 'freshtv624)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv637 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv633 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_code ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv629 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | SYMB2 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv625 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | KW_ABS ->
                        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_ADD ->
                        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_ADDRESS ->
                        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_AMOUNT ->
                        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_AND ->
                        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_APPLY ->
                        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_BALANCE ->
                        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_BLAKE2B ->
                        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CAR ->
                        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CAST ->
                        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CDR ->
                        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CHAIN_ID ->
                        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CHECK_SIGNATURE ->
                        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_COMPARE ->
                        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CONCAT ->
                        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CONS ->
                        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CONTRACT ->
                        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_CREATE_CONTRACT ->
                        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_DIG ->
                        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_DIP ->
                        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_DROP ->
                        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_DUG ->
                        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_DUP ->
                        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EDIV ->
                        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EMPTY_BIG_MAP ->
                        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EMPTY_MAP ->
                        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EMPTY_SET ->
                        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EQ ->
                        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_EXEC ->
                        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_FAILWITH ->
                        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_GE ->
                        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_GET ->
                        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_GT ->
                        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_HASH_KEY ->
                        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_IF ->
                        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_IF_CONS ->
                        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_IF_LEFT ->
                        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_IF_NONE ->
                        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_IMPLICIT_ACCOUNT ->
                        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_INT ->
                        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_ISNAT ->
                        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_ITER ->
                        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_JOIN_TICKETS ->
                        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_KECCAK ->
                        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LAMBDA ->
                        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LE ->
                        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LEFT ->
                        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LEVEL ->
                        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LOOP ->
                        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LOOP_LEFT ->
                        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LSL ->
                        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LSR ->
                        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_LT ->
                        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_MAP ->
                        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_MEM ->
                        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_MUL ->
                        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NEG ->
                        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NEQ ->
                        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NEVER ->
                        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NIL ->
                        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NONE ->
                        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NOT ->
                        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_NOW ->
                        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_OPEN_CHEST ->
                        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_OR ->
                        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_PACK ->
                        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_PAIR ->
                        _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_PAIRING_CHECK ->
                        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_PUSH ->
                        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_READ_TICKET ->
                        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_RENAME ->
                        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_RIGHT ->
                        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SAPLING_EMPTY_STATE ->
                        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SAPLING_VERIFY_UPDATE ->
                        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SELF ->
                        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SELF_ADDRESS ->
                        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SENDER ->
                        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SET_DELEGATE ->
                        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SHA256 ->
                        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SHA3 ->
                        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SHA512 ->
                        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SIZE ->
                        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SLICE ->
                        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SOME ->
                        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SOURCE ->
                        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SPLIT_TICKET ->
                        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SUB ->
                        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_SWAP ->
                        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_TICKET ->
                        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_TOTAL_VOTING_POWER ->
                        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_TRANSFER_TOKENS ->
                        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_UNIT ->
                        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_UNPACK ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_UNPAIR ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_UPDATE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_VOTING_POWER ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | KW_XOR ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | SYMB2 ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | SYMB3 ->
                        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState293
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv626)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv627 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv628)) : 'freshtv630)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv631 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv635 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv636)) : 'freshtv638)
    | _ ->
        _menhir_fail ()

and _menhir_goto_cTyp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cTyp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 228 "ParMichelson.mly"
                   ( COption _2 )
# 6160 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv484)) : 'freshtv486)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv488)
    | MenhirState71 | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv491 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv489 * _menhir_state) * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)), _, (_3 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_cTyp = 
# 229 "ParMichelson.mly"
                    ( COr (_2, _3) )
# 6216 "ParMichelson.ml"
         in
        _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv490)) : 'freshtv492)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv493 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv494)
    | MenhirState76 | MenhirState36 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | KW_big_map | KW_bls12_381_fr | KW_bls12_381_g1 | KW_bls12_381_g2 | KW_chest | KW_chest_key | KW_contract | KW_lambda | KW_list | KW_map | KW_operation | KW_sapling_state | KW_sapling_transaction | KW_set | KW_ticket | SYMB1 | SYMB2 | SYMB3 | SYMB4 | SYMB5 | SYMB6 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv495 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_cTyp)), _, (_2 : 'tv_cTyp)) = _menhir_stack in
            let _v : 'tv_cTypeSeq = 
# 210 "ParMichelson.mly"
                     ( CTypSeq1 (_1, _2) )
# 6310 "ParMichelson.ml"
             in
            _menhir_goto_cTypeSeq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv498)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_typ = 
# 195 "ParMichelson.mly"
                   ( TTicket _2 )
# 6326 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_typ = 
# 192 "ParMichelson.mly"
                ( TSet _2 )
# 6338 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv508)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv510)
    | MenhirState286 | MenhirState289 | MenhirState105 | MenhirState148 | MenhirState149 | MenhirState196 | MenhirState181 | MenhirState178 | MenhirState145 | MenhirState128 | MenhirState126 | MenhirState101 | MenhirState10 | MenhirState11 | MenhirState73 | MenhirState75 | MenhirState69 | MenhirState49 | MenhirState50 | MenhirState51 | MenhirState63 | MenhirState52 | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        (_menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) : 'freshtv512)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        (_menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) : 'freshtv514)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv516)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
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
            _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv518)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cTyp)) = _menhir_stack in
        let _v : 'tv_instr = 
# 104 "ParMichelson.mly"
                      ( IEMPTY_SET _2 )
# 6602 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv524)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_address ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState181
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181) : 'freshtv526)
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
# 21 "ParMichelson.mly"
       (int)
# 6898 "ParMichelson.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv481) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 21 "ParMichelson.mly"
       (int)
# 6908 "ParMichelson.ml"
    )) : (
# 21 "ParMichelson.mly"
       (int)
# 6912 "ParMichelson.ml"
    )) = _v in
    ((let _v : 'tv_int = 
# 234 "ParMichelson.mly"
                    ( _1 )
# 6917 "ParMichelson.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv479) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_int) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv421 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 113 "ParMichelson.mly"
                  ( IUPDATE_N _2 )
# 6934 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)) : 'freshtv424)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv425 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 96 "ParMichelson.mly"
                  ( IUNPAIR_N _2 )
# 6946 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv431 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv429 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_typ = 
# 204 "ParMichelson.mly"
                               ( TSapling_transaction _2 )
# 6958 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)) : 'freshtv432)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_typ = 
# 205 "ParMichelson.mly"
                         ( TSapling_state _2 )
# 6970 "ParMichelson.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 175 "ParMichelson.mly"
                               ( ISAPLING_EMPTY_STATE _2 )
# 6982 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv443 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_inta = 
# 40 "ParMichelson.mly"
              ( IntNeg _2 )
# 6994 "ParMichelson.ml"
         in
        _menhir_goto_inta _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)) : 'freshtv444)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv447 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 92 "ParMichelson.mly"
                ( IPAIR_N _2 )
# 7006 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv451 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 111 "ParMichelson.mly"
               ( IGET_N _2 )
# 7018 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)) : 'freshtv452)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv455 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv453 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 81 "ParMichelson.mly"
               ( IDUP_N _2 )
# 7030 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv459 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv457 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 84 "ParMichelson.mly"
               ( IDUG_N _2 )
# 7042 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)) : 'freshtv460)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv463 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv461 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 79 "ParMichelson.mly"
                ( IDROP_N _2 )
# 7054 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)) : 'freshtv464)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_instr = 
# 83 "ParMichelson.mly"
               ( IDIG_N _2 )
# 7066 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv473 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB2 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | KW_ABS ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_ADD ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_ADDRESS ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_AMOUNT ->
                _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_AND ->
                _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_APPLY ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_BALANCE ->
                _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_BLAKE2B ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CAR ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CAST ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CDR ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CHAIN_ID ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CHECK_SIGNATURE ->
                _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_COMPARE ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CONCAT ->
                _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CONS ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CONTRACT ->
                _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_CREATE_CONTRACT ->
                _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_DIG ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_DIP ->
                _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_DROP ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_DUG ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_DUP ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EDIV ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EMPTY_BIG_MAP ->
                _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EMPTY_MAP ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EMPTY_SET ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EQ ->
                _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_EXEC ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_FAILWITH ->
                _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_GE ->
                _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_GET ->
                _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_GT ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_HASH_KEY ->
                _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_IF ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_IF_CONS ->
                _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_IF_LEFT ->
                _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_IF_NONE ->
                _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_IMPLICIT_ACCOUNT ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_INT ->
                _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_ISNAT ->
                _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_ITER ->
                _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_JOIN_TICKETS ->
                _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_KECCAK ->
                _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LAMBDA ->
                _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LE ->
                _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LEFT ->
                _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LEVEL ->
                _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LOOP ->
                _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LOOP_LEFT ->
                _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LSL ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LSR ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_LT ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_MAP ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_MEM ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_MUL ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NEG ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NEQ ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NEVER ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NIL ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NONE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NOT ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_NOW ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_OPEN_CHEST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_OR ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_PACK ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_PAIR ->
                _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_PAIRING_CHECK ->
                _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_PUSH ->
                _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_READ_TICKET ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_RENAME ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_RIGHT ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SAPLING_EMPTY_STATE ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SAPLING_VERIFY_UPDATE ->
                _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SELF ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SELF_ADDRESS ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SENDER ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SET_DELEGATE ->
                _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SHA256 ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SHA3 ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SHA512 ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SIZE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SLICE ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SOME ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SOURCE ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SPLIT_TICKET ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SUB ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_SWAP ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_TICKET ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_TOTAL_VOTING_POWER ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_TRANSFER_TOKENS ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_UNIT ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_UNPACK ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_UNPAIR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_UPDATE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_VOTING_POWER ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | KW_XOR ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | SYMB2 ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | SYMB3 ->
                _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state) * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | MenhirState106 | MenhirState283 | MenhirState111 | MenhirState271 | MenhirState270 | MenhirState114 | MenhirState115 | MenhirState267 | MenhirState265 | MenhirState116 | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * 'tv_int) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_int)) = _menhir_stack in
        let _v : 'tv_inta = 
# 39 "ParMichelson.mly"
           ( IntPos _1 )
# 7299 "ParMichelson.ml"
         in
        _menhir_goto_inta _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)) : 'freshtv478)
    | _ ->
        _menhir_fail ()) : 'freshtv480)) : 'freshtv482)

and _menhir_goto_instr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState293 | MenhirState2 | MenhirState136 | MenhirState141 | MenhirState143 | MenhirState151 | MenhirState155 | MenhirState160 | MenhirState242 | MenhirState162 | MenhirState237 | MenhirState164 | MenhirState232 | MenhirState166 | MenhirState227 | MenhirState222 | MenhirState191 | MenhirState217 | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack)
        | SYMB3 | TOK_EOF ->
            _menhir_reduce144 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)
    | MenhirState106 | MenhirState283 | MenhirState271 | MenhirState270 | MenhirState114 | MenhirState115 | MenhirState267 | MenhirState265 | MenhirState116 | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv415 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv409 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv410)
        | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Integer _ | TOK_Str _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv411 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_instr)) = _menhir_stack in
            let _v : 'tv_data = 
# 68 "ParMichelson.mly"
          ( DInstr _1 )
# 7344 "ParMichelson.ml"
             in
            _menhir_goto_data _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv413 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)) : 'freshtv416)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SYMB1 ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack)
        | SYMB3 ->
            _menhir_reduce144 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
    | _ ->
        _menhir_fail ()

and _menhir_reduce143 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_instr_list = 
# 71 "ParMichelson.mly"
                         ( []  )
# 7379 "ParMichelson.ml"
     in
    _menhir_goto_instr_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_ABS ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_IF_NONE ->
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
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv229 * _menhir_state) * _menhir_state * 'tv_typ))) * _menhir_state * 'tv_typ)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * _menhir_state) * _menhir_state * 'tv_typ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_data)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv237 * _menhir_state) * _menhir_state * 'tv_data) * _menhir_state * 'tv_data)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv239 * _menhir_state) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState270 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243 * _menhir_state * 'tv_data) * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * 'tv_data) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv249 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv251 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv253 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv255 * _menhir_state)) * _menhir_state * 'tv_instr_list))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv257 * _menhir_state) * _menhir_state * 'tv_int)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state * 'tv_instr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv267 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv281 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv299 * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv301 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv309 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv321 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv347 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv349 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv375 * _menhir_state * 'tv_cTyp) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state) * _menhir_state * 'tv_cTyp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv384)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv392)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv393 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv396)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _v : (
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 8032 "ParMichelson.ml"
        ) = 
# 32 "ParMichelson.mly"
          ( raise (BNFC_Util.Parse_error (Parsing.symbol_start_pos (), Parsing.symbol_end_pos ())) )
# 8036 "ParMichelson.ml"
         in
        _menhir_goto_pProg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)) : 'freshtv404)

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
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 214 "ParMichelson.mly"
               ( CUnit  )
# 8126 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 226 "ParMichelson.mly"
                 ( CTimestamp  )
# 8139 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)

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
    let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 219 "ParMichelson.mly"
              ( CString  )
# 8197 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 225 "ParMichelson.mly"
                 ( CSignature  )
# 8210 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)

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
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 193 "ParMichelson.mly"
                 ( TOperation  )
# 8525 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 215 "ParMichelson.mly"
             ( CNever  )
# 8538 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 218 "ParMichelson.mly"
           ( CNat  )
# 8551 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 222 "ParMichelson.mly"
             ( CMutez  )
# 8564 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)

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
    let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 223 "ParMichelson.mly"
                ( CKey_hash  )
# 8776 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv209) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 224 "ParMichelson.mly"
           ( CKey  )
# 8789 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv207) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 217 "ParMichelson.mly"
           ( CInt  )
# 8802 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)

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
    let (_menhir_stack : 'freshtv205) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 207 "ParMichelson.mly"
                 ( TChest_key  )
# 8892 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv206)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv203) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 206 "ParMichelson.mly"
             ( TChest  )
# 8905 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 220 "ParMichelson.mly"
                ( CChain_id  )
# 8918 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 221 "ParMichelson.mly"
             ( CBytes  )
# 8931 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 216 "ParMichelson.mly"
            ( CBool  )
# 8944 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv195) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 202 "ParMichelson.mly"
                    ( TBls_g2  )
# 8957 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 201 "ParMichelson.mly"
                    ( TBls_g1  )
# 8970 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv191) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_typ = 
# 203 "ParMichelson.mly"
                    ( TBls_fr  )
# 8983 "ParMichelson.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv192)

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
    let (_menhir_stack : 'freshtv189) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_cTyp = 
# 227 "ParMichelson.mly"
               ( CAddress  )
# 9041 "ParMichelson.ml"
     in
    _menhir_goto_cTyp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 141 "ParMichelson.mly"
           ( IXOR  )
# 9054 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv185) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 157 "ParMichelson.mly"
                    ( IVOTING_POWER  )
# 9067 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 112 "ParMichelson.mly"
              ( IUPDATE  )
# 9086 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)
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
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 95 "ParMichelson.mly"
              ( IUNPAIR  )
# 9109 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)
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
    let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 88 "ParMichelson.mly"
            ( IUNIT  )
# 9203 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 153 "ParMichelson.mly"
                       ( ITRANSFER_TOKENS  )
# 9216 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 173 "ParMichelson.mly"
                          ( ITOTAL_VOTING_POWER  )
# 9229 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 177 "ParMichelson.mly"
              ( ITICKET  )
# 9242 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv171) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 82 "ParMichelson.mly"
            ( ISWAP  )
# 9255 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 130 "ParMichelson.mly"
           ( ISUB  )
# 9268 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 179 "ParMichelson.mly"
                    ( ISPLIT_TICKET  )
# 9281 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 169 "ParMichelson.mly"
              ( ISOURCE  )
# 9294 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 86 "ParMichelson.mly"
            ( ISOME  )
# 9307 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv164)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 126 "ParMichelson.mly"
             ( ISLICE  )
# 9320 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 103 "ParMichelson.mly"
            ( ISIZE  )
# 9333 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 167 "ParMichelson.mly"
              ( ISHA512  )
# 9346 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 165 "ParMichelson.mly"
            ( ISHA3  )
# 9359 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 166 "ParMichelson.mly"
              ( ISHA256  )
# 9372 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 154 "ParMichelson.mly"
                    ( ISET_DELEGATE  )
# 9385 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 170 "ParMichelson.mly"
              ( ISENDER  )
# 9398 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 151 "ParMichelson.mly"
                    ( ISELF_ADDRESS  )
# 9411 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 150 "ParMichelson.mly"
            ( ISELF  )
# 9424 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 176 "ParMichelson.mly"
                             ( ISAPLING_VERIFY_UPDATE  )
# 9437 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)

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
    let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 124 "ParMichelson.mly"
              ( IRENAME  )
# 9540 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 178 "ParMichelson.mly"
                   ( IREAD_TICKET  )
# 9553 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)

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
    let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 174 "ParMichelson.mly"
                     ( IPAIRING_CHECK  )
# 9643 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)

and _menhir_run118 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 91 "ParMichelson.mly"
            ( IPAIR  )
# 9662 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 127 "ParMichelson.mly"
            ( IPACK  )
# 9679 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv134)

and _menhir_run121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv131) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 139 "ParMichelson.mly"
          ( IOR  )
# 9692 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv129) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 181 "ParMichelson.mly"
                  ( IOPEN_CHEST  )
# 9705 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv127) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 158 "ParMichelson.mly"
           ( INOW  )
# 9718 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv125) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 142 "ParMichelson.mly"
           ( INOT  )
# 9731 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)

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
    let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 89 "ParMichelson.mly"
             ( INEVER  )
# 9898 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv124)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv121) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 145 "ParMichelson.mly"
           ( INEQ  )
# 9911 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 136 "ParMichelson.mly"
           ( INEG  )
# 9924 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 131 "ParMichelson.mly"
           ( IMUL  )
# 9937 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 109 "ParMichelson.mly"
           ( IMEM  )
# 9950 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv112)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 146 "ParMichelson.mly"
          ( ILT  )
# 10185 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 138 "ParMichelson.mly"
           ( ILSR  )
# 10198 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv105) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 137 "ParMichelson.mly"
           ( ILSL  )
# 10211 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)

and _menhir_run140 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv102)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv98)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 159 "ParMichelson.mly"
             ( ILEVEL  )
# 10668 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv96)

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
    let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 148 "ParMichelson.mly"
          ( ILE  )
# 10758 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv94)

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
    let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 164 "ParMichelson.mly"
              ( IKECCAK  )
# 10848 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv92)

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 180 "ParMichelson.mly"
                    ( IJOIN_TICKETS  )
# 10861 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv90)

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv86)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 134 "ParMichelson.mly"
             ( ISNAT  )
# 11096 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv84)

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 135 "ParMichelson.mly"
           ( IINT  )
# 11109 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)

and _menhir_run158 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 156 "ParMichelson.mly"
                        ( IIMPLICIT_ACCOUNT  )
# 11122 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv80)

and _menhir_run159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv76)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)

and _menhir_run161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv72)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_run165 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | KW_IF_NONE ->
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
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv64)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)

and _menhir_run167 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 168 "ParMichelson.mly"
                ( IHASH_KEY  )
# 12023 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv62)

and _menhir_run168 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 147 "ParMichelson.mly"
          ( IGT  )
# 12036 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)

and _menhir_run169 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 110 "ParMichelson.mly"
           ( IGET  )
# 12055 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169

and _menhir_run171 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 149 "ParMichelson.mly"
          ( IGE  )
# 12072 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)

and _menhir_run172 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 122 "ParMichelson.mly"
                ( IFAILWITH  )
# 12085 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 118 "ParMichelson.mly"
            ( IEXEC  )
# 12098 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv52)

and _menhir_run174 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv49) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 144 "ParMichelson.mly"
          ( IEQ  )
# 12111 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv50)

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177

and _menhir_run180 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_option ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_or ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_pair ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 132 "ParMichelson.mly"
            ( IEDIC  )
# 12259 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv48)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 80 "ParMichelson.mly"
           ( IDUP  )
# 12278 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv46)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
    | KW_ABS | KW_ADD | KW_ADDRESS | KW_AMOUNT | KW_AND | KW_APPLY | KW_BALANCE | KW_BLAKE2B | KW_CAR | KW_CAST | KW_CDR | KW_CHAIN_ID | KW_CHECK_SIGNATURE | KW_COMPARE | KW_CONCAT | KW_CONS | KW_CONTRACT | KW_CREATE_CONTRACT | KW_DIG | KW_DIP | KW_DROP | KW_DUG | KW_DUP | KW_EDIV | KW_EMPTY_BIG_MAP | KW_EMPTY_MAP | KW_EMPTY_SET | KW_EQ | KW_EXEC | KW_FAILWITH | KW_False | KW_GE | KW_GET | KW_GT | KW_HASH_KEY | KW_IF | KW_IF_CONS | KW_IF_LEFT | KW_IF_NONE | KW_IMPLICIT_ACCOUNT | KW_INT | KW_ISNAT | KW_ITER | KW_JOIN_TICKETS | KW_KECCAK | KW_LAMBDA | KW_LE | KW_LEFT | KW_LEVEL | KW_LOOP | KW_LOOP_LEFT | KW_LSL | KW_LSR | KW_LT | KW_Left | KW_MAP | KW_MEM | KW_MUL | KW_NEG | KW_NEQ | KW_NEVER | KW_NIL | KW_NONE | KW_NOT | KW_NOW | KW_None | KW_OPEN_CHEST | KW_OR | KW_PACK | KW_PAIR | KW_PAIRING_CHECK | KW_PUSH | KW_Pair | KW_READ_TICKET | KW_RENAME | KW_RIGHT | KW_Right | KW_SAPLING_EMPTY_STATE | KW_SAPLING_VERIFY_UPDATE | KW_SELF | KW_SELF_ADDRESS | KW_SENDER | KW_SET_DELEGATE | KW_SHA256 | KW_SHA3 | KW_SHA512 | KW_SIZE | KW_SLICE | KW_SOME | KW_SOURCE | KW_SPLIT_TICKET | KW_SUB | KW_SWAP | KW_Some | KW_TICKET | KW_TOTAL_VOTING_POWER | KW_TRANSFER_TOKENS | KW_True | KW_UNIT | KW_UNPACK | KW_UNPAIR | KW_UPDATE | KW_Unit | KW_VOTING_POWER | KW_XOR | SYMB1 | SYMB2 | SYMB3 | SYMB4 | TOK_EOF | TOK_Hex _ | TOK_Str _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_instr = 
# 78 "ParMichelson.mly"
            ( IDROP  )
# 12314 "ParMichelson.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188

and _menhir_run190 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SYMB2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState190 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | KW_ABS ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_IF_NONE ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | SYMB3 ->
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv42)
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190

and _menhir_run192 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | TOK_Integer _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192

and _menhir_run194 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_ADD ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_ADDRESS ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_AMOUNT ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_AND ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_APPLY ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_BALANCE ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_BLAKE2B ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CAR ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CAST ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CDR ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CHAIN_ID ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CHECK_SIGNATURE ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_COMPARE ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CONCAT ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CONS ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CONTRACT ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_CREATE_CONTRACT ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_DIG ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_DIP ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_DROP ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_DUG ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_DUP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EDIV ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EMPTY_BIG_MAP ->
            _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EMPTY_MAP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EMPTY_SET ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EQ ->
            _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_EXEC ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_FAILWITH ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_GE ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_GET ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_GT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_HASH_KEY ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_IF ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_IF_CONS ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_IF_LEFT ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_IF_NONE ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_IMPLICIT_ACCOUNT ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_INT ->
            _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_ISNAT ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_ITER ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_JOIN_TICKETS ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_KECCAK ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LAMBDA ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LE ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LEFT ->
            _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LEVEL ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LOOP ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LOOP_LEFT ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LSL ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LSR ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_LT ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_MAP ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_MEM ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_MUL ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NEG ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NEQ ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NEVER ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NIL ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NONE ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NOT ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_NOW ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_OPEN_CHEST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_OR ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_PACK ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_PAIR ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_PAIRING_CHECK ->
            _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_PUSH ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_READ_TICKET ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_RENAME ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_RIGHT ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SAPLING_EMPTY_STATE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SAPLING_VERIFY_UPDATE ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SELF ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SELF_ADDRESS ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SENDER ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SET_DELEGATE ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SHA256 ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SHA3 ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SHA512 ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SIZE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SLICE ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SOME ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SOURCE ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SPLIT_TICKET ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SUB ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_SWAP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_TICKET ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_TOTAL_VOTING_POWER ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_TRANSFER_TOKENS ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_UNIT ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_UNPACK ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_UNPAIR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_UPDATE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_VOTING_POWER ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | KW_XOR ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | SYMB2 ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | SYMB3 ->
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv38)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)

and _menhir_run196 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_address ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_big_map ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_bls12_381_fr ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_bls12_381_g1 ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_bls12_381_g2 ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_bool ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_bytes ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_chain_id ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_chest ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_chest_key ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_contract ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_int ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_key ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_key_hash ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_lambda ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_list ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_map ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_mutez ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_nat ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_never ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_operation ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_option ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_or ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_pair ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_sapling_state ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_sapling_transaction ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_set ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_signature ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_string ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_ticket ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_timestamp ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | KW_unit ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | SYMB5 ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196

and _menhir_run198 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 101 "ParMichelson.mly"
            ( ICONS  )
# 12866 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv36)

and _menhir_run199 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 125 "ParMichelson.mly"
              ( ICONCAT  )
# 12879 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv34)

and _menhir_run200 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 143 "ParMichelson.mly"
               ( ICOMPARE  )
# 12892 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)

and _menhir_run201 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 162 "ParMichelson.mly"
                       ( ICHECK_SIGNATURE  )
# 12905 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv30)

and _menhir_run202 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 172 "ParMichelson.mly"
                ( ICHAIN_ID  )
# 12918 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run203 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 94 "ParMichelson.mly"
           ( ICDR  )
# 12931 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run204 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 123 "ParMichelson.mly"
            ( ICAST  )
# 12944 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run205 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 93 "ParMichelson.mly"
           ( ICAR  )
# 12957 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 163 "ParMichelson.mly"
               ( IBLAKE2B  )
# 12970 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)

and _menhir_run207 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 161 "ParMichelson.mly"
               ( IBALANCE  )
# 12983 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)

and _menhir_run208 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 119 "ParMichelson.mly"
             ( IAPPLY  )
# 12996 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)

and _menhir_run209 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 140 "ParMichelson.mly"
           ( IAND  )
# 13009 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run210 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 160 "ParMichelson.mly"
              ( IAMOUNT  )
# 13022 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run211 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 171 "ParMichelson.mly"
               ( IADDRESS  )
# 13035 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run212 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 129 "ParMichelson.mly"
           ( IADD  )
# 13048 "ParMichelson.ml"
     in
    _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_instr = 
# 133 "ParMichelson.mly"
           ( IABS  )
# 13061 "ParMichelson.ml"
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
# 27 "ParMichelson.mly"
      (AbsMichelson.prog)
# 13080 "ParMichelson.ml"
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
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ADD ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_ADDRESS ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_AMOUNT ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_AND ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_APPLY ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_BALANCE ->
        _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_BLAKE2B ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CAR ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CAST ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CDR ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CHAIN_ID ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CHECK_SIGNATURE ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_COMPARE ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONCAT ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONS ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CONTRACT ->
        _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_CREATE_CONTRACT ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DIG ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DIP ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DROP ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DUG ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_DUP ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EDIV ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_BIG_MAP ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_MAP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EMPTY_SET ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EQ ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_EXEC ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_FAILWITH ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GE ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GET ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_GT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_HASH_KEY ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_CONS ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_LEFT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF_NONE ->
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
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_big_map ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_bls12_381_fr ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_bls12_381_g1 ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_bls12_381_g2 ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_bool ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_bytes ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_chain_id ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_chest ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_chest_key ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_contract ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_int ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_key ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_key_hash ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_lambda ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_list ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_map ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_mutez ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_nat ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_never ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_operation ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_option ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_or ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_pair ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_sapling_state ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_sapling_transaction ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_set ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_signature ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_string ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_ticket ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_timestamp ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | KW_unit ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | SYMB5 ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286) : 'freshtv2)
    | SYMB2 ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TOK_EOF ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv4))

# 269 "<standard.mly>"
  

# 13378 "ParMichelson.ml"
