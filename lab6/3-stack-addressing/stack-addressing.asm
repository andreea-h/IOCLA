%include "io.inc"

%define NUM 5
section .data
    print_format db ":  ",0
section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums
    
    ; pushing a string on the stack
   ; push 0
    sub esp, 4
    mov dword [esp], 0
 ;   push "mere"
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are "
    ;push "are "
   ; push "Ana "
    sub esp, 4
    mov dword [esp], "Ana "
    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
    xor ebx, ebx
    
    
    mov eax, esp
print_stack:
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    PRINT_STRING ": "
    PRINT_UDEC 1, [eax]
    NEWLINE
    add eax, 1
    cmp eax, ebp
    jl print_stack
    
    ; TODO 3: print the string byte by byte
    xor eax, eax
    mov eax, esp
    xor ecx, ecx
    mov ecx, 0x00 ;;initializez ecx cu 0
    
print_string:
   PRINT_CHAR [eax + ecx]
   add ecx, 1
   cmp ecx, 15
   jl print_string
   
   
    ; TODO 4: print the array element by element
    NEWLINE
    inc ecx
print_array:
    mov edx ,[eax+ecx]
    PRINT_UDEC 1, edx
    NEWLINE
    add ecx, 4
    cmp ecx, 35
    jl print_array
      
    


    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
