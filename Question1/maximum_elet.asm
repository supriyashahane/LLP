section .data
	array dd 2,1,5,3,7,9,1,-1
	four dd 4
	msg db "maximum element is = %d",10,0
section .bss
	max resd 1
	num resd 1
section .text
	global main
	extern printf
main:
	xor ebx,ebx
	mov eax,array
	XOR ecx,ecx
	mov edx,dword[eax+ecx*4]
	inc ecx
abc:	
	mov ebx,dword[eax+ecx*4]
	cmp ebx,-1
	je end
	cmp edx,dword[eax+ecx*4]
	jle pqr
	inc ecx
	jmp abc
pqr:	

	mov edx,dword[eax+ecx*4]
	inc ecx
	jmp abc

end:
	push edx
	push msg
	call printf
	add esp,8

	
	
	




	
