
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 

mov ah,1
int 21h
mov bl,al 

mov ah,2
mov dl,10
int 21h

mov dl,13
int 21h



CMP bl,97

jge small_to_capital
jl capital_to_small

small_to_capital:
   sub bl, 32
   mov ah,2 
   mov dl,bl
   int 21h
   
jmp exit
   
capital_to_small:
   add bl,32
   mov ah,2
   mov dl,bl
   int 21h


ret




