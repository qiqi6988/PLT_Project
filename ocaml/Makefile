all: AST.cmi test
test: Semantics.cmo ALG_Parser.cmo ALG_Scanner.cmo test.cmo 
	ocamlc  -o test Semantics.cmo ALG_Parser.cmo ALG_Scanner.cmo  test.cmo

test.cmo : test.ml
	ocamlc -c test.ml

ALG_Scanner.cmo : ALG_Scanner.ml
	ocamlc -c ALG_Scanner.ml

ALG_Scanner.ml : ALG_Scanner.mll
	ocamllex ALG_Scanner.mll
ALG_Parser.cmo:	ALG_Parser.ml
	ocamlc -c ALG_Parser.ml
ALG_Parser.ml:	ALG_Parser.mli
	ocamlc -c ALG_Parser.mli
ALG_Parser.mli:  ALG_Parser.mly
	ocamlyacc ALG_Parser.mly
	
Semantics.cmo:Semantics.ml
	ocamlc -c Semantics.ml

AST.cmi: AST.mli
	ocamlc -c AST.mli	
clean: 
	rm -f *.cmo *.cmi ALG_Parser.mli ALG_Parser.ml ALG_Scanner.ml AST.cmi
