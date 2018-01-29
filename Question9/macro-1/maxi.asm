%macro max 1
	mov eax,%1
	xor ebx,ebx
	xor ecx,ecx
	mov edx,dword[eax+ecx*4]
	inc ecx

tst:	
	mov ebx,dword[eax+ecx*4]
	cmp ebx,-1
	je print
	cmp edx,dword[eax+ecx*4]
	jle swap
	inc ecx
	jmp tst

swap: 	
	mov edx,dword[eax+ecx*4]
 	inc ecx
	jmp tst

print:
	push edx
	push msg
	call printf
	add esp,8
%endmacro

section .data
 	msg db "maximum number is %d",10,0
 	NumA dd 10,29,90,40,56,34,78,-1

section .text
	global main
	extern printf

main:
 	mov eax,NumA
 	
 	max eax