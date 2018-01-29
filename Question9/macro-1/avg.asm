%macro avg 1
	mov edx,%1
	xor ebx,ebx
	xor ecx,ecx
	xor eax,eax
add:
	mov ebx,dword[edx+ecx*4]
	add eax,ebx
	inc ecx
	cmp ebx,-1
	jne add
	xor edx,edx
	mov ecx,len
	div ecx
end:
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
%endmacro
section .data
 	msg db "average number is %d",10,0
 	NumA dd 10,29,90,40,56,34,78,-1
	len equ $-NumA
	
section .text
	global main
	extern printf

main:
	mov edx,NumA
	
	avg edx