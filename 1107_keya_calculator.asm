.MODEL SMALL
.STACK 100H

.DATA
    MSG1    DB 'For Add type   : 1', 13, 10, '$'
    MSG2    DB 'For Sub type   : 2', 13, 10, '$'
    MSG3    DB 'For Mul type   : 3', 13, 10, '$'
    MSG4    DB 'For Div type   : 4', 13, 10, '$'
    MSG5    DB 'Choose Any One: $'
    MSG6    DB 13, 10, 'Enter 1st Number: $'
    MSG7    DB 13, 10, 'Enter 2nd Number: $'
    MSG8    DB 13, 10, 'The Result is: $'
    MSG     DB 13, 10, 13, 10, '           THANK YOU$'
    MSG_ERR DB 13, 10, 'Invalid Option. Please try again.', 13, 10, '$'

    NUM1    DB ?
    NUM2    DB ?
    RESULT  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

DISPLAY_MENU:
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    LEA DX, MSG5
    MOV AH, 9
    INT 21H

    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    SUB BH, 48 

    CMP BH, 1
    JE ADD_OP

    CMP BH, 2
    JE SUB_OP

    CMP BH, 3
    JE MUL_OP

    CMP BH, 4
    JE DIV_OP

    JMP INVALID_OPTION


ADD_OP:
    LEA DX, MSG6
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BL, AL    

    LEA DX, MSG7
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV CL, AL     

    ADD AL, BL
    MOV AH, 0
    AAA             

    MOV BX, AX
    ADD BH, 48
    ADD BL, 48

    LEA DX, MSG8
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT_PROGRAM


SUB_OP:
    LEA DX, MSG6
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BL, AL

    LEA DX, MSG7
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV CL, AL

    SUB BL, CL
    ADD BL, 48

    LEA DX, MSG8
    MOV AH, 9
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT_PROGRAM


MUL_OP:
    LEA DX, MSG6
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL

    LEA DX, MSG7
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL

    MOV AL, NUM2
    MUL NUM1
    MOV RESULT, AL

    AAM
    ADD AH, 30H
    ADD AL, 30H
    MOV BX, AX

    LEA DX, MSG8
    MOV AH, 9
    INT 21H
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT_PROGRAM


DIV_OP:
    LEA DX, MSG6
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM1, AL

    LEA DX, MSG7
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV NUM2, AL

    MOV CL, NUM1
    MOV CH, 0
    MOV AX, CX
    DIV NUM2

    AAM
    ADD AH, 30H
    ADD AL, 30H
    MOV BX, AX

    LEA DX, MSG8
    MOV AH, 9
    INT 21H
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT_PROGRAM


INVALID_OPTION:
    LEA DX, MSG_ERR
    MOV AH, 9
    INT 21H
    JMP DISPLAY_MENU


EXIT_PROGRAM:
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
