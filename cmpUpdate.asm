.model small
.stack 100h
.code

main proc
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
   
exit: 
mov ah,4ch
int 21h

main endp
end main