section .data
	msg db "addition of matrix is",10,0
	msg1 db "%d",0
	msg4 db "%d",10,0
	msg2 db "order of matrix::",10,0
	msg3 db "matrix elements::",10,0
	
section .bss
	array resd 1
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
	push msg2
	call printf
	add esp,4
	popa
	
	pusha
	push count
	push msg1
	call scanf
	add esp,8
	popa

	mov eax,dword[count]
	mul eax
	mov dword[count],eax

	mov esi,1
	mov ebx,array1

	pusha
	push msg3
	call printf
	add esp,4
	popa

accept1:
	
	pusha
	push ebx
	push msg1
	call scanf
	add esp,8
	popa
	
	add ebx,4

	cmp esi,dword[count]
	jz no

	inc esi
	jmp accept1
	
no:	pusha
	push msg3
	call printf
	add esp,4
	popa

		mov edi,1
	mov ebx,array2

accept2:
	
	pusha
	push ebx
	push msg1
	call scanf
	add esp,8
	popa
	
	add ebx,4

	cmp edi,dword[count]
	jz find

	inc edi
	jmp accept2
find:
	xor edi,edi
	mov edi,1
	mov ecx,dword[count]
	mov ebx,array1
	mov edx,array2

cal:	mov eax,dword[ebx]
	add eax,dword[edx]

	mov dword[ebx],eax

	add ebx,4
	add edx,4
	
	cmp edi,dword[count]
	jz show

	inc edi
	jmp cal
show:
	xor esi,esi
	mov esi,1
	mov ebx,array1

	pusha
	push msg
	call printf
	add esp,4
	popa
accept3:	
	pusha
	push dword[ebx]
	push msg4
	call printf
	add esp,8
	popa
	
	add ebx,4

	cmp esi,dword[count]
	jz end1

	inc esi
	jmp accept3

end1:
	
