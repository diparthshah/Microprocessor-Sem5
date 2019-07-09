#include<stdio.h> 
#include<conio.h>

void main() {
    int num1=0,num2=0,gcd=0;
    clrscr();
    printf("\n enter num1 and num2 : ");
    scanf("%d%d",&num1,&num2);
    asm {   
	    MOV AX,num1
        MOV BX,num2
    }   
    up: asm {
      CMP AX,BX        
      JE exit          
      JB excg    
    }                         
    up1: asm {
       MOV DX,0H       
       DIV BX          
       CMP DX,0        
       JE exit         
       MOV AX,DX       
       JMP up    
    }      
    excg: asm {
       XCHG AX,BX     
       JMP up1   
    }     
    exit: asm {
       MOV gcd,BX     
       MOV AH,4CH
    }
    printf("\ngcd is %d",gcd);
    getch();
}