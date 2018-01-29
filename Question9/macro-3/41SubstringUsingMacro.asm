%macro substring 2

	mov esi, %1
	mov edi, %2
	
	loop:
		mov bl, byte[edi+ecx]
		cmp bl, 0
		je yes

		lodsb
		cmp al, 0
		je no

		cmp al, bl
		je move
		xor ecx, ecx

	move:
		inc ecx
		jmp loop

	yes:
		push str0
		push str1
		push str2
		call printf
		add esp, 12
		jmp exit

	no:
		push str0
		push str1
		push str3
		call printf
		add esp, 12

	exit:
%endm

section .data
	str0 db "Low Level Programming", 0
	str1 db "evel Pr", 0
	str2 db "Given substring '%s' exists in the string '%s'", 10, 0
	str3 db "Given substring '%s' doesn't exist in the string '%s'", 10, 0
		
section .text
	global main
	extern printf

main:
	xor ecx, ecx

	substring str0, str1

	mov eax, 1
	int 80h
