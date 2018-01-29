section .data
	msg db "Enter order of matrix::",10,0
	msga db "%d",0
	msgb db "Enter matrx elements::",10,0
	msgc db "%d",10,0
	msgd db "subtraction of  matrix is",10,0
	
section .bss
	ad resd 1
	array1 resd 60
	array2 resd 60
	count resd 1
section .text
	global main
	extern printf,exit,scanf
main:
	xor esi,esi
	xor edi,edi
	
	pusha
	push msg
	call printf
	add esp,4
	popa
	
	pusha
	push count
	push msga
	call scanf
	add esp,8
	popa

	mov eax,dword[count]
	mul eax
	mov dword[count],eax

	mov esi,1
	mov ebx,array1

	pusha
	push msgb
	call printf
	add esp,4
	popa

abc:
	
	pusha
	push ebx
	push msgc
	call scanf
	add esp,8
	popa
	
	add ebx,4

	cmp esi,dword[count]
	jz pqr

	inc esi
	jmp abc
	
pqr:	pusha
	push msg3
	call printf
	add esp,4
	popa

	mov edi,1
	mov ebx,array2

xyz:
	
	pusha
	push ebx
	push msg1
	call scanf
	add esp,8
	popa
	
	add ebx,4

	cmp edi,dword[count]
	jz lmn

	inc edi
	jmp xyz
lmn:
	xor edi,edi
	mov edi,1
	mov ecx,dword[count]
	mov ebx,array1
	mov edx,array2

asd:	mov eax,dword[ebx]
	sub eax,dword[edx]

	mov dword[ebx],eax

	add ebx,4
	add edx,4
	
	cmp edi,dword[count]
	jz sgf

	inc edi
	jmp asd
sgf:
	xor esi,esi
	mov esi,1
	mov ebx,array1

	pusha
	push msg
	call printf
	add esp,4
	popa
omn:	
	pusha
	push dword[ebx]
	push msg4
	call printf
	add esp,8
	popa
	
	add ebx,4

	cmp esi,dword[count]
	jz exit

	inc esi
	jmp omn

exit:
	
