section .data
	msg db "Enter Number",10,0
	acc db "%d%d"
	res db "Result:%d",10,0
	
section .bss
	a resd 1
	b resd 1
	
section .text
	global main
	extern printf,scanf,divi
	
main:
	push msg
	call printf
	add esp,4
	
	push a
	push b
	push acc
	call scanf
	add esp,12
	
	mov eax,dword[a]
	mov ebx,dword[b]
	
	push eax
	push ebx
	call divi
	add esp,8
	
	push eax
	push res
	call printf
	add esp,8
	
	ret
	