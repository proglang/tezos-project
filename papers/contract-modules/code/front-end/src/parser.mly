%token <int> INT
%token <string> STRING
%token <string> IDENT
%token LPAREN RPAREN
%token LBRACKET RBRACKET
%token INT_T BOOL_T BYTES_T STRING_T MUTEZ_T NAT_T UNIT_T
%token ADDRESS_T CHAINID_T KEY_T KEYHASH_T OP_T SIG_T TIMESTAMP_T
%token LIST_T SET_T OPTION_T PAIR_T LAMBDA_T MAP_T CONTRACT_T BIGMAP_T
%token LEFT RIGHT SOME NONE CONS NIL
%token ENTRYPOINT
%token PAID_ENTRYPOINT; 
%token OR
%token COLON PERCENT WILDCARD
%token EOF  
%token CONTRACT
%token SIG
%token CLOSE
%token RAISES
%token BAR  
%token SPACE

          

%start <Contract_module.contract_module_ast option> main

%%

main:
  | EOF {None}
  | m = in_parens(modul) {Some m}
  ;

modul:
  | e = contract_name; a = entrypoint_list; CLOSE
    {{contract = e; body = a} : Contract_module.contract_module_ast}

entrypoint_decl:
  | e = entrypoint_name;  p = pattern; RAISES; er = error_decl
    {{entrypoint = (e, p); error = er} : Contract_module.entrypoint_decl}

entrypoint_list:
  | NIL {`Nill}
  | en = in_parens(entrypoint_decl) {`Cons (en, `Nill)}
  | en = in_parens(entrypoint_decl); l = entrypoint_list {`Cons (en, l)}

contract_name:
  | CONTRACT; id = IDENT; SIG {id}


entrypoint_name:
  | ENTRYPOINT; id = IDENT; {id}
  | PAID_ENTRYPOINT; id = IDENT;{id}

error_decl:
  | l = error_list {l}

pattern:
  | WILDCARD                      {`Wildcard}
  | p = in_parens(pattern_paren)  {p}
  | NONE                          {`None}
  | NIL                           {`Nil}
  ;          

pattern_paren:
  | v = var_declaration                  {`Ident v}
  | PAIR_T; p1 = pattern; p2 = pattern   {`Pair (p1, p2)}
  | CONS; p1 = pattern; p2 = pattern     {`Cons (p1, p2)}
  | SOME; p = pattern                    {`Some p}
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
  | NIL {`Nill}
  | s = STRING {`Cons (s, `Nill)}
  | s = STRING; b = BAR; l = error_list {`Cons (s, l)}




