section .text
	global mylen
mylen:
	push ebp
	mov ebp,esp
	mov ebx,[ebp+8]
	mov ecx,0
abc:
	cmp byte[ebx],0
	je end
	inc ebx
	inc ecx
	jmp abc
end:
	mov eax,ecx
	mov esp,ebp
	pop ebp
	ret
