%include "io.inc"
extern printf

section .data
    before_format db "before toupper: %s", 13, 10, 0
    after_format db "after toupper: %s", 13, 10, 0
    mystring db "abcdF9887548FFiuuiyfghij", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp
    
    xor ebx, ebx
    mov ecx, [ebp+8]
    
convert:
    mov bl, [ecx]
    test bl, bl ;;pana la terminatorul de sir
    je out
    ;;testam daca caracterul curent este sau nu litera mica
    cmp bl, 'a' 
    jb next
    cmp bl, 'z'
    ja next
    sub bl, 0x20 ;;converteste caracterul la litera mare
    mov byte [ecx], bl ;;pune in ecx caracterul curent din string
next:
    inc ecx ;;incremetez conorul 
    jmp convert  ;;reiau operatiilor pentru urmatorul caracter din string
out:
    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp
    ;;afiseaza stringul inainte de conversie
    push mystring
    push before_format
    call printf
    add esp, 8

    
    ;;apeleaza functia 'toupper'
    push mystring ;;oune e stiva argumentul 
    call toupper
    add esp, 4 ;;restaureaza stiva dupa apel
    
    ;;afiseaza stringul de dupa conversie
    push mystring ;;pune pe stiva argumentele functiei
    push after_format
    call printf
    add esp, 8 ;;restaurez stiva

    leave
    ret
