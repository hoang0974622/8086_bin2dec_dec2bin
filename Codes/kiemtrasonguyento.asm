.model small
.stack 100h
.data

label db "Nhap so nguyen n:$"
f db "Khong phai so nguyen to.$"
t db "La so nguyen to.$"
num dw ? ;max is 65535
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
    
    ;Xet so nguyen to
    call nguyento
    
    ;Dung man hinh
    mov ah,1
    int 21h
    ;Xoa man hinh
    mov al,0
    mov ah,0
    int 10h
    jmp loop_main  
main endp

nguyento proc
    mov ax,num
    cmp ax,2
    je tr 
    jl fa
    cmp ax,3
    je tr
    
    mov bx,2
    div bx
    cmp dx,0
    je fa
    mov x,1
for:
    add x,2
    mov ax,num
    mov bx,x
    mov dx,0
    div bx
    cmp dx,0
    je fa
    mov dx,num
    sub dx,2
    cmp dx,x
    je tr
    jmp for 
tr:
    mov ah,9
    lea dx,t
    int 21h
    jmp exit_nguyento
fa:
    mov ah,9
    lea dx,f
    int 21h
exit_nguyento:
    ret ;return        
nguyento endp

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