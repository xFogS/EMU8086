DATA SEGMENT 
TEXT1 DB "Enter your last name or first", 13, 10, '$' 
BUFFER DB 15, ?, 15 DUP (' '), 10, '$' 
TEXT2 DB 13, 10, "Good day $" 
TEXT3 DB 13, 10, "For exit from program, enter any key$" 
ends

STACK SEGMENT 
dw 128 dup(0) 
ends
;------------------------------------- 

CODE SEGMENT 
START: 

mov ax, data
mov ds, ax 
mov es, ax 
;-------------------------- 

MOV AH,9 
LEA DX, TEXT1 
INT 21H 

MOV AL,0 
MOV AH,0CH 
INT 21H 

LEA DX,BUFFER 
MOV AH,0AH 
INT 21H 

MOV AH,9 
LEA DX,TEXT2 
INT 21H 
MOV BL,BUFFER+1 
MOV BH,0 
MOV BUFFER[BX]+2,'$' 
MOV AH,9 
LEA DX,BUFFER+2 
INT 21H 
;-------------------------- 

lea dx, TEXT3 
mov ah, 9 
int 21h 

mov ah, 1 
int 21h 

mov ax, 4C00h 
int 21h
ends;
END START; 

