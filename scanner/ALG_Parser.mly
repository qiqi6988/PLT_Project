%{
  open Printf
	open AST
%}

%token FOR LPAREN RPAREN COMMA LBRACKET RBRACKET
%token <float> NUM

%start start1
%type <unit> start1

%% /* Grammar rules and actions follow */
start1:   
	| LBRACKET point COMMA point COMMA point RBRACKET{print_string "parse a triangle"}
/*	|LPAREN FOR RPAREN{print_string "parse (for) \n"}*/
;

point:
|LBRACKET NUM COMMA NUM RBRACKET {Point($2,$4)}
%%
