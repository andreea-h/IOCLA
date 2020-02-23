%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power
    
    ; TODO - print the powers of 2 that generate number stored in EAX
putere:
    test eax, ebx
    jz not_putere;in ebx nu este stocata o putere a lui eax
    PRINT_DEC 4, ebx
    NEWLINE
    cmp eax, ebx
    jl putere
not_putere:
    shl ebx,1
    cmp ebx, eax
    jl putere
   
    leave
    ret
