section .data
	msg db "enter two no",10,0
	msg1 db "%d",0
	ans db "gcd is =%d",10,0
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

gcd:
	cmp eax,ebx
	jz end
	cmp eax,ebx
	jle state2
	sub eax,ebx
	jmp gcd

state2:
	sub ebx,eax
	jmp gcd
end:
	push eax
	push ans
	call printf
	add esp,8
