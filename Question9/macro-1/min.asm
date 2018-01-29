%macro min 2
	mov eax,%1
	mov ebx,%2	
	cmp eax,ebx
	jg loop

	push eax
	push msg3
	call printf
	add esp,8
	jmp end
	
loop:
	push ebx
	push msg3
	call printf
	add esp,8
	
end:	ret

%endmacro

section .data
	  msg1 db "enter two no",10,0
	  msg2 db "%d",0
	  msg3 db "minimum no is =%d",10,0

section .bss
	 a resd 1
	 b resd 1
	
section .text
	 global main
	 extern printf,scanf

main:
	push msg1
	call printf
	add esp,4
	push a
	push msg2
	call scanf
	add esp,8
	
	push b
	push msg2
	call scanf
	add esp,8

	mov eax,dword[a]
	mov ebx,dword[b]
	
	min eax,ebx