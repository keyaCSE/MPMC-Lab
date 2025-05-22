.model small
.stack 100h
.data
    password db '12345'         
    input    db 6 dup(?)        

    msg_enter db 'Enter password (5 chars): $'
    msg_success db 13,10, 'Access Granted!$'
    msg_fail db 13,10, 'Access Denied!$'

.code
main:
    mov ax, @data
    mov ds, ax

    
    lea dx, msg_enter
    mov ah, 09h
    int 21h

    
    lea si, input
    mov cx, 5
read_loop:
    mov ah, 01h         
    int 21h
    mov [si], al
    inc si
    loop read_loop

    
    lea si, input
    lea di, password
    mov cx, 5
compare_loop:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne wrong           
    inc si
    inc di
    loop compare_loop

correct:
    lea dx, msg_success
    mov ah, 09h
    int 21h
    jmp exit

wrong:
    lea dx, msg_fail
    mov ah, 09h
    int 21h

exit:
    mov ah, 4Ch
    int 21h
end main
