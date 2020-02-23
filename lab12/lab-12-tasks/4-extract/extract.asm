%include "io.inc"

extern printf

section .data
    n    dq 421.9461
    print_format1 db "Partea intreaga: %d", 10, 0
    print_format2 db "Partea fractionara: %f", 10, 0
    parte_intreaga dd 0
    parte_fractionara dq 0
section .text
global CMAIN
CMAIN:

    ; TODO Incarca numarul pe stiva FPU.
    fld qword [n]
    
    ; TODO Foloseste instructiunea fisttp pentru a salva valoarea
    ; cu trunchiere la intreg.
    fisttp dword [parte_intreaga]
   
    
    ; TODO Afiseaza partea intreaga.
    push dword [parte_intreaga]
    push print_format1
    call printf
    add esp,8
    
    ; TODO Reincarca numarul pe stiva FPU.
    fld qword [n]
    ; TODO Foloseste instructiunea fisub pentru a scadea din n (varful
    ; stivei FPU) partea intreaga obtinuta anterior.
    fisub dword [parte_intreaga]
    
   
    sub esp, 8
    fstp qword [esp]
    push print_format2
    call printf
    add esp,12
    
    ; TODO Extrage partea fractionara si afiseaza rezultatul

    xor eax, eax
    ret
