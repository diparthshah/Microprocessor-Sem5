Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
    msg1 db,10, "Enter Number1 $"
    msg2 db,10, "Enter Number2 $"
    msg3 db,10, "Sum is $"
    msg4 db,10, "Carry is $"
    sum db ?
    carry db ?
    num1 db ? 
    num2 db ?
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        Print msg1 ; call macro to print msg1 string
        mov ah,01h ; configure ah to accept input
        int 21h ; intr
        sub al,30h ; get orignal number 
        mov num1,al ; store in num1
                
        Print msg2  ; same for num1
        mov ah,01h
        int 21h
        sub al,30h
        mov num2,al

        mov al,num1
        mov bl,num2
        add al,bl ; add num1 and num2
        daa 

        mov sum,al ; sum of 2 numbers
        mov al,00
        adc al,al ; adc: add with carry
        mov carry,al ; carry of the sum

        Print msg3 ; print sum
        xor dx,dx
        mov dl,sum
        add dl,30h ; dos ascii
        mov ah,02
        int 21h

        Print msg4 ; print carry
        xor dx,dx
        mov dl,carry
        add dl,30h
        mov ah,02
        int 21h

        mov ah,4ch 
        int 21h
code ends
end start