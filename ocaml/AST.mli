type op=EE|NE|SE|LE|S|L
type op2=PARA|INTERS|RELAT|TE|SS|LL|SSE|LLE
type op1=PLUS|MINUS|MUL|DIV|PERC
type expr=
	| NUM of float
	| INT of int
	| ID of string
	| Binop of expr * op1 * expr
	| Binop1 of expr * op * expr
	| Assign of string * expr

type point=
	| Point of expr * expr

type line=
	| Line of point * point

type polygon=
	| Polygon of point list

type ellipse=
	| Ellipse of point * expr * expr

type geoexpr=
	| String of string
	| PointEx of point
	| LineEx of line
	| PolygonEx of polygon
	| EllipseEx of ellipse
	| GeoBinop of geoexpr * op2 * geoexpr
	| GeoBinop1 of geoexpr * op * geoexpr
	| GeoAssign of string * geoexpr

type ex=
	| GeoEx of geoexpr
	| Ex of expr

type stmt=
	| ExStmt of ex
