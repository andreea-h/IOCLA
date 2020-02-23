%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    ;       store the sum in eax
    ;       use loop instruction 
    mov eax, [N]
    mov ebx,1
    mov ecx,0
    mov edx,0
    mov esi,0
    mov edi, 0
   
aduna:
    mov esi,edx
    mov edx,ebx
    add ebx,esi
    add ecx,1
    add edi, esi
    cmp ecx,eax
    jl aduna
    
    mov eax, edi
    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, eax

    xor eax, eax
    leave
    ret
