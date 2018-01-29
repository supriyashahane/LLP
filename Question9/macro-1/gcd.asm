%macro gcd 2
	mov eax,%1
	mov ebx,%2
tst1:	 
	cmp eax,ebx
	jz end
	cmp eax,ebx
	jle tst2
	sub eax,ebx
	jmp tst1

tst2:
	sub ebx,eax
	jmp tst1


end:
	push eax
	push ans
	call printf
	add esp,8
        ret
%endmacro


section .data
	msg db "enter the number",10,0
	msg1 db "%d",0
	ans db "gcd is %d ",10,0

section .bss
	a resd 1
	b resd 1

section .text
	global main
	extern printf,scanf

main:
	push msg
	call printf
	add esp,4

	push a
	push msg1
	call scanf
	add esp,8

	push b
	push msg1
	call scanf
	add esp,8

	mov eax,dword[a]
	mov ebx,dword[b]

	gcd eax,ebx