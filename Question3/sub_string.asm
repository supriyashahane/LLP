section .data
	string1 db "PUCSD,computer science department",10,0
	len equ $-string1
section .bss
	string2 resd len
section .text
	global main
	extern printf
main:
	mov esi,string1
	mov ecx,len
	mov al,','
	repnz scasb
	push edi
	mov edi,string2
	repz movsb
	mov eax,4
	mov ebx,1
	push edi
	mov edi ,string2
	mov edx,len
	pop edi
	int 0x80
