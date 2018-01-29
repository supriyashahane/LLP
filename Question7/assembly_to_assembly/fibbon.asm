section .data
	msg1 db "enter value:",10,0
	msg2 db "%d",0

section .bss
	m resd 1
        arr resd 50
section .text
	global main
	extern scanf,printf,fib

main:
	push msg1
	call printf
	add esp,4

	push m
	push msg2
	call scanf
	add esp,8
		
 	push dword[m]
	call rec1
	add esp,4

	ret
	
	
