org 100h

jmp start

msg db 'Laske 2 * (ab + cd) * (5 + ab) - 5', 0dh, 0ah, '$'

start:
    lea dx, msg     ;
    call puts       ; 

    mov ax, 13      ;
    mov bx, 76      ;

    mov cx, 2       ;
    mov dx, 5       ;
    mov di, -5      ;

    add ax, bx
    mov bx, ax      ;

    add ax, dx      ;
    mul bx          ; 

    mul cx          ;
    sub ax, di      ; 

    mov ax, 4c00h   ; 
    int 21h

puts:
    mov ah, 9       ; Output string subroutine
    int 21h
    ret

put_num:
    push ax         ; Preserve AX
    mov bx, ax      ; Move AX to BX for division
    mov cx, 10      ; Divide by 10 repeatedly
    mov dx, 0       ; Clear DX for division
    mov si, 0       ; Counter for number of digits

num_loop:
    div cx          ; Divide BX by 10 (quotient in AX, remainder in DX)
    add dl, '0'     ; Convert remainder to ASCII
    push dx         ; Push remainder to stack
    inc si          ; Increment digit count
    test ax, ax     ; Check if quotient is zero
    jnz num_loop    ; If not zero, continue dividing

print_loop:
    pop dx          ; Pop digit from stack
    mov ah, 2       ; Print character subroutine
    int 21h
    dec si          ; Decrement digit count
    jnz print_loop  ; Loop until all digits printed

    pop ax          ; Restore original AX
    ret

exitus:
    mov ax, 4c00h   ; Terminate program subroutine
    int 21h
    ret