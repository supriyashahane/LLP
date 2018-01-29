%macro fibb 3
	
	mov ecx,%1
	mov eax,%2
	mov ebx,%3
		
	cmp ecx,0
	jz end
	pusha
        push eax
	push msg2
	call printf
	add esp,8
	popa
	dec ecx
    
abc:
	cmp ecx,0
	jz end
	pusha
        push ebx
	push msg2
	call printf
	add esp,8
	popa
	dec ecx
	
pqr:
	mov edx,ebx
	add ebx,eax
	mov eax,edx
	jmp abc

end:
	ret

%endmacro

	
section .data
	msg1 db "enter value:",10,0
	msg2 db "%d",10,0
	ip db "%d",0
	zero dd 0
        one dd 1
        nwln db 10
section .bss
	m resd 1
        arr resd 50
section .text
	global main
	extern scanf,printf,rec1

main:
	push msg1
	call printf
	add esp,4

	push m
	push ip
	call scanf
	add esp,8
		
 	mov ecx,dword[m]
	mov eax,dword[zero]
	mov ebx,dword[one]
	
	fibb ecx,eax,ebx