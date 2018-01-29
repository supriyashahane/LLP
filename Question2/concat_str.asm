section .data
	str db 'supriya ',0 		
	str1 db 'shahane ',0
	msg db "Concatenated strings : ",10,0
section .text
	global main
	extern puts,printf
main:	xor edx,edx
	xor ecx,ecx
	mov esi,str
	mov edi,str1
abc:	mov al,[esi+edx]
	cmp al,0
	jz pqr
	inc edx
	jmp abc

pqr:	mov al,[edi+ecx]
	mov [esi+edx],al
	cmp al,0
	jz end
	inc edx
	inc ecx
	jmp pqr
exit1:	push msg
	call printf
	add esp,4
	push str
	call puts
	add esp,4
	ret
