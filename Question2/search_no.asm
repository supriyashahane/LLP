section .data
	msg db "low level programming low level programming",0
	match db "low",0
	resu db "sub-string found %d times",10,0
section .text
	global main
	extern printf	

main:
	mov eax,msg
	mov ebx,match
	xor ecx,ecx
	xor dl,dl
	xor dh,dh

mat:
	mov dl,byte[eax]
	mov dh,byte[ebx]
	inc eax
	inc ebx
	cmp dl,dh
	jne print
	cmp byte[ebx],0
	jne con1
	jmp mat
con1: 
	inc ecx
	xor ebx,ebx
	mov ebx,match
	cmp byte[eax],0
	je print
	jmp mat

print:
	push ecx
	push resu
	call printf
	add esp,8
