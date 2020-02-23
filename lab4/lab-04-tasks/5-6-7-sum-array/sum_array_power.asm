%include "io.inc"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    print_format db "Array sum is ", 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax            ; Use eax to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.
    xor ebx, ebx ;;;ebx va retine suma patratelor din vector

add_dword_power_array_element:
    mov edx, dword [dword_array + 4*(ecx-1)]
    mov eax, edx
    mul eax
    add ebx, eax
    loop add_dword_power_array_element
    
    PRINT_STRING print_format
    PRINT_UDEC 4, ebx
    NEWLINE
    
    
    
    
    
    XOR eax, eax
    leave
    ret
