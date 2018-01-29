section .data
	a dq 25.0
	pri db "%f",0

section .text
 	global main
	extern printf

main:
	fld qword[a]
	fsqrt
	
	sub esp,8
	fstp qword[esp]
	push pri
	call printf
	add esp,12
