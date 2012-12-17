def int main()
{
	line l1;
	line l2;
	line l3;
	point p1;
	point p2;
	point p3;
	polygon p1;
	l1=[[1,1],[2,2]];
	l2=[[0,0],[2,0]];
	l3=[[2,2],[2,0]];
	p1=l1^l2;
	p2=l2^l3;
	p3=l3^l1;
	l1=[p1,p2];
}
