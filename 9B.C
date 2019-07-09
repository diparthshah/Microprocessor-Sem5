#include<stdio.h>
#include<conio.h>

void main()
{
	int a=0,temp=0,b=0;
	clrscr();
	printf("\nEnter a and b: ");
	scanf("%d%d",&a,&b);
	asm {
	mov bx,b
	mov ax,a
	mov temp,ax
	mov ax,bx
	mov bx,temp
	mov a,ax
	mov b,bx
	}
	printf("Values for a and b is : %d and %d ",a,b);
	getch();
}