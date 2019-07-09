#include<stdio.h>
#include<conio.h>

void main()
{	int x,y,res;
	clrscr();
	printf("Enter x,y:\n");
	scanf("%d%d",&x,&y);
	asm {
		mov ax,01
		mov bx,x
		mov cx,y	     
    }
	L1: asm {	
        mul bx
        loop L1		
    }
	L2: asm {	
        mov res,ax
	}
	printf("Result=%d",res);
	getch();	
}