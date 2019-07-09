Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
    msg1 db,10, "Enter Number1 $"
    msg2 db,10, "Enter Number2 $"
    msg3 db,10, "Quotient is $"
    msg4 db,10, "Remainder is $"
    quo db ?
    rem db ?
    num1 db ? 
    num2 db ?
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        Print msg1 
        mov ah,01h ; scan first digit of num1
        int 21h 
        sub al,30h  
        mov dl,al ; move it to dl for temporrary purpose
        mov ah,01h ; scan second digit of num1
        int 21h 
        sub al,30h  ; keep second digit of first num in al
        mov ah,dl ; move first digit of num1 from dl to ah
        aad     ; now ah has first digit and al has second digit of num1, pack 16bit digit to 8bit using aad
        mov num1,al ; 8bit output of aad is in al, move al to our variable num1 ding ding ding!
                
        Print msg2  
        mov ah,01h
        int 21h
        sub al,30h
        mov dl,al
        mov ah,01h
        int 21h
        sub al,30h
        mov ah,dl
        aad
        mov num2,al

        xor ax,ax
        mov al,num1
        aam
        mov bl,num2
        div bl
       
        mov quo,al
        mov rem,ah
       
        Print msg3 
        xor dx,dx
        mov dl,quo
        add dl,30h 
        mov ah,02
        int 21h

        Print msg4 
        xor dx,dx
        mov dl,rem
        add dl,30h 
        mov ah,02
        int 21h

        mov ah,4ch 
        int 21h

code ends
end start