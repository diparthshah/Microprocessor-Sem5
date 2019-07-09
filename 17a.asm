assume cs:code,ds:data
data segment
        num db 12h
data ends

code segment
start:
        mov ax,data
        mov ds,ax
        xor ax,ax
        mov al,num
        aam
        mov ah,4ch
        int 21h
code ends
end start