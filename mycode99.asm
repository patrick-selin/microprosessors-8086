include "emu8086.inc"

org 100h

jmp start

msg1 db 0dh, 0ah, "Enter an integer: ", 0
msg2 db 0dh, 0ah, "Enter an integer: ", 0
result_msg db 0dh, 0ah, "Product = ", 0

start:
    lea si, msg1       ; Load address of message 1
    call PRINT_STRING  ; Print message 1
    call SCAN_NUM      ; Read first integer into CX

    lea si, msg2       ; Load address of message 2
    call PRINT_STRING  ; Print message 2
    call SCAN_NUM      ; Read second integer into AX

    mov bx, cx         ; Move CX (first number) into BX
    mov ax, 0          ; Clear AX for multiplication result

    imul bx             ; Multiply AX by BX (signed multiplication)

    lea si, result_msg ; Load address of result message
    call PRINT_STRING  ; Print result message
    call PRINT_NUM     ; Print the product in AX

    mov ax, 4c00h      ; Return to DOS
    int 21h

DEFINE_PRINT_STRING
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end
