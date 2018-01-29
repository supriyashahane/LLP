section .data
	array dd 2,5,7,8,9,3,1,-1
	four dd 4
	msg db "minimum element is =%d",10,0

section .text
        global main
	extern printf
main:
	xor ebx,ebx
	mov eax,array
	xor ecx,ecx
	mov edx,dword[eax+ecx*4]
	inc ecx
abc:
	mov ebx,dword[eax+ecx*4]
	cmp ebx,-1
	je end
	cmp edx,dword[eax+ecx*4]
	jge pqr
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
	
