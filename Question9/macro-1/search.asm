%macro search 2
	mov eax,%1
	mov ebx,%2
abc:    
	cmp dword[ebx],-1
	jz notmatch
   	cmp eax,dword[ebx]
	jz match
        add ebx,4
	jmp abc    


match:
	push ans1
	call printf
	add esp,4
	ret

notmatch:
	push ans2
	call printf
	add esp,4
        ret

%endmacro
section .data
	msg1 db "enter the no for searching:",10,0
	msg2 db "%d",0
	ans1 db "element is present",10,0
	ans2 db "element is not present",10,0
        arr dd 1,9,3,4,6,8,5,-1

section .bss
	a resd 1

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
    
        mov ebx,arr
        mov eax,dword[a]
	
	search eax,ebx