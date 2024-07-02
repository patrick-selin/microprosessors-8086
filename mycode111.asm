include "emu8086.inc"

; START-OF-PROGRAM
org 100h
    jmp start

; Memory variables
f0      dw  0   ; Previous number
f1      dw  1   ; Second number
n       equ 24  ; Loop count (22 first numbers)

prompt1 db  0dh, 0ah, "The first 23 Fibonacci numbers: $"

start:
    lea SI, prompt1     ; Load address of prompt1 to SI
    call PRINT_STRING   ; Print prompt1

    ; Print first number
    mov ax, f0          ; First Fibonacci number to AX
    call PRINT_NUM_UNS  ; Print the Fibonacci number

    ; Print space character
    mov dl, ' '         ; Load space character to DL
    mov ah, 2           ; AH = 2 (function code for printing character)
    int 21h             ; Call MS-DOS interrupt to print character

up1:
    ; Last number? Exit to bort: if all done
    cmp ch, n           ; Compare loop counter to n (22)
    jge bort            ; Jump to bort if loop counter is greater than or equal to n

    ; Calculate next Fibonacci number
    mov bx, f1          ; 
    mov ax, f0          ; 
    add ax, bx          ; 
    mov f0, bx          ; 
    mov f1, ax          ; 

    ; Print it
    mov dx, ax          ; 
    call PRINT_NUM_UNS  ; Print the Fibonacci number

    ; Print space character
    mov dl, ' '         ; Load space character to DL
    mov ah, 2           ; AH = 2 (function code for printing character)
    int 21h             ; Call MS-DOS interrupt to print character

   
    inc ch              ; 
    jmp up1             ;

bort:
    mov ax, 4c00h       ; code for return to MS-DOS
    int 21h             ; call MS-DOS terminate program

ret

; Macro definitions
DEFINE_PRINT_STRING
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end                     ; END-OF-PROGRAM
