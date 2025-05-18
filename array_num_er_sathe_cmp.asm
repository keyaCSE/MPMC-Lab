.model small
.stack 100h
.data
array db 1,2,3,4,5
num db 6 

msg db 10,13, "Enter a number: $" 
msg1 db 10,13,"number found $"
msg2 db 10,13,"number not found $"  
 value db ?  ;
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,09h
    int 21h
    
    mov ah,01h  ;scanf korsi
    int 21h 
    sub al,'0'
    mov value,al
    
    lea si,array
    mov cx,5
    mov al,value
    
    my_loop:
    mov bl,[si]
    cmp al,bl
    je num_found
    inc si
    loop my_loop
    
    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit
    num_found:
    lea dx,msg1
    
    mov ah,09h
    int 21h
    
    exit:
    mov ah,4ch
    main endp
end main