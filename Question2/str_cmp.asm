section .data
	 str1 db "MSc",0
	 len equ $-str1
	 str2 db "MSc",0
	 len2 equ $-str2
   	msg db "strings are not equal ",10,0
         msg1 db "strings are equal",10,0
	
section .text
	global main
	extern printf

main:
	 mov ecx,len
	 mov edx,len2
	 mov eax,str1
       	 mov ebx,str2

state0:
	 cmp ecx,edx
	 jnz state3
	 
state1:
         mov dl,byte[eax]
	 cmp dl,byte[ebx]
	 jnz state3
	 dec ecx
	 inc eax
	 inc ebx
	 cmp ecx,0
	 jz state2
	 jmp state1
	
state2:
	push msg1
	call printf
	add esp,4
	jmp end1
state3:
	push msg
	call printf
	add esp,4
end1:	ret
