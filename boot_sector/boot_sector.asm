;
;   A simple boot sector program that demonstrates the stack.
;
[org 0x7C00]

mov dx, 0x1FB6
call print_hex

jmp $

print_hex:
    pusha                   ; Save the actual registers values into stack #
    mov cx, 4               ; Set a counter, with the length of the hex number
                            ; intended to print #
.iterate_over_hex:
    dec cx                  ; Decrement counter
    mov ax, dx              ; Copy dx value into ax
    shr dx, 4               ; Shift 4 bits to the right in dx
    and ax, 0xF             ; Get 4 less significants bits
    mov bx, HEX_OUT         ; Set string address into bx
    add bx, 2               ; Ignore the first 2 chars ('0x')
    add bx, cx              ; Use counter to properly position the char into string
    cmp ax, 0xA             ; Check if it's a number or letter (hex)
    jl .set_char            ; if number, goto set_char
    add byte [bx], 7        ; if not, ascii letter begins at 17. So, just add 7,
                            ; because it's already, at least, 10 (A)
    jmp .set_char           ; goto set_char

.set_char:
    add byte [bx], al       ; add byte value to bx current index
    cmp cx, 0               ; check if the counter zeroed
    je .print_hex_finished  ; if already zero, goto finish
    jmp .iterate_over_hex   ; if not, go back to iteration

.print_hex_finished:
    mov bx, HEX_OUT         ; Set address of HEX_OUT into bx
    call print_string       ; call function to print the string
    popa                    ; Get back the register values from stack
    ret                     ; return 

HEX_OUT: db '0x0000', 0

%include "print_string.asm"

;
;   Padding and magic BIOS number
;

times 510-($-$$) db 0

dw 0xAA55