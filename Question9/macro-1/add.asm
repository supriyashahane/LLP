%macro myadd 2
	mov eax,%1
	add eax,%2
%endmacro

section .data
	msg db "The addition is :%d",10,0

section .text
	global main
	extern printf

main:	xor eax,eax
	
	myadd 33,32
	push eax
	push msg
	call printf
	add esp,8
