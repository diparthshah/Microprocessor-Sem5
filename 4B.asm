;validate password
;you may change the code as per your understanding
;the password should be changed to your name, else i will not accept your submission

data segment
        str1 db "password"      ;give your name as the password
        str2 db 8 dup(0)        ;count no. of char in your name
        msg1 db,10, "Enter password: $"
        msg2 db,10, "Valid password$"
        msg3 db,10, "Invalid password$"
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax              ;initialize data segment register
        mov es, ax              ;initialize extra segment register

        mov dx, offset msg1
        mov ah, 09
        int 21h                 ;display msg1 on DOS screen

        lea di, str2            ; POINT DI POINTER TO FIRST BYTE OF STR2
        xor cx, cx              ; FLUSH CX
        mov ah, 08              ;accept input without showing on screen
back1:  int 21h                 ; DOS INTR
        cmp al, 0dh             ; CHECK IF IT HAS REACHED END OF STR OR NOT
        jz endip                ; IF YES STOP TAKING INPUT
        stosb                   ; STORE CONTENT OF AL TO MEM LOCATION POINTED BY DI and increment DI
        inc cx                  ; INCREAMENT WORD COUNT
        jmp back1               ; JUMP TO SCAN NEXT BYTE

endip:  cmp cx, 08              ;change count to no. of char in ur name
        jnz inv                 ;if no of char in input not same as count, invalid
        lea si, str1            ;else compare strings, POINTS FIRST BYTE OF STR1
        lea di, str2            ; POINT FIRST BYTE OF STR2
        repe cmpsb              ;repeat instruction if equal, SI AND DI GET INCRMNT AUTOMATICALLY
        jnz inv                 ;if ZF is not set, chars are not equal

        mov dx, offset msg2     ;valid string
        mov ah, 09
        int 21h                 ;display msg2 on DOS screen
        jmp last                ;terminate

inv:    mov dx, offset msg3     ;invalid string
        mov ah, 09
        int 21h                 ;display msg3 on DOS screen

last:   mov ah, 4ch
        int 21h                 ;terminate execution

code ends
end start