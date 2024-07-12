
org 100h

start:
    ; Read 
    mov ah, 1           ;
    int 21h             ;

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
    mov ax, 4c00h       ; 
    int 21h             ; 

ret




