//
//  main.cpp
//  PLT
//
//  Created by Qingye Jiang on 11/24/12.
//  Copyright (c) 2012 Qingye Jiang. All rights reserved.
//

#include <iostream>
#include <math.h>
#include <graphics.h>
using namespace std;
struct point
{
    float x;
    float y;

};
struct line
{
    point p1;
    point p2;
};//Note: if we use line as a vector, then the vector starts from p1 to p2.
struct polygon
{
    int pointNum;
    point * pointCollection;
};
struct ellipse
{
    point focusPoint;
    float a;//the length of major semi-axes
    float b;//the length of minot semi-axes
    
};



/************************************The following code are used to compose shapes*****************************/
point getPoint(float f1, float f2)
{
    point p;
    p.x = f1;
    p.y = f2;
    return p;
}
line getLine(point P1, point P2)
{
    line l;
    l.p1 = P1;
    l.p2 = P2;
    return l;
    
}
polygon getPolygon(int num, point * collection)
{
    polygon result;
    result.pointNum  = num;
    result.pointCollection = new point[num];
    for(int i =0;i<num;i++)
    {
        result.pointCollection[i] = collection[i];
    }
   // delete [] collection;
    return result;
}
ellipse getEllipse(point p,float a,float b)
{
    ellipse e;
    e.a = a;
    e.b = b;
    e.focusPoint = p;
    return e;
}





float getDis(point p1, point p2)
{
    return sqrt(pow((p1.x-p2.x),2.0)+pow((p1.y-p2.y),2.0));
}

float getAngle(line l1, line l2)// get the angle between two lines
{
    float Vx1 = l1.p1.x - l1.p2.x;
    float Vy1 = l1.p1.y - l1.p2.y;
    float Vx2 = l2.p1.x - l2.p2.x;
    float Vy2 = l2.p1.y - l2.p2.y;
    return acos((Vx1*Vx2+Vy1*Vy2)/(getDis(l1.p1,l1.p2)*getDis(l2.p1,l2.p2)));
}

/************************The following code are used to move a shape***************************************/
point movePoint(point p, float x, float y)// move a point based on the vector (x,y)
{
    point result;
    result.x = p.x-x;
    result.y = p.y-y;
    return result;
}
line moveLine(line l, float x, float y)// move a line based on the vector (x,y)
{
    line result;
    result.p1.x = l.p1.x-x;
    result.p1.y = l.p1.y-y;
    result.p2.x = l.p2.x-x;
    result.p2.y = l.p2.y-y;
    return result;
}
polygon movePolygon(polygon poly, float x, float y)// move a polygon based on the vector (x,y)
{
    int num = poly.pointNum,i;
    polygon result;
    result.pointNum = num;
    result.pointCollection = new point[num];
    for(i = 0;i<num;i++)
    {
        result.pointCollection[i].x = poly.pointCollection[i].x-x;
        result.pointCollection[i].y = poly.pointCollection[i].y-y;
    }
    return result;
    
}
ellipse moveEllipse(ellipse e, float x, float y)// move an ellipse based on the vector (x,y)
{
    ellipse result;
    result.focusPoint = movePoint(e.focusPoint, x, y);
    result.a = e.a;
    result.b = e.b;
    return result;
}
/********************The following code are used to display the information of a shape*******************/

void displayPoint(point p)
{
    printf("This is a point!\nIt is:\n%f %f", p.x,p.y);
    
}
void displayLine(line l)
{
    printf("This is a line!\n");
    printf("The first point is (%f %f) \n",l.p1.x,l.p1.y);
    printf("The second point is (%f %f) \n", l.p2.x,l.p2.y);
}
void displayPolygon(polygon p)
{
    printf("This is a polygon with %d edges! \n",p.pointNum);
    printf("The points of this polygon is: \n");
    int num = p.pointNum,i;
    point * C = p.pointCollection;
    for(i = 0;i<num;i++)
    {
        printf("(%f %f)\n", C[i].x, C[i].y);
    }
}
void displayEllipse(ellipse e)
{
    printf("This is an ellipse!\nIts focus point is (%f %f)\nIts major semi-axe's length is %f, and its minor semi-axe's length is %f", e.focusPoint.x, e.focusPoint.y, e.a, e.b);
}




