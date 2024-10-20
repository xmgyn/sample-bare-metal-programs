[BITS 16]
[ORG 0x7C00]

start:
    ; Set video mode to 13h (320x200 256 colors)
    mov ax, 0x0013
    int 0x10

    mov ax, 0xA000  ; Segment for video memory
    mov es, ax
    xor di, di      ; Start at the beginning of video memory

    ; Define colors
    mov cx, 320 * 66   ; Number of pixels per third (320 * 200 / 3)

    ; Fill top third with color 1 
    mov al, 12     ; Color 1
fill_color1:
    stosb
    loop fill_color1

    ; Fill middle third with color 2 
    mov al, 15     ; Color 2
    mov cx, 320 * 67   ; Slight adjustment for middle third
fill_color2:
    stosb
    loop fill_color2

    ; Fill bottom third with color 3 
    mov al, 10     ; Color 3
    mov cx, 320 * 67   ; Slight adjustment for bottom third
fill_color3:
    stosb
    loop fill_color3

    ; Hang
    jmp $

times 510-($-$$) db 0
dw 0xAA55
