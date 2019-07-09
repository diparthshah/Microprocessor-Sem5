/*[c=(f-32)*5/9]*/
#include<stdio.h>
#include<conio.h>

void main()
{
	int f=0,r1=0;
	float c=0.0,temp=0.0,div=0.0;
	clrscr();
	printf("\nEnter temperature in fahrenheit: ");
	scanf("%d",&f);
	asm {
		mov ax,f
		sub ax,32
		sbb bx,00h
		mov r1,ax
	}
	temp = (float) r1;
	div = 0.5;
	c = (float)((float)temp * (float)div);
	printf("\nCentigrade: %f",c);
	getch();
}
