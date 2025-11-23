%include 'in_out.asm'

section .data
    msgA db 'Введите число A: ', 0
    msgB db 'Введите число B: ', 0
    msgC db 'Введите число C: ', 0
    msgRes db "Наименьшее число: ", 0

section .bss
    A resb 10
    B resb 10
    C resb 10
    min resb 10

section .text
    global _start

_start:
    ; --- ВВОД A ---
    mov eax, msgA
    call sprint         ; Печать "Введите число A: "
    mov ecx, A
    mov edx, 10
    call sread          ; Ввод с клавиатуры
    mov eax, A
    call atoi           ; Преобразование ASCII-кода в число
    mov [A], eax        ; Сохранение числа в переменную A

    ; --- ВВОД B ---
    mov eax, msgB
    call sprint
    mov ecx, B
    mov edx, 10
    call sread
    mov eax, B
    call atoi
    mov [B], eax

    ; --- ВВОД C ---
    mov eax, msgC
    call sprint
    mov ecx, C
    mov edx, 10
    call sread
    mov eax, C
    call atoi
    mov [C], eax


    mov ecx, [A]
    mov [min], ecx
    cmp ecx, [C]
    jl check_B
    mov ecx, [C]
    mov [min], ecx
check_B:
    mov ecx, [min]
    cmp ecx, [B]
    jl fin
    mov ecx, [B]
    mov [min], ecx
fin:
    mov eax, msgRes
    call sprint
    mov eax, [min]
    call iprintLF
    call quit