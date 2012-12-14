	let _ =
	let lexbuf = Lexing.from_channel stdin in
	let parse_prog=ALG_Parser.program ALG_Scanner.token lexbuf in
	let prog=CodeGen.gen_program parse_prog in
	print_string prog
