section .data
	msg db "result is %d",10,0
	
section .text
	global main
	extern myfact,printf

main:
	mov ebx,4

	push ebx
	call myfact
	add esp,4

	push eax
	push msg
	call printf
	add esp,8

	mov eax,1
	int 0x80
