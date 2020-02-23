%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; cele doua numere se gasesc in eax si ebx
    mov eax, 9
    mov ebx, 10

    ; TODO: aflati maximul folosind doar o instructiune de salt si push/pop

    cmp eax, ebx
    jl schimba
    PRINT_DEC 4, eax ; afiseaza maximul
    NEWLINE
    ret
schimba:
    push eax
    push ebx
    pop eax
    pop ebx
    
    PRINT_DEC 4, eax ; afiseaza maximul
    NEWLINE

    ret
