Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg1 db, 10,  "Enter 10 elements $"
        array1 db 10 dup(?)
        msg2 db,10, "even count $"
        msg3 db,10, "odd count $"
        even1 db 0
        odd1 db 0
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        
        Print msg1

        lea bx,array1
        xor si,si
        mov cx,0Ah

next:   mov ah,01
        int 21h
        sub al,30h
        mov bx[si],al
        inc si
        loop next

        xor si,si
        mov cx,0Ah
        xor ax,ax

back:   mov dl,bx[si]
        and dl,01
        jz l1
        inc ah
        jmp l2

l1:     inc al

l2:     inc si
        loop back
        
        mov even1,al
        mov odd1,ah

        Print msg2

        xor dx,dx
        mov dl,even1
        add dl,30h
        mov ah,02h
        int 21h

        Print msg3 

        xor dx,dx
        mov dl,odd1
        add dl,30h
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h
code ends
end start