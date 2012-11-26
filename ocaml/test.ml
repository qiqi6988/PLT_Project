	let _ =
	let lexbuf = Lexing.from_channel stdin in
	let parse_prog=ALG_Parser.program ALG_Scanner.token lexbuf in
	let prog=Semantics.check_program parse_prog in
	true
	

