section .data
	msg db "No. of elements",10,0
	a db "%d",0
	msga db "Enter the no.:",10,0
	msgb db "Average =%d",10,0
section .bss
        b resd 1
	arr resd 20
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push b
	push a
	call scanf
	add esp,8
	
	push msga
	call printf
	add esp,4

	xor eax,eax
	mov ebx,arr
abc:
	cmp eax,dword[b]
	jz xyz

	pusha
	push ebx
	push a
	call scanf
	add esp,8
	popa

	inc eax
	add ebx,4
	jmp abc
pqr:
	xor ecx,ecx
	mov ebx,arr
	xor eax,eax
xyz:
	cmp ecx,dword[b]
	jz sop
	add eax,dword[ebx]
	add ebx,4
	inc ecx
	jmp pqr
sop:
	xor edx,edx
	mov ebx,dword[a]
	div ebx
print:
	push eax
	push msgb
	call printf
	add esp,8
	ret
	
	
	
