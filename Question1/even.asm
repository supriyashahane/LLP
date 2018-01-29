section .data
	two dd 2
	msg db "enter the no of elem",10,0
	msg1 db "enter the array elem",10,0
	msg3 db "After the filter Array will be:",10,0
	sca db "%d",0
	dic db "%c",10,0
section .bss
	array1 resd 20
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push n
	push sca
	call scanf
	add esp,8

	push msg1
	call printf
	add esp,4
	mov ebx,array1
	mov eax,dword[n]
	
scanarr:
	cmp eax,0
	jz print
	
        pusha
	push ebx
	push sca
	call scanf
	add esp,8
	popa

	dec eax
	add ebx,4
	jmp scanarr
print:
	push msg3
	call printf
	add esp,4
	xor eax,eax
	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx
	mov eax,array1
	mov esi,dword[n]
label:
	cmp esi,0
	jz next
	mov ecx,dword[n]
	div ecx
	cmp edx,0
	jz abc
	dec esi
	add eax,4
	xor edx,edx
	jmp label
	
abc:
	pusha
	push dword[eax]
	push sca
	call printf
	add esp,8
	popa

	push 9
	push dic
	call printf
	add esp,8
	
	dec esi
	add eax,4
	jmp label
	
next:
	ret
