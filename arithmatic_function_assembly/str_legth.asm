section .data
	str1 db 'helloworld',0
	len equ $-str1
	msg db 'length = %d',10,0
section .bss

section .text
	global main
	extern printf
main:

	xor edx,edx
	xor ecx,ecx
lp:	mov al,byte[str1+edx]
	cmp al,0
	jz print
	inc edx
	inc ecx
	jmp lp	

print:	push ecx
	push msg
	call printf
	add esp,8
	ret
