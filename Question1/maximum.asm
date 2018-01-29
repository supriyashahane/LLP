section .data
	Array dd 2,1,5,3,7,9,1,-1
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
	mov eax,Array
	XOR ecx,ecx
	mov edx,dword[eax+ecx*4]
	inc ecx
loop:	
	mov ebx,dword[eax+ecx*4]
	cmp ebx,-1
	je end
	cmp edx,dword[eax+ecx*4]
	jle swap
	inc ecx
	jmp loop
swap:	

	mov edx,dword[eax+ecx*4]
	inc ecx
	jmp loop

end:
	push edx
	push msg
	call printf
	add esp,8

	
	
	




	
