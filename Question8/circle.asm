section .data
	r dq 2.5
	two dq 2.0
	msg db "ans is=%f",10,0
section .bss
	c resq 1
section .text
	global main
	extern printf
main:

	fld qword[two]
	fldpi
	fmul st0,st1
	fld qword[r]
	fmul qword[r]
	fmul st1
	fst qword[c]
         sub esp,8
	fstp qword[esp]
	
	push msg
	call printf
	add esp,12
	
