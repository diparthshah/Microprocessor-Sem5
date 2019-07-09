data segment
dds db ?
msg db,10, "Enter Number $"
msg2 db,10, "factorial of num is $"
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov dx,offset msg       ; display string
        mov ah,09               ; halt screen for display
        int 21h                 ; dos intr

        mov ah,01               ; accept input on dos screen
        int 21h                 ; dos intr

        sub al,30h              ; subtract 30 to get orignal number
        mov bl,al               ; move entered first num to bl

        mov ah,01               ; acept 2nd num
        int 21h
        sub al,30h

        mov ah,bl               ; move first num which is bl to ah , and 2nd num is in al
        aad                     ; pack number 2number in one , whole num is in al
        mov dds,al              ; move final whole num to dds

        mov dx,offset msg2      ; display msg2
        mov ah,09
        int 21h

        xor bx,bx
        mov ax,01h
        mov bl,dds              ; temporarly move dds to any of reg in this case its bl
        call findfact            ; call procedure

        xor cx,cx               ; clear cx

        mov bx,0Ah              ; divide num by 10

back:   div bx                  ; div ax/bx
        push dx                 ; push rem to stack
        xor dx,dx               ; clear dx
        inc cx                  ; increment cx 
        cmp ax,00               ; check if ax is 0 or not
        jg back                 ; jump if ax is not zero

disp:   pop dx                  ; get rem form stack to display on screen
        add dl,30h              ; conv num to disp on screen
        mov ah,02               ; to display
        int 21h                 ; intr
        loop disp               ; back to disp to show all content on stack

        mov ah,4ch 
        int 21h

findfact proc 
        cmp bx,01
        jz last
        mul bx
        dec bl
        call findfact 

last:   ret                     ; if n is 1 return 
endp

code ends
end start