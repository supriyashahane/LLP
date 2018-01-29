section .data
	msg db "Enter the value of n & k",10,0
	num db "%d",0
	msg2 db "Combination is =%d",10,0
section .bss
        n resd 1
	k resd 1
	ans resd 1
	nn resd 1
section .text
        global main
	extern printf,scanf,fact
main:
	push msg
	call printf
	add esp,4

	push n
	push num
	call scanf
	add esp,8

	push k
	push num
	call scanf
	add esp,8
	
        mov eax,dword[n]
	mov ebx,dword[k]
	
	push eax
	call fact
	add esp,4

	
	mov dword[ans],eax
	xor eax,eax
	sub dword[n],ebx
	mov eax,dword[n]

	push eax
	call fact
	add esp,4

	mov dword[nn],eax
	xor eax,eax
	mov eax,dword[k]

	push eax
	call fact
	add esp,4

	mov ecx,dword[nn]
	mul eax
	mov dword[nn],ecx
	xor eax,eax
	mov eax,dword[ans]
	mov esi,dword[nn]
	div esi

	pusha
	push eax
	push msg2
	call printf
	add esp,8
	popa

	ret

	

