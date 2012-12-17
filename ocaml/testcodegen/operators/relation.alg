def int main()
{
	line l1;
	line l2;
	line l3;
	ellipse e1;
	ellipse e2;
	l1=[[0;0],[1.1;1.1]];
	l2=[[-1;0],[0;5]];
	l3=[[0;0],[0;1]];
	e1={[1;1],1,1};
	e2={[1;1],1,2};
	print("l1 and e1 ");!!secant
	print(l1|-e1);
	print_newline();
	print("l3 and e1 ");!!tangent
	print(l3|-e1);
	print_newline();
	print("l3 and e2 ");!!tangent
	print(l3|-e2);
	print_newline();
	print("l2 and e2 ");!!separate
	print(l2|-e2);
	print_newline();
}
