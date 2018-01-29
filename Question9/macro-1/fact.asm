%macro factorial 1
	mov ecx,%1
	xor eax,eax
	add eax,1
	
fact2:	
	mul ecx
	loop fact2
	
	pusha
	push eax
	push msg2
	call printf
	add esp,8
	popa
	ret
	
%endmacro

section .data
	msg db "Enter number : ",10,0
	msg2 db "%d",0
	
section .bss
	n resd 1
	
section .text
	global main
	extern printf,scanf
	
main:
	pusha
	push msg
	call printf
	add esp,4
	popa
	
	pusha
	push n
	push msg2
	call scanf
	add esp,8
	popa
	
	mov ecx,dword[n]
	factorial ecx
	
	
