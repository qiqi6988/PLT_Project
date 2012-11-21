type token =
  | FOR
  | LPAREN
  | RPAREN
  | COMMA
  | LBRACKET
  | RBRACKET
  | LBRACE
  | RBRACE
  | SEMI
  | INT_KEY
  | FLOAT_KEY
  | ARRAY_KEY
  | STRING_KEY
  | VOID_KEY
  | BOOLEAN_KEY
  | POINT_KEY
  | LINE_KEY
  | POLYGON_KEY
  | ELLIPSE_KEY
  | WHILE
  | IF
  | ELSE
  | ELSEIF
  | CASE
  | RETURN
  | SWITCH
  | BREAK
  | CONTINUE
  | DEF
  | DEFAULT
  | ID of (string)
  | NUM of (float)
  | INT of (int)
  | String of (string)
  | PARA
  | INTERS
  | RELAT
  | EE
  | NE
  | SE
  | LE
  | S
  | L
  | TE
  | E
  | PLUS
  | MINUS
  | MUL
  | DIV
  | PERC
  | SSE
  | LLE
  | SS
  | LL

open Parsing;;
# 2 "ALG_Parser.mly"
  open Printf
	open AST
# 62 "ALG_Parser.ml"
let yytransl_const = [|
  257 (* FOR *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* COMMA *);
  261 (* LBRACKET *);
  262 (* RBRACKET *);
  263 (* LBRACE *);
  264 (* RBRACE *);
  265 (* SEMI *);
  266 (* INT_KEY *);
  267 (* FLOAT_KEY *);
  268 (* ARRAY_KEY *);
  269 (* STRING_KEY *);
  270 (* VOID_KEY *);
  271 (* BOOLEAN_KEY *);
  272 (* POINT_KEY *);
  273 (* LINE_KEY *);
  274 (* POLYGON_KEY *);
  275 (* ELLIPSE_KEY *);
  276 (* WHILE *);
  277 (* IF *);
  278 (* ELSE *);
  279 (* ELSEIF *);
  280 (* CASE *);
  281 (* RETURN *);
  282 (* SWITCH *);
  283 (* BREAK *);
  284 (* CONTINUE *);
  285 (* DEF *);
  286 (* DEFAULT *);
  291 (* PARA *);
  292 (* INTERS *);
  293 (* RELAT *);
  294 (* EE *);
  295 (* NE *);
  296 (* SE *);
  297 (* LE *);
  298 (* S *);
  299 (* L *);
  300 (* TE *);
  301 (* E *);
  302 (* PLUS *);
  303 (* MINUS *);
  304 (* MUL *);
  305 (* DIV *);
  306 (* PERC *);
  307 (* SSE *);
  308 (* LLE *);
  309 (* SS *);
  310 (* LL *);
    0|]

