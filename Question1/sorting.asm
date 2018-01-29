section .data
	msg db "enter the no of elem",10,0
	msg1 db "%d",0
	msg2 db "enter the elem",10,0
	msg3 db "Sorted Array is",10,0
	msg4 db "given array is",10,0
	dis db "%c",0
	pf db "%d",10,0
	four dd 4
	i dd 0
section .bss
	a resd 1
	b resd 1
	arr resd 20
	iIndex resd 1
	jIndex resd 1
	j resd 1
	n resd 1
	
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push n
	push msg1
	call scanf
	add esp,8

	push msg2
	call printf
	add esp,4
	
	xor eax,eax
	mov ebx,arr
	mov eax,dword[n]
scan:
	cmp eax,0
	jz print

	pusha
	push ebx
	push msg1
	call scanf
	add esp,8
	popa
	dec eax
	add ebx,4
	jmp scan
print:
	push msg4
	call printf
	add esp,4
	xor eax,eax
	xor ebx,ebx
	mov ebx,arr
	mov edx,dword[n]
abc:
	pusha
	push dword[ebx]
	push msg1
	call printf
	add esp,8
        popa

	pusha
	push 9
	push dis
	call printf
	add esp,8
	popa


	cmp edx,1
	jz next
	add ebx,4
	inc ecx
	dec edx
	jmp abc
next:
	mov dword[i],0
for1:
	mov eax,dword[i]
	add eax,1
	mov dword[j],eax

	mov eax,dword[i]
	mov edx,dword[n]
	sub edx,1

	cmp eax,edx
	jl for2
	mov dword[i],0

	push msg3
	call printf
	add esp,4

	jmp display1
for2:
	mov eax,dword[i]
	mul dword[four]
	mov dword[iIndex],eax

	mov esi,dword[iIndex]
	lea ebx,[arr+esi]

	mov eax,dword[ebx]
	mov dword[a],eax

	mov eax,dword[j]
	mul dword[four]
	mov dword[jIndex],eax

	mov esi,dword[jIndex]
	lea ebx,[arr+esi]

	mov eax,dword[ebx]
	mov dword[b],eax
	mov eax,dword[a]
	cmp eax,dword[b]
	jge swap


	inc dword[j]
	mov eax,dword[j]

	cmp eax,dword[n]
	jl for2
	inc dword[i]
	jmp for1

swap:
	mov dword[arr+esi],eax
	mov eax,dword[b]
	mov esi,dword[iIndex]
	mov dword[arr+esi],eax
	inc dword[j]
	mov eax,dword[j]
	cmp eax,dword[n]
	jl for2
	inc dword[i]
	jmp for1

display1:
	mov eax,dword[i]
	mul dword[four]
	mov ecx,arr
	add ecx,eax
	
	push dword[ecx]
	push msg1
	call printf
	add esp,8

	push 9
	push dis
	call printf
	add esp,8

	inc dword[i]
	mov eax,dword[i]
	cmp eax,dword[n]
	jl display1

	
