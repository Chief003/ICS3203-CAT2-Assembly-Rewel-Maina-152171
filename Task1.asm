section .data
    prompt db "Enter a number: ", 0
    positive db "POSITIVE", 0
    negative db "NEGATIVE", 0
    zero db "ZERO", 0

section .bss
    number resb 2

section .text
    global _start

_start:
    ; Display prompt
    mov edx, prompt
    mov eax, 4        ; sys_write
    int 80h           ; Linux interrupt

    ; Read input
    mov eax, 3        ; sys_read
    lea ebx, [number]
    int 80h           ; Linux interrupt

    ; Convert input to number (assume single-digit input for simplicity)
    sub [number], '0'

    ; Compare input
    mov al, [number]
    cmp al, 0
    je .zero
    jl .negative
    jg .positive

.zero:
    mov edx, zero
    jmp .print

.negative:
    mov edx, negative
    jmp .print

.positive:
    mov edx, positive

.print:
    ; Print result
    mov eax, 4        ; sys_write
    mov ebx, 1        ; STDOUT
    int 80h           ; Linux interrupt

    ; Exit program
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; exit code 0
    int 80h
