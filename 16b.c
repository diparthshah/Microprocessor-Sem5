#include<stdio.h>
#include<conio.h>

void main()
{	int a,b,c,max;
	clrscr();
	printf("Enter a,b,c:\n");
	scanf("%d%d%d",&a,&b,&c);
	asm {
		mov ax,a
		mov bx,b
		mov cx,c
		cmp ax,bx
		JG L1
		cmp bx,cx
		JG L3
		mov max,cx
		jmp L4		
    }
	L1: asm {
		cmp ax,cx
		JG L2
		mov max,cx
		jmp L4		
    }
	L2: asm {
		mov max,ax
		jmp L4		
    }
	L3: asm {
		mov max,bx
		jmp L4		
    }
    L4: asm {

    }
	printf("Result=%d",max);
	getch();

}

