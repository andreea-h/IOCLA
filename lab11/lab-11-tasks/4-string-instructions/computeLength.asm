global computeLength
global computeLength2

section .text
computeLength:
    push ebp
    mov ebp, esp

    xor eax, eax
    ;TODO: Implement byte count using a software loop
count:
    mov esi, [ebp+0x8]	 
    mov dl, byte [esi+eax]
    inc eax
    cmp dl, 0x00
    jne count

    dec eax

    mov esp, ebp
    pop ebp
    ret

computeLength2:
    push ebp
    mov ebp, esp

    xor eax, eax
    ;TODO: Implement byte count using a hardware loop
	
    mov edi, [ebp+0x8]
    mov al, byte 0x00
    repne scasb
		
    sub edi, [ebp+0x8]
    dec edi
	
    mov eax, edi
    mov esp, ebp
    pop ebp
    ret
