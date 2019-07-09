Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

data segment
    msg1 db,10, "Enter Number1 $"
    msg2 db,10, "Enter Number2 $"
    msg3 db,10, "Difference is $"
    msg4 db,10, "Borrow is $"
    diff db ?
    borrow db ?
    num1 db ? 
    num2 db ?
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        Print msg1 
        mov ah,01h
        int 21h 
        sub al,30h  
        mov num1,al 
                
        Print msg2  
        mov ah,01h
        int 21h
        sub al,30h
        mov num2,al

        mov al,num1
        mov bl,num2
        sub al,bl 
        das 

        mov diff,al
        mov al,00
        adc al,al 
        mov borrow,al 

        Print msg3 
        xor dx,dx
        mov dl,diff
        add dl,30h 
        mov ah,02
        int 21h

        Print msg4 
        xor dx,dx
        mov dl,borrow
        add dl,30h
        mov ah,02
        int 21h

        mov ah,4ch 
        int 21h
code ends
end start