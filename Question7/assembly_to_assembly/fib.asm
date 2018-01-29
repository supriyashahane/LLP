section .data
	 pf db "%d",10,0
	 zero dd 0
	 one dd 1
section .text
	global rec1
        extern printf
rec1:
	enter 4,0
	mov ecx,dword[ebp+8]
        mov dword[ebp-4],0
	mov eax,dword[zero]
	mov ebx,dword[one]

abc:
	cmp ecx,0
	jz end
	
        pusha
	push eax
	push pf
	call printf
	add esp,8
        popa
	dec ecx
pqr:
        cmp ecx,0
	jz  end
	pusha
        push ebx
	push pf
	call printf
	add esp,8
	popa
        dec ecx


swapadd:
	      
         mov edx,ebx
         add ebx,eax
         mov eax,edx
 	 jmp pqr
	
end:    leave
	ret
