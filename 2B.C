#include<stdio.h>
#include<conio.h>
void main()
{	int a,b,c,d;
	clrscr();
	printf("Enter b,c,d:\n");
	scanf("%d%d%d",&b,&c,&d);
	asm {
		mov ax,b
		mul c
		div d
		mov a,ax
	}	printf("a=%d",a);
	getch();	
}