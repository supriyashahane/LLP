section  .data
      msg db "enter no of element",10,0
      msg1 db "%d",0
      msg2 db "value is %d",10,0
      msg3 db "substraction is %d",10,0     
section .bss
     a resd 1
     arr1 resd 20
     arr2 resd 20
section .text
     global main
     extern printf,scanf
   
main:
     push msg
     call printf
     add esp,4
    
     push a
     push msg1
     call scanf
     add esp,8     
      
     xor eax,eax
     mov ebx,arr1
     

state1:
         cmp eax,dword[a]
         jz state2

         pusha
           push ebx
           push msg1
           call scanf
           add esp,8
         popa  
          inc eax
          add ebx,4
          jmp state1
          
state2:
         mov edx,arr2
         xor eax,eax


state3:
         cmp eax,dword[a]
         jz state4

         pusha
           push edx
           push msg1
           call scanf
           add esp,8
         popa  
          inc eax
          add edx,4
          jmp state3
 
state4: 
         xor eax,eax
         mov ebx,arr1
         mov edx,arr2
state5:
         cmp eax,dword[a]
         jz END
         mov ecx,dword[ebx]
         sub ecx,dword[edx]  
         
          pusha
             push ecx
             push msg3
             call printf
             add esp,8
          popa
          inc eax
          add edx,4
          add ebx,4
          jmp state5              
END:
      ret
