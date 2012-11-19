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
  | PARA
  | INTERS
  | RELAT
  | EE
  | NE
  | SSE
  | LLE
  | SS
  | LL
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

open Parsing;;
# 2 "ALG_Parser.mly"
  open Printf
	open AST
# 61 "ALG_Parser.ml"
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
  290 (* PARA *);
  291 (* INTERS *);
  292 (* RELAT *);
  293 (* EE *);
  294 (* NE *);
  295 (* SSE *);
  296 (* LLE *);
  297 (* SS *);
  298 (* LL *);
  299 (* SE *);
  300 (* LE *);
  301 (* S *);
  302 (* L *);
  303 (* TE *);
  304 (* E *);
  305 (* PLUS *);
  306 (* MINUS *);
  307 (* MUL *);
  308 (* DIV *);
  309 (* PERC *);
    0|]

let yytransl_block = [|
  287 (* ID *);
  288 (* NUM *);
  289 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\003\000\003\000\003\000\003\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\004\000\005\000\
\006\000\008\000\008\000\007\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\007\000\003\000\
\005\000\005\000\003\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\009\000\007\000\008\000\021\000\000\000\
\002\000\003\000\004\000\005\000\006\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\016\000\000\000\000\000\012\000\013\000\014\000\000\000\000\000\
\000\000\019\000\020\000\000\000\000\000\017\000\000\000\000\000\
\015\000"

let yydgoto = "\002\000\
\007\000\015\000\009\000\010\000\011\000\012\000\013\000\034\000"

let yysindex = "\010\000\
\253\254\000\000\002\255\000\000\000\000\000\000\000\000\016\255\
\000\000\000\000\000\000\000\000\000\000\233\254\252\254\015\255\
\025\255\233\254\233\254\233\254\233\254\233\254\233\254\002\255\
\000\000\218\254\218\254\000\000\000\000\000\000\006\255\001\255\
\012\255\000\000\000\000\233\254\027\255\000\000\011\255\032\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\037\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\001\000\004\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\033\255\
\000\000"

let yygindex = "\000\000\
\000\000\002\000\000\000\000\000\000\000\000\000\003\000\038\000"

let yytablesize = 310
let yytable = "\023\000\
\010\000\003\000\008\000\011\000\036\000\016\000\014\000\004\000\
\005\000\006\000\001\000\035\000\020\000\021\000\022\000\037\000\
\041\000\038\000\024\000\026\000\027\000\028\000\029\000\030\000\
\031\000\032\000\033\000\004\000\005\000\006\000\025\000\014\000\
\004\000\005\000\006\000\037\000\001\000\039\000\018\000\040\000\
\017\000\000\000\000\000\000\000\018\000\019\000\020\000\021\000\
\022\000\018\000\019\000\020\000\021\000\022\000\018\000\019\000\
\020\000\021\000\022\000\018\000\019\000\020\000\021\000\022\000\
\018\000\019\000\020\000\021\000\022\000\000\000\000\000\000\000\
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
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\000\000\010\000\011\000\
\000\000\011\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\000\010\000\000\000\011\000\011\000"

let yycheck = "\004\001\
\000\000\005\001\001\000\000\000\004\001\003\000\005\001\031\001\
\032\001\033\001\001\000\006\001\051\001\052\001\053\001\004\001\
\006\001\006\001\004\001\018\000\019\000\020\000\021\000\022\000\
\023\000\024\000\024\000\031\001\032\001\033\001\006\001\005\001\
\031\001\032\001\033\001\004\001\000\000\036\000\006\001\037\000\
\003\000\255\255\255\255\255\255\049\001\050\001\051\001\052\001\
\053\001\049\001\050\001\051\001\052\001\053\001\049\001\050\001\
\051\001\052\001\053\001\049\001\050\001\051\001\052\001\053\001\
\049\001\050\001\051\001\052\001\053\001\255\255\255\255\255\255\
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
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\004\001\255\255\006\001\004\001\
\255\255\006\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\049\001\050\001\255\255\049\001\050\001"

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
  SSE\000\
  LLE\000\
  SS\000\
  LL\000\
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
  "

let yynames_block = "\
  ID\000\
  NUM\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 24 "ALG_Parser.mly"
          (print_string "parse expr")
# 310 "ALG_Parser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'geoexpr) in
    Obj.repr(
# 25 "ALG_Parser.mly"
          (print_string "parse geoexpr")
# 317 "ALG_Parser.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ellipse) in
    Obj.repr(
# 31 "ALG_Parser.mly"
         (EllipseEx(_1))
# 324 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'polygon) in
    Obj.repr(
# 32 "ALG_Parser.mly"
         (PolygonEx(_1))
# 331 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'line) in
    Obj.repr(
# 33 "ALG_Parser.mly"
         (LineEx(_1))
# 338 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'point) in
    Obj.repr(
# 34 "ALG_Parser.mly"
         (PointEx(_1))
# 345 "ALG_Parser.ml"
               : 'geoexpr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 38 "ALG_Parser.mly"
     (NUM(_1))
# 352 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 39 "ALG_Parser.mly"
     (INT(_1))
# 359 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 40 "ALG_Parser.mly"
    (ID(_1))
# 366 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "ALG_Parser.mly"
                 (Binop(_1,PLUS, _3))
# 374 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 42 "ALG_Parser.mly"
                 (Binop(_1,MINUS, _3))
# 382 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "ALG_Parser.mly"
                 (Binop(_1,MUL, _3))
# 390 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "ALG_Parser.mly"
                 (Binop(_1,DIV, _3))
# 398 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 45 "ALG_Parser.mly"
                 (Binop(_1,PERC, _3))
# 406 "ALG_Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'point) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 48 "ALG_Parser.mly"
                                                 (Ellipse(_2,_4,_6))
# 415 "ALG_Parser.ml"
               : 'ellipse))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'points) in
    Obj.repr(
# 51 "ALG_Parser.mly"
                             (Polygon(_2))
# 422 "ALG_Parser.ml"
               : 'polygon))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'point) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'point) in
    Obj.repr(
# 54 "ALG_Parser.mly"
                                       (Line(_2,_4))
# 430 "ALG_Parser.ml"
               : 'line))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'point) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'point) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'point) in
    Obj.repr(
# 57 "ALG_Parser.mly"
                               ([_1;_3;_5])
# 439 "ALG_Parser.ml"
               : 'points))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'point) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'points) in
    Obj.repr(
# 58 "ALG_Parser.mly"
                               (_1::_3)
# 447 "ALG_Parser.ml"
               : 'points))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 60 "ALG_Parser.mly"
                                   (Point(_2,_4))
# 455 "ALG_Parser.ml"
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
