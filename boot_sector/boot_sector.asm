;
;   A simple boot sector that prints a message to the screen using a BIOS routine.
;

mov ah, 0x0E

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'c'
int 0x10
mov al, 'o'
int 0x10
mov al, 's'
int 0x10
mov al, 'm'
int 0x10
mov al, 'o'
int 0x10
mov al, 's'
int 0x10

jmp $

;
;   Padding and magic BIOS number
;

times 510-($-$$) db 0

dw 0xAA55