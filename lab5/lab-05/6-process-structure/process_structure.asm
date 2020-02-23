%include "io.inc"

struc stud_struct
    name: resb 32
    surname: resb 32
    age: resb 1
    group: resb 8
    gender: resb 1
    birth_year: resw 1
    id: resb 16
endstruc

section .data

sample_student:
    istruc stud_struct
        at name, db 'Andrei', 0
        at surname, db 'Voinea', 0
        at age, db 21
        at group, db '321CA', 0
        at gender, db 1
        at birth_year, dw 1994
        at id, db 0
    iend

print_format db "ID:", 0

section .text
global CMAIN

CMAIN:
    push ebp
    mov ebp, esp

    ; TODO: store in a register the address of the sample_student struct
    mov  eax, sample_student  ;;adresa de inceput a structurii
    ; TODO: copy the first 3 bytes from the name field to id using movsb
    mov dx, [sample_student+name]
    PRINT_UDEC 2, dx
    NEWLINE
     mov cx, [sample_student+surname]
    PRINT_UDEC 2, cx
    NEWLINE
    lea edi, [eax+id]
    lea esi, [eax+name]
    mov ecx,3
    rep movsb
    lea edi, [eax+id+3]
    lea esi, [eax+surname]
    mov ecx, 3
    rep movsb
;    mov bl, [eax + name]
;   mov byte [eax + id],bl
;    mov bl, [eax + name+1]
;   mov byte [eax + id+1],bl
 ;   mov bl, [eax + name+2]
  ;  mov byte [eax + id+2],bl
    ; TODO: copy the first 3 bytes from the surname field to id using movsb
  ;  mov bl, [eax + surname]
  ;  mov byte [eax + id+3],bl
   ; mov bl, [eax + surname+1]
   ; mov byte [eax + id+4],bl
   ; mov bl, [eax + surname+2]
   ; mov byte [eax + id+5],bl
    ; TODO: insert `-`
    mov byte [eax + id+6],'-'
    ; TODO: copy the bytes from field group to id using movsb
  ;  mov ebx, [eax + group]
  ;  mov dword [eax + id+7],ebx
    ; print the new ID added
    
    lea edi, [eax+id+7]
    lea esi, [eax+group]
    mov ecx, 5
    rep movsb
    PRINT_STRING print_format
    PRINT_STRING [sample_student + id]

    leave
    ret