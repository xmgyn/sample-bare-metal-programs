[BITS 16]
[ORG 0x7C00]

start:
    mov ax, 0x0013
    int 0x10

    mov ax, 0xA000  
    mov es, ax
    xor di, di      
    mov cx, 320 * 66  
    mov al, 12     

fill_color1:
    stosb
    loop fill_color1

    mov al, 15     
    mov cx, 320 * 67   
fill_color2:
    stosb
    loop fill_color2

    mov al, 10     
    mov cx, 320 * 67   
fill_color3:
    stosb
    loop fill_color3

    jmp $

times 510-($-$$) db 0
dw 0xAA55
