/* f= (c*9/5)+32*/
#include<stdio.h>
#include<conio.h>
void main()
{
	int c=0,f=0,r1=0,r2=0;
	clrscr();
	printf("\nEnter temp in centigrade: ");
	scanf("%d",&c);
	c = (c * (int)(9.0/5.0));
	asm {
	    mov ax,32
	    add ax,c
	    adc bx,00h
	    mov f,ax
	}
	printf(" f is  %d",f);
	getch();
}