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
%token PARA INTERS RELAT EE NE SSE LLE  SS LL SE LE S L TE E PLUS MINUS MUL DIV PERC

%left PLUS MINUS
%left MUL DIV PERC


%start start1
%type <unit> start1

%% /* Grammar rules and actions follow */
start1:  
| expr    {print_string "parse expr"} 
| geoexpr {print_string "parse geoexpr"}
	
/*	|LPAREN FOR RPAREN{print_string "parse (for) \n"}*/
;

geoexpr:
|ellipse {EllipseEx($1)}
|polygon {PolygonEx($1)}
|line    {LineEx($1)}
|point   {PointEx($1)}


expr:
|NUM {NUM($1)}
|INT {INT($1)}
|ID {ID($1)}
|expr PLUS expr  {Binop($1,PLUS, $3)}
|expr MINUS expr {Binop($1,MINUS, $3)}
|expr MUL expr   {Binop($1,MUL, $3)}
|expr DIV expr   {Binop($1,DIV, $3)}
|expr PERC expr  {Binop($1,PERC, $3)}

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
