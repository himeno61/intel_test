  section .text
global f
f: 
  push ebp
  mov ebp,esp
  mov eax,[ebp+8]
  
  mov ebx,0
  
begin: 
  mov cl, BYTE[eax]
  cmp cl,0
  jz no_string
  
  and cl,0xDF
  cmp cl, 'A'
  jl out_of
  cmp cl, 'Z'
  jg out_of

  
begin_next:
  mov ch,cl
  inc eax
  mov cl,BYTE[eax]
  cmp cl,0
  jz no_string
  
  and cl,0xDF
  cmp cl, 'A'
  jl out_of
  cmp cl, 'Z'
  jg out_of

  
  mov dh,cl 
  sub dh,ch
  cmp dh, 1
  je string_found
  
  inc ebx
  jmp begin_next

out_of:
  inc eax
  jmp begin
  
string_found:
  and ebx, 0xFF
  mov eax, ebx
  
  mov esp,ebp
  pop ebp
  ret
  
no_string: 
  mov eax, -1
  
  mov esp,ebp
  pop ebp
  ret