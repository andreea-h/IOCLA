%include "io.inc"

section .data
    myString: db "Hello, World!",0
    mySecString:  db "Googbye, World!",0

section .text
global CMAIN
CMAIN:
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 9
    mov ebx, 1
    cmp eax, ebx
    jg print                   ; TODO1: eax > ebx?
    ret
print:
    PRINT_STRING myString
    NEWLINE
    sub ecx,1 ;scade 1 din ecx si pune rez in ecx
    cmp ecx,0
    jg print
    PRINT_STRING mySecString
    NEWLINE
                               ; TODO2.2: afisati "Hello, World!" de N ori
                               ; TODO2.1: afisati "Goodbye, World!"

    ret
