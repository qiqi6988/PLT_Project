test: ALG_Scanner.cmo test.cmo 
	ocamlc  -o test ALG_Scanner.cmo  test.cmo

test.cmo : test.ml
	ocamlc -c test.ml

ALG_Scanner.cmo : ALG_Scanner.ml
	ocamlc -c ALG_Scanner.ml

ALG_Scanner.ml : ALG_Scanner.mll
	ocamllex ALG_Scanner.mll
	
clean: 
		rm -f *.cmo *.cmi