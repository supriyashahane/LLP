	
section .data
	b dq 2.1
	a dq 4.2
	c dq 3.2
	four dq 4
	two dq 2
	msg db "Ans is =%f",10,0
section .bss
	sum resq 1
section .text
	global main
	extern printf
main:

	fild qword[four]
	fld qword[a]
	fmul st1
        fld qword[c]
	fmul st1

	fld qword[b]
	fmul st0,st0

	fsub st0,st1
	fchs 
        fsqrt 
        fld qword[b]
	fmul st0,st0

	fadd st1

	fild qword[two]
	fld qword[a]
	fmul st1

	fdiv st2,st0
        fst qword[sum]
	sub esp,8
	fst qword[esp]
	push msg
	call printf
	add esp,12
	
	
