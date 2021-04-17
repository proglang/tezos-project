%token <int> INT
%token <string> STRING
%token <string> IDENT
%token TRUE FALSE
%token LPAREN RPAREN
%token LBRACKET RBRACKET
%token INT_T BOOL_T BYTES_T STRING_T FMU_T NAT_T UNIT_T
%token ADDRESS_T CHAINID_T KEY_T KEYHASH_T OP_T SIG_T TIMESTAMP_T
%token LIST_T SET_T OPTION_T PAIR_T LAMBDA_T MAP_T CONTRACT_T BIGMAP_T
%token LEFT RIGHT SOME NONE CONS NIL
%token ENTRYPOINT
%token FORALL EXISTS
%token IF
%token ASSERT NTH SIZE
%token NOT ABS NEG
%token ADD SUB MUL DIV MOD
%token OR AND XOR LSL LSR EQ NEQ LT GT LE GE
%token SLICE
%token COLON PERCENT WILDCARD
%token EOF              

%start <Assertion.assertion_ast option> main

(* Operator precedence is not handled explicitly, as the grammar enforces parentheses *)

%%

main:
  | EOF {None}
  | m = in_parens(modul) {Some m}
  ;

modul:
  | e = entrypoint; p = pattern; a = in_parens(assertion)
    {{entrypoint = (e, p); body = a} : Assertion.assertion_ast}

entrypoint:
  | ENTRYPOINT; n = option(PERCENT; id = IDENT {id}) {n}

pattern:
  | WILDCARD                      {`Wildcard}
  | p = in_parens(pattern_paren)  {p}
  | NONE                          {`None}
  | NIL                           {`Nil}
  | id = IDENT                    {`IdentPat id}
  ;          

pattern_paren:
  | v = var_declaration                  {`Var v}
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
  | FMU_T       {`Fmu_t}
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

assertion:
  | FORALL; v = in_parens(var_declaration); a = in_parens(assertion)
    {`Forall (v, a, [])}
  | EXISTS; v = in_parens(var_declaration); a = in_parens(assertion)
    {`Exists (v, a, [])}
  | IF; e = expression; a = in_parens(assertion)
    {`If (e, a)}
  | ASSERT; e = expression
    {`Assert e}
  ;

expression:
  | TRUE                          {`Bool true}
  | FALSE                         {`Bool false}
  | i = INT                       {`Int i}
  | s = STRING                    {`String s}
  | id = IDENT                    {`Ident id}
  | e = in_parens(expr_paren)     {e}

expr_paren:
  | IF; e_cond = expression; e_then = expression; e_else = expression
    {`IfThenElse (e_cond, e_then, e_else)}
  | op = unop; e = expression                     {`Unop (op, e)}
  | op = binop; e1 = expression; e2 = expression  {`Binop (op, e1, e2)}
  | SLICE; e1 = expression; e2 = expression; e3 = expression; {`Slice (e1, e2, e3)}

unop:
  | SIZE {`Size}
  | ABS  {`Abs}
  | NEG  {`Neg}
  | NOT  {`Not}

binop:
  | NTH {`Nth}
  | ADD {`Add}
  | SUB {`Sub}
  | MUL {`Mul}
  | DIV {`Div}
  | MOD {`Mod}
  | OR  {`Or}
  | AND {`And}
  | XOR {`Xor}
  | LSL {`Lsl}
  | LSR {`Lsr}
  | EQ  {`Eq}
  | NEQ {`Neq}
  | LT  {`Lt}
  | GT  {`Gt}
  | LE  {`Le}
  | GE  {`Ge}

in_parens(X):
  | LPAREN; x = X ; RPAREN {x}
  | LBRACKET; x = X ; RBRACKET {x}
