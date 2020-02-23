%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBCAACCCB", 0
substring: db "BABC", 0

source_length: resd 1
substr_length: dd 4
vector: resd 80 

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
    mov edi, source_text
    mov eax, 0x00 ;;terminator de sir
    repne scasb
    
    sub edi, source_text
    dec edi
    mov [source_length], edi
;   PRINT_UDEC 4, edi  ;;lungimea sirului principal
;   NEWLINE
    xor edi, edi
    mov edi, substring
    mov eax, 0x00 ;;terminator de sir
    repne scasb
    
    sub edi, substring
    dec edi
    mov [substr_length], edi ;;lungimea subsirului(sirul cautat in sirul principal) 
    
          
    xor edi, edi
    mov edi, source_text
    mov esi, substring
    mov ebx, 0x00  ;;ebx retine contorul cu care se 'parcurge' substring-ul
    xor edx, edx
    xor ecx, ecx
    
loopy:
    xor eax, eax
    mov al, [esi+ebx]  ;;pune in al caracterul curent din substring
    mov ecx, [substr_length]
    repne scasb
    xor eax, eax
    mov eax, edi
    sub eax, source_text
    dec eax
    mov [vector+ebx], eax  ;; pune in vectorul 'vector' indicii coresp. pozitiilor din text la care se afla literele din substring
    inc ebx
    cmp ebx, [substr_length]
    jl loopy
    xor ecx, ecx
   
verifica_indici:  ;; verifica daca diferenta dintre oricare 2 numere consecutive ale vectorului 'vector' este 1->s-a gasit substring-ul
    mov dl, byte [vector+ecx]
    xor eax, eax
    inc ecx
    mov al, byte[vector+ecx]
    sub eax, edx
    cmp al, 1  ;;al retine diferenta dintre 2 el. consecutive ale vectorului
    jz print          
    jnz not_found
    PRINT_UDEC 4, ecx
    NEWLINE
    cmp ecx, [substr_length-1]
    jl verifica_indici
    je print
    inc ebx
    cmp ebx, [substr_length]
    jl loopy
    leave
    ret

print: 
    cmp ecx, [substr_length-1] 
    jz verifica_indici  ;;daca nu s-a ajuns la finalul vectorului, nu s-au verificat diferentele dintre toti vecinii din vector
    PRINT_STRING print_format
    PRINT_UDEC 1, [vector]  ;;vector va contine indicele de inceput al substring-ului
    NEWLINE
    xor ebx, ebx
    mov eax, edi
    sub eax, source_text
    dec eax
    cmp eax, [source_length] ;;daca nu s-a ajuns cu edi la finalul substrin-ului, reia loopy
    jl loopy
    leave
    ret
   
not_found:  
    xor ebx, ebx
    mov eax, edi
    sub eax, source_text
    dec eax
    cmp eax, [source_length]
    jl loopy

    leave
    ret
