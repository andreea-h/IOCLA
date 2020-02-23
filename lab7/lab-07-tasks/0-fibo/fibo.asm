%include "io.inc"

%define NUM_FIBO 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    sub esp, NUM_FIBO * 4
   
    mov eax, 0
    mov ebx, 1
    mov ecx, NUM_FIBO
    
fibo_loop:
    mov edx, ebx
    push ebx
    add ebx, eax
    mov eax, edx
    loop fibo_loop
     
    
   
   
    mov ecx, NUM_FIBO
print:
    PRINT_UDEC 4, [esp + (ecx - 1) * 4]
    PRINT_STRING " "
    dec ecx
    cmp ecx, 0
    ja print

    mov esp, ebp
    xor eax, eax
    ret
