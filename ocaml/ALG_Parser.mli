type token =
  | TL
  | TS
  | TTL
  | TTS
  | TE
  | T
  | QE
  | EOF
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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> AST.program
