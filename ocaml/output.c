#include "main.h"
#include "stdio.h"
#include"string.h"

int main ()
{
ellipse * e1;
ellipse * e2;
line * l1;
line * l2;
CvSize ImageSize1=cvSize(1000,1000);
Image1=cvCreateImage(ImageSize1,IPL_DEPTH_8U,3);
cvNot(Image1,Image1);
l1=new line(new point((float) 1,(float) 1),new point((float) 2,(float) 2));
l2=new line(new point((float) 1,(float) -1),new point((float) 2,(float) -2));
e1=new ellipse(new point((float) -14.14,(float) 0),(float) 10,(float) 10);
e2=new ellipse(new point((float) 14.14,(float) 0),(float) 10,(float) 10);
Draw(Image1,*(l1));
Draw(Image1,*(l2));
Draw(Image1,*(e1));
Draw(Image1,*(e2));

DrawAx(Image1);
cvNamedWindow("ALG",1);
cvShowImage("ALG",Image1);
cvWaitKey(0);
}