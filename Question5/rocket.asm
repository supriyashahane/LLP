%include "macrofile.mac"
section .data
	msg db "->",0
	msg1 db "*",0
	msg2 db "*     *     *",0
	spc db " ",0
	nxt db "",10,0
	c db 'clear',0
	
section .text
	global main
	extern system,printf,sleep,clear
main:
	pusha
	print1 nxt,15
	popa

	push c
	call system
	add esp,4

	mov eax,1
	mov ebx,6
	mov ecx,10
	mov edx,2
	
ll:
	cmp ebx,0
	je end
	pusha
	print1 spc,ecx
	popa
	pusha
	print1 msg,2
	popa
	pusha
	push eax
	call sleep
	add esp,4
	popa
	pusha
        push c
	call system
	add esp,4
	popa
	dec ebx
	inc ecx
	jmp ll
	
end:
	pusha
	print1 spc,17
	popa
	pusha
	print1 msg2,1
	popa
	pusha
	print1 nxt,1
	popa
	pusha
	print1 spc,20
	popa
	pusha
	print1 msg1,1
	popa
	pusha
	print1 nxt,1
	popa
	pusha
	print1 spc,18
	popa
	pusha
	print1 msg1,1
	popa
	pusha
	print1 nxt,2
	popa
       
        pusha
	push edx
	call system
	add esp,4
	popa









	
