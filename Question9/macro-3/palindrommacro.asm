%macro palin 3
	mov esi,%1
	mov edi,%2
	mov esi,%1+%3-2
	mov edi,%2
	mov ecx,%3-1
	
loopl:	std
	lodsb
	cld
	stosb
	loop loopl
	
	mov esi,%1
	mov edi,%2
	mov ecx,%3
	rep cmpsb
	jne neq

	push s3
	call printf
	add esp,4
	ret

neq:	push s4
	call printf
	add esp,4
	ret

%endmacro

	
section .data
	s1 db "madam",0
	len equ $-s1
	pf db "%s",10,0
	s3 db "string is palindrom",10,0
	s4 db "string is not palindrom",10,0


section .bss
	s2 resb 50

section .text
	global main
	extern printf

main:	
 	palin s1,s2,len

	
