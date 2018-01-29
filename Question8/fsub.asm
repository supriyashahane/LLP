section .data
	a dq 5.8
	b dq 90.8
        msg db "substraction is %f",10,0

section .text
	global main
	extern printf

main:
	fld qword[a]
	fld qword[b]
	fsub st0,st1
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
