open AST

module NameMap = Map.Make(String)

let check_program (vars,funcs)=
	let globals=List.fold_left (fun globals (var_type,var_name)->NameMap.add var_name var_type globals) NameMap.empty vars in

	let a=NameMap.iter (fun var_name var_type->print_string var_name) globals in
	
	let functions=List.fold_left (fun functions fdecl->NameMap.add fdecl.fname fdecl functions) NameMap.empty funcs in
	let b=NameMap.iter (fun func_name func_decl->print_string func_name) functions in

	
	
			
			
	true
	
