%include "io.inc"

extern printf

section .data
    vector dd 30, 31, 100, 86, 23, 9, 64, 90, 25, 96
    n      dd ($-vector)/4
    format db "Media elementelor: %f", 10, 0

section .text
    global CMAIN

extern printf

CMAIN:
    ; incarca valoarea 0 pe stiva FPU
    fldz
    mov eax, vector
    mov ecx, [n]
    ; TODO: parcurgerea tuturor elementelor si adunare la valoarea din varful stivei FPU (adunare intreaga)
push_nums:
    fiadd dword [eax]
    PRINT_UDEC 4, [eax]
    NEWLINE
    add eax, 4
    dec ecx
    cmp ecx, 0
    je done
    jmp push_nums
done:
    ; TODO: impartirea sumei la numarul de elemente (impartire intreaga)
    fidiv dword [n]
    
    ; TODO Afisarea rezultatului
    ; Rezultatul ar trebui sa fie 55.4
    sub esp, 8
    fstp qword [esp]
    push format
    call printf
    add esp, 12
    xor eax, eax
    ret
