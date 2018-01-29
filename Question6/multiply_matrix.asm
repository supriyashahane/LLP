%define C     esp+20
%define A     esp+24
%define nrows esp+28
%define ncols esp+32
%define B     esp+36
%define mcols esp+40

   bits 32
   global Multiply_Matrices          

   section .text

Multiply_Matrices: equ $
	push esi                  
	push edi
	push ebx
	push ebp
	mov ebx,[mcols]           
	mov edx,dword[nrows]     
	mov esi,dword[A]         
	mov ecx,dword[B]         
	mov edi,dword[C]         
	mov ebp,dword[mcols]     
	mov eax,dword[ncols]     
	lea ebx,[8*ebx]          
	cmp edx,0
	jnle continue             
	jmp  return

next_A_row: equ $
	mov dword[A],esi          
	mov ecx,dword[B]          
	mov ebp,dword[mcols]      
	mov eax,dword[ncols]
	dec dword[nrows]
	jnle continue
	jmp return 

next_B_column: equ $
	fstp  qword[edi]         
	add edi,8                 
	dec ebp                  
	jle next_A_row
	add ecx,8                 
	mov esi,dword[A]         
	mov eax,dword[ncols]     

continue: equ $
	mov edx,ecx
	fldz                     
	sub eax,4
	jl  mod4terms

next4terms: equ $
	fld qword[esi]            
	fmul qword[edx]          
	fld qword[esi+8]
	fmul qword[edx+ebx]       
	fld qword[esi+16]        
	fxch st2                 
	faddp st3,st0            
	fxch st1                 
	fmul qword[edx+2*ebx]     
	fxch st1                 
	lea edx,[edx+2*ebx]
	faddp st2,st0            
	fld qword[esi+24]        
	fmul qword[edx+ebx]      
	fxch st1                 
	faddp st2,st0            
	add  esi,32
	lea  edx,[edx+2*ebx]
	faddp st1,st0             
	sub eax,4
	jge next4terms
mod4terms: equ $
	jmp [jmptable+4*eax+16]
threemod4: equ $
	fld qword[esi]           
	fmul qword[edx]          
	fld qword[esi+8]         
	fmul qword[edx+ebx]      
	fld qword[esi+16]        
	fxch st2                  
	faddp st3,st0            
	fxch st1
	fmul qword[edx+2*ebx]    
	fxch st1                  
	lea edx,[edx+2*ebx]
	faddp st2,st0
	add  esi,24
	faddp st1,st0            
	jmp  next_B_column
twomod4: equ $
	fld qword[esi]          
	fmul qword[edx]          
	fld qword[esi+8]         
	fmul qword[edx+ebx]       
	fxch st1                  
	faddp st2,st0            
	faddp st1,st0             
	add  esi,16
	jmp  next_B_column
onemod4: equ $
	fld qword[esi]           
	fmul qword[edx]         
	faddp st1,st0            
	add  esi,8
	jmp  next_B_column
zeromod4: equ $
	jmp  next_B_column

return: equ $               
	pop ebp
	pop ebx
	pop edi                   
	pop esi
	ret                      
	section .data
jmptable:
	dd zeromod4
        dd onemod4
        dd twomod4
        dd threemod4
   
