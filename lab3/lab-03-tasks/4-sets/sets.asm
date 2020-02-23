%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    mov edx,eax
    or edx,ebx
    PRINT_DEC 4, edx
     NEWLINE
    
    ; TODO2: adaugarea unui element in multime
    or eax,0b100
     PRINT_DEC 4, eax
     NEWLINE
    
     
    ; TODO3: intersectia a doua multimi
      mov ecx,eax
      and ecx,ebx
       PRINT_DEC 4, ecx
      NEWLINE

    ; TODO4: complementul unei multimi

    not eax
    PRINT_DEC 4, eax
      NEWLINE
    ; TODO5: eliminarea unui element
    
    and eax,0b01100000
    PRINT_DEC 4, eax
      NEWLINE

    ; TODO6: diferenta de multimi EAX-EBX
    not ebx
    and eax,ebx
    PRINT_DEC 4, eax
      NEWLINE

    xor eax, eax
    ret
