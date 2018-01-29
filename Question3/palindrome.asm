section .data
        str1 db "computer",0
 	len equ $-str1
        msg1 db "string is palindrome",10,0
        msg2 db "string is not palindrome",10,0

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
        
        mov edx,str2
        mov eax,str1

state2:
        mov bl,byte[eax]
        cmp bl,0
        jz state3
        cmp bl,byte[edx]
        jnz state4
        inc eax
        inc edx
        jmp state2
  
state3:
	push msg1
	call puts
	add esp,4
        jmp end

state4:
	push msg2
	call puts
	add esp,4
        jmp end

end:
	ret
