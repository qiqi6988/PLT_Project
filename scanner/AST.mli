type op=PARA|INTERS|RELAT|EE|NE|SSE|LLE |SS|LL|SE|LE|S|L|TE
type op1=PLUS|MINUS|MUL|DIV|PERC
type expr=
	| NUM of float
	| INT of int
	| ID of string
	| Binop of expr * op1 * expr

type point=
	| Point of expr * expr

type line=
	| Line of point * point

type polygon=
	| Polygon of point list

type ellipse=
	| Ellipse of point * expr * expr

type geoexpr=
	| PointEx of point
	| LineEx of line
	| PolygonEx of polygon
	| EllipseEx of ellipse