bool naiveSimilar(polygon shape1, polygon shape2,int start1, int start2)// assume we know where to start to check whether two polygond are similar
{
    int i = 0,j = 0;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    point * C1 = shape1.pointCollection;
    point * C2 = shape2.pointCollection;
    while(i<num1 && j<num2)
    {
            line shape1Line1 = getLine(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
            line shape1Line2 = getLine(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
            line shape2Line1 = getLine(C2[(start2+j)%num2],C2[(start2+j-1+num2)%num2]);
            line shape2Line2 = getLine(C2[(start2+j)%num2],C2[(start2+j+1)%num2]);
            float shape1Line1Length = getDis(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
            float shape1Line2Length = getDis(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
            float shape2Line1Length = getDis(C2[(start2+j)%num2],C2[(start2+j-1+num2)%num2]);
            float shape2Line2Length = getDis(C2[(start2+j)%num2],C2[(start2+j+1)%num2]);
            if(fabs(getAngle(shape1Line1,shape1Line2) - getAngle(shape2Line1,shape2Line2)) >= 0.001)
            {
             
                return false;
            }
            if(fabs((shape1Line1Length/shape2Line1Length)-(shape1Line2Length/shape2Line2Length)) >=0.001)
            {
                return false;//we should also check whether the ratio of edges' length are the same
            }
        
        i++;
        j++;
    }
    return true;

}


bool naiveSimilar2(polygon shape1, polygon shape2,int start1, int start2)// assume we know where to start to check whether two polygond are similar
{
    int i = 0,j = 0;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    point * C1 = shape1.pointCollection;
    point * C2 = shape2.pointCollection;
    while(i<num1 && j<num2)
    {
        line shape1Line1 = getLine(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        line shape1Line2 = getLine(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        line shape2Line1 = getLine(C2[(start2-j+num2)%num2],C2[(start2-j+1+num2)%num2]);
        line shape2Line2 = getLine(C2[(start2-j+num2)%num2],C2[(start2-j-1+num2)%num2]);
        float shape1Line1Length = getDis(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        float shape1Line2Length = getDis(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        float shape2Line1Length = getDis(C2[(start2-j+num2)%num2],C2[(start2-j+1+num2)%num2]);
        float shape2Line2Length = getDis(C2[(start2-j+num2)%num2],C2[(start2-j-1+num2)%num2]);
        if(fabs(getAngle(shape1Line1,shape1Line2) - getAngle(shape2Line1,shape2Line2)) >= 0.001)
        {
            return false;
        }
        if(fabs((shape1Line1Length/shape2Line1Length)-(shape1Line2Length/shape2Line2Length)) >=0.001)
        {
            return false;//we should also check whether the ratio of edges' length are the same
        }
        
        i++;
        j++;
    }
    return true;
    
}// counter clockwise check
bool polygonSimilar(polygon shape1, polygon shape2)//judge whether two polygons are similar
{
    int i;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    if(num1 != num2)
        return false;// if the two polygon have different point numbers, then they are not similar
    else
    {
        for(i = 0;i<num1;i++)
        {
            if(naiveSimilar(shape1,shape2,i,0) || naiveSimilar2(shape1, shape2, i, 0))
                return true;
        }
        return false;
        
    }
}

bool naiveCongruent(polygon shape1, polygon shape2,int start1, int start2)// assume we know where to start to check whether two polygond are similar
{
    int i = 0,j = 0;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    point * C1 = shape1.pointCollection;
    point * C2 = shape2.pointCollection;
    while(i<num1 && j<num2)
    {
        line shape1Line1 = getLine(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        line shape1Line2 = getLine(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        line shape2Line1 = getLine(C2[(start2+j)%num2],C2[(start2+j-1+num2)%num2]);
        line shape2Line2 = getLine(C2[(start2+j)%num2],C2[(start2+j+1)%num2]);
        float shape1Line1Length = getDis(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        float shape1Line2Length = getDis(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        float shape2Line1Length = getDis(C2[(start2+j)%num2],C2[(start2+j-1+num2)%num2]);
        float shape2Line2Length = getDis(C2[(start2+j)%num2],C2[(start2+j+1)%num2]);
        if(fabs(getAngle(shape1Line1,shape1Line2) - getAngle(shape2Line1,shape2Line2)) >= 0.0001)
        {
            
            return false;
        }
        if(fabs(shape1Line1Length-shape2Line1Length)>0.0001 || fabs(shape1Line2Length-shape2Line2Length)>0.0001)
        {
            return false;//we should also check whether the ratio of edges' length are the same
        }
        
        i++;
        j++;
    }
    return true;
    
}


bool naiveCongruent2(polygon shape1, polygon shape2,int start1, int start2)// assume we know where to start to check whether two polygond are congruent
{
    int i = 0,j = 0;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    point * C1 = shape1.pointCollection;
    point * C2 = shape2.pointCollection;
    while(i<num1 && j<num2)
    {
        line shape1Line1 = getLine(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        line shape1Line2 = getLine(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        line shape2Line1 = getLine(C2[(start2-j+num2)%num2],C2[(start2-j+1+num2)%num2]);
        line shape2Line2 = getLine(C2[(start2-j+num2)%num2],C2[(start2-j-1+num2)%num2]);
        float shape1Line1Length = getDis(C1[(start1+i)%num1],C1[(start1+i-1+num1)%num1]);
        float shape1Line2Length = getDis(C1[(start1+i)%num1],C1[(start1+i+1)%num1]);
        float shape2Line1Length = getDis(C2[(start2-j+num2)%num2],C2[(start2-j+1+num2)%num2]);
        float shape2Line2Length = getDis(C2[(start2-j+num2)%num2],C2[(start2-j-1+num2)%num2]);
        if(fabs(getAngle(shape1Line1,shape1Line2) - getAngle(shape2Line1,shape2Line2)) >= 0.0001)
        {
            return false;
        }
        if(fabs(shape1Line1Length-shape2Line1Length)>0.0001 || fabs(shape1Line2Length!=shape2Line2Length)>0.0001)
        {
            return false;//we should also check whether the ratio of edges' length are the same
        }
        
        i++;
        j++;
    }
    return true;
    
}// counter clockwise check

bool polygonCongruent(polygon shape1, polygon shape2)//judge whether two polygons are similar
{
    int i;
    int num1 = shape1.pointNum,num2 = shape2.pointNum;
    if(num1 != num2)
        return false;// if the two polygon have different point numbers, then they are not similar
    else
    {
        for(i = 0;i<num1;i++)
        {
            if(naiveCongruent(shape1,shape2,i,0) || naiveCongruent2(shape1, shape2, i, 0))
                return true;
        }
        return false;
        
    }
}

float getTriangleArea(polygon triangle)
{
    if(triangle.pointNum != 3)
    {
        printf("error in getting triangle area! This is not a triangle!\n");
        return 0;
    }
    point *C = triangle.pointCollection;
    
    float result = 0;
    result = result + C[0].x*(C[1].y-C[2].y);
    result = result + C[1].x*(C[2].y-C[0].y);
    result = result + C[2].x*(C[0].y-C[1].y);
    return fabs(result/2);
}

float getPolygonArea(polygon p)
{
    int num  =p.pointNum;
    float result =0;
    point * C = p.pointCollection;
    if(num<=2)
        return 0;
    if(num == 3)
        return getTriangleArea(p);
    else
    {
        point C1[3] = {C[num-2],C[num-1],C[0]};
        point C2[3] = {C[0],C[1],C[2]};
        polygon t1 = getPolygon(3,C1);
        polygon t2 = getPolygon(3,C2);
        result = result + getTriangleArea(t1);
        result = result + getTriangleArea(t2);//first add the two trianlges on the edge
        for(int i = 2;i<num-2;i++)
        {
            point tempC[3] = {C[0],C[i],C[i+1]};
            polygon tempT = getPolygon(3, tempC);
            result = result+getTriangleArea(tempT);
            
        }
        return result;
        
    }
}
float getPolygonPerimeter(polygon p)
{
    int num = p.pointNum;
    float result = 0;
    point * C = p.pointCollection;
    for(int i = 0;i<num;i++)
    {
        result = result +getDis(C[i%num],C[(i+1)%num]);
    }
    return result;
}
float getEllipseArea(ellipse e)
{
    return 3.14159*e.a*e.b;
}
float getEllipsePerimeter(ellipse e)
{
    return 3.14159*(3*(e.a+e.b)-sqrt((3*e.a+e.b)*(e.a+3*e.b)));
}

int lineAndEllipse(line l, ellipse e)
{
    float y1 = l.p1.y, y2 = l.p2.y, x1 = l.p1.x, x2 = l.p2.x;
    float h = e.focusPoint.x, k = e.focusPoint.y, a = e.a, b= e.b;
    float k1 = y1-y2, k2 = x2-x1, k3 = 2*x1*y1-x1*y2-y1*x2;
    float Ba = (a*a*k1*k1)/(k2*k2)+b*b;
    float Bb = (2*a*a*k*k1)/k2 - (2*a*a*k1*k3)/(k2*k2)-2*b*b*h;
    float Bc = (a*a*k3*k3)/(k2*k2) +a*a*k*k -(2*a*a*k*k3)/(k2)+b*b*h*h-a*a*b*b;
    cout<<Ba<<endl;
    if(k2 == 0)// special case for the vertical line
    {
       if(fabs((k3/k1)-h) == a)
           return 2;//tangent
       else if((k3/k1)>h-a && (k3/k1)<h+a)
           return 1;//secant
        else
            return 3;//seperate
      
    }
    float temp = Bb*Bb-4*Ba*Bc;
    cout<<temp<<endl;
   // cout<<temp<<endl;
    if(temp>0)
        return 1;//secant
    else if(temp==0)
        return 2;//tangent
    else
        return 3;//seperate
}
bool isTangentLE(line l, ellipse e)//judge whether a line and an ellipe are tangent
{
    if(lineAndEllipse(l,e) == 2)
        return true;
    return false;
}
bool isSecantLE(line l, ellipse e)//judge whether a line and an ellipe are secant
{
    if(lineAndEllipse(l,e) == 1)
        return true;
    return false;
}
bool isSeperateLE(line l, ellipse e)////judge whether a line and an ellipe are seperated
{
    if(lineAndEllipse(l, e) == 3)
        return true;
    return false;
    
}

/************************The following code are used to judge the relationship between circles*******************/
int circleRelation(ellipse circle1, ellipse circle2)
{
    if(circle1.a!=circle1.b || circle2.a!=circle2.b)
    {
        printf("These two shapes are not both circles!\n");
        return 1;//inform a mistake
    }
    
    float r1 = circle1.a, r2 = circle2.a;
        
    float dis = getDis(circle1.focusPoint, circle2.focusPoint);
    if(fabs(dis-r1-r2)<=0.0001)
        return 2;// they are circumscribe
    else if(fabs(dis-fabs(r1-r2))<=0.0001)
        return 3;// they are inscribe
    else if(dis<fabs(r1-r2))
        return 4;// one circle contains another one
    else if(dis>r1+r2)
          return 5;//they are seperated
    else if(r1+r2>dis && dis > fabs(r1-r2))
        return 6;// they are secant
    
    return 1;
    
}

bool circleAreTangent(ellipse circle1, ellipse circle2)
{
    if(circleRelation(circle1, circle2) == 2 || circleRelation(circle1, circle2) == 3)
        return true;
    return false;
}

bool circleAreSecant(ellipse circle1, ellipse circle2)
{
    if(circleRelation(circle1, circle2) == 6)
        return true;
    return false;
}

bool circleAreSeperated(ellipse circle1, ellipse circle2)
{
    if(circleRelation(circle1,circle2) == 5 && circleRelation(circle1, circle2) == 4)
        return true;
    return false;
}
/************************The following code are used to judge the relation between two lines*******************/
bool isParallel(line l1, line l2)
{
    float deltaX1 = l1.p1.x-l1.p2.x,deltaY1 =  l1.p1.y-l1.p2.y;
    float deltaX2 = l2.p1.x-l2.p2.x, deltaY2 = l2.p1.y-l2.p2.y;
    if(deltaX1 == 0 && deltaX2 == 0)
        return true;
    if(deltaX1*deltaX2 == 0 && deltaX1+deltaX2!=0)
        return false;
    if(deltaY1/deltaX1 != deltaY2/deltaX2)
        return false;
    return true;
}//judge whether two lines are parallel

point getIntersectPoint(line l1, line l2)
{
    point result = getPoint(0,0);
    if(isParallel(l1,l2))
    {
        printf("these two linse are parallel!\n");
        return result;// if these two lines are parallel, just return the original point with a warning.
    }
    else
    {
        float x1 = l1.p1.x, y1 = l1.p1.y, x2 = l1.p2.x,y2 = l1.p2.y;
        float h1 = l2.p1.x, k1 = l2.p1.y, h2 = l2.p2.x, k2 = l2.p2.y;
        float temp2 = (k1-k2)/(h1-h2), temp1 = (y1-y2)/(x1-x2);
        float a = temp1-temp2,b = k1-y1-h1*temp2+x1*temp1;
        float resultX = b/a;
        float resultY = temp1*(resultX-x1) +y1;
        result = getPoint(resultX, resultY);
        return result;
    }
    
}// get the intersect point of two lines

int main(int argc, const char * argv[])
{

    // insert code here...
    std::cout << "Hello, World!\n";
    /*
    point p1;
    point p2,p3;
    p1.x = 0.0;
    p1.y  =0.0;
    p2.x = 1.0;
    p2.y = 1.0;
    p3.x = 0.0;
    p3.y = -1.0;
    line line1 = getLine(p1,p2);
    line line2 = getLine(p1,p3);
    cout<<getAngle(line1,line2)<<endl;
    cout<<getDis(p1,p2);*/
    
    
    
    point p1 = getPoint(0,0),p2 = getPoint(0,1),p3 = getPoint(1,1),p4 = getPoint(2,0);
    point p5 = getPoint(0,1),p6 = getPoint(0,0),p7 = getPoint(-2,0),p8 = getPoint(-1,1);
    point C1[4] = {p1,p2,p3,p4};
    point C2[4] = {p7,p8,p5,p6};
    polygon poly1 = getPolygon(4, C1),poly2 = getPolygon(4,C2);
   // displayPolygon(poly1);
   // displayPoint(p1);
    cout<<polygonCongruent(poly1, poly2)<<endl;
   // line line1 = getLine(p1,p2);
   // displayLine(line1);
   /* point p1 = getPoint(-1,1),p2 = getPoint(1,1),p3 = getPoint(2,0), p4 = getPoint(1,-1),p5= getPoint(-1, -1),p6= getPoint(-2,0);
    point C[6] = {p1,p2,p3,p4,p5,p6};
    
    polygon poly = getPolygon(6, C);
    displayPolygon(poly);
    displayPolygon(movePolygon(poly,1,1));*/
   // cout<<getPolygonArea(poly)<<endl;
    //cout<<getPolygonPerimeter(poly)<<endl;
    
    
    /*point p = getPoint(0, 0);
    point p1 = getPoint(0.5,0), p2 = getPoint(0.5,0.5);
    line l = getLine(p1, p2);
    
    ellipse e =  getEllipse(p,1,1);
    displayEllipse(moveEllipse(e, 1, 1));
   // cout<<getEllipseArea(e)<<" "<<getEllipsePerimeter(e)<<endl;
   // cout<<lineAndEllipse(l, e)<<endl;*/
    
   /* point p1 = getPoint(0,0), p2 = getPoint(-3,0);
    ellipse e1 = getEllipse(p1, 1, 1), e2 = getEllipse(p2, 4, 4);
    cout<<circleAreTangent(e1, e2)<<endl;;
    point a1 = getPoint(0,0),a2 = getPoint(1,1),a3 = getPoint(1,0),a4 = getPoint(0,-1);
    //line l1 = getLine(a1, a2),l2 = getLine(a4,a3);
    //cout<<isParallel(l1,l2);
    
    point s1 = getPoint(0,0), s2 = getPoint(1,1), s3 = getPoint(2,0),s4 = getPoint(0,0.5);
    line l1 = getLine(s1,s2), l2 = getLine(s4,s3);
   // displayPoint(getIntersectPoint(l1, l2));
    int test = 4;
    cout<<sizeof(test)<<endl;*/
    return 0;
}

