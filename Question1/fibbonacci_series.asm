section .data
        msg1 db "enter value:",10,0
	msg2 db "%d",10,0
	num db "%d",0
	msg3 db "fibbonacci series is",10,0
	zero dd 0
	one dd 1
	nxt db 10
	section .bss
	m resd 1
	arr resd 20
	section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4

	push m
	push num
	call scanf
	add esp,8

	push msg3
	call printf
	add esp,4

	mov ecx,dword[m]
	mov eax,dword[zero]
	mov ebx,dword[one]

	cmp ecx,0
	jz end
	pusha
	push eax
	push msg2
	call printf
	add esp,8
	popa
	dec ecx
abc:
	cmp ecx,0
	jz end
	pusha
	push ebx
	push msg2
	call printf
	add esp,8
	popa
	dec ecx
pqr:
	mov edx,ebx
	add ebx,eax
	mov eax,edx
	jmp abc
end:
	ret
	
	
