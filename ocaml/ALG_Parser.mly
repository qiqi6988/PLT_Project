%{
  open Printf
	open AST
%}
%token EOF
%token FOR LPAREN RPAREN COMMA LBRACKET RBRACKET LBRACE RBRACE SEMI 
%token INT_KEY FLOAT_KEY ARRAY_KEY STRING_KEY VOID_KEY BOOLEAN_KEY
%token POINT_KEY LINE_KEY POLYGON_KEY ELLIPSE_KEY
%token FOR WHILE IF ELSE ELSEIF CASE RETURN SWITCH BREAK CONTINUE DEF DEFAULT
%token <string> ID
%token <float> NUM
%token <int> INT
%token <string> String
%token PARA INTERS RELAT EE NE  SE LE S L TE E PLUS MINUS MUL DIV PERC SSE LLE  SS LL

%nonassoc NOELSE
%nonassoc ELSE


%right E
%left PLUS MINUS
%left MUL DIV PERC
%left PARA INTERS RELAT TE SSE LLE  SS LL
%left EE NE SE LE S L


%start program
%type <AST.program> program


%% /* Grammar rules and actions follow */



program:
/* nothing */ { [], [] }
| var_decl program { ($1 :: fst $2), snd $2 }
| fdecl program { fst $2, ($1 :: snd $2) }


stmt_list: 
|{ [] }
| stmt stmt_list { $1 :: $2 }

stmt:
| expr SEMI {ExStmt($1)}
| RETURN expr SEMI { Return($2) }
| LBRACE stmt_list RBRACE { Block($2) }
| IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
| IF LPAREN expr RPAREN stmt ELSE stmt{ If($3, $5, $7) }
| FOR LPAREN expr SEMI expr SEMI expr RPAREN stmt{ For($3, $5, $7, $9) }
| WHILE LPAREN expr RPAREN stmt{ While($3, $5)}

var_type:
|INT_KEY   {INT_TYPE}
|FLOAT_KEY  {FLOAT}
|ARRAY_KEY  {ARRAY}
|STRING_KEY {STRING}
|VOID_KEY  {VOID}
|BOOLEAN_KEY {BOOLEAN}
| POINT_KEY {POINT}
|LINE_KEY {LINE}
|POLYGON_KEY {POLYGON}
|ELLIPSE_KEY {ELLIPSE}

/*function declaration*/
formal_decl:
|var_type ID {$1,$2}
 
var_decl:
|var_type ID SEMI {$1,$2}

formal_list_opt:
|{[]}
| formal_list {$1} 

formal_list:
|formal_decl  { [$1] }
|formal_decl COMMA formal_list { $1 :: $3 }

vdecl_list: 
| {[]}
|var_decl vdecl_list  { $1 :: $2 }


fdecl: 
|DEF var_type ID LPAREN formal_list_opt RPAREN LBRACE vdecl_list stmt_list RBRACE {{ftype=$2;fname=$3;formal_list=$5;locals=$8;body=$9}}

/*end function declaration*/





/*ex:
|expr  {GeoEx($1)}
| expr  {Ex($1)}
| ID LPAREN actuals_opt RPAREN {Call($1,$3)}
*/
actuals_opt:
|{ [] }
| actuals_list { $1 }
actuals_list:
|expr { [$1] }
|expr COMMA actuals_list { $1 :: $3 }

/*expression*/

/*expr:
|String  {String($1)}
|ellipse {EllipseEx($1)}
|polygon {PolygonEx($1)}
|line    {LineEx($1)}
|point   {PointEx($1)}
|expr INTERS expr {GeoBinop($1,INTERS,$3)}
|expr PARA expr {GeoBinop($1,PARA,$3)}
|expr RELAT expr {GeoBinop($1,RELAT,$3)} 
|expr TE expr {GeoBinop($1,TE,$3)}
|expr SS expr {GeoBinop($1,SS,$3)}
|expr LL expr {GeoBinop($1,LL,$3)}
|expr SSE expr {GeoBinop($1,SSE,$3)}
|expr LLE expr {GeoBinop($1,LLE,$3)}
|expr EE expr {GeoBinop1($1,EE,$3)}
|expr NE expr {GeoBinop1($1,NE,$3)}
|expr SE expr {GeoBinop1($1,SE,$3)}
|expr LE expr {GeoBinop1($1,LE,$3)}
|expr L expr {GeoBinop1($1,L,$3)}
|expr S expr {GeoBinop1($1,S,$3)}
| ID E expr {GeoAssign($1,$3)}
| LPAREN expr RPAREN {$2}
*/
expr:

|NUM {NUM($1)}
|INT {INT($1)}
|ID {ID($1)}
|String  {String($1)}
/*|point   {PointEx($1)}*/
|polygon {PolygonEx($1)}
|ellipse {EllipseEx($1)}
|line    {LineEx($1)}
|expr INTERS expr {Binop($1,INTERS,$3)}
|expr PARA expr {Binop($1,PARA,$3)}
|expr RELAT expr {Binop($1,RELAT,$3)} 
|expr TE expr {Binop($1,TE,$3)}
|expr SS expr {Binop($1,SS,$3)}
|expr LL expr {Binop($1,LL,$3)}
|expr SSE expr {Binop($1,SSE,$3)}
|expr LLE expr {Binop($1,LLE,$3)}
|expr PLUS expr  {Binop($1,PLUS, $3)}
|expr MINUS expr {Binop($1,MINUS, $3)}
|expr MUL expr   {Binop($1,MUL, $3)}
|expr DIV expr   {Binop($1,DIV, $3)}
|expr PERC expr  {Binop($1,PERC, $3)}
|expr EE expr  {Binop($1,EE, $3)}
|expr NE expr  {Binop($1,NE, $3)}
|expr LE expr  {Binop($1,LE, $3)}
|expr SE expr  {Binop($1,SE, $3)}
|expr L expr  {Binop($1,L, $3)}
|expr S expr  {Binop($1,S, $3)}
|ID E expr {Assign($1,$3)}
|LPAREN expr RPAREN {$2}
| ID LPAREN actuals_opt RPAREN {Call($1,$3)}

ellipse:
| LBRACKET point COMMA expr COMMA expr RBRACKET  {Ellipse($2,$4,$6)}

polygon: 
| LBRACKET points RBRACKET   {Polygon($2)}

line:
| LBRACKET point COMMA point RBRACKET  {Line($2,$4)}

points:
|point COMMA point COMMA point {[$1;$3;$5]}
| point COMMA points           {$1::$3}
point:
|LBRACKET expr COMMA expr RBRACKET {Point($2,$4)}
/*expression*/
%%
