section .data
	msg db "This is my string",10,0
	len equ $-msg
section .bss
	msga resb len
section .text
	global main
	extern puts
main:
	xor ecx,ecx
	mov ebx,msg
	mov ecx,len
	mov edx,msga
abc:	mov al,byte[ebx]
	cmp al,0
	je end
	cmp al," "
	je w
	mov byte[edx],al
	
	dec ecx 
	inc edx
	inc ebx
	jmp abc
w:	
	mov byte[edx],al
	inc edx
	inc ebx
	dec ecx
	jmp abc
	
end:	pusha
	push msg
	call puts
	add esp,4

	push msga
	call puts
	add esp,4
	popa
