	section .data
	msg db "asd",10,0
	section .text
	global main
	extern printf
main:	pusha
	push msg
	call printf
	add esp,4
	popa
	ret
