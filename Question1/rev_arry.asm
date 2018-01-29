section .data
       msg1 db "Enter no of elements",10,0
       msg2 db "%d",0
       msg3 db "array is=",10,0
       msg4 db "reverse of array:=%d",10,0
      
section .bss
      a resd 1
      arr resd 20

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

      xor ecx,ecx
      mov ebx,arr
      xor eax,eax

state2:
      cmp eax,dword[a]
      jz state3
    
      pusha
      push ebx
      push msg2
      call scanf
      add esp,8
      popa
      inc eax
      add ebx,4
      jmp state2
	
state3: sub ebx,4

state4:
        cmp eax,0
        jz end
       
       pusha 
       push dword[ebx]
       push msg4
       call printf
       add esp,8     
       popa
       dec eax
       sub ebx,4
       jmp state4

 
end:
        push dword[ebx]
	push msg4
	call printf
	add esp,8
        ret
