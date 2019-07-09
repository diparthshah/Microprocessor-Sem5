/* (A + B) * (C – D) */
#include<stdio.h>
#include<conio.h>

void main() {
    int a=0,b=0,c=0,d=0,result=0,r1=0,r2=0;
    clrscr();
    printf("\nEnter A,B,C,D : \n");
    scanf("%d%d%d%d",&a,&b,&c,&d);
    asm {
	mov ax,a
	add ax,b
	adc bx,00h
	mov r1,ax
	mov ax,c
	sub ax,d
	sbb bx,00h
	mov r2,ax
	mov ax,r1
        mov bx,r2
	mul bx
        mov result,ax
    }
    printf("\n result is:  %d",result);
    getch();
}