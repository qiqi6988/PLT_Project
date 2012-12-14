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

let rec	 gen_expr=function
	| NUM(f) ->string_of_float f
	| INT(i)-> string_of_int i
	| ID(id)-> id
	| Binop( expr1,op ,expr)->""
	| Assign(id,expr)->id^"="^(gen_expr expr)
(*	| Call(funcname, actual_list)->funcname^"("^(gen_actual_list actual_list)^")"*)
	| String(str)->str
	| PointEx(Point(expr1,expr2))->"new point((float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"
	| LineEx(Line(point1,point2))->"new line("^(gen_point point1)^","^(gen_point point2)^")"
	| PolygonEx(Polygon(point_list))->""
	| EllipseEx(Ellipse(point, expr1,expr2))->"new ellipse("^(gen_point point)^",(float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"



and gen_point=function
	|Point(expr1,expr2)->"new point((float) "^(gen_expr expr1)^",(float) "^(gen_expr expr2)^")"

and gen_points point_list=
	"{"^(String.concat "," (List.map gen_point point_list))^"}"

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
