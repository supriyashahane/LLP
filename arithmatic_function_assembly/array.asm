section .data
	arr dd 1,2,3,4,5,0
	msg db "%d",0
	sum db 0
section .text
	global main
	extern printf
main:	mov ebx,arr
	mov edx,sum
	xor ecx,ecx
	xor eax,eax
	
abc:	mov eax,4
	mul ecx
	add eax,arr
	mov ebx,eax

	cmp dword[ebx],0
	jz next
	
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	
	inc ecx
	
	jmp abc
next:
	ret
pqr:	mov esi,dword[ebx]
	mov edi,dword[edx]
	add edi,esi
	inc esi
	cmp esi,0
	jmp pqr
	pusha
	push dword[edx]
	call printf
	add esp,4
