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

val start1 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
