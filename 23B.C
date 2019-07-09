#include<stdio.h> 
#include<conio.h> 

void main()
{
    int basic=0,da=0,hra=0,tax=0,tot=0,r1=0,fift=02,fit=20,ten=10;
    clrscr();
    printf("\nenter basic sal: ");
    scanf("%d",&basic);

    asm {
        mov ax,basic
	    div fift
        mov da,ax 
        mov ax,basic
        div fit
        mov hra,ax 
        mov ax,basic 
        div ten
        mov tax,ax
        mov ax,basic
        add ax,da 
        adc bx,00h 
        mov r1,ax 
        mov ax,r1 
        add ax,hra 
        mov r1,ax 
        sub ax,tax 
        sbb bx,00h 
        mov tot,ax
    }
    printf("\ntotal sal is %d",tot);
    getch();
}