let yytransl_block = [|
  287 (* ID *);
  288 (* NUM *);
  289 (* INT *);
  290 (* String *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\004\000\004\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\006\000\007\000\008\000\010\000\010\000\009\000\
\000\000"

let yylen = "\002\000\
\001\000\001\000\002\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\001\000\001\000\001\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\007\000\003\000\005\000\005\000\003\000\005\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\027\000\028\000\006\000\
\049\000\001\000\000\000\000\000\000\000\007\000\008\000\009\000\
\010\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\026\000\042\000\000\000\000\000\
\000\000\044\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\019\000\020\000\021\000\022\000\024\000\023\000\000\000\
\000\000\000\000\000\000\000\000\035\000\036\000\038\000\037\000\
\040\000\039\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\047\000\000\000\048\000\000\000\000\000\045\000\
\000\000\000\000\043\000"

let yydgoto = "\002\000\
\009\000\010\000\018\000\012\000\019\000\014\000\015\000\016\000\
\017\000\091\000"

let yysindex = "\255\255\
\249\255\000\000\249\255\070\000\218\254\000\000\000\000\000\000\
\000\000\000\000\141\000\001\255\158\000\000\000\000\000\000\000\
\000\000\073\255\115\255\058\255\058\255\223\254\162\255\012\255\
\013\255\249\255\016\000\016\000\016\000\016\000\016\000\016\000\
\016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
\000\000\058\255\058\255\058\255\058\255\058\255\058\255\058\255\
\058\255\058\255\058\255\058\255\000\000\000\000\058\255\058\255\
\070\000\000\000\141\000\158\000\016\000\229\254\114\000\114\000\
\114\000\000\000\000\000\000\000\000\000\000\000\000\000\114\000\
\114\000\114\000\114\000\114\000\000\000\000\000\000\000\000\000\
\000\000\000\000\171\000\171\000\148\000\148\000\148\000\200\255\
\179\255\000\255\000\000\016\000\000\000\058\255\016\255\000\000\
\125\000\018\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\132\255\000\000\000\000\000\000\
\000\000\000\000\003\000\000\000\014\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\090\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\002\000\011\255\000\000\000\000\001\000\005\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\030\000\
\061\000\082\000\086\000\107\000\000\000\000\000\000\000\000\000\
\000\000\000\000\074\255\253\255\023\255\139\255\187\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\025\255\000\000"

let yygindex = "\000\000\
\000\000\000\000\008\000\000\000\007\000\000\000\000\000\000\000\
\009\000\020\000"

let yytablesize = 477
let yytable = "\001\000\
\012\000\025\000\002\000\095\000\011\000\096\000\026\000\013\000\
\011\000\041\000\023\000\055\000\024\000\041\000\041\000\057\000\
\041\000\092\000\058\000\041\000\021\000\095\000\005\000\025\000\
\013\000\032\000\032\000\023\000\032\000\014\000\046\000\032\000\
\060\000\059\000\063\000\064\000\065\000\066\000\067\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\076\000\
\077\000\078\000\079\000\080\000\081\000\082\000\083\000\084\000\
\085\000\086\000\087\000\020\000\017\000\060\000\088\000\089\000\
\000\000\090\000\000\000\000\000\032\000\032\000\032\000\032\000\
\032\000\000\000\000\000\053\000\030\000\030\000\000\000\030\000\
\000\000\018\000\030\000\000\000\000\000\015\000\000\000\000\000\
\022\000\006\000\007\000\000\000\029\000\029\000\000\000\029\000\
\000\000\000\000\029\000\059\000\097\000\000\000\000\000\098\000\
\000\000\000\000\016\000\027\000\028\000\029\000\030\000\031\000\
\032\000\033\000\034\000\035\000\036\000\054\000\000\000\030\000\
\030\000\000\000\000\000\037\000\038\000\039\000\040\000\029\000\
\029\000\029\000\029\000\029\000\029\000\000\000\029\000\029\000\
\029\000\029\000\029\000\029\000\029\000\033\000\033\000\000\000\
\033\000\000\000\000\000\033\000\000\000\000\000\000\000\000\000\
\042\000\043\000\044\000\045\000\046\000\047\000\000\000\000\000\
\048\000\049\000\050\000\051\000\052\000\056\000\000\000\000\000\
\000\000\029\000\029\000\029\000\029\000\029\000\029\000\000\000\
\000\000\029\000\029\000\029\000\029\000\029\000\094\000\000\000\
\033\000\033\000\033\000\033\000\033\000\034\000\034\000\000\000\
\034\000\000\000\000\000\034\000\000\000\000\000\000\000\042\000\
\043\000\044\000\045\000\046\000\047\000\093\000\000\000\048\000\
\049\000\050\000\051\000\052\000\000\000\000\000\000\000\000\000\
\042\000\043\000\044\000\045\000\046\000\047\000\000\000\000\000\
\048\000\049\000\050\000\051\000\052\000\000\000\000\000\000\000\
\034\000\034\000\034\000\034\000\034\000\042\000\043\000\044\000\
\045\000\046\000\047\000\000\000\000\000\048\000\049\000\050\000\
\051\000\052\000\003\000\000\000\000\000\004\000\000\000\031\000\
\031\000\000\000\031\000\012\000\025\000\031\000\000\000\011\000\
\000\000\012\000\025\000\004\000\000\000\011\000\000\000\000\000\
\000\000\061\000\000\000\000\000\004\000\000\000\000\000\005\000\
\006\000\007\000\008\000\013\000\000\000\000\000\000\000\000\000\
\014\000\013\000\000\000\012\000\012\000\012\000\014\000\011\000\
\011\000\011\000\031\000\031\000\012\000\000\000\062\000\000\000\
\011\000\008\000\000\000\012\000\012\000\012\000\012\000\011\000\
\011\000\011\000\011\000\013\000\013\000\013\000\000\000\017\000\
\014\000\014\000\014\000\000\000\013\000\017\000\000\000\020\000\
\000\000\014\000\021\000\013\000\013\000\013\000\013\000\000\000\
\014\000\014\000\014\000\014\000\018\000\000\000\000\000\000\000\
\015\000\000\000\018\000\000\000\000\000\000\000\015\000\017\000\
\017\000\017\000\000\000\000\000\022\000\006\000\007\000\000\000\
\017\000\000\000\000\000\000\000\000\000\016\000\000\000\017\000\
\017\000\017\000\017\000\016\000\018\000\018\000\018\000\000\000\
\015\000\015\000\015\000\000\000\000\000\018\000\000\000\000\000\
\000\000\015\000\099\000\000\000\018\000\018\000\018\000\018\000\
\015\000\015\000\015\000\015\000\000\000\016\000\016\000\016\000\
\000\000\000\000\000\000\000\000\000\000\000\000\016\000\030\000\
\031\000\032\000\033\000\034\000\035\000\016\000\016\000\016\000\
\016\000\000\000\042\000\043\000\044\000\045\000\046\000\047\000\
\000\000\000\000\048\000\049\000\050\000\051\000\052\000\027\000\
\028\000\029\000\030\000\031\000\032\000\033\000\034\000\035\000\
\036\000\042\000\043\000\044\000\045\000\046\000\047\000\037\000\
\038\000\039\000\040\000\042\000\043\000\044\000\045\000\046\000\
\047\000\000\000\000\000\048\000\049\000\050\000\051\000\052\000\
\042\000\043\000\044\000\045\000\046\000\047\000\000\000\000\000\
\000\000\000\000\050\000\051\000\052\000"

let yycheck = "\001\000\
\000\000\000\000\000\000\004\001\000\000\006\001\045\001\001\000\
\001\000\009\001\004\000\045\001\004\000\003\001\004\001\004\001\
\006\001\045\001\006\001\009\001\005\001\004\001\009\001\004\000\
\000\000\003\001\004\001\021\000\006\001\000\000\006\001\009\001\
\026\000\026\000\027\000\028\000\029\000\030\000\031\000\032\000\
\033\000\034\000\035\000\036\000\037\000\038\000\039\000\040\000\
\042\000\043\000\044\000\045\000\046\000\047\000\048\000\049\000\
\050\000\051\000\052\000\002\001\000\000\055\000\056\000\057\000\
\255\255\057\000\255\255\255\255\046\001\047\001\048\001\049\001\
\050\001\255\255\255\255\003\001\003\001\004\001\255\255\006\001\
\255\255\000\000\009\001\255\255\255\255\000\000\255\255\255\255\
\031\001\032\001\033\001\255\255\003\001\004\001\255\255\006\001\
\255\255\255\255\009\001\092\000\094\000\255\255\255\255\095\000\
\255\255\255\255\000\000\035\001\036\001\037\001\038\001\039\001\
\040\001\041\001\042\001\043\001\044\001\003\001\255\255\046\001\
\047\001\255\255\255\255\051\001\052\001\053\001\054\001\038\001\
\039\001\040\001\041\001\042\001\043\001\255\255\003\001\046\001\
\047\001\048\001\049\001\050\001\009\001\003\001\004\001\255\255\
\006\001\255\255\255\255\009\001\255\255\255\255\255\255\255\255\
\038\001\039\001\040\001\041\001\042\001\043\001\255\255\255\255\
\046\001\047\001\048\001\049\001\050\001\004\001\255\255\255\255\
\255\255\038\001\039\001\040\001\041\001\042\001\043\001\255\255\
\255\255\046\001\047\001\048\001\049\001\050\001\004\001\255\255\
\046\001\047\001\048\001\049\001\050\001\003\001\004\001\255\255\
\006\001\255\255\255\255\009\001\255\255\255\255\255\255\038\001\
\039\001\040\001\041\001\042\001\043\001\006\001\255\255\046\001\
\047\001\048\001\049\001\050\001\255\255\255\255\255\255\255\255\
\038\001\039\001\040\001\041\001\042\001\043\001\255\255\255\255\
\046\001\047\001\048\001\049\001\050\001\255\255\255\255\255\255\
\046\001\047\001\048\001\049\001\050\001\038\001\039\001\040\001\
\041\001\042\001\043\001\255\255\255\255\046\001\047\001\048\001\
\049\001\050\001\002\001\255\255\255\255\005\001\255\255\003\001\
\004\001\255\255\006\001\003\001\003\001\009\001\255\255\003\001\
\255\255\009\001\009\001\009\001\255\255\009\001\255\255\255\255\
\255\255\002\001\255\255\255\255\005\001\255\255\255\255\031\001\
\032\001\033\001\034\001\003\001\255\255\255\255\255\255\255\255\
\003\001\009\001\255\255\035\001\036\001\037\001\009\001\035\001\
\036\001\037\001\046\001\047\001\044\001\255\255\031\001\255\255\
\044\001\034\001\255\255\051\001\052\001\053\001\054\001\051\001\
\052\001\053\001\054\001\035\001\036\001\037\001\255\255\003\001\
\035\001\036\001\037\001\255\255\044\001\009\001\255\255\002\001\
\255\255\044\001\005\001\051\001\052\001\053\001\054\001\255\255\
\051\001\052\001\053\001\054\001\003\001\255\255\255\255\255\255\
\003\001\255\255\009\001\255\255\255\255\255\255\009\001\035\001\
\036\001\037\001\255\255\255\255\031\001\032\001\033\001\255\255\
\044\001\255\255\255\255\255\255\255\255\003\001\255\255\051\001\
\052\001\053\001\054\001\009\001\035\001\036\001\037\001\255\255\
\035\001\036\001\037\001\255\255\255\255\044\001\255\255\255\255\
\255\255\044\001\006\001\255\255\051\001\052\001\053\001\054\001\
\051\001\052\001\053\001\054\001\255\255\035\001\036\001\037\001\
\255\255\255\255\255\255\255\255\255\255\255\255\044\001\038\001\
\039\001\040\001\041\001\042\001\043\001\051\001\052\001\053\001\
\054\001\255\255\038\001\039\001\040\001\041\001\042\001\043\001\
\255\255\255\255\046\001\047\001\048\001\049\001\050\001\035\001\
\036\001\037\001\038\001\039\001\040\001\041\001\042\001\043\001\
\044\001\038\001\039\001\040\001\041\001\042\001\043\001\051\001\
\052\001\053\001\054\001\038\001\039\001\040\001\041\001\042\001\
\043\001\255\255\255\255\046\001\047\001\048\001\049\001\050\001\
\038\001\039\001\040\001\041\001\042\001\043\001\255\255\255\255\
\255\255\255\255\048\001\049\001\050\001"

let yynames_const = "\
  FOR\000\
  LPAREN\000\
  RPAREN\000\
  COMMA\000\
  LBRACKET\000\
  RBRACKET\000\
  LBRACE\000\
  RBRACE\000\
  SEMI\000\
  INT_KEY\000\
  FLOAT_KEY\000\
  ARRAY_KEY\000\
  STRING_KEY\000\
  VOID_KEY\000\
  BOOLEAN_KEY\000\
  POINT_KEY\000\
  LINE_KEY\000\
  POLYGON_KEY\000\
  ELLIPSE_KEY\000\
  WHILE\000\
  IF\000\
  ELSE\000\
  ELSEIF\000\
  CASE\000\
  RETURN\000\
  SWITCH\000\
  BREAK\000\
  CONTINUE\000\
  DEF\000\
  DEFAULT\000\
  PARA\000\
  INTERS\000\
  RELAT\000\
  EE\000\
  NE\000\
  SE\000\
  LE\000\
  S\000\
  L\000\
  TE\000\
  E\000\
  PLUS\000\
  MINUS\000\
  MUL\000\
  DIV\000\
  PERC\000\
  SSE\000\
  LLE\000\
  SS\000\
  LL\000\
  "

let yynames_block = "\
  ID\000\
  NUM\000\
  INT\000\
  String\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 29 "ALG_Parser.mly"
           (print_string "parse stmt")
# 386 "ALG_Parser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 30 "ALG_Parser.mly"
          (print_string "parse geoexpr")
# 393 "ALG_Parser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'ex) in
    Obj.repr(
# 40 "ALG_Parser.mly"
         (ExStmt(_1))
# 400 "ALG_Parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 43 "ALG_Parser.mly"
          (GeoEx(_1))
# 407 "ALG_Parser.ml"
               : 'ex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "ALG_Parser.mly"
        (Ex(_1))
# 414 "ALG_Parser.ml"
               : 'ex))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 47 "ALG_Parser.mly"
         (String(_1))
# 421 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ellipse) in
    Obj.repr(
# 48 "ALG_Parser.mly"
         (EllipseEx(_1))
# 428 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'polygon) in
    Obj.repr(
# 49 "ALG_Parser.mly"
         (PolygonEx(_1))
# 435 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 50 "ALG_Parser.mly"
         (LineEx(_1))
# 442 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'point) in
    Obj.repr(
# 51 "ALG_Parser.mly"
         (PointEx(_1))
# 449 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 52 "ALG_Parser.mly"
                        (GeoBinop(_1,INTERS,_3))
# 457 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 53 "ALG_Parser.mly"
                      (GeoBinop(_1,PARA,_3))
# 465 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 54 "ALG_Parser.mly"
                       (GeoBinop(_1,RELAT,_3))
# 473 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 55 "ALG_Parser.mly"
                    (GeoBinop(_1,TE,_3))
# 481 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 56 "ALG_Parser.mly"
                    (GeoBinop(_1,SS,_3))
# 489 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 57 "ALG_Parser.mly"
                    (GeoBinop(_1,LL,_3))
# 497 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 58 "ALG_Parser.mly"
                     (GeoBinop(_1,SSE,_3))
# 505 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 59 "ALG_Parser.mly"
                     (GeoBinop(_1,LLE,_3))
# 513 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 60 "ALG_Parser.mly"
                    (GeoBinop1(_1,EE,_3))
# 521 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 61 "ALG_Parser.mly"
                    (GeoBinop1(_1,NE,_3))
# 529 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 62 "ALG_Parser.mly"
                    (GeoBinop1(_1,SE,_3))
# 537 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 63 "ALG_Parser.mly"
                    (GeoBinop1(_1,LE,_3))
# 545 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 64 "ALG_Parser.mly"
                   (GeoBinop1(_1,L,_3))
# 553 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'geoexpr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 65 "ALG_Parser.mly"
                   (GeoBinop1(_1,S,_3))
# 561 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 66 "ALG_Parser.mly"
               (GeoAssign(_1,_3))
# 569 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'geoexpr) in
    Obj.repr(
# 67 "ALG_Parser.mly"
                        (_2)
# 576 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 72 "ALG_Parser.mly"
     (NUM(_1))
# 583 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 73 "ALG_Parser.mly"
     (INT(_1))
# 590 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "ALG_Parser.mly"
    (ID(_1))
# 597 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "ALG_Parser.mly"
                 (Binop(_1,PLUS, _3))
# 605 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "ALG_Parser.mly"
                 (Binop(_1,MINUS, _3))
# 613 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "ALG_Parser.mly"
                 (Binop(_1,MUL, _3))
# 621 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "ALG_Parser.mly"
                 (Binop(_1,DIV, _3))
# 629 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "ALG_Parser.mly"
                 (Binop(_1,PERC, _3))
# 637 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "ALG_Parser.mly"
               (Binop1(_1,EE, _3))
# 645 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "ALG_Parser.mly"
               (Binop1(_1,NE, _3))
# 653 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "ALG_Parser.mly"
               (Binop1(_1,LE, _3))
# 661 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "ALG_Parser.mly"
               (Binop1(_1,SE, _3))
# 669 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "ALG_Parser.mly"
              (Binop1(_1,L, _3))
# 677 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "ALG_Parser.mly"
              (Binop1(_1,S, _3))
# 685 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "ALG_Parser.mly"
           (Assign(_1,_3))
# 693 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 87 "ALG_Parser.mly"
                    (_2)
# 700 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'point) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 90 "ALG_Parser.mly"
                                                 (Ellipse(_2,_4,_6))
# 709 "ALG_Parser.ml"
               : 'ellipse))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'points) in
    Obj.repr(
# 93 "ALG_Parser.mly"
                             (Polygon(_2))
# 716 "ALG_Parser.ml"
               : 'polygon))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'point) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'point) in
    Obj.repr(
# 96 "ALG_Parser.mly"
                                       (Line(_2,_4))
# 724 "ALG_Parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'point) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'point) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'point) in
    Obj.repr(
# 99 "ALG_Parser.mly"
                               ([_1;_3;_5])
# 733 "ALG_Parser.ml"
               : 'points))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'point) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'points) in
    Obj.repr(
# 100 "ALG_Parser.mly"
                               (_1::_3)
# 741 "ALG_Parser.ml"
               : 'points))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 102 "ALG_Parser.mly"
                                   (Point(_2,_4))
# 749 "ALG_Parser.ml"
               : 'point))
(* Entry start1 *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start1 (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
;;
