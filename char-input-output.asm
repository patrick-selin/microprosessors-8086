org 100h

start:
    ; Read 
    mov ah, 1           ; keyboard input subprogram
    int 21h             ; call ms-dos input character
                        ; the character input is stored in al

    ; Check if Enter
    cmp al, 0Dh         ;
    je exit             ;

    ; Print character on screen
    mov dl, al          ;
    mov ah, 2           ;
    int 21h             ;

    ; Loop
    jmp start           ;

exit:
    ; Terminate and go to ms-dos
    mov ax, 4c00h       ; code for return to ms-dos
    int 21h             ; call ms-dos terminate program

ret

