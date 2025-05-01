.model small
.stack 100h
.data
array db 1,2,3,4,5
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset array
    mov cx,5
    
    my_loop:
    mov ah,2
    mov dl,[si]
    add dl,48
    int 21h
    mov dl,32
    int 21h
    inc si
    loop my_loop
    
    exit:
    mov ah,4ch
    main endp
end main