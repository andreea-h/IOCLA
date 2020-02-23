%include "io.inc"

section .data
    mystring db "This is my string", 10, 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    PRINT_STRING mystring

    push mystring ;;pun argumentul pe stiva
    call puts
    
    add esp, 4 ;;restaurez stiva
    leave
    ret
