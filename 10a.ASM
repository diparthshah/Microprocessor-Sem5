Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
        msg1 db "Enter first name: $"
        msg2 db "Enter second name: $"
        msg3 db "Full name: $"
        str1 db 25 dup('$')
        str2 db 25 dup('$')
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        mov es, ax

        Print msg1

        lea di, str1            ;load effective address of str1 into DI register
        xor bx, bx              ;count of str1
        
        mov ah, 01
back1:  int 21h                 ;accept key press into AL register
        cmp al, 0dh             ;0dh is the ascii value of 'enter'
        jz endip1               ;end of input for str1
        stosb                   ;mov [DI], AL and increment DI
        inc bx                  ;increment counter of str1
        jmp back1               ;back to accept next char of str1

endip1: mov al,20h              ;20h is the ascii value of 'space'
        stosb                   ;mov [DI], AL
        inc bx                  ;inc counter of str1

        Print msg2

        lea di, str2           
        mov ah, 01
        xor cx, cx
back2:  int 21h
        cmp al, 0dh
        jz endip2
        stosb
        inc cx
        jmp back2

endip2: lea di, str1            
        lea si, str2
        add di, bx              ;increment di by length of str1, so that str2 is copied from that location
        cld                     ;clear direction flag = si and di are incremented
        rep movsb               ;rep = dec cx and repeat instruction until cx != 0
                                ;movsb = mov [di], [si] and increment si and di
        Print msg3
        Print str1

        mov ah, 4ch
        int 21h
code ends
end start