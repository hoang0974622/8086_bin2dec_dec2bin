;int 21h  ah1 nhap vao 1 ki tu tu 
          ;ah2 xuat ki tu ra man hinh
          ;ah9
.model small             
.stack 100h               
.data 
    THONGBAO DB "Hello UTE$"                      
.code                       

main proc 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1 
    INT 21h

    MOV AH, 2
    MOV DL, AL
    INT 21h
    
    MOV AH, 9
    LEA DX, THONGBAO
    INT 21h
main endp
end main