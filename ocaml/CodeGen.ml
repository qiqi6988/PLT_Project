open AST


let gen_type=
|INT_TYPE -> "int"
|FLOAT -> "float"
|VOID -> "void"
|BOOLEAN -> "bool"
| POINT -> "point"
|LINE -> "line"
|POLYGON-> "polygon"
|ELLIPSE	-> "ellipse"


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
			|PARA->"(isParallel("^gen_expr expr1^","^gen_expr expr2^"))"
			|INTERS->"(getIntersect("^gen_expr expr1^","^gen_expr expr2^"))"
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
