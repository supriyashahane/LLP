section .data
	str1 db 'hello world',0
	pf db 'Reverse the string :',10,0
	newl db '',10,0
section .bss
	str2 resb 30
section .text
	global main
	extern printf,scanf
main:
	xor edx,edx
	xor esi,esi
	
lp1:	mov al,byte[str1+edx]
	cmp al,0
	jz next
	inc edx
	jmp lp1
next:	dec edx
	
lp2:	mov al,byte[str1+edx]
	cmp edx,0
	jl print
	
	mov byte[str2+esi],al
	inc esi
	dec edx
	jmp lp2
	
print:
	push str2
	call printf
	add esp,4
	
	push newl
	call printf
	add esp,4
	ret
