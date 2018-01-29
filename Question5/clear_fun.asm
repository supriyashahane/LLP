section .data
	msg db 'clear',0
section .text
	global main
	extern system
main:
	push msg
	call system
	add esp,4
	
