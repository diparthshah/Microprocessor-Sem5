#include<stdio.h> 
#include<conio.h> 

void main() 
{
    int marks=0;
    char grade=' ';
    clrscr(); 
    printf("\nenter total marks: ");
    scanf("%d",&marks);
    asm {
        mov ax,marks
        cmp ax,80
	    jg l1
        jb nc
    }
    nc: asm {
        cmp ax,60
	    jg l2
        je l3
        jb nc2
    }
    nc2: asm {
        cmp ax,40
	    jg l4
        jb nc3
    }
    nc3: asm {
        cmp ax,39
	    jg l6
    }
    l1: asm {
	    mov grade,'a'
	    jmp e1
    }
    l2: asm {
	    cmp ax,79
	    jb l3
    }
    l3: asm {
        mov grade,'b'
        jmp e1
    }
    l4: asm {
        cmp ax,59
        jb l5
    }
    l5: asm {
        mov grade,'c'
        jmp e1
    }
    l6: asm {
	    mov grade,'f'
        jmp e1
    }
    e1: asm {

    }
    printf("\ngrade is %c",grade);
    getch(); 
}