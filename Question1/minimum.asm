section .data
	Array dd 2,5,7,8,9,3,1,-1
	four dd 4
	msg db "minimum element is =%d",10,0

section .text
        global main
	extern printf
main:
	xor ebx,ebx
	mov eax,Array
	xor ecx,ecx
	mov edx,dword[eax+ecx*4]
	inc ecx
loop:
	mov ebx,dword[eax+ecx*4]
	cmp ebx,-1
	je end
	cmp edx,dword[eax+ecx*4]
	jge swap
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
	
