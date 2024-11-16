; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db 13,10,"For exit from program, please enter any key$" 
    X1 db 5  ; example value for X1
    X2 db 3  ; example value for X2
    X3 db 10 ; example value for X3
    Y1 db ?  ; result of Y1
    Y2 db ?  ; result of Y2
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
    mov al, X1       ; AL = X1
    mov bl, X2       ; BL = X2
    mov cl, X3       ; CL = X3
    
    not bl          
    and bl, al      
    mov dl, cl      
    not dl           
    or bl, dl        
    and bl, al      
    xor bl, al       
    or bl, cl       
    mov Y1, bl       
                    ;if check
    cmp bl, 8        
    jl less_than_8   
    mov al, 0        
    jmp store_Y2

less_than_8:
    mov al, 1        

store_Y2:
    mov Y2, al       

    ; Output Y1
    lea dx, pkey
    mov ah, 9
    int 21h
    
    ; Wait for any key press
    mov ah, 1
    int 21h

    ; Exit program
    mov ax, 4C00h
    int 21h

ends

end start ; Set entry point and stop the assembler.
