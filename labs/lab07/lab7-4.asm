%include 'in_out.asm'

SECTION .data
    msg_x: DB 'Введите значение x: ', 0
    msg_a: DB 'Введите значение a: ', 0
    msg_res: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80
    a: RESB 80
    res: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    mov ecx, [x]
    cmp ecx, [a]
    jge greater_equal

    mov eax, [a]
    mov ebx, 3
    mul ebx
    inc eax
    mov [res], eax
    jmp print_res

greater_equal:
    mov eax, [x]
    mov ebx, 3
    mul ebx
    inc eax
    mov [res], eax

print_res:
    mov eax, msg_res
    call sprint
    mov eax, [res]
    call iprintLF
    call quit