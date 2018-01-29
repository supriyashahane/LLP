%macro revstr 1

	mov ecx, [strl]
	sub ecx, 2
	mov esi, str0

	loop:
		cmp ecx, -1
		jz exit
		
		pushad
		push dword[esi+ecx]
		push str3
		call printf
		add esp, 8
		popad

		dec ecx
		jmp loop

	exit:
		push str4
		call printf
		add esp, 4
%endm

section .data
	str0 db "Nitin Manchanda", 0
	strl dd $-str0
	str1 db "Reverse of the string ", 0
	str2 db " is:- ",10, 0
	str3 db "%c"
	str4 db 10

section .text
	global main
	extern printf
	extern scanf

main:
	enter 0, 0

	push str1
	call printf
	push str0
	call printf
	push str2
	call printf
	add esp, 12
	
	revstr str0

	leave
	ret
