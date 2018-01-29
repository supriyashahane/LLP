section .data
	a dq 5.9
	b dq 8.3
        msg db "addition is %f",10,0

section .text
	global main
	extern printf

main:
	fld qword[a]
	fld qword[b]
	fadd st0,st1
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
