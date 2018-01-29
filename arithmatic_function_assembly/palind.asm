	section .data
	arr dd 1,3,2,3,4,2,0
	msg db "%d",0
	sum db 0
	section .text
	global main
	extern printf
main:
	mov ebx,arr
	mov edx,msg
	xor ecx,ecx
	xor eax,eax
abc:	mov eax,4
	mul ecx
	add eax,arr
	mov ebx,eax

	cmp dword[ebx],0
	jz nxt

	pusha
	push dword[ebx]
	
