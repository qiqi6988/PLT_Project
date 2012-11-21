	let _ =
	let lexbuf = Lexing.from_channel stdin in
	ALG_Parser.start1 ALG_Scanner.token lexbuf
	
	
	
(*let _ =
	let lexbuf = Lexing.from_channel stdin in
	let expr = Parser.expr Scanner.token lexbuf in
	let result = string2tt expr in
	print_string (result);; *)