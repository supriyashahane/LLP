section .data
	msg db "Enter the value of a & b",10,0
	msga db "%d",0
	msgb db "Permutation is =%d",10,0
section .bss
        a resd 1
	b resd 1
	ans resd 1
	n resd 1
section .text
        global main
	extern printf,scanf,factor
main:
	push msg
	call printf
	add esp,4

	push a
	push msga
	call scanf
	add esp,8

	push b
	push msga
	call scanf
	add esp,8
	
        mov eax,dword[a]
	mov ebx,dword[b]
	
	push eax
	call factor
	add esp,4

	
	mov dword[ans],eax
	xor eax,eax
	sub dword[n],ebx
	mov eax,dword[n]

	push eax
	call factor
	add esp,4


	xor edx,edx
	mov dword[n],eax
	mov eax,dword[ans]
	mov esi,dword[n]
	div esi

	pusha
	push eax
	push msgb
	call printf
	add esp,8
	popa

	ret

	

