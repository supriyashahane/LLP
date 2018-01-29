section .text
	global myfact

myfact:
	enter 4,0
	mov ebx,dword[ebp+8]
	mov dword[ebp-4],ebx
	mov eax,1
        mov ecx,dword[ebp-4]
l1:
	mul dword[ebp-4]
	dec dword[ebp-4]
	loop l1

	leave
	ret
