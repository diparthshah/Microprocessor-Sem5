/* r= b*b-4ac*/
#include<stdio.h>
#include<conio.h>
void main()
{
	int a=0,b=0,c=0,r=0,res=0;
	clrscr();
	printf("\nEnter a b c: ");
	scanf("%d%d%d",&a,&b,&c);
	asm {
		mov ax,b
		mul ax
		mov res,ax
		mov bx,04
		mov ax,a
		mul bx
		mov bx,c
		mul bx
		mov r,ax
		mov bx,r
		mov ax,res
		sub ax,r
		sbb bx,00h
		mov r,ax
	}
	printf("root is  %d",res);
	getch();
}