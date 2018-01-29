section .data
	msg db "roots are:",10,0
	rootx db "x=%f",10,0
	rooty db "y=%f",10,0
        a dq 2.0
	b dq 3.0
	c dq 0.5
        d dq 4.0
        B dq -3.0
        z dq 2.0
section .bss
	x resq 1
	y resq 1

section .text
	global main
	extern printf

main:
        fld qword[b]
        fmul qword[b]

        fld qword[a]
	fld qword[c]
        fmul qword[a]
        fmul qword[d]
	
	fsub st0,st2
        fabs
        fsqrt
	
        fld qword[B]
        fsub st0,st1
        fld qword[a]
	fmul qword[z]
	fdiv st1,st0
        fstp qword[x]
       ;; sub esp,8

        fld qword[B]
	fadd st0,st2
        fld qword[z]
        fmul qword[a]
	fdiv st1,st0
	fstp qword[y]
        
        sub esp,8
	fstp qword[esp]
        push rootx
	call printf
	add esp,12

	sub esp,8
        fstp qword[esp]
        push rooty
	call printf
	add esp,12
