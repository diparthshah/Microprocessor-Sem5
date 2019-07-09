#include<stdio.h> 
#include<conio.h> 

void main() 
{
    int n1=0,n2=0;
    char sm=' ';
    clrscr();
    printf("\n enter n1 and n2: ");
    scanf("%d%d",&n1,&n2);
    asm {
        mov ax,n1 
        mov bx,n2 
        cmp ax,bx
        jb l1
        jg l2
    }
    l1: asm {
        mov sm,'1'
        jmp e1
    }
    l2: asm {
        mov sm,'2'
        jmp e1
    }
    e1: asm {

    }
    printf("\n n%c is smaller",sm);
    getch();
}