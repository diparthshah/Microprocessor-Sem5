#include<stdio.h> 
#include<conio.h> 

void main() 
{
    int n1=0,n2=0,n3=0,d=3,avg=0,r1=0;
    clrscr();
    printf("\nenter 3 number:\n");
    scanf("%d%d%d",&n1,&n2,&n3);
    asm {
        mov ax,n1
        add ax,n2 
        adc bx,00h
        mov r1,ax 
        mov ax,n3
        add ax,r1 
        adc bx,00h
        div d 
        mov avg,ax
    }
    printf("average of 3 number is %d",avg);
    getch();
}