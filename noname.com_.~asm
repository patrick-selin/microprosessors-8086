include "emu8086.inc"

; START-OF-PROGRAM
org 100h
jmp start

; Memory variables:
msg3    db  0ah, 0dh, "The string is a palindrome.", 0
msg2    db  0ah, 0dh, "The string is NOT a palindrome.", 0
msg1    db  "Enter a string (max 128 characters): ", 0
mystr   db  128 dup (0) ; Buffer to save the entered string
mystrREV db 128 dup (0) ; Buffer to save the reversed string
endl    db  0dh, 0ah, 0
length  db  0

start:
lea SI, msg1            ; Load address of message to SI
CALL PRINT_STRING       ; Print message

lea DI, mystr           ; Load address of buffer to DI
mov DX, 128             ; Buffer size
CALL GET_STRING         ; Read string into buffer

lea SI, endl            ; Load address of newline to SI
CALL PRINT_STRING       ; Print newline

; Count the number of characters in the buffer mystr into CX:
mov cx, 0               ; Start from 0 (use CX as counter to match SI size)
lea SI, mystr           ; Point SI to mystr
tess:
mov al, [SI]            ; Load character from mystr
cmp al, 0               ; Check for null terminator
je seur                 ; Proceed to next step if null terminator found
inc cx                  ; Increment character counter
inc SI                  ; Increment pointer to next character
jmp tess                ; Repeat until null terminator found

; Copy mystr into mystrREV in reverse order
seur:
mov length, cl          ; Store number of characters in length
lea SI, mystr           ; Source buffer address
lea DI, mystrREV        ; Result buffer address
mov bx, cx              ; Use BX to store the length of the string
dec bx                  ; Decrement BX to point to the last character

coop:
cmp bx, 0               ; Check if all characters are copied
jl print_buffers        ; If yes, proceed to print buffers
mov al, [SI + bx]       ; Load character from source
mov [DI], al            ; Copy character to destination
inc DI                  ; Increment destination pointer
dec bx                  ; Decrement source pointer
jmp coop                ; Repeat until all characters are copied

print_buffers:
lea SI, mystr
call PRINT_STRING       ; Print mystr
lea SI, endl
call PRINT_STRING       ; Print newline

lea SI, mystrREV
call PRINT_STRING       ; Print mystrREV
lea SI, endl
call PRINT_STRING       ; Print newline

; Compare strings. If equal => palindrome
mov cl, length          ; Number of characters to compare
mov ch, 0               ; Clear CH to ensure CX is correct
lea SI, mystr           ; Source buffer address
lea DI, mystrREV        ; Result buffer address
compare_loop:
cmp cx, 0               ; Test if end-of-comparison/buffer
je positive             ; If end of comparison, strings are equal
mov al, [SI]            ; Load character from source buffer
mov bl, [DI]            ; Load character from result buffer
cmp al, bl              ; Compare characters
jne negative            ; If not equal, jump to negative
inc SI                  ; Increment source pointer
inc DI                  ; Increment destination pointer
dec cx                  ; Decrement counter
jmp compare_loop        ; Repeat until all characters are compared

positive:
lea SI, msg3            ; Yess, palindrome
call PRINT_STRING       ; Print it
jmp bort                ; and exit

negative:
lea SI, msg2            ; NOT a palindrome
call PRINT_STRING       ; Print it and exit

bort:
mov ax, 4c00h           ; code for return to ms-dos
int 21h                 ; call ms-dos terminate program
ret

; Macro definitions
DEFINE_GET_STRING
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

end                         ; END-OF-PROGRAM



