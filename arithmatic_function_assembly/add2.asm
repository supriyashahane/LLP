section .data
	num db "%d",0
	msg1 db "enter two no",10,0
	msg db "Addtion is =%d",10,0
section .bss
	a resd 1
	b resd 1
	sum resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4

	push a
	push num
	call scanf
	add esp,8

	push b
	push num
	call scanf
	add esp,8

	mov eax,dword[a]
	mov ebx,dword[b]
	add eax,ebx
	mov dword[sum],eax

	push dword[sum]
	push msg
	call printf
	add esp,8
	
