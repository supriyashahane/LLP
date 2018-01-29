section .data
	a dq 8.0
	b dq 72.0
        msg db "division is %f",10,0

section .text
	global main
	extern printf

main:
	fld qword[a]
	fld qword[b]
	fdiv st0,st1
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
