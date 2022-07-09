;
;   A simple boot sector program that demonstrates the stack.
;
[org 0x7C00]

mov bx, HELLO_MSG
call print_string

mov bx, GOODBYE_MSG
call print_string

jmp $

%include "print_string.asm"

HELLO_MSG:
    db 'Hello, World!', 0

GOODBYE_MSG:
    db 'Goodbye!', 0

;
;   Padding and magic BIOS number
;

times 510-($-$$) db 0

dw 0xAA55