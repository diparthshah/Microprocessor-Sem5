data segment
	msg db "enter number :$"
data ends

code segment
assume cs:code,ds:data
start:	mov ax,data
	mov ds,ax
    ; PRINT STRING
	mov dx,offset msg
	mov ah,09
	int 21h

	xor dx,dx
	xor cx,cx
    ; ACCEPT FIRST NUM AND STORE IN BL
	mov ah,01
	int 21h
	sub al,30h
	mov bl,al
    ; ACCEPT SECOND NUM AND KEEP IT IN AL
	int 21h
	sub al,30h
    ; MOVE FIRST DIGIT IN AH , KEEP SECOND DIGIT IN AL AND RUN AAD (PACKING 16BIT AX IN 8BIT AL)
	mov ah,bl
	aad
    ; STORE IN COUNTER CL
	mov cl,al

l1:	mov al,cl
    ; SET AH TO 00
	xor ah,ah
    ; AL IS EXPANDED TO 16BIT AX
	aam
	mov bx,ax
    ; MAKE NUMBER TO BE PRINTABLE ON DOS 
	add bx,3030h
    ; PRINT HIGHER PART
	mov dl,bh
	mov ah,02
	int 21h
    ; PRINT LOWER PARTH
	mov dl,bl
	int 21h
    ; LOOP UNTIL CX IS NOT 0
	loop l1
	mov ah,4ch
	int 21h
code ends
end start