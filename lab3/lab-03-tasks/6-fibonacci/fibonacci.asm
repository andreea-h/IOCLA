%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx,1
    mov ecx,0
    mov edx,0
    mov esi,0
aduna:
    mov esi,edx
    mov edx,ebx
    add ebx,esi
    add ecx,1
    cmp ecx,eax
    jl aduna    
    PRINT_DEC 4, ebx
    NEWLINE
    ret