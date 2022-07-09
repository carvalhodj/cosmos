;
;   A simple boot sector program that demonstrates addressing.
;

mov ah, 0x0E

; First attempt
mov al, the_secret
int 0x10

; Second attempt
mov al, [the_secret]
int 0x10

; Third attempt
mov bx, the_secret
add bx, 0x7C00
mov al, [bx]
int 0x10

; Fourth attempt
mov al, [0x7C1E]
int 0x10

jmp $

the_secret:
    db "X"

;
;   Padding and magic BIOS number
;

times 510-($-$$) db 0

dw 0xAA55