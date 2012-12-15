def int main()
{
        line l1;
        line l2;
	point p;
        boolean a;
        l1=[[1,1],[2,2]];
        l2=[[3,3],[4,4]];
        a=l1//l2;
	if(a)
	printf("true");

	p=l1^l2;
	displayPoint(p);
}

