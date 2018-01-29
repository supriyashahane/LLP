section .data
	string db "programming",0
	len equ $-string
	msg db "length is %d",10,0

section .text
	global main
	extern printf
main:
	push len
	push msg
	call printf
	add esp,8


