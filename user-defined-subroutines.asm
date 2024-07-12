org 100h

jmp start

msg db 'Enter a character (press Enter to exit)', 0dh, 0ah, '$'

start:
    lea dx, msg     ; load string address to dx
    call puts       ; output string

input_loop:
    call getc       ;
    cmp al, 0Dh     ; 
    je exitus       ; 
    call putc       ; 
    jmp input_loop  ; 

exit:
    call putcb      ; 
    mov ax, 4c00h   ;
    int 21h         ;

; User-defined subroutines

puts:
    mov ah, 9       ; Output string subprogram
    int 21h         ; Call MS-DOS output string
    ret

getc:
    mov ah, 1       ; Keyboard input subprogram (with echo)
    int 21h         ; Call MS-DOS input character
    ret             ; The character input is stored in al

putcb:
    mov dl, 0ah     ; ASCII code for newline character
    mov ah, 2       ; Character output subprogram
    int 21h         ; Call MS-DOS output character
    ret

putc:
    mov ah, 2       ; Character output subprogram
    int 21h         ; Call MS-DOS output character
    ret

end
