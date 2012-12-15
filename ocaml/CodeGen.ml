(*int a;
ellipse b;
def line function(line a,line b)
{
 if(a//b)
  return a//b;
else 
return a+b;
}
*)

open AST
open Printf



let gen_type=function
|INT_TYPE -> "int"
|FLOAT -> "float"
|VOID -> "void"
|BOOLEAN -> "bool"
| POINT -> "point *"
|LINE -> "line *"
|POLYGON-> "polygon *"
|ELLIPSE	-> "ellipse *"
|ARRAY ->"array"
|STRING->"string"


(*test case:gen_expr ( Binop(PointEx(Point(INT(1),INT(2))),EE,PointEx(Point(INT(1),INT(2))))  );;*)
(* gen_expr ( Binop(PointEx(Point(INT(1),INT(2))),PARA,PointEx(Point(INT(1),INT(2))))  );;*)
(* gen_actual_list [PointEx(Point(INT(1),INT(2)));PointEx(Point(INT(1),INT(2)))];;*)
(* gen_expr (Call("print", [PointEx(Point(INT(1),INT(2)));PointEx(Point(INT(1),INT(2)))]));;*)
let rec	 gen_expr expr=
	match expr with
	| NUM(f) ->string_of_float f
	| INT(i)-> string_of_int i
	| ID(id)-> id
	| Binop( expr1,op ,expr2)->
		begin
			match op with 
			|EE->"("^(gen_expr expr1)^")==("^(gen_expr expr2)^")"
		  |NE->"("^(gen_expr expr1)^")!=("^(gen_expr expr2)^")"
			|SE->"("^(gen_expr expr1)^")<=("^(gen_expr expr2)^")"
			|LE->"("^(gen_expr expr1)^")>=("^(gen_expr expr2)^")"
			|S->"("^(gen_expr expr1)^")<("^(gen_expr expr2)^")"
			|L->"("^(gen_expr expr1)^")>("^(gen_expr expr2)^")"
		  |PLUS->"("^(gen_expr expr1)^")+("^(gen_expr expr2)^")"
			|MINUS->"("^(gen_expr expr1)^")-("^(gen_expr expr2)^")"
			|MUL->"("^(gen_expr expr1)^")*("^(gen_expr expr2)^")"
			|DIV->"("^(gen_expr expr1)^")/("^(gen_expr expr2)^")"
			|PERC ->"("^(gen_expr expr1)^")%("^(gen_expr expr2)^")"
			|PARA->"(isParallel(*"^gen_expr expr1^",*"^gen_expr expr2^"))"
			|INTERS->"(getIntersect(*"^gen_expr expr1^",*"^gen_expr expr2^"))"
			|RELAT->"(getRelation("^gen_expr expr1^","^gen_expr expr2^"))"
			|TE->"(isCongruent("^gen_expr expr1^","^gen_expr expr2^"))"
			|SS->"(isPerimeterLessThan("^gen_expr expr1^","^gen_expr expr2^"))"
			|LL->"(isPerimeterLargerThan("^gen_expr expr1^","^gen_expr expr2^"))"
			|SSE->"(isPerimeterLessOrEqual("^gen_expr expr1^","^gen_expr expr2^"))"
			|LLE->"(isPerimeterLargerOrEqual("^gen_expr expr1^","^gen_expr expr2^"))"
			end
	| Assign(id,expr)->id^"="^(gen_expr expr)
  | Call(funcname, actual_list)->
		begin
			match funcname with 
			|_ ->funcname^"("^(gen_actual_list actual_list)^")"
			end
	| String(str)->str
	| PointEx(Point(expr1,expr2))->"new point((float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"
	| LineEx(Line(point1,point2))->"new line("^(gen_point point1)^","^(gen_point point2)^")"
	| PolygonEx(Polygon(point_list))->"new polygon("^(string_of_int (List.length point_list))^",new point*["^(string_of_int (List.length point_list))^"]"^(gen_points point_list)
	| EllipseEx(Ellipse(point, expr1,expr2))->"new ellipse("^(gen_point point)^",(float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"

and gen_actual_list =function
	actual_list ->"("^(String.concat "," (List.map gen_expr actual_list))^")"


and gen_point=function
	|Point(expr1,expr2)->"new point((float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"

and gen_points point_list=
	"{"^(String.concat "," (List.map gen_point point_list))^"}"

	
	
	
(*and stmt=
	| ExStmt of expr
	| Return of expr
	| Block of stmt list
	| If of expr * stmt * stmt
	| For of expr * expr * expr * stmt
	| While of expr * stmt
*)
let rec gen_stmt stmt=
	match stmt with
	| ExStmt(expr)->(gen_expr expr)^";"
	| Return(expr)->"return "^(gen_expr expr)^";"
	| Block(stmt_list)->"{"^(String.concat "\n" (List.map gen_stmt stmt_list))^"}"
	| If(expr,stmt1,stmt2)->"if("^(gen_expr expr)^")\n"^(gen_stmt stmt1)^"\nelse\n"^(gen_stmt stmt2)
	| For(expr1,expr2,expr3,stmt)->"for("^(gen_expr expr1)^";"^(gen_expr expr2)^";"^(gen_expr expr3)^")\n"^(gen_stmt stmt)
	| While(expr,stmt)->"while("^(gen_expr expr)^")\n"^(gen_stmt stmt)
	
	
(*let test_stmt=
	let expr=	PointEx(Point(INT(1),INT(2))) in
	let exstmt=ExStmt(expr) in
	let block=Block([exstmt;exstmt]) in
	print_string (gen_stmt block);;

let test_stmt=
	let expr=	PointEx(Point(INT(1),INT(2))) in
	let exstmt=ExStmt(expr) in
	let for1=For(expr,expr,expr,exstmt) in
	print_string (gen_stmt for1);;

let test_stmt=
	let expr=	PointEx(Point(INT(1),INT(2))) in
	let exstmt=ExStmt(expr) in
	let while1=While(expr,exstmt) in
	print_string (gen_stmt while1);;
	*)
	

(*gen_var_decl (INT_TYPE, "a")*)	
(*let gen_var_decl_list var_list=
let gen_var_decl (var_type, id)=
	(gen_type var_type)^" "^id 
	in
	String.concat "," (List.map gen_var_decl var_list)
	in
	print_string (gen_var_decl_list [(INT_TYPE ,"a");(FLOAT ,"b")]);;
*)

let gen_var_decl_list var_list=
let gen_var_decl (var_type, id)=
	(gen_type var_type)^" "^id 
	in
	String.concat "," (List.map gen_var_decl var_list)

let gen_locals local_list=
let gen_var_decl (var_type, id)=
	(gen_type var_type)^" "^id 
	in
	match local_list with
	| []->""
	| _->(String.concat ";\n" (List.map gen_var_decl local_list)	)^";"	
	
let gen_fdecl fdecl=
	let ftype=gen_type (fdecl.ftype) in
	let fname=fdecl.fname in
	let formal_list=(gen_var_decl_list fdecl.formal_list) in
	let locals=gen_locals fdecl.locals in
	let body=String.concat "\n" (List.map gen_stmt fdecl.body) in
	ftype^" "^fname^" "^"("^formal_list^")\n{"^locals^"\n"^body^"\n}"
	
	
(*let test_gen_func=
	let formals=[(INT_TYPE ,"a");(FLOAT ,"b")] in
	let locals=[(INT_TYPE ,"a");(FLOAT ,"b")] in
	let fname="func1" in
	let ftype=INT_TYPE in
	let expr=	PointEx(Point(INT(1),INT(2))) in
	let exstmt=ExStmt(expr) in
	let body=[exstmt;exstmt]in
	let fdecl_list=[{ftype=ftype;fname=fname;formal_list=formals;locals=locals;body=body};{ftype=ftype;fname=fname;formal_list=formals;locals=locals;body=body}] in
	let vars=locals in
	print_string (gen_program(vars,fdecl_list));;
*)


let gen_program (var_list, fdecl_list)=
	let vars=gen_locals var_list in
	let fdecls= String.concat "\n" (List.map gen_fdecl fdecl_list) in
	let header="#include \"main.h\"\n#include \"stdio.h\"\n" in
	header^vars^"\n"^fdecls



