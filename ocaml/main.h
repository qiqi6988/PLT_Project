using namespace std;
#include "stdio.h"
#include <iostream>
#include <math.h>
#include "string.h"
#include "stdlib.h"


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
void displayPoint(point *p)
{
    printf("This is a point!\nIt is:\n%f %f", p->x,p->y);
    
}
point * getPoint(float f1, float f2)
{
    point *p=new point(f1,f2);
    return p;
}

point *getIntersect(line l1, line l2)
{
	bool isParallel(line l1, line l2);
    point *result = getPoint(0,0);
    if(isParallel(l1,l2))
    {
        printf("these two linse are parallel!\n");
        return result;// if these two lines are parallel, just return the original point with a warning.
    }
    else
    {
        float x1 = l1.p1->x, y1 = l1.p1->y, x2 = l1.p2->x,y2 = l1.p2->y;
        float h1 = l2.p1->x, k1 = l2.p1->y, h2 = l2.p2->x, k2 = l2.p2->y;
        float temp2 = (k1-k2)/(h1-h2), temp1 = (y1-y2)/(x1-x2);
        float a = temp1-temp2,b = k1-y1-h1*temp2+x1*temp1;
        float resultX = b/a;
        float resultY = temp1*(resultX-x1) +y1;
        result = getPoint(resultX, resultY);
        return result;
    }
    
}// get the intersect point of two lines



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
float getDis(point *p1, point *p2)
{
    return sqrt(pow((p1->x-p2->x),2.0)+pow((p1->y-p2->y),2.0));
}

char * getRelation(ellipse  circle1, ellipse  circle2)
{
	char * str=(char*)malloc(sizeof(char)*30);
    if(circle1.a!=circle1.b || circle2.a!=circle2.b)
    {
        printf("These two shapes are not both circles!\n");
	str="";
        return str;//inform a mistake
    }
    
    float r1 = circle1.a, r2 = circle2.a;
        
    float dis = getDis(circle1.focusPoint, circle2.focusPoint);
    if(fabs(dis-r1-r2)<=0.0001)
        strcpy(str,"circumscribe");// they are circumscribe
    else if(fabs(dis-fabs(r1-r2))<=0.0001)
        strcpy(str,"inscribe");// they are inscribe
    else if(dis<fabs(r1-r2))
        strcpy(str,"contain");// one circle contains another one
    else if(dis>r1+r2)
          strcpy(str,"seperate");//they are seperated
    else if(r1+r2>dis && dis > fabs(r1-r2))
       strcpy(str,"secant");// they are secant
    
    return str;
    
}


char * getRelation(line l, ellipse e)
{
    float y1 = l.p1->y, y2 = l.p2->y, x1 = l.p1->x, x2 = l.p2->x;
    float h = e.focusPoint->x, k = e.focusPoint->y, a = e.a, b= e.b;
    float k1 = y1-y2, k2 = x2-x1, k3 = 2*x1*y1-x1*y2-y1*x2;
    float Ba = (a*a*k1*k1)/(k2*k2)+b*b;
    float Bb = (2*a*a*k*k1)/k2 - (2*a*a*k1*k3)/(k2*k2)-2*b*b*h;
    float Bc = (a*a*k3*k3)/(k2*k2) +a*a*k*k -(2*a*a*k*k3)/(k2)+b*b*h*h-a*a*b*b;
    //cout<<Ba<<endl;
    char * str=(char*)malloc(sizeof(char)*30);
    if(k2 == 0)// special case for the vertical line
    {
       if(fabs((k3/k1)-h) == a)
           {strcpy(str,"tangent");return str;}//tangent
       else if((k3/k1)>h-a && (k3/k1)<h+a)
         { strcpy(str,"secant");return str;}//secant
        else
           {strcpy(str,"seperate");return str;}//seperate
      
    }
    float temp = Bb*Bb-4*Ba*Bc;
  //  cout<<temp<<endl;
   // cout<<temp<<endl;
    if(temp>0)
        {strcpy(str,"secant");return str;}//secant
    else if(temp==0)
        {strcpy(str,"tangent");return str;}//tangent
    else
       { strcpy(str,"seperate");return str;}//seperate

}
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





