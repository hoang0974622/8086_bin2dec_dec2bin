.model small                 //kich thuoc bo nho
.stack 100h                  //kich thuoc ngan xep 
.data                        //khai bao doan du lieu 
    THONGBAO DB "Hello UTE$"
.code                        //khai bao doan ma lenh

main proc
    mov DS, @DATA
    mov AH, 09H
    lea DX, THONGBAO
    int 21h
main endp
end main
    