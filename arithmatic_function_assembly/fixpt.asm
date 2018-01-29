section .data
	msg db ' ',0
	msgb db 'a',10,0
	msga db 10,0
	a dd 21
	b dd 74
	c db 'clear',0
	d db 'delay',0
	
section .text
	global main
	extern printf,system
main:
	xor eax,eax
	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx
	xor esi,esi
	xor edi,edi
	mov eax, msg
	mov edx,msg
	mov ebx,a
	mov ecx,b
abc:	mov edi,dword[ebx]
	cmp edi,0
	jz pqr
	pusha
	push msga
	call printf
	add esp,4
	popa
	dec edi
	mov dword[ebx],edi
	jmp abc

xyz:	xor esi,esi
xyt:	mov esi,dword[edx]
	cmp esi,0
	jz end
	pusha
	push msga
	call printf
	add esp,4
	popa
	dec esi
	mov dword[edx],esi
	jmp xyt
	
pqr:	mov esi,dword[ecx]
	cmp esi,0
	jz nxt
	pusha
	push msg
	call printf
	add esp,4
	popa

	dec esi
	mov dword[ecx],esi
	jmp pqr
	
nxt:
	pusha
	push msgb
	call printf
	add esp,4
	popa

	
	pusha
	push msga
	call printf
	add esp,4
	popa
	

	xor edx,edx
	mov edx,b
	jmp xyz
end:	
	ret
