[BITS 16]
[ORG 0x7C00]

start:
    ; Set video mode
    mov ah, 0x00
    mov al, 0x03   
    int 0x10

    ; Initialize keyboard
    xor ax, ax
    mov ds, ax

main_loop:
    call get_key
    call scancode_to_ascii
    cmp al, 0      
    je main_loop   
    mov ah, 0x0E
    int 0x10
    jmp main_loop

get_key:
    in al, 0x64
    test al, 1
    jz get_key
    in al, 0x60
    ret

scancode_to_ascii:
    test al, 0x80
    jnz ignore_key  

    and al, 0x7F    
    cmp al, 0x1E    ; 'A'
    je set_a
    cmp al, 0x30    ; 'B'
    je set_b
    cmp al, 0x2E    ; 'C'
    je set_c
    cmp al, 0x20    ; 'D'
    je set_d
    cmp al, 0x12    ; 'E'
    je set_e
    cmp al, 0x21    ; 'F'
    je set_f
    cmp al, 0x22    ; 'G'
    je set_g
    cmp al, 0x23    ; 'H'
    je set_h
    cmp al, 0x17    ; 'I'
    je set_i
    cmp al, 0x24    ; 'J'
    je set_j
    cmp al, 0x25    ; 'K'
    je set_k
    cmp al, 0x26    ; 'L'
    je set_l
    cmp al, 0x32    ; 'M'
    je set_m
    cmp al, 0x31    ; 'N'
    je set_n
    cmp al, 0x18    ; 'O'
    je set_o
    cmp al, 0x19    ; 'P'
    je set_p
    cmp al, 0x10    ; 'Q'
    je set_q
    cmp al, 0x13    ; 'R'
    je set_r
    cmp al, 0x1F    ; 'S'
    je set_s
    cmp al, 0x14    ; 'T'
    je set_t
    cmp al, 0x16    ; 'U'
    je set_u
    cmp al, 0x2F    ; 'V'
    je set_v
    cmp al, 0x11    ; 'W'
    je set_w
    cmp al, 0x2D    ; 'X'
    je set_x
    cmp al, 0x15    ; 'Y'
    je set_y
    cmp al, 0x2C    ; 'Z'
    je set_z
    cmp al, 0x0B    ; '0'
    je set_0
    cmp al, 0x02    ; '1'
    je set_1
    cmp al, 0x03    ; '2'
    je set_2
    cmp al, 0x04    ; '3'
    je set_3
    cmp al, 0x05    ; '4'
    je set_4
    cmp al, 0x06    ; '5'
    je set_5
    cmp al, 0x07    ; '6'
    je set_6
    cmp al, 0x08    ; '7'
    je set_7
    cmp al, 0x09    ; '8'
    je set_8
    cmp al, 0x0A    ; '9'
    je set_9
    xor al, al      
    ret

ignore_key:
    xor al, al     
    ret

set_a: mov al, 'A'  ; 'A'
    ret
set_b: mov al, 'B'  ; 'B'
    ret
set_c: mov al, 'C'  ; 'C'
    ret
set_d: mov al, 'D'  ; 'D'
    ret
set_e: mov al, 'E'  ; 'E'
    ret
set_f: mov al, 'F'  ; 'F'
    ret
set_g: mov al, 'G'  ; 'G'
    ret
set_h: mov al, 'H'  ; 'H'
    ret
set_i: mov al, 'I'  ; 'I'
    ret
set_j: mov al, 'J'  ; 'J'
    ret
set_k: mov al, 'K'  ; 'K'
    ret
set_l: mov al, 'L'  ; 'L'
    ret
set_m: mov al, 'M'  ; 'M'
    ret
set_n: mov al, 'N'  ; 'N'
    ret
set_o: mov al, 'O'  ; 'O'
    ret
set_p: mov al, 'P'  ; 'P'
    ret
set_q: mov al, 'Q'  ; 'Q'
    ret
set_r: mov al, 'R'  ; 'R'
    ret
set_s: mov al, 'S'  ; 'S'
    ret
set_t: mov al, 'T'  ; 'T'
    ret
set_u: mov al, 'U'  ; 'U'
    ret
set_v: mov al, 'V'  ; 'V'
    ret
set_w: mov al, 'W'  ; 'W'
    ret
set_x: mov al, 'X'  ; 'X'
    ret
set_y: mov al, 'Y'  ; 'Y'
    ret
set_z: mov al, 'Z'  ; 'Z'
    ret
set_0: mov al, '0'  ; '0'
    ret
set_1: mov al, '1'  ; '1'
    ret
set_2: mov al, '2'  ; '2'
    ret
set_3: mov al, '3'  ; '3'
    ret
set_4: mov al, '4'  ; '4'
    ret
set_5: mov al, '5'  ; '5'
    ret
set_6: mov al, '6'  ; '6'
    ret
set_7: mov al, '7'  ; '7'
    ret
set_8: mov al, '8'  ; '8'
    ret
set_9: mov al, '9'  ; '9'
    ret

hang:
    jmp hang

times 510-($-$$) db 0  
dw 0xAA55              
