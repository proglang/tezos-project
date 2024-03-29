%token <int> INT
%token <string> STRING
%token <string> IDENT
%token LPAREN RPAREN
%token LBRACKET RBRACKET
%token INT_T BOOL_T BYTES_T STRING_T MUTEZ_T NAT_T UNIT_T
%token ADDRESS_T CHAINID_T KEY_T KEYHASH_T OP_T SIG_T TIMESTAMP_T
%token LIST_T SET_T OPTION_T PAIR_T LAMBDA_T MAP_T CONTRACT_T BIGMAP_T
%token LEFT RIGHT NIL
%token ENTRYPOINT
%token PAID_ENTRYPOINT; 
%token OR
%token COLON PERCENT WILDCARD
%token EOF  
%token CONTRACT
%token SIG
%token END
%token RAISES
%token BAR  

          

%start <Contract_module_t.contract_module_ast option> main

%%

main:
  | EOF {None}
  | m = modul {Some m}
  ;

modul:
  | e = contract_name; a = entrypoint_list; END
    {{contract = e; body = a} : Contract_module_t.contract_module_ast}

entrypoint_list:
  | NIL {[]}
  | LPAREN ; en = entrypoint_decl; RPAREN {en :: []}
  | LPAREN ; en = entrypoint_decl; RPAREN; l = entrypoint_list {en :: l}

entrypoint_decl:
  | e = entrypoint_name;  p = pattern; RAISES; er = error_list
    {{entrypoint = (e, p); errors = er}}

contract_name:
  | CONTRACT; id = IDENT; SIG {id}


entrypoint_name:
  | ENTRYPOINT; id = IDENT; {id}
  | PAID_ENTRYPOINT; id = IDENT;{id}

pattern:
  | in_parens(WILDCARD)           {`Wildcard}
  | p = in_parens(pattern_paren)  {p}
  ;          

pattern_paren:
  | v = var_declaration                  {`Ident v}
  | LEFT; p = pattern                    {`Left p}
  | RIGHT; p = pattern                   {`Right p} 

var_declaration:
  | id = IDENT; COLON; t = type_id       {(id, t)}

type_id:
  | INT_T       {`Int_t}
  | BOOL_T      {`Bool_t}
  | BYTES_T     {`Bytes_t}
  | STRING_T    {`String_t}
  | MUTEZ_T     {`Mutez_t}
  | NAT_T       {`Nat_t}
  | UNIT_T      {`Unit_t}
  | ADDRESS_T   {`Address_t}
  | CHAINID_T   {`ChainID_t}
  | KEY_T       {`Key_t}
  | KEYHASH_T   {`KeyHash_t}
  | OP_T        {`Operation_t}
  | SIG_T       {`Signature_t}
  | TIMESTAMP_T {`Timestamp_t}
  | t = in_parens(type_id_paren) {t}

type_id_paren:
  | LIST_T; t = type_id                  {`List_t t }
  | SET_T; t = type_id                   {`Set_t t }
  | OPTION_T; t = type_id                {`Option_t t }
  | OR; t1 = type_id; t2 = type_id       {`Or_t (t1, t2) }
  | PAIR_T; t1 = type_id; t2 = type_id   {`Pair_t (t1, t2) }
  | LAMBDA_T; t1 = type_id; t2 = type_id {`Lambda_t (t1, t2) }
  | MAP_T; t1 = type_id; t2 = type_id    {`Map_t (t1, t2) }
  | CONTRACT_T; t = type_id              {`Contract_t t }
  | BIGMAP_T; t1 = type_id; t2 = type_id {`BigMap_t (t1, t2) }

in_parens(X):
  | LPAREN; x = X ; RPAREN {x}
  | LBRACKET; x = X ; RBRACKET {x}

error_list:
  | NIL {[]}
  | s = STRING {s :: []}
  | s = STRING; BAR; l = error_list {s :: l}




