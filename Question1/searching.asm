section .data
        msg db " No. of Elements",10,0
	num  dd "%d",0
	msg1 db "Enter the array element",10,0
	msg2 db "Element is present",10,0
	msg3 db "Element is not present",10,0
	msg4 db "Enter the element for search",10,0
	msg5 db "given array is",10,0
	newln db 10,0
	dis db "%c",0
	four dd 4
section .bss
        elem resd 1
	n resd 1
	arr resd 20
section .text
	global main
	extern printf,scanf
	
main:
	push msg
	call printf
	add esp,4

	push elem
	push num
	call scanf
	add esp,8

	push msg1
	call printf
	add esp,4

	xor eax,eax
	xor ecx,ecx
	xor edx,edx
	mov ebx,arr
abc:
	cmp eax,dword[elem]
	je end

	pusha
	push ebx
	push num
	call scanf
	add esp,8
	popa
	inc eax
	add ebx,4
	jmp abc
end:
	push msg5
	call printf
	add esp,4
	xor eax,eax
	mov ebx,arr
	mov edx,dword[elem]
pqr:	mov eax,dword[four]
	pusha
	push dword[ebx]
	push num
	call printf
	add esp,8
	
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
	push msg4
	call printf
	add esp,4

	push n
	push num
	call scanf
	add esp,8

	xor eax,eax
	xor edx,edx
	mov edx,dword[elem]
	mov eax,dword[n]
	mov ebx,arr
xyz:
	cmp edx,1
	jz notmatch
	cmp eax,dword[ebx]
	je match
	add ebx,4
	dec edx
        jmp xyz
match:
	push msg2
	call printf
	add esp,4
	ret
notmatch:
	push msg3
	call printf
	add esp,4
	ret
	
