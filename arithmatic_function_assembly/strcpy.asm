section .data
	msg db "This is my string",10,0
	len equ $-msg
	msg2 db "Reverse string=%s",10,0
section .bss
	msg1 resb len
section .text
	global main
	extern printf
main:
	xor edx,edx
	xor ebx,ebx
	xor ecx,ecx
	
	mov ebx,msg
	mov ecx,len
	mov edx,msg1
	mov al,byte[ebx]
abc:	cmp al,0
	je end
	cmp al," "
	je pqr
xyz:	
	mov byte[edx],al
	mov byte[ebx],al
	inc edx
	dec ecx
	inc ebx
	jmp abc
pqr:	mov byte[ebx],al
	inc ebx
	mov al,byte[ebx]
	jmp abc
end:	mov byte[edx],al
	dec edx
	push edx
	push msg2
	call printf
	add esp,4
