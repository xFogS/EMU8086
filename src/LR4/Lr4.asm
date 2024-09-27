; multi-segment executable file template.

data segment
    x1 db 18h;
    x2 db 1h;
    x3 db 2h;
    y1 dw 11h;
    y2 dw 20h;
    z EQU 40h;
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
    
    ;GUIDE:
    ;
    ;   db    - eight system
    ;   dw    - sixteen system
    ;   EQU   - const
    ;   AX,BX,
    ;   CX,DX,
    ;   CL,BX - registers 
    ;   MOV   - Copy
    ;   DL    - temp variable
    ;   XCHG  - SWAP(A = B, B = A)
    ;   PUSH  - STACK (LI)
    ;   POP   - STACK (FI)
    
    mov ah, z; 
    mov cl, ah; 
    mov x1, cl;
    mov x3, 10h;
    mov bx, y1;
    mov dl, x1;
    mov x2, dl;
    xchg bl, al;
    xchg cx, y2;
    mov dl, x3;
    mov dh, x2;
    xchg dl, dh; 
    mov x2, dh;
    mov x3, dl;
    
    push ax;
    push dx;  
    pop ax;
    pop dx;
       
    push y1;
    push y2;  
    pop y1;
    pop y2;
      
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
