section .data
	string db "1,sujata,female,mca,40",0
	 db "16221,kiran,male,msc,52",0
	 db"16222,radha,female,msc,60",0
	 db"16144,sachin,male,mca,90",0
	 db"16147,gautam,male,mca,85",10,0

	msg2 db "%c",10,0
	msg3 db "%d",10,0

	msg4 db "mca,",10,0
	len equ $-msg4
	msg6 db 10,"match -",0
	msg5 db 10,"not match -",0
section .bss
	a resd 1
	b resd 1
	c resd 1
section .text
	global main
	extern printf,scanf,puts
main:	
	mov eax,string
	mov ebx,msg4
	mov dl,','
	mov dword[a],0

l1:	cmp byte[eax],10
	jz out
	cmp byte[eax],0
	jz l6
	cmp byte[eax],dl
	jz l2
	inc eax
	jmp l1

l2:	inc dword[a]
	inc eax
	cmp dword[a],1
	jz l9
	cmp dword[a],2
	jz l3
	cmp dword[a],4
	jz l5
	jmp l1

l9:	mov dword[c],eax
	jmp l1
	

l3:	dec eax
	pusha
	mov ecx,dword[c]
	sub eax,ecx
	mov dword[b],eax
	popa
	mov ecx,2
	jmp l1

l5:	mov dh,byte[ebx]
	cmp dh,byte[eax]
	jnz l7

	inc ebx
	inc eax
	
	loop l5

end:	pusha
	mov eax,4
	mov ebx,1
	mov ecx,msg6
	mov edx,9
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,dword[c]
	mov edx,dword[b]
	int 80h
	
	popa
	inc eax
	jmp l1


l7:	pusha
	mov eax,4
	mov ebx,1
	mov ecx,msg5
	mov edx,12
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,dword[c]
	mov edx,dword[b]
	int 80h
	popa
	inc eax
	mov dword[a],0
	mov ebx,msg4
	jmp l1
	

l6:	inc eax
	mov dword[a],0
	mov ebx,msg4
	jmp l1
	
out:	ret
