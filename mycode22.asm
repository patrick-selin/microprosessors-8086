
; Program to wiat for a keystroke

org 100h


    
    mov ah,00
    int 16h
    
    mov ah,4ch
    mov al,00
    int 21h
        
    ret




