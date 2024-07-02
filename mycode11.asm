#make_bin#


; a
     mov ah,4
     mov al,4
     cmp ah,al
     nop
; b
     mov ah,4
     mov al,3
     cmp ah,al
     nop
; c
     mov ah,1
     mov al,251
     cmp ah,al
     nop
; d
     mov ah,-3
     mov al,-2
     cmp ah,al
     nop
; e
     mov ah,-3
     mov al,-2
     cmp ah,al
     nop
; f
     mov ah,-2
     mov al,-3
     cmp ah,al
     nop
; g
     mov ah,255
     mov al,1
     cmp ah,al
     nop



HLT           ; halt!


