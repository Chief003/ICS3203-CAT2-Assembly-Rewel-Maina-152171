section .data
    prompt db "Enter a number to compute its factorial: ", 0
    result db "Factorial is: ", 0

section .bss
    number resb 1
    factorial resd 1

section .text
    global _start

_start:
    ; Prompt user
    mov edx, prompt
    mov eax, 4
    int 80h

    ; Read input
    mov eax, 3
    lea ebx, [number]
    int 80h
    sub [number], '0'

    ; Initialize factorial computation
    mov eax, [number]
    call factorial_sub

    ; Print result
    mov edx, result
    mov eax, 4
    int 80h

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 80h

factorial_sub:
    ; Base case: if n <= 1, return 1
    cmp eax, 1
    jle .done
    dec eax
    push eax       ; save current n-1
    call factorial_sub
    pop ebx        ; restore n-1
    imul eax, ebx  ; n * (n-1)!
.done:
    ret
