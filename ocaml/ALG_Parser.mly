%{
  open Printf
	open AST
%}

%token FOR LPAREN RPAREN COMMA LBRACKET RBRACKET LBRACE RBRACE SEMI 
%token INT_KEY FLOAT_KEY ARRAY_KEY STRING_KEY VOID_KEY BOOLEAN_KEY
%token POINT_KEY LINE_KEY POLYGON_KEY ELLIPSE_KEY
%token FOR WHILE IF ELSE ELSEIF CASE RETURN SWITCH BREAK CONTINUE DEF DEFAULT
%token <string> ID
%token <float> NUM
%token <int> INT
%token <string> String
%token PARA INTERS RELAT EE NE  SE LE S L TE E PLUS MINUS MUL DIV PERC SSE LLE  SS LL

%right E
%left PLUS MINUS
%left MUL DIV PERC
%left PARA INTERS RELAT TE SSE LLE  SS LL
%left EE NE SE LE S L


%start start1
%type <unit> start1

%% /* Grammar rules and actions follow */
start1:  
/*|expression {print_string "parse expression"}*/
| stmt     {print_string "parse stmt"} 
| geoexpr {print_string "parse geoexpr"}
/*| expr1  {print_string "parse expr1"}*/
/*| test    {print_string "test"}*/
	
/*	|LPAREN FOR RPAREN{print_string "parse (for) \n"}*/
;
/*expr1:
|expr S {}
*/
stmt:
|ex SEMI {ExStmt($1)}

ex:
|geoexpr  {GeoEx($1)}
| expr  {Ex($1)}

geoexpr:
|String  {String($1)}
|ellipse {EllipseEx($1)}
|polygon {PolygonEx($1)}
|line    {LineEx($1)}
|point   {PointEx($1)}
|geoexpr INTERS geoexpr {GeoBinop($1,INTERS,$3)}
|geoexpr PARA geoexpr {GeoBinop($1,PARA,$3)}
|geoexpr RELAT geoexpr {GeoBinop($1,RELAT,$3)} 
|geoexpr TE geoexpr {GeoBinop($1,TE,$3)}
|geoexpr SS geoexpr {GeoBinop($1,SS,$3)}
|geoexpr LL geoexpr {GeoBinop($1,LL,$3)}
|geoexpr SSE geoexpr {GeoBinop($1,SSE,$3)}
|geoexpr LLE geoexpr {GeoBinop($1,LLE,$3)}
|geoexpr EE geoexpr {GeoBinop1($1,EE,$3)}
|geoexpr NE geoexpr {GeoBinop1($1,NE,$3)}
|geoexpr SE geoexpr {GeoBinop1($1,SE,$3)}
|geoexpr LE geoexpr {GeoBinop1($1,LE,$3)}
|geoexpr L geoexpr {GeoBinop1($1,L,$3)}
|geoexpr S geoexpr {GeoBinop1($1,S,$3)}
| ID E geoexpr {GeoAssign($1,$3)}
| LPAREN geoexpr RPAREN {$2}
/*test:
|expr S {}
*/
expr:
|NUM {NUM($1)}
|INT {INT($1)}
|ID {ID($1)}
|expr PLUS expr  {Binop($1,PLUS, $3)}
|expr MINUS expr {Binop($1,MINUS, $3)}
|expr MUL expr   {Binop($1,MUL, $3)}
|expr DIV expr   {Binop($1,DIV, $3)}
|expr PERC expr  {Binop($1,PERC, $3)}
|expr EE expr  {Binop1($1,EE, $3)}
|expr NE expr  {Binop1($1,NE, $3)}
|expr LE expr  {Binop1($1,LE, $3)}
|expr SE expr  {Binop1($1,SE, $3)}
|expr L expr  {Binop1($1,L, $3)}
|expr S expr  {Binop1($1,S, $3)}
|ID E expr {Assign($1,$3)}
|LPAREN expr RPAREN {$2}

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

%%
