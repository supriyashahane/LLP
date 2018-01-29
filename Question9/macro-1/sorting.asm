section .data
	pf1 db "How many elements :",10,0
	pf2 db "Enter %d elements :",10,0
	pf3 db "Array before sorting :",10,0
	pf4 db "Array after sorting :",10,0
	pf5 db "%d",10,0
	sf db "%d"
	i dd 0
	four dd 4

section .bss	
	a resd 1
	b resd 1
	iIndex resd 1
	jIndex resd 1
	j resd 1
	n resd 1
	arr resd 10
	
section .text
	global main
	extern printf, scanf

main:
	push pf1
	call printf
	add esp, 4

	push n
	push sf
	call scanf
	add esp, 8

	push dword[n]
	push pf2
	call printf
	add esp, 8

	
	
accept:
	mov eax, dword[i]
	mul dword[four]

	mov ecx, arr
	add ecx, eax

	push ecx
	push sf
	call scanf
	add esp, 8

	inc dword[i]
	mov eax, dword[i]
	cmp eax, dword[n]
	jl accept

	mov dword[i], 0


	push pf3
	call printf
	add esp, 4
	
display:
	mov eax, dword[i]
	mul dword[four]
	mov ecx, arr
	add ecx, eax

	push dword[ecx]
	push pf5
	call printf
	add esp, 8

	inc dword[i]
	mov eax, dword[i]
	cmp eax, dword[n]
	jl display

	mov dword[i], 0	
	
for1:	
	mov eax, dword[i]
	add eax, 1
	mov dword[j], eax
	
	mov eax, dword[i]

	mov edx, dword[n]
	sub edx, 1
	
	cmp eax, edx
	jl for2
	mov dword[i],0

	push pf4
	call printf
	add esp, 4	

	jmp display1
	
for2:
	
	mov eax, dword[i]
	mul dword[four]
	mov dword[iIndex], eax
	
	mov esi, dword[iIndex]
	lea ebx, [arr+esi]

	mov eax, dword[ebx]
	mov dword[a], eax

	
	mov eax, dword[j]
	mul dword[four]
	mov dword[jIndex], eax
	
	mov esi, dword[jIndex]
	lea ebx, [arr+esi]

	mov eax, dword[ebx]
	mov dword[b], eax 	

	
	mov eax, dword[a]
	cmp eax, dword[b]
	jge swap

	inc dword[j]
	mov eax, dword[j]

	cmp eax, dword[n]
	jl for2
	inc dword[i]
	jmp for1

	
swap:


	mov dword[arr+esi], eax

	mov eax, dword[b]

	mov esi, dword[iIndex]
	mov dword[arr+esi], eax
	
	inc dword[j]
	mov eax, dword[j]
	
	cmp eax, dword[n]
	jl for2
	inc dword[i]
	jmp for1

	
	
display1:
	mov eax, dword[i]
	mul dword[four]
	mov ecx, arr
	add ecx, eax

	push dword[ecx]
	push pf5
	call printf
	add esp, 8

	inc dword[i]
	mov eax, dword[i]
	cmp eax, dword[n]
	jl display1	
