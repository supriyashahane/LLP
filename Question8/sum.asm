	;; sumation of 1/n
section .data
	num db "%d",0
	msg db "Addition is =%lf",10,0
section .bss
        n resd 1
	i resd 1
	sum resq 1
	mydiv resq 1
section .text
	global main
	extern printf,scanf
main:
	push n
	push num
	call scanf
	add esp,8

	fldz
	fstp qword[sum]
label:
	fild dword[n]
	fld1
	fdiv st0,st1
	fadd qword[sum]
	fstp qword[sum]
	fstp qword[mydiv]
	dec dword[n]
	cmp dword[n],0
	jnz label

	fld qword[sum]
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	
	
	
