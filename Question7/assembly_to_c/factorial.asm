section .data
	msg db "Enter Number:",10,0
	acc db "%d",0
	res db "factorial: %d " ,10,0

section .bss
	a resd 1

section .text
	global main
	extern printf,scanf,facto

main:
	pusha
	push msg
	call printf
	add esp,4
	popa

	pusha
	push a
	push acc
	call scanf
	add esp,8
	popa

	mov edx,dword[a]

	pusha
	push edx
	call facto
	add esp,4
	popa 

	pusha
	push eax
	push res
	call printf
	add esp,8
