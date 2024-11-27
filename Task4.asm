section .data
    sensor_val db 0   ; Simulated sensor value
    motor_status db 0 ; Motor status (0: off, 1: on)
    alarm_status db 0 ; Alarm status (0: off, 1: on)

section .text
    global _start

_start:
    ; Simulate sensor input
    mov al, 5         ; Example: set water level to 5
    mov [sensor_val], al

    ; Check water level
    mov al, [sensor_val]
    cmp al, 7         ; High level
    jg .high_level
    cmp al, 3         ; Moderate level
    jl .low_level

.moderate:
    mov byte [motor_status], 0
    jmp .done

.high_level:
    mov byte [motor_status], 1
    mov byte [alarm_status], 1
    jmp .done

.low_level:
    mov byte [motor_status], 0
    mov byte [alarm_status], 0

.done:
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 80h
