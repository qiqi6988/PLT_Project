def int main()
{
        line l1;
        line l2;
	point p;
        boolean a;
	ellipse e1;
 	ellipse e2;
        l1=[[1,1],[2,2]];
        l2=[[3,3],[4,4]];
	e1=[[1,1],1,1];
	e2=[[3,1],1,1];
        a=l1//l2;
	if(a)
	printf("true");

	p=l1^l2;
	displayPoint(p);
	printf(e1|-e2);
	printf("\n");
        printf(l1|-e1);
	
}

