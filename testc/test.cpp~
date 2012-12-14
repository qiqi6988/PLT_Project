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
    point * p2;
    line(point * a,point * b);
};
line::line(point * a,point * b){p1=a;p2=b;}

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

int main()
{
	//printf("%f\n", (new point((float)1,(float)2))->x);
       // printf("%f\n", ((new line(new point(1.1,1.2),new point(2.1,2.2)))->p1->x));
	//printf("%f\n", ((new ellipse(new point(1.1,1.2),(float)3,(float)4))->focusPoint->x));
	//new point[]={new point(1.1,1.2),new point(1.1,1.2),new point(1.1,1.2)}
	int num=2;
	//printf("%d\n",(new int[num]{1,2})[0]);
	//point  p[]={point(1.1,1.2),point(1.1,1.2),point(1.1,1.2)};
	//new polygon(num, new point[num]{point(1.1,1.2),point(1.1,1.2),point(1.1,1.2)} );
	//new point*[num]{new point(1.1,1.2), new point(1.1,1.2)};
	printf("%d\n", (new polygon(num, new point*[num]{new point(1.1,1.2), new point(1.1,1.2), new point(3.1,1.2)}            ))->pointNum);
}











