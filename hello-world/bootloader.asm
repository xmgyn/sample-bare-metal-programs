[BITS 16]
[ORG 0x7C00]

start:
    mov si, msg
print_char:
    lodsb           ; Load byte at DS:SI into AL, increment SI
    cmp al, 0       ; Compare AL with 0 (end of string)
    je hang         ; If AL is 0, jump to hang
    mov ah, 0x0E    ; BIOS teletype function
    int 0x10        ; Call BIOS interrupt
    jmp print_char  ; Repeat until null terminator

msg db 'Hello World!', 0  ; The message string, null-terminated

hang:
    jmp hang       ; Infinite loop to halt the CPU

times 510-($-$$) db 0  ; Fill the rest of the 512-byte boot sector with zeros
dw 0xAA55             ; Boot signature
