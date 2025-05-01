.model small
.stack 100h

.data  
digit db 0
msg_even db 'this is even number $'    ;db er age shob variable
msg_odd db 'this is odd number $'

.code
main proc
    mov ax,@data
    mov ds,ax   ;ds=data segment
    
    
    
    mov ah,0
    mov al,digit
    mov bl,2 ;bl k 2 diye bhag korsi
    div bl    ;bl=al/bl
    
    
    cmp ah,0
     je print_even
     jne print_odd
     
     print_even:
     mov ah,9
     lea dx,msg_even
     int 21h
     jmp exit 
     
     print_odd:
     mov ah,9
     lea dx,msg_odd
     int 21h
     jmp exit
     
     
     
    exit:
    mov ah,4ch
    main endp
end main