#include<stdio.h>
#include<conio.h> 

void main() 
{
    int n=0,res=0;
    clrscr();
    printf("\n enter number: ");
    scanf("%d",&n);

    asm {      
        MOV BX,0002	
	    MOV AX,n
		MOV DX,0001	
		CMP AX,0002	
		JZ L2	
    }
	L1:asm {	
        MOV DX,0000	
		DIV BX	
		CMP DX,0000	
		JZ L3	
		MOV AX,n	
		INC BX	
		CMP AX,BX	
		JNZ L1	
    }
	L2:asm {	
        MOV res,0001	
    }
	L3:asm {	
        MOV res,DX	
    }
    if(res==1) 
    {
	    printf("\n number is prime");
    }
    else
    {
	    printf("\n number is not prime");
    }
    getch();
}