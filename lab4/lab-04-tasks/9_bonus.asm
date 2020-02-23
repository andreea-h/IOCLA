%include "io.inc"

%define ARRAY_SIZE 10
section .data
    byte_array db 8, -19, 12, 3, -6, -20, 127, -19, 78, 102

section .text
global CMAIN
CMAIN:
    xor edx,edx
    mov ecx, ARRAY_SIZE
    mov al,0b10000000
    xor edx, edx
    xor esi, esi ;;numar de numere pozitive
    xor edi, edi ;;numar de numere negative
pozitiv:
     mov dl, byte [byte_array + ecx - 1] ;;elementul curent din vector
     test dl,al ;;numar pozitiv/negativ
     jnz negativ
     inc esi
     sub ecx,0b00000001
     test ecx, ecx
     jnz pozitiv
     PRINT_DEC 4, esi
     NEWLINE
     PRINT_DEC 4,edi
     NEWLINE
     ret
negativ:
    inc edi
    sub ecx,0b00000001
    test ecx,ecx
    jnz pozitiv
   
    
    
    
    
    xor eax, eax
    ret