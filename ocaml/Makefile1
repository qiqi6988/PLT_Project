all: AST.cmi test1
test1: CodeGen.cmo Semantics.cmo ALG_Parser.cmo ALG_Scanner.cmo test1.cmo 
	ocamlc  -o test1 CodeGen.cmo Semantics.cmo ALG_Parser.cmo ALG_Scanner.cmo  test1.cmo

test1.cmo : test1.ml
	ocamlc -c test1.ml

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

Semantics.cmo: Semantics.ml
	ocamlc -c Semantics.ml
	
CodeGen.cmo:CodeGen.ml
	ocamlc -c CodeGen.ml



AST.cmi: AST.mli
	ocamlc -c AST.mli	
clean: 
	rm -f *.cmo *.cmi ALG_Parser.mli ALG_Parser.ml ALG_Scanner.ml AST.cmi
