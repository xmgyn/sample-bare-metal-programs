[BITS 16]
[ORG 0x7C00]

start:
    mov si, msg
print_char:
    lodsb           
    cmp al, 0       
    je hang         
    mov ah, 0x0E    
    int 0x10        
    jmp print_char  

msg db 'Hello World!', 0  

hang:
    jmp hang       

times 510-($-$$) db 0  
dw 0xAA55             
