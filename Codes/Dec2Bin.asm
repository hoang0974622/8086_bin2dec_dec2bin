.model small
.stack 100h
.data

label db "Nhap so:$"
num dw ? 
x dw ?

.code

main proc
    mov al,0
    mov ah,0
    int 10h
    mov ax,@data
    mov ds,ax
loop_main:
    ;Nhap so
    mov ah,9
    lea dx,label
    int 21h
    call nhapso
    
    call dec2bin
    
    ;Dung man hinh
    mov ah,1
    int 21h
    ;Xoa man hinh
    mov al,0
    mov ah,0
    int 10h
    jmp loop_main  
main endp

dec2bin proc
    mov cl,07h
    mov bx,0001h
loop_dec2bin:
    mov dx,num
    shr dx,cl
    dec cl
    mov ax,dx
    and ax,bx
    cmp ax,1
    je print1
print0:
    mov ah, 2
	mov dl, '0'
	int 21h
	cmp cl,255
    je exit_dec2bin
    jmp loop_dec2bin
print1:
    mov ah, 2
	mov dl, '1'
	int 21h
	cmp cl,255
    je exit_dec2bin
    jmp loop_dec2bin
exit_dec2bin:
    ret ;return
dec2bin endp

nhapso proc
    mov num,0
    mov x,0
    mov bx,10
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je exit_nhapso
    sub al,30h
    xor ah,ah
    mov x,ax
    mov ax,num
    mul bx
    add ax,x
    mov num,ax
    jmp nhap
exit_nhapso:
    ;Xoa man hinh
    mov al,0
    mov ah,0
    int 10h
    ret ;return
nhapso endp

endp main