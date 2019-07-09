/*a-b*c+d*/
#include<stdio.h> 
#include<conio.h> 

void main() 
{
    int a=0,b=0,c=0,d=0,r1=0,r2=0,r3=0;
    clrscr();
    printf("\nenter a b c d: \n");
    scanf("%d%d%d%d",&a,&b,&c,&d);
    asm {
        mov ax,a
        sub ax,b
        sbb bx,00h
        mov r1,ax 
        mov ax,c 
        add ax,d 
        adc bx,00h
        mov r2,ax 
        mov ax,r1 
        mov bx,r2 
        mul bx 
        mov r3,ax 
    }
    printf("\n result is %d",r3);
    getch();
}