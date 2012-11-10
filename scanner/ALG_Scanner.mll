{
  open Printf
	open ALG_Parser
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
let ignore=[' ' '\t' '\r' '\n']

rule token=parse
|ignore {print_string "ignored\n"; token lexbuf}
| "(!" 	{comment lexbuf}
| "!!"	{comment1 lexbuf}
(*type key words*)
|"int" {print_string "key int\n";token lexbuf}|"float" { FOR } |"string" {print_string "key string\n";token lexbuf}
|"array" {print_string "key array\n";token lexbuf}|"boolean" {print_string "key boolean\n";token lexbuf}|"void" {print_string "key void\n";token lexbuf}
(*geometry type key words*)
|"point" {print_string "key point\n";token lexbuf}|"line" {print_string "key line\n";token lexbuf}|"polygon" {print_string "key polygon";token lexbuf}|"ellipse" {print_string "key ellipse";token lexbuf}
(*control key words*)
|"for" {FOR}|"while" {print_string "key while\n";token lexbuf}|"if" {print_string "key if\n";token lexbuf}
| "else" {print_string "key else\n";token lexbuf}|"elseif" {print_string "key elseif";token lexbuf}|"case" {print_string "key case\n";token lexbuf}|"return" {print_string "key return\n";token lexbuf}
| "switch" {print_string "key switch\n";token lexbuf}|"continue" {print_string "key continue\n";token lexbuf}|"break" {print_string "key break\n";token lexbuf}
| "def" {print_string "key def\n";token lexbuf}|"default" {print_string "key default\n";token lexbuf}
|id		as identifier {printf "identifier: %s\n" identifier; token lexbuf}
|digit+ as num {printf "number: %d\n" (int_of_string num); token lexbuf} 
| (digit+'.'digit*|'.'digit+)('e'['+' '-']?digit+)?
| digit+'e'['+' '-']?digit+  as float_num {NUM(float_of_string float_num)}
(*punctuation*)
|"(" {LPAREN} | ")" {RPAREN} | "{" {print_string "LBRACE ";token lexbuf} | "}" {print_string "RBRACE ";token lexbuf}
| "[" {LBRACKET } | "]" {RBRACKET } |"," {COMMA } | ";" {print_string "SEMI ";token lexbuf}
(*Geometry operators*)
|"//" {print_string "// op ";token lexbuf}|"^" {print_string "^ op ";token lexbuf}|"|-" {print_string "|- op ";token lexbuf}|"==" {print_string "== op ";token lexbuf}|"!=" {print_string "!= op ";token lexbuf}
|"<<=" {print_string "<<= op ";token lexbuf}|">>=" {print_string ">>= op";token lexbuf}|"<<" {print_string "<< op";token lexbuf}|">>" {print_string ">> op";token lexbuf}
|"<=" {print_string "<= op ";token lexbuf}|">=" {print_string ">= op ";token lexbuf}|"<" {print_string "< op ";token lexbuf}|">" {print_string "> op ";token lexbuf}|"~=" {print_string "~= op ";token lexbuf}
(*basic operators*)
|"+" {print_string "add op ";token lexbuf} |"-" {print_string "minus op ";token lexbuf} | "*" {print_string "mul op ";token lexbuf}
|"/" {print_string "div op ";token lexbuf}|"%" {print_string "% op ";token lexbuf} |"=" {print_string "assign op ";token lexbuf}
|eof  	{exit 0}
|_ 	as char		{raise (Failure("illegal input"^Char.escaped char))}

and comment =parse
| "!)" {token lexbuf}
| _		{comment lexbuf}

and comment1=parse
|"\n" {token lexbuf}
| _ {comment1 lexbuf}