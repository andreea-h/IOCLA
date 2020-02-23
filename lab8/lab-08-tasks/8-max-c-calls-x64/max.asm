section .text

global get_max

get_max:
	push rbp  ;;;;;ebp -> rbp
	mov rbp, rsp  ;;;esp->rsp

	; [ebp+8] is array pointer
	; [ebp+12] is array length
	;;;argumentele: rdi, rsi, rdx
	lea rbx, [rdx]
	lea rcx, [rsi] ;;nr de elemente din vector->al doilea argument
	xor rax, rax ;;rax este setat la 0 daca nu se folosessc alte registre decat rdi, rsi, rdxi

compare:
	cmp eax, [rdi+(rcx-1)*4] ;;eax contine elementul curent din vector la fiecare parcurgere a vectorului
	jge check_end
	mov eax, [rdi+(rcx-1)*4]
	lea rdx, [rcx-1]
check_end:
	loopnz compare

	leave
	ret
