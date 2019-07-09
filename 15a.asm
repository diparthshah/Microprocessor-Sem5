Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
    msg1 db, 10,  "Enter 10 elements $"
    array1 db 10 dup(?)
    msg2 db,10, "Minimum is $"
    msg3 db,10, "Maximum is $"
    mx db ?
    mn db ?
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        
        Print msg1 

        lea bx,array1 ; load effective address
        xor si,si       ; flush si

        mov cx,0Ah  ; accept 10 elements
next:   mov ah,01
        int 21h
        sub al,30h
        mov bx[si],al
        inc si          ; incr si
        loop next

        xor si,si       ; flush si
        mov cx,0Ah      ; reload cx with 10
        xor ah,ah       ; ah will check for min , initial min is 0
        mov al,09       ; al will check for max , initial max is 9

back:   cmp bx[si],ah   ; check if greater than ah
        jg l1           ; if yes update ah

l2:     cmp bx[si],al   ; check if same num is min or not
        jb l3           ; if yes upadte al with min
        jmp l4          ; incr si

l1:     mov ah,bx[si]
        jmp l2          ; check if same num is min or not

l3:     mov al,bx[si]

l4:     inc si
        loop back       ; continue until cx is not 0

        mov mn,al       ; store min in mn
        mov mx,ah       ; store max in mx

        Print msg2
        xor dx,dx
        mov dl,mn
        add dl,30h
        mov ah,02h
        int 21h

        Print msg3
        xor dx,dx
        mov dl,mx
        add dl,30h
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h
code ends
end start