;concatenate two strings
;you may change the code as per your wish
;comments should not be printed
;output should have your name, else submission will not be accepted.

data segment
        msg1 db "Enter String 1: $"
        msg2 db "String 2 : $"
        str1 db 25 dup('$')
        str2 db 25 dup('$')
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        mov es, ax

        mov dx, offset msg1     
        mov ah, 09
        int 21h                 ;display msg1 on DOS screen

        lea di, str1            ;load effective address of str1 into DI register
        xor cx, cx              ;count of str1

        mov ah, 01
back1:  int 21h                 ;accept key press into AL register
        cmp al, 0dh             ;0dh is the ascii value of 'enter'
        jz endip1               ;end of input for str1
        stosb                   ;mov [DI], AL and increment DI
        inc cx                  ;increment counter of str1
        jmp back1               ;back to accept next char of str1

endip1: lea si, str1
        lea di, str2
        cld
        rep movsb  

        mov dx, offset msg2     
        mov ah, 09
        int 21h          
        
        mov dx, offset str2
        int 21h
        
        mov ah, 4ch
        int 21h
code ends
end start