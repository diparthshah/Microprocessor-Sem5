Print macro msg
mov ah,09h
mov dx,offset msg
int 21h
endm

data segment
fibo db 10 dup(?)
msg1 db 10,13,"fibonaci series",10,13,"$"
msgn1 db 10,13,"$"
data ends
code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        Print msg1
        mov si,offset fibo
        mov al,00
        mov [si],al ; initial 00 on first mem loc
        inc si      ; icr mem index
        mov bl,01   ; store 01 on next loc
        mov [si],bl
        inc si      ; incr index
        mov cl,08   ; print till n is 08
next:   add al,bl   ; add 0th index with 1st 
        mov [si],al ; store result in 2nd index so mem is now 00 01 01
        mov al,bl   ; mov 01 of bl to al
        mov bl,[si] ; move last index data to bl
        inc si      ; incr index
        loop next   ;  repeat until cx is not 0
        mov ah,00   ;  set ah to 00
        mov si,offset fibo ; load initial addr to si
        mov cl,10   ; now there are total 10 ele, 00 01 and rest 8 loc of arr
back:   mov al,[si] ; move first arr loc to al
        aam         ; expand 8bit to 16bit
        mov bx,ax   ; move 16bit ax to bx
        add bx,3030h    ; make data compatibel for dos screen
        mov dl,bh ; load upper part to dl for display
        mov ah,02h
        int 21h
        mov dl,bl
        mov ah,02h ; load lower part for display
        int 21h
        Print msgn1
        inc si  ; incr index
        loop back ; untill cx is not 0
        mov ax,4c00h
        int 21h
code ends
end start