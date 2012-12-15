#include "main.h"
#include "stdio.h"

int main ()
{line * l1;
line * l2;
bool a;
l1=new line(new point((float) 1,(float) 1),new point((float) 2,(float) 2));
l2=new line(new point((float) 3,(float) 3),new point((float) 4,(float) 4));
a=(isParallel(*l1,*l2));
if(a)
printf(("true"));
else
{}
}