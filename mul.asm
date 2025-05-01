.model small
.stack 100h

.data 

.code
main proc
     
    
    mov al, 2 
    mov bl, 3 
    
    mul bl 
    
    add al,48  
    mov ah,2
    mov dl,al
    int 21h
                
    
    exit:
    mov ah,4ch
    main endp
end main