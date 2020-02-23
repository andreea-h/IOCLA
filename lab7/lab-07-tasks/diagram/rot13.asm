%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "ana", 0

section .text
global CMAIN

rot13:
    push ebp
    mov ebp, esp
    
    xor ebx, ebx
    mov ecx, [ebp+8]
    
convert:
    mov bl, [ecx]
    test bl, bl ;;pana la terminatorul de sir
    je out ;;verific daca nu s-a ajuns la '0x00' (terminatorul de sir)
    cmp bl, 'a'
    jb next_char
    cmp bl, 'z'
    ja next_char
    cmp bl, 'n'
    jl aduna
    jge scade
    jmp next
aduna:
    add bl, 13 ;;conversia rot13
    jmp next
scade:
    sub bl, 13
next:
    mov byte [ecx], bl
next_char:
    inc ecx   ;;incrementez contorul 
    jmp convert  ;;repet operatia pentru urmatoarele caractere din string
out:
    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp
;;;apeleaza functia 'printf'
    push mystring
    push before_format
    call printf
    add esp, 8
    
;;apeleaza functia 'toupper'
    push mystring
    call rot13
    add esp, 4
;;apeleaza functia printf pentru sirul obtinut
    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
