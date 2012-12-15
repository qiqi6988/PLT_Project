def int main()
{
        line l1;
        line l2;
	point p;
        boolean a;
	ellipse e1;
 	ellipse e2;
	polygon poly1;
	polygon poly2;
	poly1=[[0,0],[-0.5,-1],[-1,0]];
	poly2=[[0,0],[0.5,1],[1,0]];
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

        printf(l1|-e1);

	if(poly1~poly2)
	printf("true");

	if(poly1<<poly2)
	printf("poly1lesspoly2");
	
	if(e1<<=e2)
	printf("e1lesse2");

	if(e1~~<e2)
	printf("e1smaller");
	if(e1~~>e2)
	printf("e1larger");
	
	e1~<e2;
	e1~>e2;
	printf("ok");
	
	
}

