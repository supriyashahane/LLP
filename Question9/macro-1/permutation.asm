%macro per 1
	mov eax,%1	
	mov ecx,1

lp1:
	cmp ecx,dword[n]
	je label1

	mul ecx
	inc ecx
	jmp lp1
	
label1:
	xor ecx,ecx
	mov ebx,dword[n]
	mov ecx,dword[r]
	sub ebx,ecx
	xor ecx,ecx
label2:
	mov esi,eax
	mov eax,ebx
	mov ecx,1
lp2 :
	cmp ecx,ebx
	je divide

	mul ecx
	inc ecx
	jmp lp2

divide:
	xor edx,edx
	
	mov ecx,eax
	mov eax,esi
	
	div ecx

	pusha
	push eax
	push msgp
	call printf
	add esp,8
	popa	

%endmacro
section .data
	msg db "Enter n & r : ",10,0
	msgs db "%d%d"
	msgp db "permutaton is %d",10,0
section .bss
	n resd 1
	r resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push r
	push n
	push msgs
	call scanf
	add esp,12

	mov eax,dword[n]

	per eax