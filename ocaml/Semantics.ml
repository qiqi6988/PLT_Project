open AST

module NameMap = Map.Make(String)

let check_program (vars,funcs)=
	let globals=List.fold_left (fun globals (var_type,var_name)->NameMap.add var_name var_type globals) NameMap.empty vars in

	let a=NameMap.iter (fun var_name var_type->print_string var_name) globals in
	
	let functions=List.fold_left (fun functions fdecl->NameMap.add fdecl.fname fdecl functions) NameMap.empty funcs in
	let b=NameMap.iter (fun func_name func_decl->print_string func_name) functions in
        true

(*the type env*)

type env = {
	functions : fdecl list ;
	variables : (var_type * string) list ;
	} 

(*this is a function used in other functions*)
(*It is used to test whether a function's name is equal to a string 'name'*)

let func_equal_name name = function
	| func -> func.fname = name

(*This function is to check whether a function's name has been defined more than once*)

let fun_exist func env = 
	let name = func.fname in
	   try
			   let _ = List.find (func_equal_name name) env.functions in
				   let e = "Function whose name is "^ name ^" has been defined more than once" in
					     raise (Failure e)
			with Not_found -> false

(*This function is to check whether a function's name exist in the env*)
let func_name_exist name env = List.exists (func_equal_name name) env.functions

(*This function will directly give you the function object if you give its name*)
let return_func_given_name name env = 
	try
		   let result = List.find (func_equal_name name) env.functions in
			      result
  with Not_found -> raise(Failure("Function "^ name ^ " has not been declared!"))

(*check whether*)
let exist_formal_para func fpname = 
	let check func fpname = List.exists (function (a,b) -> b = fpname) func.formal_list in
	  check func fpname
	
