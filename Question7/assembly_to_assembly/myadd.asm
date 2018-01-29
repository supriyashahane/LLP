section .text
	global addi

addi:
	enter 4,0
	mov eax,dword[ebp+8]
	mov ecx,dword[ebp+12]
	add eax,ecx
	leave
	ret
