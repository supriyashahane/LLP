section .data
	n dd 9
	pnl db 10,0
	psl db "* ",0
	pbl db "  ",0
	clr db "clear"

section .bss
	nb2 resd 1
	
section .text
	global main
	extern sleep
	extern system

main:	enter 0,0

	xor edx,edx
	mov eax,dword[n]
	mov ebx,2
	div ebx
	mov dword[nb2],eax

wlp:	push 1
	call sleep
	add esp,4

	push clr
	call system
	add esp,4
	
	mov ecx,dword[n]
lp11:	push ecx

	mov ecx,dword[n]
lp12:	push ecx

	mov eax,dword[nb2]
	inc eax
	cmp ecx,eax
	je psl12

	mov eax,4
	mov ebx,1
	mov ecx,pbl
	mov edx,3
	int 0x80
	jmp lp12e

psl12:	mov eax,4
	mov ebx,1
	mov ecx,psl
	mov edx,3
	int 0x80

lp12e:	pop ecx
	loop lp12

	mov eax,4
	mov ebx,1
	mov ecx,pnl
	mov edx,2
	int 0x80

	pop ecx
	loop lp11

	push 1
	call sleep
	add esp,4

	push clr
	call system
	add esp,4
	
	mov ecx,dword[n]
	mov eax,ecx
lp21:	push ecx
	push eax

	cmp ecx,eax
	je pnl21
	cmp ecx,1
	je pnl21

lp22:	push ecx

	cmp ecx,1
	je psl22

	mov eax,4
	mov ebx,1
	mov ecx,pbl
	mov edx,3
	int 0x80
	jmp lp22e

psl22:	mov eax,4
	mov ebx,1
	mov ecx,psl
	mov edx,3
	int 0x80

lp22e:	pop ecx
	loop lp22

pnl21:	mov eax,4
	mov ebx,1
	mov ecx,pnl
	mov edx,2
	int 0x80

	pop eax
	pop ecx
	loop lp21

	push 1
	call sleep
	add esp,4

	push clr
	call system
	add esp,4

	mov ecx,dword[n]
lp31:	push ecx

	mov eax,dword[nb2]
	inc eax
	cmp ecx,eax
	je lp32s

	mov eax,4
	mov ebx,1
	mov ecx,pnl
	mov edx,2
	int 0x80
	jmp lp31e

lp32s:	mov ecx,dword[n]
lp32:	push ecx

	mov eax,4
	mov ebx,1
	mov ecx,psl
	mov edx,3
	int 0x80

	pop ecx
	loop lp32

lp31e:	pop ecx
	loop lp31

	push 1
	call sleep
	add esp,4

	push clr
	call system
	add esp,4

	mov ecx,dword[n]
	mov eax,ecx
lp41:	push ecx
	push eax

	cmp ecx,eax
	je pnl41
	cmp ecx,1
	je pnl41

	mov eax,ecx
	mov ecx,dword[n]
lp42:	push ecx
	push eax

	cmp ecx,eax
	je psl42

	mov eax,4
	mov ebx,1
	mov ecx,pbl
	mov edx,3
	int 0x80
	jmp lp42e

psl42:	mov eax,4
	mov ebx,1
	mov ecx,psl
	mov edx,3
	int 0x80

lp42e:	pop eax
	pop ecx
	loop lp42
	
pnl41:	mov eax,4
	mov ebx,1
	mov ecx,pnl
	mov edx,2
	int 0x80

	pop eax
	pop ecx
	loop lp41

	jmp wlp
	
ex:	mov eax,4
	mov ebx,1
	mov ecx,pnl
	mov edx,2
	int 0x80

	leave
	ret