%include "io.inc"
extern puts 
extern printf 
section .data
    mystring db "This is my string", 0
    print_format db "String length is: %u ",10, 0
    store_string times 64 db 0 ;;64 de octeti initializati cu 0
    var dd 0
section .text
global CMAIN

reverse_string:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp+8] ;;sirul sursa
    mov ecx, dword [ebp+12] ;;length
    add eax, ecx
    dec eax
    mov edx, dword [ebp+16] ;;sirul destinatie

copy_one_byte:
    mov bl, byte [eax]
    mov byte [edx], bl
    dec eax
    inc edx
    loopnz copy_one_byte

    inc edx
    mov byte [edx], 0
    leave
     ret

CMAIN:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, byte [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte
    ;;ecx contine lungimea sirului
out:
    
    PRINT_DEC 4, ecx ;;afiseaza lumgimea sirului
    NEWLINE
    push ecx ;;salvez pe stiva valoarea lui ecx. va fi modificat la 'printf'
    push ecx ;;pun pe stiva argumentul functiei care se va apela
    push print_format 
    call printf ;;apelez functia
    add esp, 8 ;;restaurez stiva
    pop ecx ;;recuperez valoarea lui ecx salvat pe stiva
    PRINT_UDEC 4, ecx
    NEWLINE
    
    ;;dupa apelul lui printf valoarea lui 'ecx' se pierde    
    push store_string
    push ecx ;;salveaza pe stiva valoare lui 'ecx'
    push  mystring
    call reverse_string
    add esp, 12
    
    push mystring
    call puts
    add esp, 4
    ;;;store_string contine sirul inversat
    NEWLINE
    PRINT_STRING store_string
    NEWLINE
    
   
    
    leave
    ret
