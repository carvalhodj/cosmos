;
;   A simple print function
;

print_string:
    pusha
    mov ah, 0x0E
.print_char:
    mov al, [bx]
    cmp al, 0
    je .finished
    int 0x10
    add bx, 1
    jmp .print_char
.finished:
    popa
    ret
