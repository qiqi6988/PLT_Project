open AST


type env = {
	mutable functions : fdecl list;
	variables : (var_type * string) list;
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
	with Not_found ->raise(Failure("In the function" ^ func.fname ^" does not have the parameter "^ fpname))


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
let exist_id name func env= (check_exist_para_in_fun func name) or (check_exist_var_in_fun func name) or (exist_global_variable env name)


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

(*This function will check whether a (var_type*string) has a var_name that appears more than once in a function's local variable list*)
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






(*This function will get you the return type of a function if you give me the fname*)
let get_func_return_type func_name env = 
	try 
		 let func = List.find (func_equal_name func_name) env.functions in
		      func.ftype
	with Not_found -> raise(Failure("Function "^ func_name ^" is not found in the function defination list"))


(*This function will help check whether an ellipse's axis length is positive*)
let check_ellipse_axis expr = 
	match expr with
	| NUM(a) ->if a>0.0 then true else raise(Failure("The axis length of an ellipse mut be positive!"))
  | INT(a) ->if a>0 then true else raise(Failure("The axis length of an ellipse mut be positive!"))
	| _ -> true 

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
			let _check1 = check_ellipse_axis expr3 and _check2 = check_ellipse_axis expr4 in
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
					in let final = List.for_all check_point_validation l in
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
					| BOOLEAN, NE, BOOLEAN->BOOLEAN      (*NE*)
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

(*The following function will judge whether an expression is assign or call*)

let is_assign_call func = function
	| Assign(_,_) ->true
	| Call(_,_) ->true
	| _ ->false


(*This function is to check whether when calling function fname with a parameter list exprlist, it matches*)
(*all the required parameter type as claimed in the function declaration*)
(*fname: the function name being called*)
(*exprlist: the expression list which performs as the parameters when called*)
(*func: the function in which fname is called*)
(*env: the big enviornment*)

let check_func_paralist_type fname exprlist func1 env = 
	let func = return_func_given_name fname env in 
	let arg_type_list = List.map (fun(e) -> get_expr_type e func1 env) exprlist (*When you do the function call, you need to cehck the expr list matches every claimed parameter of the function*)
	  in
		if(List.length arg_type_list != List.length func.formal_list)
		    then raise(Failure("The numebr of parameters given when calling function "^ func.fname ^" is worng!"))
		else
			let check_one_by_one count arg_type =  (*arg_type is the type of this variable when being called*)
				let para = List.nth func.formal_list count in(*get this variable in the formal list*)
				  let (real_var_type,para_name) = para in (*get its real type*)
					  if real_var_type = arg_type (*if they are the same, just pass*)
						 then  count+1
						else
							begin
							match real_var_type, arg_type with
							| INT_TYPE,FLOAT-> count+1
							| FLOAT,INT_TYPE -> count+1
							| _ ->raise(Failure("Type does not all match in the call expression of "^ fname))
							end  (*end of check_one_by_one*)
			  in 
				     List.fold_left check_one_by_one 0 arg_type_list
(*The following function check whether a statements list end with a return statement*)

let has_return_stmt stmt_list = 
	if List.length stmt_list = 0
	  then false
	else match (List.hd (List.rev stmt_list)) with
	| Return(_) -> true
	| _->false

(*Check is a statement list, whether one if statements has a return value in it*)
let if_has_return stmt_list = 
	let if_stmt_list = List.filter (function If(_,_,_)->true |_ ->false) stmt_list in
	   let check_result = List.map (
			function
				If(_,s1,s2) ->
					     begin
							 match s1,s2 with
							| Block(st1), Block(st2) ->(has_return_stmt st1) && (has_return_stmt st2)
							| _ -> raise(Failure("The statements after if or else should be incldued in {}!"))
							end
			 |_ -> false
			) if_stmt_list in(*get a list "cehck_result" of boolean to tell whether each if statement has a return *)
			List.fold_left (fun a b -> b||a) false check_result



(*The following function will judge whether an expression is valid in a fund and expr*)

let rec expr_valid func expr env = 
	match expr with
	|Assign(id, e1) -> if exist_id id func env 
	                      then let type1 = get_type env func id and _ = expr_valid func e1 env and type2 = get_expr_type e1 func env in
												if type1 = type2 then true
												else
													begin
													match type1, type2 with
													| INT_TYPE,FLOAT -> true
													| FLOAT,INT_TYPE ->true
													| _ ->raise(Failure"Unmathed type in Assign operation!")
													end
										else raise(Failure("Undeclared identifier " ^ id ^ " is used!"))
	|Call(fname,exprlist) ->
		      if func_name_exist fname env
					   then let _fulfill_valid_exprs = List.map (fun e -> expr_valid func e env) exprlist in
						   let _check_type = check_func_paralist_type fname exprlist func env in
							true
					else raise(Failure("Undefined function: "^ fname ^ "is used!"))
	|_ ->
		try
			let _ = get_expr_type expr func env in true
		with Not_found -> raise(Failure("Invalid expression!"))


(*The following function will tell you whether a function's body is valid*)

let check_valid_body func env = 
   let rec check_stmt = 
		function
			| Block(stmt_list) -> 
				let _  = List.map (fun(x) -> check_stmt x) stmt_list in true(*block case*)
			| ExStmt(expr) -> let vldexpr = expr_valid func expr env and assign_call = is_assign_call func expr in
			        begin
								match vldexpr,assign_call with
								| true, true ->true
								| true, false -> raise(Failure("There is a statement in function "^func.fname^" which is not a function call or assignment, which is invalid!"))
								| false, _ -> raise(Failure("There is an invalid expession in function "^ func.fname))
							end
				|Return(expr) -> let ret  = get_expr_type expr func env in
				                     let real_type  = func.ftype in
														if ret = real_type then true else raise(Failure("Unmatched return type with function's defination!"))
				|If(expr,stmt1,stmt2) ->
					let expr_type = get_expr_type expr func env in
					   let _check_expr_type = 
							begin
							   match expr_type with
								| BOOLEAN -> true
								| _ -> raise(Failure("expression in If(..) should be type BOOLEAN!"))
							end
								in
								if (check_stmt stmt1) && (check_stmt stmt2)
								then true
								else raise(Failure("Invalid statement in the if statement in function: "^ func.fname))
				|For(_,_,_,stmt1) -> if check_stmt stmt1 then true else raise(Failure("Invalid statement in For statement in function:"^ func.fname))
				|While(_,stmt1)-> if check_stmt stmt1 then true else raise(Failure("Invalid statement in While statement in function:"^ func.fname))
				in (*end of check_stmt*)
      let _ = List.map (check_stmt) func.body in
			true						     


(*check whether a function's body has a return statement*)		
let func_body_has_return func = 
	let stmt_list = func.body in
	   let result = List.exists (function stmt -> match stmt with |Return(_) ->true |_ ->false) stmt_list	in
		     result  
(*get all the return statements' corresponding expression type*)
let fun_get_all_return_type func env= 
	let stmt_list = func.body in
	 let f result_list stmt = 
		match stmt with
		|Return(expr) -> (get_expr_type expr func env)::result_list 
		|_ -> result_list in
	  let result = List.fold_left f [] stmt_list in
		   result    
			
(*check whether a function's return statement's type all fulfills the real return type of this function*)
let check_return func env =
	match func.ftype with
	|  VOID -> if func_body_has_return func then raise(Failure("There should not be return statement in a void function: "^ func.fname)) else true
	|  f_type -> 
		let return_type_list  =  fun_get_all_return_type func env in
	      let f a  =  a= f_type in
				 if List.for_all  f return_type_list  then true else raise(Failure("At least one return type does not match the function's defination requriement!"))

(*THis will check each function's validity*)
let check_func f env =
		let _dup_name = fun_exist f env in
		   let _dup_formals = check_fpara_duplicate f in
			   let _dup_vlocals = check_var_duplicate f in
				   let _vbody = check_valid_body f env in
					   let _check_return_result = check_return f env in
						   let _ = env.functions <- (f) ::env.functions in
							    true


(*check whether there is a main function*)

									
let exists_main env = 
	if func_name_exist "main" env
	   then true else raise(Failure("No Main Function exist!"))
(*the following three functions will judge whether there is global variables redefiend!*)
let equal_variable_name (a,b) (c,d) = 
	b=d
	
let exist_v_name vlist vdecl = 
	let new_fun count x = 
		if(equal_variable_name vdecl x) then count+1 else count in
		 let result = List.fold_left new_fun 0 vlist in
		   if result <=1 then true else raise(Failure("Global Variable has been redefined!"))
	
let dup_in_global env = 
	 List.for_all (exist_v_name env.variables) env.variables


(*define all the built-in functions*)
let f1 = {ftype = VOID;fname = "displayPoint";formal_list = [(POINT,"a")];locals = [];body = []}
let f2 = {ftype = VOID;fname = "displayLine";formal_list = [(LINE,"a")];locals = [];body = []}
let f3 = {ftype = VOID;fname = "displayEllipse";formal_list = [(ELLIPSE,"a")];locals = [];body = []}
let f4 = {ftype = VOID;fname = "displayPolygon";formal_list = [(POLYGON,"a")];locals = [];body = []}

let f5 = {ftype = VOID;fname = "drawPoint";formal_list = [(POINT,"a")];locals = [];body = []}
let f6 = {ftype = VOID;fname = "drawLine";formal_list = [(LINE,"a")];locals = [];body = []}
let f7 = {ftype = VOID;fname = "drawEllipse";formal_list = [(ELLIPSE,"a")];locals = [];body = []}
let f8 = {ftype = VOID;fname = "drawPolygon";formal_list = [(POLYGON,"a")];locals = [];body = []}
let f9 = {ftype = VOID;fname = "print";formal_list = [(STRING,"a")];locals = [];body = []}

let built_in = [f1;f2;f3;f4;f5;f6;f7;f8;f9]
let check_program (var_list,fun_list) = 
	let env = {functions = built_in;variables = var_list} in
         let _global_check = dup_in_global env in
	let _dovalidation = List.map (fun f -> check_func f env) fun_list in
	   let  _mainexist = exists_main env in
		   let _ = print_endline "\nThe semantic check has been finished!\n" in
			true 