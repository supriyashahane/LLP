section .data
        str1 db "low level programming",0
 	len equ $-str1
section .bss
	str2 resb len	

section .text
	global main
	extern puts

main:
	mov esi,str1
	mov edi,str2
	mov ecx,len
	add esi,len
        dec esi
	dec esi
state1:
	xor eax,eax
	std
	lodsb
	cld
	stosb
	loop state1
        
        push str2
	call puts
 	add esp,4
	ret
