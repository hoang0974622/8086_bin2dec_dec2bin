MOV AL, 5
MOV BL, 5
CMP AL, BL  ; = nhau CF = 0  

MOV AL, 6
MOV BL, 5   
CMP AL, BL  ; CF=0   ZF=0   

MOV AL, 5
MOV BL, 6   
CMP AL, BL  ; CF=1   ZF=0   

RET