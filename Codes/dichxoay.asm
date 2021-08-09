MOV AL, 11100000b
SHL AL, 1         ; AL = 11000000b,  CF=1  

MOV AL, 00000111b
SHR AL, 1         ; AL = 00000011b,  CF=1

MOV AL, 1CH        ; AL = 00011100b
ROL AL, 1         ; AL = 00111000b,  CF=0.
