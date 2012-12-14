open Printf

		let _ =
	let lexbuf = Lexing.from_channel stdin in
	let parse_prog=ALG_Parser.program ALG_Scanner.token lexbuf in
	let prog=CodeGen.gen_program parse_prog in
	let out_channel = open_out "output.c" in
	output_string out_channel prog