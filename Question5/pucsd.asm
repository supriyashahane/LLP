section .data
	clr db "clear",0
	dly db "sleep 0.5s",0
	dly1 db "sleep 1s",0
	rock db '##***##',10,0
	newln db 10
	spc db " ",0
	h dd 25
	l dd 75
	star db "**  PUCSD  **",0
	ran dd 15

section .bss
	temp resd 1
	flag resd 1
section .text
	global main
	extern printf,system

main:
	mov eax,dword[h]
	pusha
	push clr
	call system
	add esp,4
	popa
	mov ebx,dword[h]
	
tst1:
	pusha 
	push newln
	call printf
	add esp,4
	popa
	
	dec eax
	cmp eax,0
	jne tst1

	cmp ebx,0
	je tst3	
	

	mov edx,spc
	mov ecx,dword[l]
tst2:
	pusha
	push edx
	call printf
	add esp,4
	popa
	
	loop tst2

	pusha
	push rock
	call printf
	add esp,4
	popa

	dec ebx
	mov eax,ebx

tst3:
	pusha
	push dly
	call system
	add esp,4
	popa
	
	pusha
	push clr
	call system
	add esp,4
	popa

	dec eax
	cmp eax,0 
	jnz tst1

	mov ecx,65 ;; firework starts here
	mov dword[temp],ecx
	xor ebx,ebx
	xor eax,eax
	
	pusha
	push clr
	call system
	add esp,4
	popa

fire1:
	pusha
	push edx
	call printf
	add esp,4
	popa
	
	loop fire1

	pusha
	push star
	call printf
	add esp,4
	popa

	pusha
	push dly1
	call system
	add esp,4
	popa

	pusha 
	push newln
	call printf
	add esp,4
	popa

	cmp dword[flag],0
	je style2

style:
	mov ecx,dword[temp]
	add ecx,4
	mov dword[flag],0
	jmp rest

style2:	
	mov ecx,dword[temp]
	sub ecx,4
	mov dword[flag],1
	
rest:
	inc ebx
	cmp ebx,dword[ran]
	jne fire1
	
end:
	ret
