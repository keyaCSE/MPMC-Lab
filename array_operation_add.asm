.model small
.stack 100h
.data

a db 1,3,2,4
b db 2,4,3,1
sum db 0               
res db 4 dup(?)        


msg1 db 10,13, "Sum of array A: $"
msg2 db 10,13, "Result of A[i]+B[i]: $"
newline db 10,13, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    
    lea si, a
    mov cx, 4           
    xor al, al          

sum_loop:
    add al, [si]
    inc si
    loop sum_loop
    mov sum, al         

    
    lea dx, msg1
    mov ah, 09h
    int 21h

    
    mov al, sum
    call print_num      

    
    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov cx, 4
    lea si, a
    lea di, b
    lea bx, res         

add_loop:
    mov al, [si]
    add al, [di]
    mov [bx], al
    inc si
    inc di
    inc bx
    loop add_loop

    
    lea dx, newline
    mov ah, 09h
    int 21h

    
    lea si, res
    mov cx, 4

print_loop:
    mov al, [si]
    call print_num
    mov ah, 02h
    mov dl, ' '         
    int 21h
    inc si
    loop print_loop

    
    mov ah, 4Ch
    int 21h
main endp


print_num proc
    push ax
    push bx
    push cx
    push dx

    xor ah, ah          
    mov bx, 10
    xor cx, cx         

next_digit:
    xor dx, dx
    div bx              
    push dx             
    inc cx
    test ax, ax
    jnz next_digit

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num endp

end main
