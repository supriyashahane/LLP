section .text
	global mymult

mymult:
	enter 4,0
	mov ebx,dword[ebp+8]
	mov dword[ebp-4],0
	mov ecx,dword[ebp+12]
abc:
	add dword[ebp-4],ebx
	loop abc

	mov eax,dword[ebp-4]
	leave
	ret
