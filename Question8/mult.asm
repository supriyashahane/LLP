section .data
	a dq 5.0
	b dq 9.0
        msg db "multiplication is %f",10,0

section .text
	global main
	extern printf

main:
	fld qword[a]
	fld qword[b]
	fmul st0,st1
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
