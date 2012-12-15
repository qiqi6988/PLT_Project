using namespace std;
#include "stdio.h"

class  point
{
public:
    float x;
    float y;
    point(float a,float b);
};

point::point(float a,float b){x=a;y=b;}

class line
{
public:
    point * p1;
    point  * p2;
    line(point *  a,point *  b);
};
line::line(point* a,point*  b){p1=a;p2=b;}

struct ellipse
{
    point * focusPoint;
    float a;//the length of major semi-axes
    float b;//the length of minot semi-axes
    ellipse(point * p, float x, float y);
};

ellipse::ellipse(point * p, float x, float y){focusPoint=p;a=x;b=y;}

class polygon
{
public:
    int pointNum;
    point ** pointCollection;
    polygon(int pointNum, point ** pointCollection);
};
polygon::polygon(int pointNum1, point ** pointCollection1){pointNum=pointNum1;pointCollection=pointCollection1;}


/************************The following code are used to judge the relation between two lines*******************/
bool isParallel(line l1, line l2)
{
    float deltaX1 = l1.p1->x-l1.p2->x,deltaY1 = l1.p1->y-l1.p2->y;
    float deltaX2 = l2.p1->x-l2.p2->x, deltaY2 = l2.p1->y-l2.p2->y;
    if(deltaX1 == 0 && deltaX2 == 0)
        return true;
    if(deltaX1*deltaX2 == 0 && deltaX1+deltaX2!=0)
        return false;
    if(deltaY1/deltaX1 != deltaY2/deltaX2)
        return false;
    return true;
}//judge whether two lines are parallel

/*
int main()
{
	printf("%f\n", (new point((float)1,(float)2))->x);
        printf("%f\n", (( new line( new point(1.1,1.2), new point(2.1,2.2)))->p1->x));
	printf("%f\n", ((new ellipse(new point(1.1,1.2),(float)3,(float)4))->focusPoint->x));
	//new point[]={new point(1.1,1.2),new point(1.1,1.2),new point(1.1,1.2)}
	int num=2;
	//printf("%d\n",(new int[num]{1,2})[0]);
	//point  p[]={point(1.1,1.2),point(1.1,1.2),point(1.1,1.2)};
	//new polygon(num, new point[num]{point(1.1,1.2),point(1.1,1.2),point(1.1,1.2)} );
	//new point*[num]{new point(1.1,1.2), new point(1.1,1.2)};
	printf("%d\n", (new polygon(3, new point*[3]{new point(1.1,1.2), new point(1.1,1.2), new point(3.1,1.2)}            ))->pointNum);
}
*/

/*
int main()
{line * l1;
line * l2;
bool a;
l1=new line(new point((float) 1,(float) 1),new point((float) 2,(float) 2));
l2=new line(new point((float) 3,(float) 3),new point((float) 4,(float) 4));
a=(isParallel(*l1,*l2));
}

*/





