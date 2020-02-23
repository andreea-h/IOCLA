%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "ana",0,"are",0, "meer",0
    len dd 10 ;;lungimea stringului 

section .text
global CMAIN

rot13var2:
    push ebp
    mov ebp, esp
    
    xor edx, edx
    xor ebx, ebx
    mov ecx, [ebp+8] ;;pun in ecx argumentul primit de f
    
convert:
    mov bl,[ecx] ;;pune in 'bl' caracterul curent din ecx
    cmp edx, [len]
 ;   PRINT_UDEC 4, edx
 ;   NEWLINE
    je out
    cmp bl, 0
    je terminator_de_sir
    cmp bl, 'n'
    jl aduna
    jge scade
    jmp continue
aduna:
    add bl, 13 ;;conversia rot13
    jmp continue
scade:
    sub bl, 13
    jmp continue
terminator_de_sir:
    mov bl,' '
    mov byte [ecx],bl ;;inlocuiesc caracterul '\0' cu ' '
    jmp next_char
continue:
    mov byte [ecx], bl
next_char:
    inc edx
    inc ecx
    jmp convert  
out:
    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp
;;apelez functia printf (afiseaza situl inainte de transformare)
;    push mystring
;;    push before_format
;    call printf
 ;   add esp, 8
;;apeleaz functia rot13var2

    push mystring ;;stringul care trebuie convertit
    call rot13var2
    add esp, 4 ;;restaurez stiva

    push mystring
    push after_format
    call printf ;;ap
    add esp, 8 ;;restaurez stiva

    leave
    ret
