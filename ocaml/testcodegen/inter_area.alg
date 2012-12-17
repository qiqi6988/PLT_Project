def int main()
{
	line l1;
	line l2;
	line l3;
	point p1;
	point p2;
	point p3;
	polygon poly;
	ellipse e;
	l1=[[1,1],[2,2]];
	l2=[[2,3],[2,10]];
	l3=[[1,2],[2,10]];
	display(l1);
	display(l2);
	display(l3);
	p1=l1^l2;
	p2=l2^l3;
	p3=l3^l1;
display(l1);
	display(l2);
	display(l3);
	l1=[p1,p3];
	poly=[p1,p2,p3];
	e=[p1,2,3];
	display(l1);
	display(poly);
	display(e);
	print_newline();
	print(Area(e));
}
