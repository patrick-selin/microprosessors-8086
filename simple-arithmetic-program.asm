: Calculate (desimal) 12*(200-225)+127
; prg

org 100h

mov ax,200
sub ax,225    

mov bx,12
mul bx 

add ax,127

hlt              

ret
