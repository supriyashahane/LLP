section .data 
	msg db "enter two no",10,0
	sf db "%d",0
	pf db "%d",10,0

section .bss
	x resd 1
	y resd 1

section .text
	global main 
	extern printf,scanf,addi

main:
	push msg
	call printf
	add esp,4

	push x
	push sf
	call scanf
	add esp,8

	push y
	push sf
	call scanf
	add esp,8

	push dword[x]
	push dword[y]
	call addi
	add esp,8
	
	push eax
	push pf
	call printf
	add esp,8
	ret
