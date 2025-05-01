.model small
.stack 100h
.data
a db 2 
b db 5
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,2
    add a,48
    mov dl,a
    int 21h
    
    mov dl,32
    int 21h 
    add b,48
    mov dl,b
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    
    
main endp

