	section .data
	msg dd 2,3,2,4,5,3,2,0
	len equ $-msg
	msga db "%d",0
	section .bss
	msg2 resb 4
	section .text
	global main
	extern printf
main:	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx

	mov eax,msg
	mov ecx,len
	mov edx,msg2

	xor esi,esi
	mov esi,dword[eax]
	
xyz:
	inc eax
	xor edi,edi
	mov edi,dword[eax]
	cmp esi,edi
	je pqr
	cmp edi,0
	je nxt
pqr:    
	jmp xyz
	
nxt:	xor eax,eax
	xor ecx,ecx
	mov eax,4
	mul ecx
	add 
	pusha
	push dword[eax]
	push msg
	call printf
	add esp,8
	popa
	pusha
	push dword[edi]
	push msga
	call printf
	add esp,8
	
	
