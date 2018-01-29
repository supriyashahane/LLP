section .data
        msg db "enter the no",10,0
	msg2 db "%d",0
	msg1 db "factorial is %d",10,0
section .bss
      	num resd 1
	fact1 resd 1
section .text
        global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push num
	push msg2
	call scanf
	add esp,8

        mov ebx,dword[num]
	mov ecx,1
	mov eax,1
abc:
	cmp ecx,ebx
	jg pqr
	mul ecx
	inc ecx
	jmp abc

pqr:
	mov dword[fact1],eax
	push dword[fact1]
	push msg1
	call printf
	add esp,8
	ret


	
