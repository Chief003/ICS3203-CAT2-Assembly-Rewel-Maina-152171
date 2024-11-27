section .data
    prompt db "Enter 5 numbers (space-separated): ", 0
    result db "Reversed array: ", 0
    array resb 10    ; space for 5 numbers

section .bss
    temp resb 1      ; temporary variable for swapping

section .text
    global _start

_start:
    ; Prompt for input
    mov edx, prompt
    mov eax, 4        ; sys_write
    int 80h

    ; Read input array
    mov eax, 3        ; sys_read
    lea ebx, [array]
    int 80h

    ; Reverse array (in-place)
    mov esi, array    ; start of array
    lea edi, [array+4] ; end of array (adjust for input size)

.reverse_loop:
    cmp esi, edi      ; check if pointers meet
    jge .done_reverse ; exit if reversed

    ; Swap values
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al

    ; Update pointers
    inc esi
    dec edi
    jmp .reverse_loop

.done_reverse:
    ; Display reversed array
    mov edx, result
    mov eax, 4
    int 80h

    ; Print array contents
    mov eax, 4
    lea ebx, [array]
    int 80h

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 80h
