section .data
	msg db 10,0
	msga dd 21
	section .text
	global main
	extern printf
main:	xor eax,eax
	xor ecx,ecx
	mov ebx,msga
abc:	mov edi,dword[ebx]
	cmp edi,0
	jz end 
	pusha
	push msg
	call printf
	add esp,4
	popa
	dec edi
	mov dword[ebx],edi
	jmp abc
end:	ret
