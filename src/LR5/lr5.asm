include 'emu8086.inc'
data segment
        
    ; add your data here!
    pkey db 13,10,"For exit from program, please enter any key$" 
    X1 DW 2 
    X2 DW 4 
    X3 DW 8 
    x4 DW ?; temp variable for save intermediate data
    Y DW 0   
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    ; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    ; add your code here                                     
    MOV AX, X3
    MUL X1
    MUL AX
    MOV X4, AX
    MOV AX, X3
    CWD
    DIV X1
    ADD X2, AX
    MOV AX, 20
    MUL X2
    SUB X4, AX
    MOV BX, X4
    MOV Y, BX

    PRINT 'Y=' 
    MOV AX, Y
        ; ouptup unsigned numbers from register AX;
        ; for output signed nummbers use method PRINT_NUM  
        
    ; exit from program in Windows
    ; output line on screen
    lea dx, pkey 
    mov ah, 9 
    int 21h 
    
    ; wait enter any key
    mov ah, 1 
    int 21h     
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
ends

end start ; set entry point and stop the assembler.
