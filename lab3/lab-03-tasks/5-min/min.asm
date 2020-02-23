%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 1
    mov ebx, 9
    cmp eax,ebx
    jg print
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE
    ret   
print:
    xchg eax,ebx
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE
   