include "emu8086.inc"  


; START-OF-PROGRAM    

org 100h
jmp start
                     
                     
; Memory variables:  

msg1    db  "Enter a string (max 128 characters): ", 0
mystr   db  128 dup (0) ; Buffer to save the entered string
endl    db  0dh, 0ah, 0
 
 
start:
    lea SI, msg1            ; Load address of message to SI
    CALL PRINT_STRING       ; Print message

    lea DI, mystr           ; Load address of buffer to DI
    mov DX, 128             ; Buffer size
    CALL GET_STRING         ; Read string into buffer

    lea SI, endl            ; Load address of newline to SI
    CALL PRINT_STRING       ; Print newline

    lea SI, mystr           ; Load address of buffer to SI
    CALL PRINT_STRING       ; Print string from buffer


bort:
    mov ax, 4c00h           ; code for return to MS-DOS
    int 21h                 ; call MS-DOS terminate program
    ret
 
 
; Macro definitions
DEFINE_GET_STRING
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS 

end                         ; END-OF-PROGRAM
