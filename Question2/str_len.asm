section .data
	  str1 db "hello world",10,0
	  msg db "Length of string is %d",10,0

section .text
	 global main
	 extern printf

main:    xor ebx,ebx
	 xor eax,eax
	 mov ecx,str1
	 mov eax,str1
abc:
	 mov bl,byte[eax]
	 cmp bl,0
	 jz state2
	 inc eax
	 jmp abc


	 sub eax,ecx
	 push eax
	 push msg
	 call printf
	 add esp,8
         ret
