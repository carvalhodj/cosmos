;
;   A simple boot sector program that demonstrates the stack.
;
mov bx, 50

cmp bx, 4
jle le_4
cmp bx, 40
jl less_40
mov al, 'C'
jmp the_end

le_4:
    mov al, 'A'
    jmp the_end

less_40:
    mov al, 'B'
    jmp the_end

the_end:
    mov ah, 0x0E
    int 0x10

jmp $

;
;   Padding and magic BIOS number
;

times 510-($-$$) db 0

dw 0xAA55