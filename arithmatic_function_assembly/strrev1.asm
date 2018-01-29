section .data
	msg db 'hello world',10,0
section .bss
	msg2 resb 30
section .text
	global main
	extern printf
main:	xor edx,edx
	xor esi,esi
abc:	mov al,byte[msg+edx]
	cmp al,0
	jz pqr
	inc edx
	jmp abc
pqr:	dec edx
xyz:	mov al,byte[msg+edx]
	cmp edx,0
	jl show
	mov byte[msg2+esi],al
	inc esi
	dec edx
	jmp xyz
show:	push msg
	call printf
	add esp,4
	push 10
	call printf
	add esp,4
	push msg2
	call printf
	add esp,4
