#include<stdio.h>
#include<conio.h>
void main()
{
	int b=0,h=0,a=0,r1=0;
	clrscr();
	printf("\nenter b and h: ");
	scanf("%d%d",&b,&h);
	asm {
		mov ax,b
		mov bx,h
		mul bx
		mov r1,ax
		mov bx,02
		mov ax,r1
		div bx
		mov a,ax
	}
	printf("\narea is %d",a);
	getch();
}