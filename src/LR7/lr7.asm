data segment
    pkey db "press any key...$" 
    X dw -8                     
    Y dw 4                      
    Z dw ?                      
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax, data
    mov ds, ax
    mov es, ax

    MOV AX, X              
    CMP AX, Y              
    JL M1                  

    MOV AX, X              
    CWD                    
    MOV BX, Y              
    IDIV BX                
    MOV Z, AX         
    JMP END               

M1:
    MOV AX, X              
    MOV BX, Y              
    IMUL BX                
    MOV Z, AX              
    JMP END                
END:

    mov ah, 1
    int 21h

    mov ax, 4c00h      
    int 21h
ends

end start ;
