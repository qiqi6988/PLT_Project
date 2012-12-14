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

(*check whether a 'fpname' is in the formal parameter list of a function*)
let exist_formal_para func fpname = 
	let check func fpname = List.exists (function (a,b) -> b = fpname) func.formal_list in
	  check func fpname

(*check whether a 'vname' is declared in the local variable list of a function*)

let exist_local_variable func vname = 
	let check func vname = List.exists (function (a,b) -> b= vname) func.locals in
	  check func vname


(*check whether a 'vname' is declared in the global variable list*)
		
let exist_global_variable env vname = 
	let check env vname = List.exists (function (a,b) -> b= vname) env.variables in
	  check env vname

(*get the type of a 'vname' in the global variable list*)

let get_global_variable_type env vname = 
	try 
		let fpara = List.find(function (_,b) -> b = vname) env.variables in
		   let(c,_) = fpara in
			   c
	with Not_found ->raise(Failure("Cannot find a variable called "^ vname ^ " in global variable list!")) 

(*The following function will get you the type of a parameter in a function if you give parameter's name*)

let get_para_type func fpname = 
	try 
		   let para  =List.find (function (a,b) -> b = fpname) func.formal_list in (*check whether fname is in  func's formal_list*)
			   let (para_type,_) = para in
				    para_type
	with Not_found ->raise(Failure("In the function" ^ func.fname ^" does not have the parameter "^ fpname));;	


(*The following function will get you the type of a local variable in a function if you give variable's name*)

let get_var_type func vname = 
	try
		 let var  = List.find (function (a,b) -> b = vname) func.locals in(*search in function's local variable list*)
		   let (var_type,_) = var in
			   var_type
  with Not_found -> raise(Failure("In the function"^ func.fname ^" there is not a loval variable called " ^ vname ^ " defined!"))

(*A function to check whether a function has a parameter called fpname*)
let check_exist_para_in_fun func fpname = List.exists (function (_,b)->b = fpname) func.formal_list

(*A function to check whether a function has a local parameter called vname*)
let check_exist_var_in_fun func vname = List.exists (function (_,b) -> b = vname) func.locals



(*The function to get the type of a variable "name" to see whether it appears in parameter or local variable list or global variable list*)

let get_type env func name = 
	if check_exist_var_in_fun func name
	       then get_var_type func name
	else
		    if check_exist_para_in_fun func name
				   then get_para_type func name
				else
					if exist_global_variable env name 
						then get_global_variable_type env name
						else
					 raise(Failure("Variable" ^ name^" is used but not declared in function "^ func.fname))


(*The function will check whether a variable "name" exists in a function's para list or local list*)
let exist_id name func = (check_exist_para_in_fun func name) or (check_exist_var_in_fun func name)


(*The function will check whether a function name "fun_name" has a corresponding function in the environment*)

let find_func func_name env = 
	try 
		 let _ = List.find (func_equal_name func_name) env.functions in
		      true
	with Not_found -> raise(Failure("Function "^ func_name ^" is not found in the function defination list"))


(*This function will check whether a (var_type*string) has a para_name that appears more than once in a function's parameter list*)	
let count_fpara func = function (_,b)
  -> let f count (_,c) = 
		  if c=b then count+1
			else count
			in
			  let count = List.fold_left f 0 func.formal_list in
			     if count > 1
					then raise(Failure("Duplicate parameter in function " ^ func.fname))
					else
						count


(*This function will automatically check whether there is parameter duplication in function defination*)
						
let check_fpara_duplicate func = 
	List.map (count_fpara func) func.formal_list  

(*This function will check whether a (var_type*string) has a var_name that appears more than once in a function's local variable list)
let count_var func = function (_,b)
  -> let f count (_,c) = 
		  if c=b then count+1
			else count
			in
			  let count = List.fold_left f 0 func.locals in
			     if count > 1
					then raise(Failure("Duplicate parameter "^ b ^ " in function " ^ func.fname))
					else
						count

(*This function will automatically check whether a function has local variable duplication*)

let check_var_duplicate func = 
	List.map (count_var func) func.locals

(*check whether a string represents a number*)
let is_int x =
	try ignore(int_of_string x); true
	with _ ->false


let is_int s =
	try ignore (int_of_string s); true
	with _ -> false

let is_float s =
	try ignore (float_of_string s); true
	with _ -> false

let is_letter s = string_match (regexp "[A-Za-z]") s 0

let is_string s = string_match (regexp "\".*\"") s 0

let is_string_bool = function "true" -> true | "false" -> true | _ -> false


(*This function will get you the return type of a function if you give me the fname*)
let get_func_return_type func_name env = 
	try 
		 let func = List.find (func_equal_name func_name) env.functions in
		      func.ftype
	with Not_found -> raise(Failure("Function "^ func_name ^" is not found in the function defination list"))



(*This function will return the type of an expression*)
(*env: the environment including the global variable list and function list*)
(*expr: the expression we are exploring*)
(*func:the function we are in now*)
let rec get_expr_type expr func env = 
	match expr with
	| String(s) ->STRING
	| ID(s) -> get_type env func s (*we need to modify it later*)
	| INT(s) -> INT_TYPE
  
	| PointEx(Point(expr1,expr2)) 
	   ->  
			   let t1 = get_expr_type expr1 func env and t2 = get_expr_type expr2 func env in
		      begin 
					match t1,t2 with
					| INT_TYPE, INT_TYPE -> POINT
					| INT_TYPE, FLOAT -> POINT
					| FLOAT,INT_TYPE -> POINT
					| FLOAT, FLOAT ->POINT
					| _, _ -> raise(Failure("Error in Point expression!"))
					end  
	| LineEx(Line(Point(expr1,expr2),Point(expr3,expr4)))
	   -> let check_temp_expr temp_expr = 
			     let t = get_expr_type temp_expr func env (*get the type of one expression*)
				   in
					   begin
					  match t with
						| INT_TYPE -> true
						| FLOAT -> true (*the function check_temp_expr will check whether an expression's type is INT_TYPE or FLOAT*)
						| _ -> false
						 end
			  in
				    if check_temp_expr expr1 && check_temp_expr expr2 && check_temp_expr expr3 && check_temp_expr expr4
						then LINE
						else raise(Failure("Error in Line expression"))		  		
	| EllipseEx(Ellipse(Point(expr1,expr2),expr3,expr4)) -> 
		let check_temp_expr temp_expr = 
			     let t = get_expr_type temp_expr func env (*get the type of one expression*)				
				   in
				   	begin
					  match t with
						| INT_TYPE -> true
						| FLOAT -> true (*the function check_temp_expr will check whether an expression's type is INT_TYPE or FLOAT*)
						| _ -> false
						end
			  in
				    if check_temp_expr expr1 && check_temp_expr expr2 && check_temp_expr expr3 && check_temp_expr expr4
						then ELLIPSE
						else raise(Failure("Error in Ellipse expression"))

  
	| PolygonEx(Polygon(l)) 
	   -> let check_point_validation pp =
						begin	
						match pp with
					
						| Point(expr1,expr2) -> 
					
					   let t1 =  get_expr_type expr1 func env  and t2 = get_expr_type expr2 func env
					in
					  begin
					   match t1,t2 with
						| INT_TYPE,INT_TYPE ->true
						| INT_TYPE,FLOAT ->true
						| FLOAT,INT_TYPE -> true
						| FLOAT,FLOAT -> true
						| _,_ ->false
						end
					|_ -> raise(Failure("Do Point Check to a non-Point object!"))
					end(*end of definition of check_point_validation*)
					in let final = List.exists check_point_validation l in
					if final then POLYGON else raise(Failure("Error in Polygon expression!"))(*check whether each point is valid*)
						 

	| NUM(s) ->FLOAT
	| Binop(expr1,op,expr2) -> let temp1 = get_expr_type expr1 func env and temp2 = get_expr_type expr2 func env
	      in
				begin
					match temp1,op,temp2 with
					| BOOLEAN, EE, BOOLEAN -> BOOLEAN(*EE*)
					| INT_TYPE, EE, INT_TYPE -> BOOLEAN
					| INT_TYPE, EE, FLOAT -> BOOLEAN
					| FLOAT, EE, INT_TYPE -> BOOLEAN
					| FLOAT, EE, FLOAT -> BOOLEAN
					| POLYGON,EE,POLYGON -> BOOLEAN
					| ELLIPSE, EE, ELLIPSE -> BOOLEAN
					| LINE, EE, LINE -> BOOLEAN
					| POINT, EE, POINT -> BOOLEAN
					| STRING, EE, STRING -> BOOLEAN
					| BOOLEAN, NE, BOOLEAN           (*NE*)
					| INT_TYPE, NE, INT_TYPE -> BOOLEAN
					| INT_TYPE, NE, FLOAT -> BOOLEAN
					| FLOAT, NE, INT_TYPE -> BOOLEAN
					| FLOAT, NE, FLOAT -> BOOLEAN
					| POLYGON,NE,POLYGON -> BOOLEAN
					| ELLIPSE, NE, ELLIPSE -> BOOLEAN
					| LINE, NE, LINE -> BOOLEAN
					| POINT, NE, POINT -> BOOLEAN
					| STRING, NE, STRING -> BOOLEAN
					| INT_TYPE, SE, INT_TYPE -> BOOLEAN   (*SE,LE,S,L*)
					| INT_TYPE, SE, FLOAT -> BOOLEAN
					| FLOAT, SE, INT_TYPE -> BOOLEAN
					| FLOAT, SE, FLOAT -> BOOLEAN
					| POLYGON, SE, POLYGON -> BOOLEAN
					| POLYGON, SE, ELLIPSE -> BOOLEAN
					| ELLIPSE, SE, POLYGON -> BOOLEAN
					| ELLIPSE, SE, ELLIPSE -> BOOLEAN
				  | INT_TYPE, LE, INT_TYPE -> BOOLEAN
					| INT_TYPE, LE, FLOAT -> BOOLEAN
					| FLOAT, LE, INT_TYPE -> BOOLEAN
					| FLOAT, LE, FLOAT -> BOOLEAN
					| POLYGON, LE, POLYGON -> BOOLEAN
					| POLYGON, LE, ELLIPSE -> BOOLEAN
					| ELLIPSE, LE, POLYGON -> BOOLEAN
					| ELLIPSE, LE, ELLIPSE -> BOOLEAN
					| INT_TYPE, S, INT_TYPE -> BOOLEAN
					| INT_TYPE, S, FLOAT -> BOOLEAN
					| FLOAT, S, INT_TYPE -> BOOLEAN
					| FLOAT, S, FLOAT -> BOOLEAN
					| POLYGON, S, POLYGON -> BOOLEAN
					| POLYGON, S, ELLIPSE -> BOOLEAN
					| ELLIPSE, S, POLYGON -> BOOLEAN
					| ELLIPSE, S, ELLIPSE -> BOOLEAN
					| INT_TYPE, L, INT_TYPE -> BOOLEAN
					| INT_TYPE, L, FLOAT -> BOOLEAN
					| FLOAT, L, INT_TYPE -> BOOLEAN
					| FLOAT, L, FLOAT -> BOOLEAN
					| POLYGON, L, POLYGON -> BOOLEAN
					| POLYGON, L, ELLIPSE -> BOOLEAN
					| ELLIPSE, L, POLYGON -> BOOLEAN
					| ELLIPSE, L, ELLIPSE -> BOOLEAN
					| LINE, PARA, LINE -> BOOLEAN(*PARA*)
					| LINE, INTERS, LINE -> POINT(*INTERS*)
					(*| LINE, INTERS, ELLIPSE -> ARRAY*)
					(*| ELLIPSE, INTERS, LINE -> ARRAY*)
					| ELLIPSE, INTERS, ELLIPSE ->LINE
					| LINE,RELAT, LINE -> INT_TYPE (*RELAT*)
					| LINE, RELAT, ELLIPSE -> INT_TYPE
					| ELLIPSE, RELAT, LINE -> INT_TYPE
					| ELLIPSE, RELAT, ELLIPSE -> INT_TYPE
					| POLYGON, TE, POLYGON -> BOOLEAN (*TE*)
					| POLYGON, SS, POLYGON -> BOOLEAN(*SS,LL,SSE,LLE*)
					| POLYGON, SS, ELLIPSE -> BOOLEAN
					| ELLIPSE, SS, POLYGON -> BOOLEAN
					| ELLIPSE, SS, ELLIPSE -> BOOLEAN
					| POLYGON, LL, POLYGON -> BOOLEAN
					| POLYGON, LL, ELLIPSE -> BOOLEAN
					| ELLIPSE, LL, POLYGON -> BOOLEAN
					| ELLIPSE, LL, ELLIPSE -> BOOLEAN
					| POLYGON, SSE, POLYGON -> BOOLEAN
					| POLYGON, SSE, ELLIPSE -> BOOLEAN
					| ELLIPSE, SSE, POLYGON -> BOOLEAN
					| ELLIPSE, SSE, ELLIPSE -> BOOLEAN
					| POLYGON, LLE, POLYGON -> BOOLEAN
					| POLYGON, LLE, ELLIPSE -> BOOLEAN
					| ELLIPSE, LLE, POLYGON -> BOOLEAN
					| ELLIPSE, LLE, ELLIPSE -> BOOLEAN
					| INT_TYPE, PLUS, INT_TYPE -> INT_TYPE
					| INT_TYPE, PLUS, FLOAT -> FLOAT
					| FLOAT, PLUS, INT_TYPE -> FLOAT
					| FLOAT, PLUS, FLOAT -> FLOAT
					| INT_TYPE, MINUS, INT_TYPE -> INT_TYPE
					| INT_TYPE, MINUS, FLOAT -> FLOAT
					| FLOAT, MINUS, INT_TYPE -> FLOAT
					| FLOAT, MINUS, FLOAT -> FLOAT 
					| INT_TYPE, MUL, INT_TYPE -> INT_TYPE
					| INT_TYPE, MUL, FLOAT -> FLOAT
					| FLOAT, MUL, INT_TYPE -> FLOAT
					| FLOAT, MUL, FLOAT -> FLOAT
					| INT_TYPE, DIV, INT_TYPE -> FLOAT
					| INT_TYPE, DIV, FLOAT -> FLOAT
					| FLOAT, DIV, INT_TYPE -> FLOAT
					| FLOAT, DIV, FLOAT -> FLOAT
					| INT_TYPE, PERC, INT_TYPE ->INT_TYPE
					| _,_,_ ->raise(Failure("Illegal type used in a binop expression"))
				end(*end of binop consideration*)
			|Assign(id,expr) -> get_expr_type expr func env
			|Call(fname,expr) -> get_func_return_type fname env(*We want to check the return type of the function fname*)
			|_ ->raise(Failure("An unexpected error occured!"))

