section .data
	msg db"max in array [29.0,27.1,20.0]=%f",0
	a dq 29.0,27.1,20.0
section .text
	global main
	extern printf
main:	fldz
pqr:	xor eax,eax
	mov eax,a
	fldz
	fild qword[eax]
	fcom
	fstsw ax
	sahf
	jb pp
	sub esp,8
	fstp qword[esp]
	push eax
	push msg
	call printf
	add esp,12
pp:	fld qword[a]
